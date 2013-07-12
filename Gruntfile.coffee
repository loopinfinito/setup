module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-rsync'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'

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
    htmlmin:
      prod:
        options:
          removeComments: true,
          collapseWhitespace: true
        files: [
          expand: true
          src: ['out/**/*.html']
        ]
  )

  grunt.registerTask('build', 'Gera arquivos estáticos', () ->
    spawn = require('child_process').spawn
    done = @async()

    docpad = spawn('docpad', ['generate','--env', 'static'])
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

  grunt.registerTask('deploy', ['build', 'htmlmin', 'rsync:prod'])
  grunt.registerTask('deploy:staging', ['build', 'htmlmin', 'rsync:staging'])
