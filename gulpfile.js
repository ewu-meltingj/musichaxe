var gulp = require('gulp');
var shell = require('gulp-shell');
var runSequence = require('run-sequence');
var watcher = gulp.watch('./src/**/*', ['runChange']);

gulp.task('clean', shell.task([
  'flambe clean'
]));

gulp.task('build', shell.task([
  'flambe build --debug'
]));

gulp.task('serve', shell.task([
  'flambe serve'
]));

gulp.task('runChange', shell.task([
  'flambe run --debug',
  'echo runChange'
]));

gulp.task('develop', function() {
    runSequence('clean', 'build', 'serve', function() {
        console.log('Run something else');
    });
});

gulp.task('default', ['develop']);

watcher.on('change', function(event) {
  console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
});