local widget = require("widget")
local com = require("utils.common")

local function createScrollView()
  local scrollView =
    widget.newScrollView(
    {
      backgroundColor = {.87, .87, .87},
      left = 0,
      top = 100,
      width = com.w,
      height = com.h - 100,
      topPadding = 20,
      bottomPadding = 20,
      horizontalScollDisabled = true
    }
  )

  return scrollView
end

return createScrollView
