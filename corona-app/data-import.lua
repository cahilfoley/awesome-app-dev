local json = require("vendor.dkjson")

local excludes = {
  'Belize',
  'Cote d’Ivoire',
  'Guatemala',
  'Guyana',
  'Malawi',
  'Moldova',
  'Nepal',
  'Nicaragua',
  'Kenya',
  'Serbia',
  'St.Kitts and Nevis',
  'St. Vincetn and the Grenadines',
  'St. Lucia',
  'South Africa',
  'Sri Lanka',
  'Suriname',
  'Uganda',
  'Uzbekistan',
  'Zambia',
  'Zimbabwe'
}

function isExcluded(name)
  for index, exclusion in pairs(excludes) do
    if exclusion == name then return true end
  end
  return false
end

function dataImport(pathForFile)
  -- Read the JSON file as a string
  local fileData = io.open(pathForFile, 'rb')
  local jsonString = fileData:read('*all')

  -- Convert the JSON string to a table
  local importedData = json.decode(jsonString, 1, nil)

  local output = {}

  for name, country in pairs(importedData) do
    if not isExcluded(name) then
      -- Make a table for the specific country
      local countryTable = {
        name = name,
        score = country['1'],
        flag = 'data/flags/' .. name .. '-01.png'
      }

      -- Add the country to the output table
      output[name] = countryTable
    end
  end

  return output
end

return dataImport
