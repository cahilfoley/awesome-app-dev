-----------------------------------------------------------------------------------------
--
-- views/country-details.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local widget = require("widget")
local com = require("utils.common")
local createScrollView = require("utils.create-scroll-view")

local scene = composer.newScene()

-- read the field data
local fieldImport = require("utils.field-import")
local pathForFile = system.pathForFile("data/fields.json")
local fields = fieldImport(pathForFile)

function scene:create(event)
  local sceneGroup = self.view
  local country = event.params.country
  local section = event.params.section

  -- Called when the scene's view does not exist.

  -- List scrolling display
  local scrollView = createScrollView()

  local countryFlag = display.newImageRect(country.flag, 100, 100)
  countryFlag.x = 60
  countryFlag.y = 60

  scrollView:insert(countryFlag)

  local countryName =
    display.newText(
    {
      alpha = 0.82,
      x = com.w / 2 + 60,
      y = 60,
      width = com.w - 20 - 100,
      height = 0,
      font = "fonts/Roboto-Medium",
      fontSize = 28,
      fontWeight = "bold",
      align = "left",
      text = country.name ..
        "\n" .. section.title .. " Score: " .. country.details[section.score .. ""]
    }
  )
  countryName:setFillColor(0)

  scrollView:insert(countryName)

  local bgShadow = display.newRoundedRect(com.centerX + 3, 183, com.w - 20, 60, 7)
  bgShadow:setFillColor(0)
  bgShadow.alpha = 0.3
  scrollView:insert(bgShadow)

  local background = display.newRoundedRect(com.centerX, 150, com.w - 20, 60, 5)
  background:setFillColor(1)
  background.anchorY = 0
  scrollView:insert(background)

  local backArrow =
    widget.newButton(
    {
      defaultFile = "data/icons/back-icon.png",
      width = 40,
      height = 40
    }
  )
  backArrow.x = 40
  backArrow.y = 180

  backArrow:addEventListener(
    "tap",
    function()
      composer.gotoScene("views.country-details", {params = {country = country}})
    end
  )

  scrollView:insert(backArrow)

  local detailsTitle =
    display.newText(
    {
      alpha = 0.82,
      x = com.centerX + 20,
      y = 180,
      width = com.w - 120,
      height = 0,
      font = "Roboto",
      fontSize = 30,
      align = "left",
      text = "Breakdown"
    }
  )
  detailsTitle:setFillColor(0)

  scrollView:insert(detailsTitle)

  local top = 225

  local contentString = ""

  for index, fieldIndex in pairs(section.values) do
    contentString = contentString .. fields[fieldIndex .. ""] .. "\n"
    contentString = contentString .. country.details[fieldIndex .. ""] .. "\n\n"
  end

  local content =
    display.newText(
    {
      alpha = 0.82,
      x = com.centerX,
      width = com.w - 40,
      y = top,
      height = 0,
      font = "Roboto",
      fontSize = 24,
      align = "left",
      text = contentString
    }
  )
  content:setFillColor(0)
  content.anchorY = 0

  scrollView:insert(content)

  sceneGroup:insert(scrollView)
end

function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase

  if phase == "will" then
    -- Called when the scene is still off screen and is about to move on screen
  elseif phase == "did" then
  -- Called when the scene is now on screen
  end
end

function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase

  if event.phase == "will" then
    -- self.searchBox:removeSelf()
    -- Called when the scene is on screen and is about to move off screen
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
