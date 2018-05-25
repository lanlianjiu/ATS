//引入插件
var gulp = require('gulp');
var connect = require('gulp-connect');
var proxy = require('http-proxy-middleware');
var browsersync = require('browser-sync').create(); //获取browsersync
//启动一个Web服务器
gulp.task('startWeb', function (callback) {

    browsersync.init({
        host: 'localhost',
        port: 3000,
        server: {
            baseDir: "./"
        },
        open: true,
    });
});

gulp.task('startServer', function () {
    connect.server({
        root: ['./'],
        port: 3000,
        livereload: true,
        middleware: function (connect, opt) {
            return [
                proxy('/InterfaceRequest', {
                    target: 'http://127.0.0.1/ATS/backend/web/',
                    changeOrigin: true
                }),
                proxy('/otherServer', {
                    target: 'http://IP:Port',
                    changeOrigin: true
                })
            ]
        }

    });
});

//运行Gulp时，默认的Task
gulp.task('default', ['startServer']);