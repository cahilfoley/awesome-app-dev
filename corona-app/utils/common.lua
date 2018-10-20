-- Extracted from SSK
-- https://github.com/roaminggamer/SSKCorona
--
common = {}

function common.round(val, n)
   if (n) then
      return math.floor((val * 10 ^ n) + 0.5) / (10 ^ n)
   else
      return math.floor(val + 0.5)
   end
end
common.w = display.contentWidth
common.h = display.contentHeight
common.centerX = display.contentCenterX
common.centerY = display.contentCenterY
common.fullw = display.actualContentWidth
common.fullh = display.actualContentHeight
common.unusedWidth = common.fullw - common.w
common.unusedHeight = common.fullh - common.h
common.left = common.round(0 - common.unusedWidth / 2)
common.top = common.round(0 - common.unusedHeight / 2)
common.right = common.round(common.w + common.unusedWidth / 2)
common.bottom = common.round(common.h + common.unusedHeight / 2)

return common
