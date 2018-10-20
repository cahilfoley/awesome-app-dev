# Country Rankinator Formatter

To assist with consistent formatting across the whole codebase this JS script is provided to parse the whole lua codebase and apply the formatting rules.

## Usage

To use the script you must first install Node.js (a JavaScript runtime) which can be downloaded from [this link](https://nodejs.org). After installing Node.js open a terminal in the `./formatter` directory and run the following command to install the package dependencies.

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
