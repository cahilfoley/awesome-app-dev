# awesome-app-dev

Awesome App Dev Elite Mega Pro Hackers

## Contents
  * [Installation](#installation)
  * [Testing](#testing)
     * [Test Scripts](#test-scripts)
     * [Running Tests](#running-tests)
     * [CI Tests](#ci-tests)
  * [Loading Data](#loading-data)

## Installation

To run the application there are no external dependencies, however, to run the tests you will need to have busted installed.

First, make sure you have `luarocks` installed, there are [instructions here](https://github.com/luarocks/luarocks/wiki/Download) on getting started.

After luarocks is installed open a terminal and run the command `luarocks install busted`

## Testing

### Test Scripts
All of the unit tests in this project live in the `./corona-app/spec/` directory and must have a name ending in `_spec.lua` (e.g. `data-import_spec.lua`).

### Running Tests
To run the tests, first make sure that you have the busted library installed, [instructions here](#Installation), then:

```
cd ./corona-app
busted
```

### CI Tests

This project uses the [Travis CI](https://travis-ci.org/) service to automatically run unit tests on commits and pull requests. The configuration for this service can be found in the [`.travis.yml`](https://github.com/cahilfoley/awesome-app-dev/blob/travis-ci/.travis.yml) file in the project root. After submitting a pull request or pushing a commit the progress of the build can be seen at the [projects Travis CI page](https://travis-ci.org/cahilfoley/awesome-app-dev).

## Scripts

### Importing Country Data

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

### Printing Tables

There is a utility function provided in the `./corona-app/utils` directory that can be used to print the contents of a table.

**Example Usage**

```lua
local printTable = require("utils.print-table")

printTable({
  foo = "bar",
  hello = "world"
})

--[[
  Would print to the console
  {
    hello: "world",
    foo: "bar",
  }
]]--
```
