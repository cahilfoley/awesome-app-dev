--[[
   Filters the provided table of countries down to those that contain the provided search string
      @param {table} countries - The table of countries imported from the JSON file
      @param {string} searchString - The query string to filter by
      @return {table} - The filtered table of countries
]] --
local function filterCountries(countries, searchString)
   matches = {}
   local matchCount = 0

   for name, country in pairs(countries) do
      if name:lower():find(searchString:lower()) ~= nil then
         matches[name] = country
         matchCount = matchCount + 1
      end
   end

   return matches, matchCount
end

return filterCountries
