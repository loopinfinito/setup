module.exports = (grunt) ->
  grunt.loadTasks 'grunt_tasks/'
  grunt.loadNpmTasks 'grunt-rsync'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-sitemap'

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
          collapseWhitespace: true
          removeRedundantAttributes: true
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
    imagemin:
     dynamic:
      files: [
        expand: true
        cwd: 'src/'
        src: ['**/*.{png,jpg,gif}']
        dest: 'out/'
      ]
    sitemap:
      dist:
        siteRoot: 'out/',
        homepage: 'index.html'

  )

  grunt.registerTask('build', [
    'docpad:generate'
    'clean'
  ])

  grunt.registerTask('deploy', [
    'sitemap'
    'build'
    'imagemin'
    'htmlmin'
    'cssmin'
    'uglify'
    'imagemin'
    'rsync:prod'
  ])

  grunt.registerTask('deploy:staging', [
    'build'
    'htmlmin'
    'cssmin'
    'uglify'
    'imagemin'
    'rsync:staging'
  ])

