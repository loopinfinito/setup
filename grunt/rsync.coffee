module.exports = (grunt) ->
  grunt.config 'rsync'
    options:
      src: './out/'
      host: 'loopinfinito@dellwood.dreamhost.com'
      recursive: true

    prod:
      options:
        dest: '~/setup.loopinfinito.com.br'

    staging:
      options:
        dest: '~/staging.setup.loopinfinito.com.br'
        exclude: ['.htaccess', '.htpasswd']
