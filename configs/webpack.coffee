{resolve} = require 'path'
buildDir = resolve __dirname, '..', 'build'
module.exports =
  context: resolve __dirname, '..'
  entry: [
    'scripts/main.coffee'
  ]
  output:
    path: buildDir
    filename: 'bundle.js'
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'}
    ]
  resolve:
    modulesDirectories: [
      'node_modules'
      'src'
      'assets'
    ]
  devServer:
    contentBase: buildDir

