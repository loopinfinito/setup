module.exports = (grunt) ->
  grunt.config 'coffee',
    dist:
      files: [
        expand: true
        cwd: './src/scripts'
        src: '**/*.coffee'
        dest: './out/scripts'
        ext: '.js'
      ]
