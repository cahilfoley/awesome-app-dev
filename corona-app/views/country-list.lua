-----------------------------------------------------------------------------------------
--
-- views/country-list.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local com = require("utils.common")
local createPageHeader = require("utils.create-page-header")
local createScrollView = require("utils.create-scroll-view")
local pairsByKey = require("utils.pairs-by-key")

local scene = composer.newScene()

local itemHeight = 120

function scene:create(event)
   local sceneGroup = self.view

   -- List scrolling display
   local scrollView = createScrollView()

   local index = 0
   for name, country in pairsByKey(event.params.countries) do
      local item = display.newContainer(display.contentWidth, itemHeight + 10)

      -- Background for the list item
      local bgShadow = display.newRoundedRect(3, 3, com.w - 20, itemHeight, 7)
      bgShadow:setFillColor(0)
      bgShadow.alpha = 0.3
      item:insert(bgShadow)

      local bg = display.newRoundedRect(0, 0, com.w - 20, itemHeight, 5)
      bg:setFillColor(1)
      item:insert(bg)

      -- Insert flag image to left side of list item
      local flag = display.newImageRect(item, country.flag, 100, 100)
      flag.x = -com.centerX + 70
      flag.y = 0
      item:insert(flag)

      -- Name of the country
      local name = display.newText(
         {
            alpha = 0.82,
            x = 60,
            y = 0,
            width = com.w - 140,
            height = 0,
            font = "Roboto",
            fontSize = 24,
            align = "left",
            text = name
         }
      )
      name:setFillColor(0)
      item:insert(name)

      item:addEventListener(
         "tap",
         function()
            event.params.selectCountry(country)
         end
      )

      item:translate(com.centerX, itemHeight / 2 + index * (itemHeight + 10))
      scrollView:insert(item)
      index = index + 1
   end

   -- There were no countries in the search results
   if index == 0 then
      local emptyLabel = display.newText(
         {
            alpha = 0.82,
            x = com.centerX,
            y = 120,
            width = com.w - 20,
            height = 0,
            font = "Roboto",
            fontSize = 32,
            align = "center",
            text = "No results"
         }
      )
      emptyLabel:setFillColor(0)

      scrollView:insert(emptyLabel, true)
   end

   self.scrollView = scrollView

   sceneGroup:insert(scrollView)
end

function scene:destroy(event)
   local sceneGroup = self.view

   self.scrollView:removeSelf()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("destroy", scene)

-----------------------------------------------------------------------------------------

return scene
