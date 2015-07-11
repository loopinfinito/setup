module.exports = (grunt) ->
  # task aliases
  grunt.registerTask 'docpad', 'shell:docpad'

  # workflows
  grunt.registerTask 'build', [
    'docpad',
    'clean'
  ]

  grunt.registerTask 'run', [
    'build',
    'concurrent'
  ]

  grunt.registerTask 'default', 'run'
