local json = require("vendor.dkjson")

function fieldImport(pathForFile)
  -- Read the JSON file as a string
  local fileData = io.open(pathForFile, "rb")
  local jsonString = fileData:read("*all")

  -- Convert the JSON string to a table
  local importedData = json.decode(jsonString, 1, nil)

  return importedData
end

return fieldImport
