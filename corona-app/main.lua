-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local widget = require("widget")
local composer = require("composer")
local createPageHeader = require("utils.create-page-header")

-- read the country data
local countryImport = require("utils.country-import")
local pathForFile = system.pathForFile("data/country.json")
local countries = countryImport(pathForFile)

-- Page title
local title = createPageHeader("Country Ranker")

local loadCountryList, loadCountryDetails, loadUserGuide, loadCountryRanking, loadCriteriaSelect

loadCountryDetails = function(country)
   composer.removeScene("views.country-details")
   title:showMenuButton()
   title:updateTitle("Country Details")
   composer.gotoScene(
      "views.country-details",
      {
         params = {
            country = country
         }
      }
   )
end

loadCountryList = function(filteredCountries)
   title:showMenuButton()
   if filteredCountries == nil then
      title:updateTitle("All Countries")
   else
      title:updateTitle("Search Results")
   end
   composer.removeScene("views.country-list")
   composer.gotoScene(
      "views.country-list",
      {
         params = {
            countries = filteredCountries or countries,
            selectCountry = loadCountryDetails
         }
      }
   )
end

loadCountryRanking = function(section)
   local countriesWithSortableKey = {}
   for name, country in pairs(countries) do
      -- Get the countries score for this section
      local score = country.details[section.score .. ""]

      -- Add it to the front of the name to make a unique value that can be sorted
      countriesWithSortableKey[score .. name] = country
   end
   title:showMenuButton()
   title:updateTitle("Rankings")
   composer.gotoScene(
      "views.country-ranks",
      {
         params = {
            countries = countriesWithSortableKey,
            section = section,
            selectCountry = loadCountryDetails,
            back = loadCriteriaSelect
         }
      }
   )
end

loadCriteriaSelect = function()
   title:showMenuButton()
   title:updateTitle("Rankings")
   composer.gotoScene(
      "views.criteria-selection",
      {
         params = {
            selectCriteria = loadCountryRanking
         }
      }
   )
end

loadUserGuide = function()
   title:showMenuButton()
   title:updateTitle("User Guide")
   composer.gotoScene("views.user-guide")
end

local function goToMenu(event)
   title:updateTitle("Menu")
   composer.gotoScene(
      "views.menu",
      {
         params = {
            loadCountryList = loadCountryList,
            loadCriteriaSelect = loadCriteriaSelect,
            loadUserGuide = loadUserGuide
         }
      }
   )
end

title:registerMenuHandler(goToMenu)

-- hidden while showing the intro animation
title.isVisible = false

-- load the intro-animation scene
composer.gotoScene(
   "views.intro-animation",
   {
      params = {
         load = function()
            loadCountryList()
            title.isVisible = true
         end
      }
   }
)
