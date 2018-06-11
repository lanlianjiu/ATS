+ function ($) {
    var app = angular.module('createOrder', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {

        $scope.data = {
            regionName: "北京市"
        };

        var orderId = $.utils.getUrlParams("orderId") || "";
        //获取修改数据
        $scope.getOrderInfo = function (params) {
            $.post("/CRUD-InterfaceRequest.php?r=orders/index", {
                    orderId: orderId
                },
                function (res) {
                    //$('#basic2').selectpicker('refresh');
                    $('#basic2').selectpicker('val', 120000); //设置选中
                    $scope.$apply();
                }, 'json');
        };


        //保存订单
        $scope.saveOrder = function () {
            console.log($scope.data);
            // $.post($.cfg.server_ + "InterfaceRequest.php?r=orders/create", {},
            //     function (res) {
            //         $scope.$apply();
            //     }, 'json');
        };


        $(document).ready(function () {
            if (orderId) {

                $scope.getOrderInfo();
            };

        })

    }])

}(jQuery);