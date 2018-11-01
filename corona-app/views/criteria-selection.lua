-----------------------------------------------------------------------------------------
--
-- views/country-details.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local com = require("utils.common")
local createButton = require("utils.create-button")
local createPageHeader = require("utils.create-page-header")
local createScrollView = require("utils.create-scroll-view")
local pairsByKey = require("utils.pairs-by-key")
local sections = require("data.sections")

local scene = composer.newScene()

function scene:create(event)
   local sceneGroup = self.view

   -- List scrolling display
   local scrollView = createScrollView()

   local title = display.newText(
      {
         alpha = 0.82,
         x = com.w / 2,
         y = 30,
         width = com.w - 20,
         height = 0,
         font = "fonts/Roboto",
         fontSize = 24,
         align = "center",
         text = "Select Criteria to Order By"
      }
   )
   title:setFillColor(0)

   scrollView:insert(title)

   local top = 120

   for index, section in pairs(sections) do
      local button = createButton(
         section.title,
         function()
            composer.removeScene("views.country-ranks")
            event.params.selectCriteria(section)
         end,
         true
      )

      button.x = display.contentCenterX
      button.y = top

      scrollView:insert(button)

      top = top + 100
   end

   -- all objects must be added to group (e.g. self.view)
   sceneGroup:insert(scrollView)
end

function scene:show(event)
   local sceneGroup = self.view
   local phase = event.phase

   if phase == "will" then
      -- Called when the scene is still off screen and is about to move on screen
   elseif phase == "did" then
      -- Called when the scene is now on screen
      --
      -- INSERT code here to make the scene come alive
      -- e.g. start timers, begin animation, play audio, etc.
   end
end

function scene:hide(event)
   local sceneGroup = self.view
   local phase = event.phase

   if event.phase == "will" then
      -- self.searchBox:removeSelf()
      -- Called when the scene is on screen and is about to move off screen
      --
      -- INSERT code here to pause the scene
      -- e.g. stop timers, stop animation, unload sounds, etc.)
   elseif phase == "did" then
      -- Called when the scene is now off screen
   end
end

function scene:destroy(event)
   local sceneGroup = self.view

   -- Called prior to the removal of scene's "view" (sceneGroup)
   --
   -- INSERT code here to cleanup the scene
   -- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

-----------------------------------------------------------------------------------------

return scene
