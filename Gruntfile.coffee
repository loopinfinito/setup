module.exports = (grunt) ->

  grunt.loadTasks 'grunt_tasks/'
  grunt.loadNpmTasks 'grunt-rsync'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.initConfig

    cssmin:
      prod:
        files:
          'out/styles/main.css': 'out/styles/main.css'
        options:
          report: 'gzip'

    htmlmin:
      prod:
        options:
          removeComments: true
          collapseWhitespace: true
          removeRedundantAttributes: true
        files: [
          expand: true
          src: ['out/**/*.html']
        ]

    clean: [
      'out/styles/*.styl'
      'out/styles/components'
      'out/styles/templates'
    ]

    uglify:
      prod:
        files:
          'out/scripts/main.js': 'out/scripts/main.js'
        options:
          report: 'gzip'

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


  grunt.registerTask 'build', [
    'docpad:generate'
    'clean'
  ]

  grunt.registerTask 'deploy', [
    'build'
    'htmlmin'
    'cssmin'
    'uglify'
    'rsync:prod'
  ]

  grunt.registerTask 'deploy:staging', [
    'build'
    'htmlmin'
    'cssmin'
    'uglify'
    'rsync:staging'
  ]
