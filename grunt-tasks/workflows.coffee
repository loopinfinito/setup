module.exports = (grunt) ->
  # task aliases
  grunt.registerTask 'docpad', 'shell:docpad'

  # workflows
  grunt.registerTask 'build', [
    'docpad'
  ]

  grunt.registerTask 'build:optimize', [
    'build',
    'clean',
    'htmlmin'
  ]

  grunt.registerTask 'run', [
    'build',
    'concurrent'
  ]

  grunt.registerTask 'default', 'run'
