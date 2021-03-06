+ function ($) {
    var app = angular.module('adminIndex', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {

        $scope.menuList = {};
        $scope.userInfo = {};

        if (!($.u.user.result)) {
            window.location.href = 'login.html';
        };
        $scope.userInfo.username = $.u.user.result.username;

        $scope.loadNode = function (data, pid) {

            var result = [],
                temp;

            for (var i = 0; i < data.length; i++) {
                if (data[i].pId == pid) {

                    result.push(data[i]);

                    temp = $scope.loadNode(data, data[i].id);
                    if (temp.length > 0) data[i].children = temp;
                    if (data[i].pId != 0) data[i].targetType = "iframe-tab";
                    if (data[i].url) data[i].url = data[i].url;
                }
            }

            return result;
        };

        //获取菜单
        $scope.getMenus = function () {
            $.post("CRUD-InterfaceRequest.php?r=site/index", {},
                function (res) {

                    if (res.status) {
                        $scope.menuList = $scope.loadNode(res.data, 0);
                    };

                    $scope.$apply();

                }, 'json').then(function () {
                //菜单栏初始化
                addTabs(({
                    id: '10008',
                    title: '首页',
                    close: false,
                    url: 'auth/main.html'
                }));
                App.fixIframeCotent();
                $('.sidebar-menu').sidebarMenu({
                    data: $scope.menuList
                });
            });
        };


        //退出登录
        $scope.loginOut = function () {
            $.post("CRUD-InterfaceRequest.php?r=site/logout", {},
                function (result) {
                    if (result) {
                        $.localCache.remove($.cfg.user);
                        window.location.href = "login.html";
                    } else {
                        $.localCache.remove($.cfg.user);
                        window.location.href = 'login.html';
                    };
                }, 'json');
        };

        // 菜单创建ifram
        $scope.createMeuntab = function (h, t) {
            var obj = {
                href: h,
                title: t
            };
            Hui_admin_tab(obj);
        };

        $(document).ready(function () {
            $scope.getMenus();
        });

    }])

}(jQuery);