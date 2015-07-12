module.exports = (grunt) ->
  # content
  grunt.registerTask 'content:dev', 'shell:docpad'
  grunt.registerTask 'content:prod', [
    'shell:docpad',
    'clean',
    'htmlmin'
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

  grunt.registerTask 'run', [
    'build:dev',
    'concurrent'
  ]

  grunt.registerTask 'default', 'run'
