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
  return true
end

local function createScrollView()
  local scrollView = widget.newScrollView {
    left = 0,
    top = 0,
    width = display.contentWidth,
    height = display.contentheight,
    -- topPadding = 50,
    bottomPadding = 50,
    horizontalScollDisabled = true,
    verticalScollDisabled = true,
    listener = scrollListener,
  }

  return scrollView
end

return createScrollView

-- local lotsOfText = "Afghanire Cartier"
-- local lotsOfTextObject = display.newText( lotsOfText, 0, 0, 300, 0, "Helvetica", 14)
-- lotsOfTextObject:setTextColor(0)
-- lotsOfTextObject.x = display.contentCenterX
--
-- scrollView:insert(lotsOfTextObject)
