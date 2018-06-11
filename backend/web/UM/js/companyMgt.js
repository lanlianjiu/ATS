+ function ($) {
    var app = angular.module('companyMgt', []);
    app.controller('controller', ['$scope', '$http', function ($scope, $http) {
        $scope.data = {};
        $scope.formData = {};
        var zTreeObj;
        var setting = {
            check: {
                enable: false
            },
            view: {
                addHoverDom: function addHoverDom(treeId, treeNode) {

                    if (treeNode.pcTags == 1) {

                        $scope.data.title = "新增";
                        $scope.formData = {};
                        $scope.$apply();
                        var sObj = $("#" + treeNode.tId + "_span");
                        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
                        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId +
                            "' title='新增公司''></span>";
                        sObj.after(addStr);
                        var btn = $("#addBtn_" + treeNode.tId);
                        if (btn) btn.bind("click", function () {

                            $('#addCompanydialog').modal('show');

                            return false;
                        });
                    }

                },
                removeHoverDom: function removeHoverDom(treeId, treeNode) {
                    $("#addBtn_" + treeNode.tId).unbind().remove();
                },
                selectedMulti: false
            },
            edit: {
                enable: true,
                editNameSelectAll: false,
                showRemoveBtn: function showRemoveBtn(treeId, treeNode) {

                    return true;
                },
                showRenameBtn: function showRenameBtn(treeId, treeNode) {

                    return true;
                },
                removeTitle: "删除公司",
                renameTitle: "编辑公司"
            },
            data: {
                key: {
                    name: 'cName'
                },
                simpleData: {
                    enable: true,
                    idKey: "cId",
                    pIdKey: "cPId",
                    rootPId: 0
                },
                keep: {
                    isParent: true
                }
            },
            callback: {
                beforeRemove: function deleteCompany(treeId, treeNode) {

                    var $scope = $('html').scope();
                    return false;

                },
                beforeEditName: function editSaveInfo(treeId, treeNode) {

                    $scope.data.title = "编辑";
                    $scope.formData = treeNode;
                    $scope.$apply();
                    $('#addCompanydialog').modal('show');

                    return false;
                },
                onClick: companyInfo,
            }
        };

        //树图回调函数（公司详细信息）
        function companyInfo(e, treeId, treeNode) {

            if ($scope.newNode == null) {

            };
        };

        $scope.getTree = function () {

            $.post("/CRUD-InterfaceRequest.php?r=company/index", {},
                function (data) {

                    if (data.status) {

                        zTreeObj = $.fn.zTree.init($("#comanyManage-tree"), setting, data.data);
                        zTreeObj.expandAll(true);

                        //修改时刷新树图
                        if ($scope.cId) {
                            var treeObj = $.fn.zTree.getZTreeObj("comanyManage-tree");
                            var nodes = treeObj.getNodes();
                            if (nodes.length > 0) {
                                var node = treeObj.getNodeByParam('cId', $scope.cId);
                                treeObj.selectNode(node)
                                treeObj.setting.callback.onClick(null, treeObj.setting.treeId, node)
                            };
                        };
                        //新增时刷新树图
                        if ($scope.newCid) {
                            var treeObj = $.fn.zTree.getZTreeObj("comanyManage-tree");
                            var nodes = treeObj.getNodes();
                            if (nodes.length > 0) {
                                var node = treeObj.getNodeByParam('cId', $scope.newCid);
                                treeObj.selectNode(node);
                                treeObj.setting.callback.onClick(null, treeObj.setting.treeId, node)
                            };
                        };
                        //初始化树图、删除时
                        if (!$scope.cId && !$scope.newCid) {

                            var treeObj = $.fn.zTree.getZTreeObj("comanyManage-tree");
                            var nodes = treeObj.getNodes()
                            if (nodes.length > 0) {
                                var node = treeObj.getNodeByParam('cId', nodes[0].cId);
                                treeObj.selectNode(node);
                                treeObj.setting.callback.onClick(null, treeObj.setting.treeId, node)
                            };
                        };

                    };
                    $scope.$apply();

                }, 'json');
        };

        $scope.getCtype = function () {

            $.post("/CRUD-InterfaceRequest.php?r=company/ctype", {},
                function (res) {

                    if (res.status) {

                        $scope.cType = res.result;
                    };
                    $scope.$apply();

                }, 'json');
        };

        $scope.saveCompanyInfo = function () {

        };

        $(document).ready(function () {
            $scope.getTree();
            $scope.getCtype();
        });
    }])
}(jQuery);