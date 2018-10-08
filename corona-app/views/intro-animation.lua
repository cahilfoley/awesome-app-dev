-----------------------------------------------------------------------------------------
--
-- views/intro-animation.lua
--
-----------------------------------------------------------------------------------------
local composer = require "composer"
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
  -- Code here runs when the scene is first created but has not yet appeared on screen
  function touchlistener(e)
    if (e.phase == "ended") then
      event.params.load()
    end
    return true
  end

  -- Assign "self.view" to local variable "sceneGroup" for easy reference
  local sceneGroup = self.view

  local background = display.newImageRect("background.png", display.viewableContentHeight * 3, display.viewableContentWidth * 3)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  local loading = display.newText(
    {
      alpha = 0.8,
      text = "Tap to start",
      x = display.contentCenterX,
      y = display.contentHeight - 50,
      width = display.contentWidth,
      fontSize = 32,
      height = 100,
      font = "Roboto",
      align = "center"
    }
  )
  loading:setFillColor(1)

  local globeSheet = graphics.newImageSheet("globe-sprite.png", {width = 450, height = 450, numFrames = 72})

  local globeSprite = display.newSprite(globeSheet, {name = "earth", start = 1, count = 72, time = 3000})
  globeSprite.x = display.contentCenterX
  globeSprite.y = display.contentCenterY
  local scale = display.contentWidth / 450
  globeSprite.xScale = scale
  globeSprite.yScale = scale
  globeSprite:play()

  -- -----------------------------------------------------------------------------------
  -- Insert items into scene group

  sceneGroup:insert(background)
  sceneGroup:insert(loading)
  sceneGroup:insert(globeSprite)
  sceneGroup:addEventListener("touch", touchlistener)
end

-- show()
function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase

  if (phase == "will") then
    -- Code here runs when the scene is still off screen (but is about to come on screen)
  elseif (phase == "did") then
    -- Code here runs when the scene is entirely on screen
  end
end

-- hide()
function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase

  if (phase == "will") then
    -- Code here runs when the scene is on screen (but is about to go off screen)
  elseif (phase == "did") then
    -- Code here runs immediately after the scene goes entirely off screen
  end
end

-- destroy()
function scene:destroy(event)
  display.remove(globeSprite)
  globeSprite = nil

  local sceneGroup = self.view

  -- Code here runs prior to the removal of scene's view
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene
