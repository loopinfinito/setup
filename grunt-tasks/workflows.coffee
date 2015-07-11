module.exports = (grunt) ->
  # tasks
  grunt.registerTask 'docpad', 'shell:docpad'

  # workflows
  grunt.registerTask 'default', 'run'
  grunt.registerTask 'build', 'docpad'
  grunt.registerTask 'run', [
    'build',
    'concurrent'
  ]
