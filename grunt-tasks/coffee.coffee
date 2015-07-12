module.exports = (grunt) ->
  grunt.config 'coffee',
    dist:
      files: [
        expand: true
        cwd: './src/documents/scripts'
        src: '**/*.coffee'
        dest: './out/scripts'
        ext: '.js'
      ]
