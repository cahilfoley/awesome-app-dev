require("busted")
local countryImport = require("utils.country-import")

describe(
   "Testing the country-import function #import",
   function()
      local countries = countryImport("data/country.json")

      it(
         "should have the right number of countries",
         function()
            -- There are 113 countries in the data file
            local totalItems = 0

            for country in pairs(countries) do
               totalItems = totalItems + 1
            end

            -- If all countries had flags it would be 113
            -- assert.are.same(totalItems, 113)

            -- 93 countries have flags and are included
            assert.are.same(totalItems, 93)
         end
      )

      describe(
         "Contains values for the country Afghanistan",
         function()
            local afghanistan = countries.Afghanistan

            it(
               "should countain the country name",
               function()
                  assert.are.same(afghanistan.name, "Afghanistan")
               end
            )

            it(
               "should countain the country score",
               function()
                  assert.are.same(afghanistan.score, 34)
               end
            )

            it(
               "should countain the country flag file name",
               function()
                  assert.are.same(afghanistan.flag, "data/flags/Afghanistan-01.png")
               end
            )
         end
      )
   end
)
