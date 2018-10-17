function formatTable(value, level)
  if level == nil then
    level = 0
  end
  local padding = ""
  local i = 0
  while i < level do
    padding = padding .. "  "
    i = i + 1
  end

  local s = "{"
  for key, val in pairs(value) do
    if type(val) == "table" then
      val = formatTable(val, level + 1)
    end
    if type(val) == "string" then
      val = '"' .. val .. '"'
    end
    s = s .. "\n  " .. padding .. key .. ": " .. val .. ","
  end
  s = s .. "\n" .. padding .. "}"
  return s
end

function printTable(value)
  print(formatTable(value))
end

return printTable
