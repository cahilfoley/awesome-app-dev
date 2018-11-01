--[[
   Creates a scrollview widget
      @param {table} [libs] - The libraries to use, if a library is not provided then it will be imported (for testing)
      @return {ScrollViewWidget} - A scroll view widget
]] --
local function createScrollView(libs)
   local libs = libs or {}
   local com = libs.com or require("utils.common")
   local widget = libs.widget or require("widget")

   local scrollView = widget.newScrollView(
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
