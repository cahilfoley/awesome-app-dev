-----------------------------------------------------------------------------------------
--
-- views/menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local createButton = require("utils.create-button")
local scene = composer.newScene()

function scene:create(event)
  local sceneGroup = self.view

  -- create a white background to fill screen
  local background = display.newRect(
    display.contentCenterX,
    display.contentCenterY,
    display.contentWidth,
    display.contentHeight
  )
  background:setFillColor(.87,.87,.87)

  -- Create the widget
  local button = createButton("Country List", function()
    event.params.loadCountryList()
  end)
  button.x = display.contentCenterX
  button.y = 160


  local button2 = createButton("Alerts", function()
    print("Alert Button")
  end)
  button2.x = display.contentCenterX
  button2.y = 260


  -- local button3 = createButton("Button 3", function()
  --   print("Pressed button 3")
  -- end)
  -- button3.x = display.contentCenterX
  -- button3.y = 380


  sceneGroup:insert(background)
  sceneGroup:insert(button)
  sceneGroup:insert(button2)
  -- sceneGroup:insert(button3)
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
