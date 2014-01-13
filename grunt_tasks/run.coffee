module.exports = (grunt) ->
  grunt.registerTask('run', 'Roda server com geração automática de estáticos', () ->
    spawn = require('child_process').spawn
    done = @async()

    docpad = spawn('node_modules/docpad/bin/docpad', ['run'])
    docpad.stdout.on('data', (data) ->
      grunt.log.write "#{data}"
    )
    docpad.stderr.on('data', (data) ->
      grunt.log.write "#{data}"
    )
    docpad.on('close', (code) ->
      done true
    )
  )
