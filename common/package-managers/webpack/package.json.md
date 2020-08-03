npm install babel-core babel-loader babel-preset-es2015 webpack --save-dev
./node_modules/.bin/webpack --watch

# package.json

{
  "name": "network-subscriptions",
  "version": "1.0.0",
  "scripts": {
    "build": "babel src -d network-subscriptions/public/js"
  },
  "devDependencies": {
    "babel-cli": "^6.24.1",
    "babel-core": "^6.25.0",
    "babel-loader": "^7.1.1",
    "babel-preset-es2015": "^6.24.1",
    "babel-watch": "^2.0.6",
    "webpack": "^3.0.0"
  },
  "babel": {
    "presets": [
      "es2015"
    ]
  }
}