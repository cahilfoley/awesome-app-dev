--[[
   Returns an iterator through a table sorted by the key. An optional function can be passed to override the sort
   comparison function.
]]--
function pairsByKey(inputTable, compare)
   local all = {}
   for key in pairs(inputTable) do
      table.insert(all, key)
   end
   table.sort(all, compare)
   local index = 0
   local iterator = function()
      index = index + 1
      if all[index] == nil then
         return nil
      else
         return all[index], inputTable[all[index]]
      end
   end
   return iterator
end

return pairsByKey
