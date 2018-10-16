local widget = require("widget")

local function scrollListener(event)
  -- local phrase = event.phrase
  -- local direction = event.direction
  --
  -- if event.limitReached then
  --   if "up" == direction then print ("Reached Top Limit")
  --   elseif "down" == direction then print ("Reached Bottom Limit")
  --   end
  -- end
  print(event.phase)
  return true
end

local function createScrollView()
  local scrollView = widget.newScrollView({
    backgroundColor = {.87,.87,.87},
    left = 0,
    top = 100,
    width = display.contentWidth,
    height = display.contentheight,
    topPadding = 10,
    bottomPadding = 50,
    horizontalScollDisabled = true,
    listener = scrollListener,
  })

  return scrollView
end

return createScrollView
