// This ignores automatically generated files from the dev server watched files.

const webpack = require('webpack')

const ignorePlugin = new webpack.WatchIgnorePlugin({
  paths: [/scss\.d\.ts$/]
});

module.exports = ignorePlugin;
