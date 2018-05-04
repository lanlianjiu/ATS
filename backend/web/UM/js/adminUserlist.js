+ function ($) {
    var app = angular.module('adminUserlist', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {
        $scope.data = {};
        $scope.userList = {};
        $scope.formData = {};
        var table = $("#userList-table");
        $scope.getUser = function () {

            // $.post($.cfg.server_ + "InterfaceRequest.php?r=adminuser/index", {},
            //     function (res) {

            //         if (res.status) {
            //             $scope.userList = res.result;

            //         };
            //         $scope.$apply();
            //     }, 'json');



        };

        $scope.getUser();

        $scope.addUser = function () {

            $scope.data.title = "添加用户";
            $scope.formData = {};
            $scope.formData.isEdit = true;
            $('#userDialog').modal('show');
        };

        $scope.editUser = function (id) {
            var editData = table.bootstrapTable('getRowByUniqueId', id);
            $scope.formData = editData;
            $scope.formData.isEdit = false;
            $scope.data.title = "编辑用户";
            $('#userDialog').modal('show');
        };

        $scope.saveUser = function () {

            $.post($.cfg.server_ + "InterfaceRequest.php?r=adminuser/create", {
                    username: $scope.formData.username,
                    password: $scope.formData.password,
                    usermobile: $scope.formData.usermobile,
                    email: $scope.formData.email
                },
                function (res) {

                    if (res.status) {
                        table.bootstrapTable('refresh');
                        $('#userDialog').modal('hide');
                    } else {

                    }

                }, 'json');
        };

        //获取选中id
        $scope.getCheckId = function (data) {

            var arrayId = [];
            for (var i in data) {
                arrayId.push(data[i].id);
            }
            return arrayId;
        };

        $scope.bathDel = function () {

            var checkId = table.bootstrapTable('getSelections');

            var ids = $scope.getCheckId(checkId);
            console.log(ids);

            if (ids.length == 0) {
                return false;
            };

        };

        $(document).ready(function () {
            $.get($.cfg.server_ + "InterfaceRequest.php?r=plugins/regionplugin", {

                },
                function (res) {

                    if (res.status) {
                        // var resultJson = {};
                        // for(var i in res.data){
                        //     resultJson[res.data[i].regionId] = res.data[i].regionName
                        // };
                        console.log(resultJson);
                    } else {

                    }

                }, 'json');
        });

    }])
}(jQuery);


function user_edit(id) {

    if (!id) return;
    var $scope = angular.element(document.body).scope();
    $scope.editUser(id);
    $scope.$apply();
};

function operateFormatter(value, row, index) {
    var h = "";

    h += '<a style="text-decoration:none" class="ml-5" onclick="user_edit(' + row.id + ')" href="javascript:;" title="编辑"> <i class = "Hui-iconfont" > &#xe6df; </i> </a>';

    h += '<a style = "text-decoration:none"class = "ml-5" onclick ="user_del(' + row.id + ')"href = "javascript:;"title = "删除"><i class = "Hui-iconfont" > &#xe6e2; </i> </a>';
    return h;
}