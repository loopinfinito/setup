module.exports = (grunt) ->
  src   = './src/styles/main.styl'
  build = './out/styles/main.css'

  grunt.config 'stylus',
    prod:
      src: src
      dest: build

    dev:
      src: src
      dest: build
      options:
        compress: false
