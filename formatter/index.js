#!/usr/bin/env node
const chokidar = require('chokidar')
const fs = require('fs-extra')
const globSync = require('glob')
const { formatText } = require('lua-fmt')
const { promisify } = require('util')

const glob = promisify(globSync)
const argv = require('yargs').argv

const formatSettings = {
  lineWidth: 120,
  indentCount: 3,
  quotemark: 'double'
}
const globPattern = '../corona-app/**/*.lua'

async function formatFile(path) {
  try {
    const content = await fs.readFile(path, 'utf8')

    // Format the code with the lua-fmt library
    const formattedText = formatText(content, formatSettings)

    // The formatter will stick function call assignments on a new line, move them back up
    const output = formattedText.replace(/(\s+=\s*\n+\s*)/gm, ' = ')

    // Only update the file if the content has changed
    if (content !== output) {
      // Write the code back to the file
      await fs.writeFile(path, output)
    }
  } catch (err) {
    return Promise.reject(err)
  }
}

glob(globPattern)
  .then(matches => Promise.all(matches.map(formatFile)))
  .then(results => console.log(`Finished formatting ${results.length} files`))
  .catch(console.error)
  .then(() => {
    if (argv.watch) {
      console.log('Entering watch mode')
      const watcher = chokidar.watch('../corona-app/**/*.lua', { awaitWriteFinish: { stabilityThreshold: 300 } })

      watcher.on('change', path => {
        console.log(`File change detected: ${path}`)
        // Don't want to fire a change event with the formatting, stop watching it
        watcher.unwatch(path)
        formatFile(path).then(() => {
          // File has been formatted, start watching again
          watcher.add(path)
        })
      })
    }
  })
