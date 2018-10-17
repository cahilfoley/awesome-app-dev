local widget = require("widget")
local com = require("utils.common")

function createButton(label, handler, small)
  local group = display.newGroup(com.w - 20, 100)

  local bgShadow = display.newRoundedRect(3, 3, com.w - 20, 90, 7)
  bgShadow:setFillColor(0)
  bgShadow.alpha = 0.3
  group:insert(bgShadow)

  local fontSize = 32
  if small then
    fontSize = 24
  end

  local button =
    widget.newButton(
    {
      label = label,
      onEvent = function(event)
        if event.phase == "ended" then
          handler(event)
        end
      end,
      emboss = false,
      -- Properties for a rounded rectangle button
      shape = "roundedRect",
      width = com.w - 20,
      height = 90,
      cornerRadius = 5,
      x = 0,
      y = 0,
      fillColor = {
        default = {1, 1, 1},
        over = {.8, .8, .8}
      },
      labelColor = {
        default = {0, 0, 0}
      },
      fontSize = fontSize
    }
  )
  group:insert(button)

  return group
end

return createButton
