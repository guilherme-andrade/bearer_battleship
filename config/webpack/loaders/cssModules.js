// This adds a loader for .module.scss files, using typings from automatically generated .d.ts files.

module.exports = {
  test: /\.module\.scss$/i,
  use: [
    'style-loader',
    {
      loader: '@teamsupercell/typings-for-css-modules-loader',
      options: {
        verifyOnly: process.env.NODE_ENV === 'production'
      }
    },
    {
      loader: 'css-loader',
      options: {
        modules: {
          getLocalIdent: (context, _localIdentName, localName, _options) => {
            let identifier = context.resourcePath.replace('/styles.module.scss', '')
            identifier = identifier.replace(/^.*\/app\/frontend\/stylesheets\//, '')
            identifier = identifier.replace(/^.*components\//, '')
            identifier = identifier.replace(/\_/g, '-')
            identifier = identifier.replace(/\//g, '--')
            return `${identifier}__${localName}`
          }
        },
        sourceMap: true,
      },
    },
    {
      loader: 'sass-loader',
      options: {
        sourceMap: true,
      },
    },
  ]
}
