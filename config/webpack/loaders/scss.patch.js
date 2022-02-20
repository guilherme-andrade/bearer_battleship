// By default, the scss loader is used for both .scss and .module.scss files.
// This is a problem when using typescript, since imported scss modules need type definitions.
// To fix this, we override the scss loader to exclude the .module.scss files, which are loaded by the loader in ./cssModules.js.

const { webpackConfig: { module: { rules } } } = require('@rails/webpacker')

const scssLoader = rules.find((rule) => 'file.scss'.match(rule.test))
scssLoader.exclude = /\.module\.scss$/
