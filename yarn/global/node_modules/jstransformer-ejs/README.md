# jstransformer-ejs

[EJS](https://github.com/mde/ejs) support for [JSTransformers](http://github.com/jstransformers).

[![Build Status](https://img.shields.io/travis/jstransformers/jstransformer-ejs/master.svg)](https://travis-ci.org/jstransformers/jstransformer-ejs)
[![Coverage Status](https://img.shields.io/codecov/c/github/jstransformers/jstransformer-ejs/master.svg)](https://codecov.io/gh/jstransformers/jstransformer-ejs)
[![Dependency Status](https://img.shields.io/david/jstransformers/jstransformer-ejs/master.svg)](http://david-dm.org/jstransformers/jstransformer-ejs)
[![Greenkeeper badge](https://badges.greenkeeper.io/jstransformers/jstransformer-ejs.svg)](https://greenkeeper.io/)
[![NPM version](https://img.shields.io/npm/v/jstransformer-ejs.svg)](https://www.npmjs.org/package/jstransformer-ejs)

## Installation

    npm install jstransformer-ejs

## API

```js
var ejs = require('jstransformer')(require('jstransformer-ejs'))

ejs.render('Hello <%= name %>!', {name: 'World'}).body
//=> 'Hello World!'
```

## License

MIT
