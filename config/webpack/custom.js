const { basePath } = require('./config/base')

const typeScriptPlugin = require('./plugins/typescript')
const ignorePlugin = require('./plugins/watchIgnore')

const cssModulesLoader = require('./loaders/cssModules')
const typescriptLoader = require('./loaders/typescript')

require('./loaders/scss.patch')
require('./loaders/files.patch')

module.exports = {
  context: basePath,
  resolve: {
    extensions: ['.css', '.js', '.jsx', '.ts', '.tsx', '.scss', '.json'],
  },
  plugins: [
    typeScriptPlugin,
    ignorePlugin,
  ],
  module: {
    rules: [
      cssModulesLoader,
      typescriptLoader
    ],
  },
}
