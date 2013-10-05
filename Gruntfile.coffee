module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-rsync'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'

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
        exclude: ['.htaccess', '.htpasswd']
        recursive: true
    htmlmin:
      prod:
        options:
          removeComments: true
        files: [
          expand: true
          src: ['out/**/*.html']
        ]
    cssmin:
      prod:
        files:
          'out/styles/main.css': 'out/styles/main.css'
        options:
          report: 'gzip'
    uglify:
      prod:
        files:
          'out/scripts/main.js': 'out/scripts/main.js'
        options:
          report: 'gzip'
    clean: [
      'out/styles/*.styl'
      'out/styles/components'
      'out/styles/templates'
    ]
  )

  grunt.registerTask('docpadGenerate', 'Gera arquivos estáticos', () ->
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

  grunt.registerTask('build', ['docpadGenerate', 'clean'])
  grunt.registerTask('deploy', [
    'build',
    'htmlmin',
    'cssmin',
    'uglify',
    'rsync:prod'
  ])
  grunt.registerTask('deploy:staging', [
    'build',
    'htmlmin',
    'cssmin',
    'uglify',
    'rsync:staging'
  ])
