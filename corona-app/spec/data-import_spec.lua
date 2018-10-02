require("busted")
local dataImport = require("data-import")

describe("Testing the data-import function #dataImport", function()
  local countries = dataImport()

  it("should have the right number of countries", function()
    -- There are 113 countries in the data file
    local totalItems = 0

    for country in pairs(countries) do
      totalItems = totalItems + 1
    end

    assert.are.same(totalItems, 113)
  end)

  describe("Contains values for the country Afghanistan", function()
    local afghanistan = countries.Afghanistan

    it("should countain the country name", function()
      assert.are.same(afghanistan.name, 'Afghanistan')
    end)

    it("should countain the country score", function()
      assert.are.same(afghanistan.score, 34)
    end)

    it("should countain the country flag file name", function()
      assert.are.same(afghanistan.flag, 'Afghanistan-01.png')
    end)
  end)
end)
