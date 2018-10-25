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

local function loadCountryDetails(country)
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

local function loadCountryList(filteredCountries)
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

local function loadCriteriaSelect()
    title:showMenuButton()
    title:updateTitle("Country Rankings")
    composer.gotoScene("views.criteria-selection")
end

local function loadUserGuide()
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
-- title.isVisible = false

-- loadCountryDetails(countries.Australia)
-- onCountrySearch()
-- goToMenu()
-- composer.gotoScene("views.user-guide")
-- loadCriteriaSelect()

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
