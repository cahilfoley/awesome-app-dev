local superMatch = require("spec.internal.super-match")

local function hasProperty(state, arguments)
   local name = arguments[1]
   local expected = arguments[2]

   return function(result)
      if type(result) ~= "table" then
         return false
      end

      for key, value in pairs(result) do
         if key == name then
            return superMatch(expected, value)
         end
      end

      return false
   end
end

return hasProperty
