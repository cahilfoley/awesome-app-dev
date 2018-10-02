local json = require("vendor.dkjson")

function dataImport()
  -- Read the JSON file as a string
  local fileData = io.open('../data/country.json', 'rb')
  local jsonString = fileData:read('*all')

  -- Convert the JSON string to a table
  local importedData = json.decode(jsonString, 1, nil)

  local output = {}

  for name, country in pairs(importedData) do
    -- Make a table for the specific country
    local countryTable = {
      name = name,
      score = country['1'],
      flag = name .. '-01.png'
    }

    -- Add the country to the output table
    output[name] = countryTable
  end

  return output
end

return dataImport
