-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local createScrollView = require("scrolling-list")
local pairsByKey = require "utils.pairs-by-key"

local scene = composer.newScene()

local itemHeight = 100

function scene:create(event)
  local sceneGroup = self.view

  -- Called when the scene's view does not exist.
  --
  -- INSERT code here to initialize the scene
  -- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

  -- List title
  local title = display.newText("Country List", display.contentCenterX, 40, 'Roboto', 32)
  title:setFillColor(0) -- black

  local scrollView = createScrollView()

  local listItems = {}
  local index = 0
  for name, country in pairsByKey(event.params.countries) do
    local top = 80 + itemHeight / 2 + index * itemHeight
    local item = display.newGroup()

    -- Background for the list item
    local bg = display.newRect(
      display.contentCenterX,
      top,
      display.contentWidth - 10,
      itemHeight - 5
    )
    bg:setFillColor(0.87)
    item:insert(bg)

    -- Insert flag image to left side of list item
    local flag = display.newImageRect(country.flag, 100, 80)
    flag.x = 60
    flag.y = top
    item:insert(flag)

    -- Name of the country
    local name = display.newText({
      x = display.contentWidth / 2 + 60,
      y = top + 45,
      width = display.contentWidth - 140,
      height = 140,
      font = 'Roboto', fontSize = 24,
      align = "left",
      text = name,
      color
    })
    name:setFillColor(0)
    item:insert(name)

    scrollView:insert(item)
    index = index + 1
  end

  -- all objects must be added to group (e.g. self.view)
  scrollView:insert(title)

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
