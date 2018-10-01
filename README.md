# awesome-app-dev

Awesome App Dev Elite Mega Pro Hackers

## Loading Data

To load country data in the application use the following code.

```lua
local dataImport = require("data-import")
local countries = dataImport()

--[[
  Countries is a table of country tables, each contains the following
      country.name (eg 'Afghanistan')
      country.score (eg 34)
      country.flag (eg 'Afghanistan-01.png')
]]--
```
