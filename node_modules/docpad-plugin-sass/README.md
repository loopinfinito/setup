# SASS/SCSS Plugin for DocPad with Compass support
Adds support for the [SASS and SCSS](http://sass-lang.com/) CSS pre-processors to [DocPad](https://docpad.org). It also supports the [Compass](http://compass-style.org/) framework.

Convention:  `.css.sass|scss`


## Install

1. [Install Ruby](http://www.ruby-lang.org/en/downloads/)

2. [Install the SASS gem](http://rubygems.org/gems/sass/)

3. Install this plugin

	```
	npm install --save docpad-plugin-sass
	```


## Configure
For information on customising your plugin configuration you can refer to the [DocPad FAQ](https://github.com/bevry/docpad/wiki/FAQ)

### Sass and Scss Paths
We automatically detect the path to your sass and scss executables, however sometimes that doesn't work. If our detection fails and you'll have to specify the path to your sass and scss executables with the `sassPath` and `scssPath` config options.

### Compass Support
We automatically detect if you have compass installed, and if you do, then we'll use it. If our detection fails and you want to still use it, then set the `compass` option to `true`. If you have compass installed but don't want to use it then set the `compass` option to `false`.

### Output Style
You can set the `outputStyle` option to any of the supported [output styles](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#output_style). Those being `nested`, `expanded`, `compact`, and `compressed`. By default, we use the `compressed` mode for all environments, except the development mode where it is set to `expanded`.

### Require Libraries
You can set the `requireLibraries` option to an array of extra ruby libraries you'd like to include before rendering your sass file. For instance, setting it to `['susy','compass-colors']` will include the [Susy](http://susy.oddbird.net/) and [Compass Colors](https://github.com/chriseppstein/compass-colors) plugins. By default, the value is set to `null` indicating we do not include any libaries.

### Render Underscore Stylesheets
By default we prevent any SASS/SCSS stylesheets that filename starts with underscore character from being rendered and written to the output directory. This is to follow SASS/SCSS convention that such files are just intended to be included inside out stylesheets, and that they are not meant to be rendered by themselves. If you really want to, you can render the underscore stylesheets by setting the `renderUnderscoreStylesheets` option to `true` in your plugin's configuration.


## History
You can discover the history inside the `History.md` file


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012+ [Bevry Pty Ltd](http://bevry.me)
