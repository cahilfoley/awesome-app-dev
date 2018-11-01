--[[
   Deep compare of two values, including tables
      @param {*} v1 - The first value to compare
      @param {*} v2 - The second value to compare
      @return {boolean} - The result
]] --
function superMatch(v1, v2)
   local avoid_loops = {}
   local function recurse(t1, t2)
      -- Compare value types
      if type(t1) ~= type(t2) then
         return false
      end

      -- Base case: compare simple values
      if type(t1) ~= "table" then
         return t1 == t2
      end

      -- Avoid looping forever
      if avoid_loops[t1] then
         return avoid_loops[t1] == t2
      end
      avoid_loops[t1] = t2

      -- Copy keys from t2
      local t2keys = {}
      local t2tablekeys = {}
      for k, _ in pairs(t2) do
         if type(k) == "table" then
            table.insert(t2tablekeys, k)
         end
         t2keys[k] = true
      end

      -- Let's iterate keys from t1
      for k1, v1 in pairs(t1) do
         local v2 = t2[k1]
         if type(k1) == "table" then
            -- If key is a table, we need to find an equivalent one
            local ok = false
            for i, tk in ipairs(t2tablekeys) do
               if tableMatch(k1, tk) and recurse(v1, t2[tk]) then
                  table.remove(t2tablekeys, i)
                  t2keys[tk] = nil
                  ok = true
                  break
               end
            end
            if not ok then
               return false
            end
         else
            -- t1 has a key which t2 doesn't have, fail
            if v2 == nil then
               return false
            end
            t2keys[k1] = nil
            if not recurse(v1, v2) then
               return false
            end
         end
      end
      -- If t2 has a key which t1 doesn't have, fail
      if next(t2keys) then
         return false
      end
      return true
   end

   return recurse(v1, v2)
end

return superMatch
