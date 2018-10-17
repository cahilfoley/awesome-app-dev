const fs = require('fs-extra')
const path = require('path')
const globSync = require('glob')
const { formatText } = require('lua-fmt')
const { promisify } = require('util')

const glob = promisify(globSync)

const root = path.join(__dirname, '../corona-app')

glob(root + '/**/*.lua')
  .then(matches =>
    matches.map(match =>
      fs
        .readFile(match, 'utf8')
        .then(content =>
          formatText(content, {
            lineWidth: 100,
            indentCount: 2
          })
        )
        .then(output => fs.writeFile(match, output))
        .catch(console.error)
    )
  )
  .then(operations => Promise.all(operations))
  .then(results => console.log(`Finished formatting ${results.length} files`))
  .catch(console.error)
