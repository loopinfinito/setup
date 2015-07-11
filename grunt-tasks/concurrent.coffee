module.exports = (grunt) ->
  grunt.config 'concurrent',
    dev:
      tasks: ['connect', 'watch']
      options:
        logConcurrentOutput: true
