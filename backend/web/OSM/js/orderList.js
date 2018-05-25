+ function ($) {
    var app = angular.module('orderList', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {

        $scope.orderEdit = function (orderId) {

        };

        $scope.batchdel = function (orderId) {
            $("#orderList-table").bootstrapTable("resetView");
            console.log(4);
        };

        $scope.orderDel = function (orderId) {
            console.log(3);
        };

    }])

}(jQuery);

function operateFormatter(value, row, index) {
    var h = "";

    h += '<a style="text-decoration:none" class="ml-5"  href="javascript:;" onClick="editOrder(' + row.orderId + ')" title = "编辑" ><i class="fa fa-pencil"></i></a >';

    h += '<a style = "text-decoration:none"class = "ml-5" onclick ="order_del(' + row.orderId + ')"href = "javascript:;"title = "删除"><i class = "fa fa-trash" ></i> </a>';
    return h;
};

function addOrder() {

    addTabs(({
        id: '10000',
        title: '新增订单',
        close: true,
        childrenIframeopen: true,
        url: 'OSM/createOrder.html'
    }));
};

function editOrder(orderId) {
    addTabs(({
        title: '编辑订单',
        close: true,
        childrenIframeopen: true,
        url: 'OSM/createOrder.html?orderId=' + orderId
    }));
}

function order_del(orderId) {

};