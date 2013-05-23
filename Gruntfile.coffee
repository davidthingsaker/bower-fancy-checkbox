module.exports = (grunt) =>
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		## Compile coffeescript
		coffee:
			compile:
				files: [
					{
						expand: true
						cwd: 'src'
						src: ['FancyCheckbox.coffee']
						dest: 'dist'
						ext: '.js'
					},
					{
						expand: true
						cwd: 'src'
						src: ['main.coffee']
						dest: 'demo'
						ext: '.js'
					}
				]

		removelogging:
			files:
				expand: true
				cwd: 'dist'
				src: ['FancyCheckbox.min.js']
				dest: 'dist'
				ext: '.js'

		uglify:
			options:
				mangle: false
				compress: true
				banner: """/*!
						<%= pkg.name %> v<%= pkg.version %> 
						<%= pkg.description %>
						Build time: #{(new Date()).toString('dddd, MMMM ,yyyy')}
						*/\n\n"""
					
			javascript:
				files: {
					'dist/FancyCheckbox.min.js': 'dist/FancyCheckbox.js'
				}

		markdown:
			readmes:
				files: [
					{
						expand: true
						src: 'README.md'
						dest: 'dist'
						ext: '.html'
					}
				]

		regarde:
			markdown:
				files: 'README.html'
				tasks: 'markdown'
			
			coffee:
				files: ['src/**/*.coffee']
				tasks: ['coffee', 'requirejs']

			scss:
				files: ['src/**/*.scss']
				tasks: ['sass']

		connect:
			server:
				options:
					keepalive: true
					port: 9001
					base: ''

		exec:
			server:
				command: 'grunt connect &'

			open:
				command: 'open http://localhost:9001/'

		requirejs:
			compile:
				options:
					optimizeCss: false
					optimize: 'none'
					logLevel: 1
					name: "FancyCheckbox"
					out: "dist/FancyCheckbox.js"
					baseUrl: "src"
					exclude: ['mootools']
					paths:
						'FancyCheckbox': '../dist/FancyCheckbox'
						'validate': '../components/validate/validate'
						'mootools' : '../demo/mootools'
					
					shim:
						"validate":
							"exports" : "FancyCheckbox"

		shell:
			bower_cache:
				command: 'bower cache-clean'
				options:
					stdout: true

			bower:
				command: 'bower install'
				options:
					stdout: true

		sass:
			dist:
				options:
					style: 'expanded'
				files:
					'dist/FancyCheckbox.css': 'src/FancyCheckbox.scss'

		
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-remove-logging'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-markdown'
	grunt.loadNpmTasks 'grunt-regarde'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'
	grunt.loadNpmTasks 'grunt-exec'
	grunt.loadNpmTasks 'grunt-shell'
	grunt.loadNpmTasks 'grunt-contrib-sass'

	grunt.registerTask 'default', ['shell:bower', 'compile', 'requirejs', 'uglify']

	grunt.registerTask 'server', ['exec:server', 'exec:open', 'watch']

	grunt.registerTask 'commit', ['default', 'git']
	
	grunt.registerTask 'compile', 'Compile coffeescript scss and markdown', ['coffee', 'sass', 'markdown']
	grunt.registerTask 'watch', 'Watch coffee and markdown files for changes and recompile', () ->
		## always use force when watching
		grunt.option 'force', true
		grunt.task.run ['regarde']
