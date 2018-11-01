-----------------------------------------------------------------------------------------
--
-- views/menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local com = require("utils.common")
local createButton = require("utils.create-button")
local createSearchField = require("utils.create-search-field")
local filterCountries = require("utils.filter-countries")

local scene = composer.newScene()

-- read the country data
local countryImport = require("utils.country-import")
local pathForFile = system.pathForFile("data/country.json")
local countries = countryImport(pathForFile)

function scene:create(event)
   local sceneGroup = self.view

   -- create a white background to fill screen
   local background = display.newRect(com.centerX, com.centerY, com.w, com.h)
   background:setFillColor(.87, .87, .87)
   sceneGroup:insert(background)

   local top = 160

   local search = createSearchField({}, "Search Countries")
   search.y = top
   sceneGroup:insert(search)

   top = top + 80

   -- Create the widget
   local countryListButton = createButton(
      "Country List",
      function()
         event.params.loadCountryList()
      end
   )
   countryListButton.x = com.centerX
   countryListButton.y = top
   sceneGroup:insert(countryListButton)

   top = top + 100

   local rankingButton = createButton("Rankings", event.params.loadCriteriaSelect)
   rankingButton.x = com.centerX
   rankingButton.y = top
   sceneGroup:insert(rankingButton)

   top = top + 100

   local userGuideButton = createButton("User Guide", event.params.loadUserGuide)
   userGuideButton.x = com.centerX
   userGuideButton.y = top
   sceneGroup:insert(userGuideButton)

   top = top + 100

   search:addHandler(
      "onSubmit",
      function(value)
         event.params.loadCountryList(filterCountries(countries, value))
      end
   )

   self.search = search
end

function scene:show(event)
   local sceneGroup = self.view
   local phase = event.phase

   if phase == "will" then
      -- Called when the scene is still off screen and is about to move on screen
      self.search.isVisible = true
      self.search:reset()
   elseif phase == "did" then
   -- Called when the scene is now on screen
   end
end

function scene:hide(event)
   local sceneGroup = self.view
   local phase = event.phase

   if event.phase == "will" then
      -- Called when the scene is on screen and is about to move off screen
      self.search.isVisible = false
   elseif phase == "did" then
   -- Called when the scene is now off screen
   end
end

function scene:destroy(event)
   local sceneGroup = self.view

   -- Called prior to the removal of scene's "view" (sceneGroup)
   self.search:removeSelf()
   self.search = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

-----------------------------------------------------------------------------------------

return scene
