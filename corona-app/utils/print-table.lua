function printTable(value)
  local s = "{"
  for key, val in pairs(value) do
    if type(val) == 'string' then val = '"' .. val .. '"' end
    s = s .. "\n  " .. key .. ': ' .. val .. ","
  end
  print(s .. "\n}")
end

return printTable
