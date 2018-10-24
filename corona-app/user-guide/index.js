const fs = require('fs-extra')
const globSync = require('glob')
const pretty = require('pretty')
const marked = require('marked')
const Typography = require('typography')
const theme = require('typography-theme-lincoln')
const path = require('path')
const { promisify } = require('util')

const glob = promisify(globSync)

theme.baseFontSize = '18px'
theme.baseLineHeight = 1.666
theme.headerFontFamily = ['Varela Round', 'Helvetica Neue', 'Segoe UI', 'Helvetica', 'Arial', 'sans-serif']
theme.headerWeight = 400
theme.bodyFontFamily = ['Lora', 'Georgia', 'serif']

async function writeFile(path, content) {
  await fs.writeFile(path, content)
  console.log(`File Generated: ${path}`)
}

async function renderFile(filePath) {
  try {
    const file = path.parse(filePath)
    const markdownContent = await fs.readFile(filePath, 'utf8')
    guideHTML = `
      <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>Country Rankinator User Guide</title>
          <link href="https://fonts.googleapis.com/css?family=Lora|Varela+Round" rel="stylesheet">
          <link href="style.css" rel="stylesheet">
        </head>
        <body>
          <div id="root">
            ${marked(markdownContent)}
          </div>
        </body>
      </html>
    `

    await writeFile(path.join(__dirname, 'dist', `${file.name}.html`), pretty(guideHTML))
  } catch (err) {
    return Promise.reject(err)
  }
}

fs.emptyDir(path.join(__dirname, 'dist')).then(() => {
  writeFile(
    path.join(__dirname, 'dist', 'style.css'),
    pretty(`
  <style>
    #root {
      max-width: 42rem;
      margin-left: auto;
      margin-right: auto;
      padding: 1.5rem 1.125rem;
    }

    ${new Typography(theme).toString()}

    img {
      max-height: 400px;
      width: auto;
      position: relative;
      left: 50%;
      transform: translateX(-50%);
    }
  </style>
  `).replace(/<\/?style>/gi, '')
  )

  fs.copy(path.join(__dirname, 'content/images'), path.join(__dirname, 'dist/images'))

  glob('./content/**/*.md')
    .then(matches => Promise.all(matches.map(renderFile)))
    .catch(console.error)
})
