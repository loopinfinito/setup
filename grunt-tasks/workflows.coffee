module.exports = (grunt) ->
  grunt.registerTask 'docpad', 'shell:docpad'
  grunt.registerTask 'build', 'docpad'
  grunt.registerTask 'run', 'watch'
  grunt.registerTask 'default', 'run'
