module.exports = (grunt) ->
  # content
  grunt.registerTask 'content:dev', 'shell:docpad'
  grunt.registerTask 'content:prod', [
    'shell:docpad',
    'htmlmin'
  ]

  # style
  grunt.registerTask 'style:dev', [
    'stylus:dev',
    'postcss'
  ]

  grunt.registerTask 'style:prod', [
    'stylus:prod',
    'postcss'
  ]

  # script
  grunt.registerTask 'script:dev', 'coffee'
  grunt.registerTask 'script:prod', [
    'coffee',
    'uglify'
  ]

  # build
  grunt.registerTask 'build:dev', [
    'content:dev',
    'style:dev',
    'script:dev'
  ]

  grunt.registerTask 'build:prod', [
    'content:prod',
    'style:prod',
    'script:prod'
  ]

  # deploy
  grunt.registerTask 'deploy', [
    'build:prod',
    'rsync:prod'
  ]

  grunt.registerTask 'deploy:staging', [
    'build:prod',
    'rsync:staging'
  ]

  # development
  grunt.registerTask 'run', [
    'build:dev',
    'concurrent'
  ]

  grunt.registerTask 'default', 'run'
