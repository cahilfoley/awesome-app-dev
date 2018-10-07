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
local pathForFile = system.pathForFile "data/country.json"
local countries = dataImport(pathForFile)

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
  {
    label = "First",
    defaultFile = "button1.png",
    overFile = "button1-down.png",
    width = 32,
    height = 32,
    onPress = onFirstView
  },
  {
    label = "Second",
    defaultFile = "button2.png",
    overFile = "button2-down.png",
    width = 32,
    height = 32,
    onPress = onSecondView,
    selected = true
  }
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar {
  top = display.contentHeight - 50, -- 50 is default height for tabBar widget
  buttons = tabButtons
}

onSecondView() -- invoke first tab button's onPress event manually
