module.exports = (grunt) ->
  grunt.config 'shell',
    docpad:
      command: './node_modules/docpad/bin/docpad generate'
