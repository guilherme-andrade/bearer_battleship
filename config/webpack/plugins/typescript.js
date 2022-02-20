// This adds typescript support to the webpack config.

const path = require('path')
const fs = require('fs')
const { basePath } = require('../config/base')

const ForkTSCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin')

const envFileName = `tsconfig.${process.env.NODE_ENV}.json`

const configfilePath = fs.access(path.resolve(basePath, envFileName), fs.FS_OK, function(exists) {
  if (exists) {
    return path.resolve(basePath, envFileName)
  } else {
    return path.resolve(basePath, 'tsconfig.json')
  }
})

const typeScriptPlugin = new ForkTSCheckerWebpackPlugin({
  typescript: {
    configFile: configfilePath
  },
  async: false
})

module.exports = typeScriptPlugin
