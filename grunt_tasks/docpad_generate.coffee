module.exports = (grunt) ->
  grunt.registerTask('docpad:generate', 'Gera arquivos estáticos', () ->
    spawn = require('child_process').spawn
    done = @async()

    docpad = spawn('node_modules/docpad/bin/docpad', ['generate','--env', 'static'])
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
