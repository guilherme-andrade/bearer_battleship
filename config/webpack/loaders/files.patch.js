// By default, webpacker maps asset files, regardless of their containing directory, to static/file_name.ext
// This is a problem when you have assets with similar names in different directories.
// To fix this, we need to map the asset files to the correct directory.
// This is done by overriding the file loader's file name generator.

const { webpackConfig: { module: { rules } } } = require('@rails/webpacker')

const fileLoader = rules.find((rule) => rule.type === 'asset/resource')

fileLoader.generator.filename = function(path) {
  if (path.filename.includes('node_modules')) {
    return path.filename.replace('../../', '')
  }

  return '[path][name][hash][ext][query]'
}
