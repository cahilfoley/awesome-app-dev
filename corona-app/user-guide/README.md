# Country Rankinator User Guide

This JS script generates a HTML user guide for the Country Rankinator application from markdown source files.

## Files

**Source Code**
The source code for the user guide is contained in the `./content/` directory in markdown files.

**Generated HMTL**
The generated HTML code is written the the `./dist/` directory for use in the application.

## Usage

To use the script you must first install Node.js (a JavaScript runtime) which can be downloaded from [this link](https://nodejs.org). After installing Node.js open a terminal in the `./user-guide` directory and run the following command to install the package dependencies.

```bash
npm install
```

Once the dependencies are installed you can generate the user guide with this command.

```bash
npm run generate
```
