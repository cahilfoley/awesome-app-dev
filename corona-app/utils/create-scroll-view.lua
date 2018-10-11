local widget = require("widget")

local function createScrollView()
  local scrollView = widget.newScrollView({
    backgroundColor = {.87,.87,.87},
    left = 0,
    top = 100,
    width = display.contentWidth,
    height = display.contentheight,
    topPadding = 10,
    bottomPadding = 50,
    horizontalScollDisabled = true
  })

  return scrollView
end

return createScrollView
