local json = require("vendor.dkjson")-- one-time load of the routines

function dataImport()
  -- Read the JSON file as a string
  local fileData = io.open('../data/country.json', 'rb')
  local jsonString = fileData:read('*all')
  -- print(jsonString)

  -- Convert the JSON string to a table
  local importedData = json.decode(jsonString, 1, nil)

  local output = {}

  for name, country in pairs(importedData) do
    -- print(name .. ': ' .. country['1'])
    -- print('Flag file: ' .. name .. '-01.png')
    output[name] = {
      name = name,
      score = country['1'],
      flag = name .. '-01.png'
    }
  end

  -- print(json.encode(output, { indent = true }))
  return output
end

return dataImport
