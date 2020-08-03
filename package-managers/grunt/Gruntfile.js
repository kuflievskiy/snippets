//'use strict';
// wrapper function that exposes the grunt instance
module.exports = function(grunt) {

  // show elapsed time at the end
  require('time-grunt')(grunt);
	
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    
	// https://github.com/gruntjs/grunt-contrib-uglify
	uglify: {
      options: {
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> -  <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      //build: {
       // src: 'src/<%= pkg.name %>.js',
      //  dest: 'build/<%= pkg.name %>.min.js'
      //}	  
		my_target: {
		  files: [{
			  expand: true,    // Enable dynamic expansion.
			  cwd: 'src',          // Src matches are relative to this path.
			  src: ['**/*.js'],  // Actual pattern(s) to match.
			  dest: 'src/',  // Destination path prefix.
			  ext: '.min.js',      // Dest filepaths will have this extension.
		  }]
		}
    },
	
	// https://github.com/gruntjs/grunt-contrib-jshint
	//jshint: {
	//	target: {
	//		// here we define the src files
	//		// grunt has many ways to define input/out, see docs		
	//		all: ['Gruntfile.js', 'src/{,*/}*.js']
	//	}
	//},
	
	// npm install grunt-remove-logging
	// https://github.com/ehynds/grunt-remove-logging
	removelogging: {
		dist: {
		  src: "src/**/.js",
		  dest: "src/**/.js",
		  options: {
			// see below for options. this is optional.
		  }
		}
	},
	jshint: {
		options: {
		  curly: true,
		  eqeqeq: true,
		  eqnull: true,
		  browser: true,
		  globals: {
			jQuery: true
		  },
		},
		uses_defaults: ['src/**/*.js'],
	  },  	
	// npm install grunt-contrib-compress --save-dev
	// https://github.com/gruntjs/grunt-contrib-compress
	
	// https://github.com/gruntjs/grunt-contrib-cssmin
	// https://github.com/gruntjs/grunt-contrib-concat
	// https://github.com/gruntjs/grunt-contrib-watch
	
  });

	// Load the plugin that provides the "uglify" task.
	grunt.loadNpmTasks('grunt-contrib-uglify');
	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks("grunt-remove-logging");
	// grunt.loadNpmTasks("grunt-contrib-compress");
  
    // Default task(s).
    grunt.registerTask('default', ['removelogging','uglify']);

};