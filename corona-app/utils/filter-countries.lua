local function filterCountries(countries, searchString)
  matches = {}
  local matchCount = 0

  for name, country in pairs(countries) do
    if name:lower():find(searchString:lower()) ~= nil then
      matches[name] = country
      matchCount = matchCount + 1
    end
  end

  return matches, matchCount
end

return filterCountries
