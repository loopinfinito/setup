module.exports = (grunt) ->
  grunt.config 'htmlmin',
    dist:
      options:
        removeComments: true
        collapseWhitespace: true
        removeRedundantAttributes: true
      files: [
        expand: true
        src: 'out/**/*.html'
      ]
