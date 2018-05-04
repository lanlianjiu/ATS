(function ($) {　
    var config = {
        js: [
            "/lib/jquery/1.9.1/jquery-ui.min.js",
            "/lib/bootstrap/bootstrap.min.js",
            "/lib/plugins/bootstrap-dialog/bootstrap-dialog.min.js",
            "/lib/plugins/bootstrap-select/js/bootstrap-select.min.js",
            "/lib/angular/angular-1.4.8.min.js",
            "/lib/supershopui/js/supershopui.common.js",
        ],
        css: [
            "/lib/bootstrap/bootstrap.min.css",
            "/lib/plugins/bootstrap-select/css/bootstrap-select.min.css",
            "/lib/plugins/bootstrap-dialog/bootstrap-dialog.min.css",
            "/lib/fonts/font-awesome.min.css",
            "/lib/supershopui/css/supershopui.common.min.css",
            "/css/style.min.css"
        ],
    };

    var JSLoader = {
        load: (function () {

            var baseUrl = getJSPath();

            function getJSPath() {
                var js = document.scripts;
                var src = js[js.length - 1].src;
                var thisPath = src.substring(0, src.lastIndexOf("/") - 3);
                return thisPath.substring(0, thisPath.length);
            }

            function scriptsLoad(scripts) {
                if (scripts.length == 0) {
                    return;
                }
                var head = document.getElementsByTagName('head')[0] || document.documentElement;
                for (var i = 0; i < scripts.length; i++) {
                    document.write('<script type="text/javascript" src="' + baseUrl + scripts[i] + '" ><\/script>');
                }
            }

            function cssLoad(csses) {
                if (csses.length == 0) {
                    return;
                }
                var head = document.getElementsByTagName('head')[0] || document.documentElement;
                var s = new Array();
                for (var i = 0; i < csses.length; i++) {
                    s[i] = document.createElement("link");
                    s[i].setAttribute("type", "text/css");
                    s[i].setAttribute('rel', 'stylesheet');
                    s[i].setAttribute('href', baseUrl + csses[i]);
                    var reg = new RegExp("skin.css");
                    if (reg.test(csses[i])) {
                        s[i].setAttribute('id', "skin");
                    };
                    head.appendChild(s[i]);
                }
            }
            return {
                js: scriptsLoad,
                css: cssLoad
            };
        })()
    };
    JSLoader.load.js(config.js);
    JSLoader.load.css(config.css);
})(jQuery);