module.exports = (grunt) ->
  src   = './src/documents/styles/main.styl'
  build = './out/styles/style.css'

  grunt.config 'stylus',
    prod:
      src: src
      dest: build

    dev:
      src: src
      dest: build
      options:
        compress: false
