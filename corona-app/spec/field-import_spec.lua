require("busted")
local fieldImport = require("utils.field-import")

describe(
   "Testing the field-import function #fieldImport",
   function()
      local fields = fieldImport("data/fields.json")

      it(
         "should have the right number of fields",
         function()
            -- There are 45 fields in the data file
            local totalItems = 0

            for field in pairs(fields) do
               totalItems = totalItems + 1
            end

            assert.are.same(totalItems, 45)
         end
      )

      describe(
         "Contains the sections in the correct order",
         function()
            it(
               "should start with the overall score",
               function()
                  assert.are.same(fields["1"], "Overall")
               end
            )

            it(
               "should countain the section 'Absence of Corruption' for item 13",
               function()
                  assert.are.same(fields["13"], "Absence of Corruption")
               end
            )

            it(
               "should end with the section 'Due process of law and the rights of the accused'",
               function()
                  assert.are.same(fields["45"], "Due process of law and the rights of the accused")
               end
            )
         end
      )
   end
)
