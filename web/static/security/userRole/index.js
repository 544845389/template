/**
 * Created by chentao on 2015/9/9.
 */
var UserRole
if(!UserRole)
    UserRole={}

/**
 * 点击添加用户按钮
 */
bindClick("#addUserRole",function(){
    var rid = $("#rid").val();
    if(rid==null||rid==''){
        hint("请先选择权限");
    }else{
        $("input[name=roleId]").val(rid);
        showModel("showAllUser-div");
        var table = $("#userAllTable");
        var url = $().AbsUrlParse("/web/userRole/loadUserNoHaveUser?rid="+rid);
        table.bootstrapTable("refresh",{url:url});
    }
});

bindClick("button[data-event=submit-userRole]",function(){
    var table = $("#userAllTable");
    var json = table.bootstrapTable('getSelections');
    if(json.length==0){
        hint('请选中数据');
        return false;
    }
    var ids='';
    for(var i=0;i<json.length;i++){
        ids+=json[i].aid+','
    }
    if(ids==''){
        hint("请选择数据");
        return false;
    }
    var rid = $("#rid").val();
    $("input[name=aid]").val(ids);
    comment.post("/web/userRole/addUserRole",{rid:rid,ids:ids},null,function(data){
        if(data.res.code==40000){
            hint("添加成功");
            closeModel("showAllUser-div");
            var url=$().AbsUrlParse("/web/userRole/getUserByRoleId?rid="+rid);
            $("#userTable").bootstrapTable("refresh",{url:url});
        }
    });
});

UserRole.operateFormatter = function(value,row,index){
    return[
        '<a class="look" href="javascript:void(0)" title="查看用户"><i class="glyphicon glyphicon-arrow-right"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}

UserRole.userFormatter = function(value,row,index){
    return[
        '<a class="remove" href="javascript:void(0)" title="删除用户"><i class="glyphicon glyphicon-remove-sign"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}

window.operateEvents = {
    'click .look': function (e, value, row, index) {
        $("#rid").val(row.id);
        var table = $("#userTable");
        var url = $().AbsUrlParse("/web/userRole/getUserByRoleId?rid="+row.id);
        table.bootstrapTable("refresh",{url:url});
    },
    'click .remove': function (e, value, row, index) {
        comment.showOperationTips("确定删除吗？", function () {
            $.post($().AbsUrlParse('/web/userRole/deleteUser'), {
                aid: row.aid,rid:row.rid
            }, function (data) {
                if (data.state == true) {
                    if (data.res.code == 40000) {
                        hint("删除成功");
                        var table = $('#table');
                        var url=$().AbsUrlParse("/web/userRole/getUserByRoleId?rid="+row.rid);
                        $("#userTable").bootstrapTable("refresh",{url:url});
                    } else {
                        hint(data.res.msg);
                    }
                } else {
                    hint(data.msg);
                }
            });
        });
    }
}
