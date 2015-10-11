module.exports = (grunt) ->
  grunt.config 'connect',
    server:
      options:
        port: 4000
        base: './out'
        keepalive: true
