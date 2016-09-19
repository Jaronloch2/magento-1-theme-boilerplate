/**
*  BGTS Theme Magento Boiler Plate
*  Grunt JS
*  09/17/2016
**/
module.exports = function(grunt){
	var themename	= "bgts_theme";
	var projectdir='C:\\xampp_php7\\htdocs\\sandbox\\magento\\1';
	var themedir='C:\\xampp_php7\\htdocs\\sandbox\\magento\\' + themename;
	grunt.initConfig({
		pkg:grunt.file.readJSON("package.json"),
		uglify: {
			build: {
				src: "src/js/modules/*.js",    
				dest: "js/" + themename + "/script.min.js" 
			},
			dev: {
				options: {
					beautify: true, 
					mangle: false,
					compress: false,
					preserveComments: "all"
				},
				src: "src/js/*.js",    
				dest: "js/" + themename + "/script.min.js" 
			}
		},
		sass: {
			build: { 
				options: {
					outputStyle: "compressed" 
				},
				files: {
					"skin/frontend/default/bgts_theme/css/style.min.css" : "src/skin/**/*.scss" 
				}
			},
			dev: {
				options: {
					outputStyle: "expanded"  
				},
				files: {
					"skin/frontend/default/bgts_theme/css/style.min.css" : "src/skin/**/*.scss" 
				}
			},
		},
		exec: {
			js:		{cmd:"wintasks js "+projectdir+" "+themedir},
			app:	{cmd:"wintasks app "+projectdir+" "+themedir},
			skin:	{cmd:"wintasks skin "+projectdir+" "+themedir}
		},
		watch: {
			js: {
				files: ["src/js/**/*.js"],   
				tasks: ["uglify:build","exec:js"],
				options: {
					livereload: true   
				}
			},
			css: {
				files: ["src/skin/**/*.scss","src/skin/**/*.css","src/skin/**/*.*"],
				tasks: ["sass:build","exec:skin"],
				options: {
					livereload: true
				}
			},
			app: {
				files: ["src/app/**/*.php","src/app/**/*.phtml","src/app/**/*.html","src/app/**/*.xml"],
				tasks: ["exec:app"],
				options: {
					livereload: true
				}
			}
		}
	});

	grunt.loadNpmTasks("grunt-contrib-uglify");
	grunt.loadNpmTasks("grunt-contrib-watch");
	grunt.loadNpmTasks("grunt-sass");
	grunt.loadNpmTasks("grunt-exec");

	grunt.registerTask("default",["uglify:dev","sass:dev"]);  
	grunt.registerTask("build",["uglify:build","sass:build"]); 
};