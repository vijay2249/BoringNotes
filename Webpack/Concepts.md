
Now before that, what is __webpack__ and what is it being used for.

> **webpack** is a _static module bundler_ for modern JavaScript applications

When __webpack__ processes your application, it internally builds a dependency graph from one or more _entry points_ and then combine every module of your project into one or more _bundles_, which are static assets to serve your content from.


### Modules

Each module, has a smaller surface area than a full program, making verification, debugging and testing trivial

Webpack modules can express their dependencies in a variety of ways
1. an ES2015 `import` statement
2. CommonJS `require` statement
3. AMD `define` and `require` statement
4. `@import` statement inside a css/scss/less file
5. an image url in a stylesheet url(...) or HTML \<img src=...> file


#### Modules support

Webpack supports the following modules types natively
- ECMAScript modules
- CommonJS modules
- AMD modules
- Assets
- WebAssembly modules


> In addition to that, webpack supports modules written in a variety of languages and preprocessors via _loaders_.

These _loaders_ describe to webpack how to process non-native modules and include these dependencies into your _bundles_. 

To create custom loaders -> [webpack.js.org/api/loaders/](https://webpack.js.org/api/loaders/)


### Entry

An _entry point_ indicates which module webpack should use to begin building out its internal dependency graph. Webpack will figure out which other modules and libraries that entry point depends on.

By default, its value is `./src/index.js`, but you can also specify multiple entry points by setting an entry property in the webpack configuration.

```js
module.exports = {
	entry: './src/index.js'
}
```

```js
module.exports = {
	entry: {
		home: "./src/home.js",
		contact: "./src/contact.js"
	}
}
```

_Single entry syntax_ is great choice when you are looking to quickly set up a webpack configuration for an application or tool with one entry. However, there is not much flexibility given in extending or scaling your configuration with this syntax
```js
module.exports = {
  entry: ['./src/file_1.js', './src/file_2.js'],
  output: {
    filename: 'bundle.js',
  },
};
```


#### Syntax

1. Single Entry syntax
	1. `entry: string | [string]`
2. Object syntax
	1. `entry: { <chunkName>: string | [string]`
