# webpack.config.js

var path = require('path');
var webpack = require('webpack');
var outputPath = __dirname+'\\network-subscriptions\\public\\js';

console.log(outputPath);
module.exports = {
    entry: {
        'base': './network-subscriptions/public/src/base.js',
        'page-default': './network-subscriptions/public/src/page-default.js',
        'page-profile': './network-subscriptions/public/src/page-profile.js'
    },
    output: {
        path: outputPath,
        filename: '[name]-bundle.js?v=[chunkhash:8]'
    },
    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    stats: {
        colors: true
    },
    devtool: 'source-map'
};