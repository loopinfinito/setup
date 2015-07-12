module.exports = (grunt) ->
  grunt.config 'watch',
    content:
      files: './src/**/*.{eco,md}'
      tasks: 'content:dev'
