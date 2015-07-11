module.exports = (grunt) ->
  grunt.config 'clean',
    coffee: [
      './out/scripts/**/*.coffee'
    ],

    stylus: [
      './out/styles/**/*.styl',
      './out/styles/components',
      './out/styles/templates'
    ]
