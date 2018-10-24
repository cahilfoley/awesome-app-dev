-----------------------------------------------------------------------------------------
--
-- views/user-guide.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local com = require("utils.common")

local scene = composer.newScene()

function scene:create(event)
   local sceneGroup = self.view

   local webView = native.newWebView(0, 100, com.w, com.h - 100)
   webView.anchorX = 0
   webView.anchorY = 0
   webView:request(system.pathForFile("user-guide/dist/index.html"), system.ResourceDirectory)

   self.webView = webView

   sceneGroup:insert(webView)
end

function scene:show(event)
   local sceneGroup = self.view
   local phase = event.phase

   if phase == "will" then
      -- Called when the scene is still off screen and is about to move on screen
      self.webView.isVisible = true
   elseif phase == "did" then
      -- Called when the scene is now on screen
   end
end

function scene:hide(event)
   local sceneGroup = self.view
   local phase = event.phase

   if event.phase == "will" then
      -- Called when the scene is on screen and is about to move off screen
      self.webView.isVisible = false
   elseif phase == "did" then
      -- Called when the scene is now off screen
   end
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
