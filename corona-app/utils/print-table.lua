function printTable(value)
  local s = "{"
  local sep = ""
  for key, val in pairs(value) do
    s = s .. key .. ': ' .. val .. e
    sep = ", "
  end
  return s .. "}"
end

return printTable
