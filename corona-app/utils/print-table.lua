function formatTable(value)
  local s = "{"
  for key, val in pairs(value) do
    if type(val) == 'table' then val = formatTable(val) end
    if type(val) == 'string' then val = '"' .. val .. '"' end
    s = s .. "\n  " .. key .. ': ' .. val .. ","
  end
  s = s .. "\n}"
  return s
end

function printTable(value)
  print(formatTable(value))
end

return printTable
