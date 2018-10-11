local widget = require("widget")

function createButton(label, handler)
  local group = display.newGroup(display.contentWidth - 20, 100)

  local bgShadow = display.newRoundedRect(3, 3, display.contentWidth - 20, 90, 7)
  bgShadow:setFillColor(0)
  bgShadow.alpha = 0.3
  group:insert(bgShadow)

  local button = widget.newButton({
    label = label,
    onEvent = handler,
    emboss = false,
    -- Properties for a rounded rectangle button
    shape = "roundedRect",
    width = display.contentWidth - 20,
    height = 90,
    cornerRadius = 5,
    x = 0,
    y = 0,
    fillColor = {
      default = { 1, 1, 1 },
      over = { .8, .8, .8 }
    },
    labelColor = {
      default = { 0, 0, 0 }
    },
    fontSize = 32
  })
  group:insert(button)

  return group
end

return createButton
