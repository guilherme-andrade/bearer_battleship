process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const { webpackConfig } = require('@rails/webpacker')
const { merge } = require('webpack-merge')

const customConfig = require('./custom')

module.exports = merge(webpackConfig, customConfig)
