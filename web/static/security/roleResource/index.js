/**
 * Created by chentao on 2015/9/9.
 */
var RoleResource
if (!RoleResource)
    RoleResource = {}


/**
 * 点击保存按钮
 */
bindClick("#saveRoleResource", function () {

    var roId = $("#roId").val();

    var treeObj = $.fn.zTree.getZTreeObj("jstree_demo_div");
    var nodes = treeObj.getCheckedNodes(true);

    var ids = "";
    if (nodes != null && nodes.length > 0) {
        for (var i = 0; i < nodes.length; i++) {
            var n = nodes[i];
            ids += n.id + ",";
        }
    }

    var url = $().AbsUrlParse("/web/roleResource/saveRoleResource");
    comment.post(url, {roId: roId, ids: ids}, "保存数据中...", function (data) {
        if (data.res.code == 40000) {
            hint("添加成功!");
        } else {
            hint("添加失败!");
        }
    });
});




bindClick("#open",function(){
    var treeObj = $.fn.zTree.getZTreeObj("jstree_demo_div");
    treeObj.expandAll(true);
});

bindClick("#close",function(){
    var treeObj = $.fn.zTree.getZTreeObj("jstree_demo_div");
    treeObj.expandAll(false);
});

/**
 * 角色列表操作按钮
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
RoleResource.operateFormatter = function (value, row, index) {
    return [
        '<a class="look" href="javascript:void(0)" title="查看角色资源"><i class="glyphicon glyphicon-arrow-right"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}


var loadTree = function (ids) {
    //加载tree
    var url = $().AbsUrlParse("/web/roleResource/loadResourceTree?ids=" + ids);
    var nodes ;
    var setting = {
        callback: {
            beforeClick: function beforeClick(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj(treeId);
                zTree.checkNode(treeNode, !treeNode.checked, null, true);
                return true;
            },
            beforeCheck: zTreeBeforeCheck
        },
        check: {
            enable: true,
            chkboxType: {"Y": "p", "N": "ps"},
            chkStyle: "checkbox",
            radioType: "all"
        },
        async: {
            enable: true,
            url: function () {
                return url;
            },
            dataFilter: function (treeId, parentNode, childNodes) {
                $.unblockUI();
                //js中节点数据：
                return childNodes.res.data;
            }
        }
    };
    
    nodes = [
        //父节点展开 折叠时分别使用不同的图标
        { name:"", iconOpen:$().AbsUrlParse("/static/images/favicon.ico"), iconClose:$().AbsUrlParse("/static/images/favicon.ico")},
        //叶子节点个性化图标
        { name:"", icon:$().AbsUrlParse("/static/images/favicon.ico")}
    ]

    var zTree = $.fn.zTree.init($("ul[data-event=jstree_demo_div]"), setting);
    function zTreeBeforeCheck(treeId, treeNode) {
        //$("input[name=typeId]").val(treeNode.id);
    }
}

$.blockUI(
    {
        message: '加载菜单数据中....',
        baseZ: 2000,
        css: {
            border: 'none',
            padding: '15px',
            backgroundColor: 'white',
            width: "300px",
            opacity: .5,
            color: 'black'
        }
    });
loadTree();

/**
 * 操作按钮点击事件
 * @type {{click .look: Function, click .lookRight: Function, click .remove: Function}}
 */
window.operateEvents = {
    'click .look': function (e, value, row, index) {
        $("#roId").val(row.id);
        var url = $().AbsUrlParse("/web/roleResource/getResourceByRoleId?rId=" + row.id);
        comment.get(url, "加载数据中...", function (data) {
            if (data.res.code == 40000) {
                var treeObj = $.fn.zTree.getZTreeObj("jstree_demo_div");
                treeObj.checkAllNodes(false);
                treeObj.expandAll(true);
                var nodes = treeObj.getNodes();
                var checkSelected = function (nodes) {
                    if (nodes != null)
                        for (var index = 0; index < nodes.length; index++) {
                            var n = nodes[index];
                            for (var i = 0; i < data.res.data.length; i++) {
                                if (data.res.data[i] == n.id) {
                                    treeObj.checkNode(n, true, true);
                                    checkSelected(n.children);
                                }
                            }
                        }
                }
                checkSelected(nodes);
            }
        });
    }
}


