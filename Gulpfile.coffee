require('coffee-script/register')
gulp = require('gulp')
mocha = require('gulp-mocha')

gulp.task 'mocha', ->
  gulp.src('test/**.coffee', read: false)
  .pipe mocha()

gulp.task 'develop',['mocha'],->
  gulp.watch '**/*.coffee',['mocha']