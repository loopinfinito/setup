module.exports = (grunt) ->
  grunt.config 'watch',
    content:
      files: './src/**/*.{eco,md}'
      tasks: 'content:dev'

    style:
      files: './src/**/*.styl'
      tasks: 'style:dev'

    script:
      files: './src/**/*.coffee'
      tasks: 'script:dev'
