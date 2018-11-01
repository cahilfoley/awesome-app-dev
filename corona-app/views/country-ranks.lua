-----------------------------------------------------------------------------------------
--
-- views/country-ranks.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local com = require("utils.common")
local createPageHeader = require("utils.create-page-header")
local createScrollView = require("utils.create-scroll-view")
local pairsByKey = require("utils.pairs-by-key")

local scene = composer.newScene()

local itemHeight = 120
local top = 140

function scene:create(event)
   local sceneGroup = self.view
   local countries = event.params.countries
   local section = event.params.section

   -- List scrolling display
   local scrollView = createScrollView()

   local title = display.newText(
      {
         alpha = 0.82,
         x = 50,
         y = 30,
         width = com.w - 60,
         height = 0,
         font = "fonts/Roboto",
         fontSize = 24,
         align = "center",
         text = section.title
      }
   )
   title.anchorX = 0
   title:setFillColor(0)

   scrollView:insert(title)

   local backArrow = widget.newButton(
      {
         defaultFile = "data/icons/back-icon.png",
         width = 40,
         height = 40
      }
   )
   backArrow.x = 40
   backArrow.y = 30

   backArrow:addEventListener("tap", event.params.back)

   scrollView:insert(backArrow)

   local index = 0
   for sortKey, country in pairsByKey(
      countries,
      function(a, b)
         return a > b
      end
   ) do
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

      -- Name and score of the country
      local countryScore = country.details[section.score .. ""]
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
            text = country.name .. "\n" .. countryScore .. "/100"
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

      item:translate(com.centerX, top + index * (itemHeight + 10))
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
