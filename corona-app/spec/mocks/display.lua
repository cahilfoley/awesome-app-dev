--[[
   Mock for the `display` table provided by Corona for unit testing
]] --
function newRect(x, y, w, h)
   local rect = {
      alpha = 1
   }

   function rect:setFillColor(color)
      rect.fillColor = color
   end

   return rect
end

local display = {
   newGroup = function()
      local group = {
         items = {}
      }

      function group:insert(item)
         table.insert(group.items, item)
      end

      return group
   end,
   newRoundedRect = function(x, y, w, h, r)
      return newRect(x, y, w, h)
   end
}

return display
