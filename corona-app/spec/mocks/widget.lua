--[[
   Mock for the `widget` table provided by Corona for unit testing
]] --
local widget = {
   newButton = function(options)
      local button = options
      return button
   end,
   newScrollView = function(options)
      local scrollview = options
      return scrollview
   end
}

return widget
