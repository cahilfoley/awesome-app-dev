const fs = require('fs-extra')
const path = require('path')
const globSync = require('glob')
const { formatText } = require('lua-fmt')
const { promisify } = require('util')

const root = path.join(__dirname, '../corona-app')

const glob = promisify(globSync)

const formatSettings = {
  lineWidth: 120,
  indentCount: 3,
  quotemark: 'double'
}

glob(root + '/**/*.lua')
  .then(matches =>
    matches.map(match =>
      fs
        .readFile(match, 'utf8')
        .then(content => formatText(content, formatSettings))
        // The formatter will stick function call assignments on a new line, move them back up
        .then(content => content.replace(/(\s+=\s*\n+\s*)/gm, ' = '))
        .then(output => fs.writeFile(match, output))
        .catch(console.error)
    )
  )
  .then(operations => Promise.all(operations))
  .then(results => console.log(`Finished formatting ${results.length} files`))
  .catch(console.error)
