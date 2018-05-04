+ function ($) {
    var app = angular.module('orderList', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {

        $scope.orderEdit = function (orderId) {

        };

        $scope.batchdel = function (orderId) {
            $("#orderList-table").bootstrapTable("resetView");
            console.log(4);
        };

        $scope.order_del = function (orderId) {
            console.log(3);
        };

    }])

}(jQuery);

function operateFormatter(value, row, index) {
    var h = "";

    h += '<a style="text-decoration:none" class="ml-5" data-title="编辑订单" data-href="OSM/createOrder.html?orderId=' + row.orderId +
        '" href="javascript:;" onClick="Hui_admin_tab(this)" title = "编辑" ><i class="Hui-iconfont Hui-iconfont-edit"></i></a >';

    h += '<a style = "text-decoration:none"class = "ml-5" onclick ="order_del(' + row.orderId + ')"href = "javascript:;"title = "删除"><i class = "Hui-iconfont Hui-iconfont-del3" ></i> </a>';
    return h;
};