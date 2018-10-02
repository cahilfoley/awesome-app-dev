package = 'awesome-app-dev'
version = 'scm-0'

source = {
  url = ''
}

description = {
  summary = '',
  homepage = '',
  license = 'MIT'
}

dependencies = {
  'lua >= 5.1'
}

build = {
  copy_directories = {},

  type = 'builtin',

  modules = {
    ['dataImport'] = 'corona-app/data-import.lua'
  }
}
