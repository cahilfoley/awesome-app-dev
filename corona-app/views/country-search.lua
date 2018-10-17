-----------------------------------------------------------------------------------------
--
-- views/country-search.lua
--
-----------------------------------------------------------------------------------------

local createSearchField = require("utils.create-search-field")
local com = require("utils.common")
local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view

  -- create a white background to fill screen
  local background = display.newRect(com.centerX, com.centerY, com.w, com.h)
  background:setFillColor(1)

  sceneGroup:insert(background)
  sceneGroup:insert(search)
end

function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase

  -- if phase == "will" then
  --   -- Called when the scene is still off screen and is about to move on screen
  -- elseif phase == "did" then
  --   -- Called when the scene is now on screen
  -- end
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase

  -- if event.phase == "will" then
  --   -- Called when the scene is on screen and is about to move off screen
  -- elseif phase == "did" then
  --   -- Called when the scene is now off screen
  -- end
end

function scene:destroy(event)
  local sceneGroup = self.view
  -- Called prior to the removal of scene's "view" (sceneGroup)
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

-----------------------------------------------------------------------------------------

return scene
