-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- include Corona's "widget" library
local widget = require("widget")
local composer = require("composer")
local createPageHeader = require("utils.create-page-header")

-- read the country data
local dataImport = require("data-import")
local pathForFile = system.pathForFile("data/country.json")
local countries = dataImport(pathForFile)

-- Page title
local title = createPageHeader("Country Ranker")

-- event listeners for tab buttons:
local function onFirstView(event)
  title:showMenuButton()
  title:updateTitle("All Countries")
  composer.gotoScene(
    "views.country-list",
    {
      params = {
        countries = countries
      }
    }
  )
end

local function onSecondView(event)
  title:showMenuButton()
  title:updateTitle("Second View")
  composer.gotoScene("views.view2")
end

-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
  {
    label = "All Countries",
    defaultFile = "button.png",
    overFile = "button-down.png",
    width = 32,
    height = 32,
    onPress = onFirstView,
    selected = true
  },
  {
    label = "Second",
    defaultFile = "button.png",
    overFile = "button-down.png",
    width = 32,
    height = 32,
    onPress = onSecondView
  }
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar({
  top = display.contentHeight - 52, -- 52 is default height for tabBar widget
  buttons = tabButtons
})

local function goToMenu(event)
  tabBar.isVisible = false
  title:updateTitle("Menu")
  composer.gotoScene("views.menu", {
    params = {
    loadCountryList = function()
      tabBar.isVisible = true
      onFirstView()
    end
  }
})
end

title:registerMenuHandler(goToMenu)

-- hidden while showing the intro animation
tabBar.isVisible = false
title.isVisible = false

-- preload the country-list scene
composer.loadScene("views.country-list", {
  params = {
    countries = countries
  }
})

-- load the intro-animation scene
composer.gotoScene("views.intro-animation", {
  params = {
    load = function()
      composer.gotoScene(
        "views.country-list",
        {
          params = {
            countries = countries
          }
        }
      )
      tabBar.isVisible = true
      title.isVisible = true
    end
  }
})
