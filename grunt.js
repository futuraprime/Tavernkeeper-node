/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    coffee: {
      compile: {
        files: {
          'public/javascripts/app/*.js': ['public/javascripts/src/**/*.coffee']
        },
        options: {
          bare: false
        }
      }
    },
    reload: {
      port: 13338,
      liveReload: {},
      proxy: {
        host: 'localhost',
        port: 13337
      }
    },
    watch: {
      coffee: {
        files: 'public/javascripts/src/**/*.coffee',
        tasks: 'coffee reload'
      },
      stylus : {
        files : 'public/stylesheets/*.styl',
        tasks : 'reload'
      },
      templates : {
        files : 'templates/**/*.jade',
        tasks : 'reload'
      },
      views : {
        files : 'views/**/*.jade',
        tasks : 'reload'
      }
    }
  });
  grunt.loadNpmTasks('grunt-reload');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.registerTask('default', 'reload watch');
  grunt.registerTask('dist', ['coffee']);
};
