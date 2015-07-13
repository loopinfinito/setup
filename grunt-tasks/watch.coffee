module.exports = (grunt) ->
  grunt.config 'watch',
    content:
      files: './src/**/*.{eco,md}'
      tasks: 'content:dev'

    style:
      files: './src/styles/**/*.styl'
      tasks: 'style:dev'

    script:
      files: './src/scripts/**/*.coffee'
      tasks: 'script:dev'
