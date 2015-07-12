module.exports = (grunt) ->
  grunt.config 'uglify'
    dist:
      files: [
        expand: true
        cwd: './out/scripts'
        src: '**/*.js'
        dest: './out/scripts'
      ]
