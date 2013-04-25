module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-rsync'

  grunt.initConfig(
    rsync:
      prod:
        src: './out/'
        dest: '~/setup.loopinfinito.com.br'
        host: 'loopinfinito@bugsy.dreamhost.com'
        recursive: true
      staging:
        src: './out/'
        dest: '~/staging.setup.loopinfinito.com.br'
        host: 'loopinfinito@bugsy.dreamhost.com'
        recursive: true
  )

  grunt.registerTask('build', 'Gera arquivos estáticos', () ->
    spawn = require('child_process').spawn
    done = @async()

    docpad = spawn('docpad', ['generate'])
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

  grunt.registerTask('run', 'Roda server com geração automática de estáticos', () ->
    spawn = require('child_process').spawn
    done = @async()

    docpad = spawn('docpad', ['run'])
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

  grunt.registerTask('deploy', ['build', 'rsync:prod'])
  grunt.registerTask('deploy:staging', ['build', 'rsync:staging'])
