//引入插件
var gulp = require('gulp');
var browsersync = require('browser-sync').create(); //获取browsersync
var proxyMiddleware = require('http-proxy-middleware');
var Mock = require('mockjs');
var url = require('url');
var fs = require('fs');
var path = require('path');

//启动一个Web服务器
gulp.task('startServer', function (callback) {

    browsersync.init({
        host: 'localhost',
        port: 3000,
        server: {
            baseDir: "./"
        },
        open: true,
        // middleware: function (connect, opt) {
        //     return [
        //         proxyMiddleware('InterfaceRequest', {
        //             target: 'http://192.168.184.128:3000',
        //             changeOrigin: true
        //         })
        //     ]
        // }

        // middleware: function (req, res, next) {
        //     res.setHeader('Access-Control-Allow-Origin', '*');
        //     res.setHeader('Content-Language', 'zh-CN');
        //     res.setHeader('Content-Type', 'text/html;charset=UTF-8');
        //     res.end(JSON.stringify((data[req.url]) && Mock.mock(data[req.url])));
        //     next();
        // }

        // middleware: function (req, res, next) {

        //     var urlObj = url.parse(req.url, true),
        //         method = req.method;

        //     if (!urlObj.pathname.match(/^\/InterfaceRequest/)) { //不是api开头的数据，直接next
        //         next();
        //         return;
        //     };

        //     var mockDataFile = path.join(__dirname, urlObj.pathname) + ".php";

        //     fs.access(mockDataFile, fs.F_OK, function (err) {
        //         if (err) {
        //             res.setHeader('Content-Type', 'application/json');
        //             res.end(JSON.stringify({
        //                 "status": "没有找到此文件",
        //                 "notFound": mockDataFile
        //             }));
        //             return;
        //         }
        //         var data = fs.readFileSync(mockDataFile, 'utf-8');
        //         res.setHeader('Content-Type', 'application/json');
        //         res.end(data);
        //     });
        //     next();
        // },
        // proxies: []

        // middleware: function (req, res, next) {
        //     res.setHeader('Access-Control-Allow-Origin', '*');
        //     res.setHeader('Content-Language', 'zh-CN');
        //     res.setHeader('Content-Type', 'text/html;charset=UTF-8');
        //     var mockDataFile = __dirname + "InterfaceRequest.php";
        //     var data = fs.readFileSync(mockDataFile, 'utf-8');
        //     var urlObj = url.parse(req.url, true),
        //         method = req.method;
        //     res.end(data);
        //     next();
        // }

    });

})

//运行Gulp时，默认的Task
gulp.task('default', ['startServer']);



