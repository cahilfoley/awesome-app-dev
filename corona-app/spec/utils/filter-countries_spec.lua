require("busted")
local countryImport = require("utils.country-import")
local filterCountries = require("utils.filter-countries")
 --

--[[
   Filters the provided table of countries down to those that contain the provided search string
      @param {table} countries - The table of countries imported from the JSON file
      @param {string} searchString - The query string to filter by
      @return {table} - The filtered table of countries
]] describe(
   "Testing the filter-Countries function #utils",
   function()
      local countries = countryImport("data/country.json")

      it(
         "To search through the database and find 2 matches to search string 'aus'",
         function()
            local searchString = "aus"
            local results = filterCountries(countries, searchString)
            local matches = 0

            for item in pairs(results) do
               matches = matches + 1
            end
            assert.are.same(matches, 2)
         end
      )
   end
)
