# awesome-app-dev

[![Build Status](https://travis-ci.org/cahilfoley/awesome-app-dev.svg?branch=develop)](https://travis-ci.org/cahilfoley/awesome-app-dev)

Awesome App Dev Elite Mega Pro Hackers

## Contents

<!-- toc -->

- [Installation](#Installation)
- [Testing](#Testing)
  * [Test Scripts](#Test-Scripts)
  * [Running Tests](#Running-Tests)
  * [CI Tests](#CI-Tests)
- [Scripts](#Scripts)
  * [Importing Country Data](#Importing-Country-Data)
  * [Printing Tables](#Printing-Tables)
- [Code Formatting](#Code-Formatting)
  * [Formatting Script](#Formatting-Script)
    + [Usage](#Usage)

<!-- tocstop -->

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

**In a unit test**

```lua
local countryImport = require("utils.country-import")
local countries = countryImport("data/country.json")

--[[
  Countries is a table of country tables, each contains the following
      country.name (eg 'Afghanistan')
      country.score (eg 34)
      country.flag (eg 'Afghanistan-01.png')
]]--
```

**In Corona**

```lua
local countryImport = require("utils.country-import")
local countries = countryImport(system.pathForFile("data/country.json"))

-- Same data as above example
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

## Code Formatting

An `.editorconfig` file is provided with the formatting standards for this repository. To use these standards in the Atom text editor install the [editorconfig](https://github.com/sindresorhus/atom-editorconfig) package.

### Formatting Script

To assist with consistent formatting across the whole codebase a JS script is provided that will parse the whole lua codebase and apply the formatting rules. This script is in the [`./formatter`](./formatter/) directory.

#### Usage

To use the script you must first install Node.js (a JavaScript runtime) which can be downloaded from [this link](https://nodejs.org). After installing Node.js open a terminal in the formatter directory and run the following command to install the package dependencies.

```bash
npm install
```

Once the dependencies are installed you can run the formatter with this command.

```bash
npm run format
```

If you wish to run the formatter in watch mode (will re-run the formatter on file change) then run the `watch` command.

```bash
npm run watch
```
