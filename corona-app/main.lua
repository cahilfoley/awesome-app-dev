-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar(display.DefaultStatusBar)

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

-- read the country data
local dataImport = require "data-import"
local countries = dataImport()

-- event listeners for tab buttons:
local function onFirstView(event)
  composer.gotoScene("view1", {
    effect = 'fade',
    time = 100
  })
end

local function onSecondView(event)
  composer.gotoScene(
    "view2",
    {
      effect = 'fade',
      time = 100,
      params = {
        countries = countries
      }
    }
  )
end

-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
  { label = "First", defaultFile = "button.png", overFile = "button-down.png", width = 32, height = 32, onPress = onFirstView, selected = true },
  { label = "Second", defaultFile = "button.png", overFile = "button-down.png", width = 32, height = 32, onPress = onSecondView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
  top = display.contentHeight - 52, -- 52 is default height for tabBar widget
  buttons = tabButtons
}
-- hidden while showing the intro animation
tabBar.isVisible = false

-- load the intro-animation scene
composer.gotoScene(
  "views.intro-animation",
  {
    params = {
      load = function()
        tabBar.isVisible = true
        onFirstView()
      end
    }
  }
)
