--[[
   Mock for the `native` table provided by Corona for unit testing
]] --
local native = {
   newTextField = function(x, y, w, h)
      local textField = {
         x = x,
         y = y,
         width = w,
         height = h,
         eventHandlers = {}
      }

      textField.setReturnKey = function(self, key)
         self.returnKey = key
      end

      textField.addEventListener = function(self, event, handler)
         self.eventHandlers[event] = handler
      end

      return textField
   end
}

return native
