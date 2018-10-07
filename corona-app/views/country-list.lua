-----------------------------------------------------------------------------------------
--
-- views/country-list.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local createPageHeader = require("utils.create-page-header")
local createScrollView = require("utils.create-scroll-view")
local pairsByKey = require("utils.pairs-by-key")

local scene = composer.newScene()

local itemHeight = 120

function scene:create(event)
  local sceneGroup = self.view

  -- Called when the scene's view does not exist.

  -- List scrolling display
  local scrollView = createScrollView()

  local index = 0
  for name, country in pairsByKey(event.params.countries) do
    local item = display.newContainer(display.contentWidth, itemHeight + 10)

    -- Background for the list item
    local bgShadow = display.newRoundedRect(3, 3, display.contentWidth - 20, itemHeight, 7)
    bgShadow:setFillColor(0)
    bgShadow.alpha = 0.3
    item:insert(bgShadow)

    local bg = display.newRoundedRect(0, 0, display.contentWidth - 20, itemHeight, 5)
    bg:setFillColor(1)
    item:insert(bg)

    -- Insert flag image to left side of list item
    local flag = display.newImageRect(item, country.flag, 100, 100)
    flag.x = -display.contentCenterX + 70
    flag.y = 0
    item:insert(flag)

    -- Name of the country
    local name = display.newText({
      alpha = 0.82,
      x = 60,
      y = 0,
      width = display.contentWidth - 140, height = 0,
      font = 'Roboto',
      fontSize = 24,
      align = "left",
      text = name
    })
    name:setFillColor(0)
    item:insert(name)

    item:translate(display.contentCenterX, itemHeight / 2 + index * (itemHeight + 10))
    scrollView:insert(item)
    index = index + 1
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
