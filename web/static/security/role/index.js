/**
 * Created by chentao on 2015/8/13.
 */

var Role;
if (!Role) {
    Role = {}
}

/**
 * 点击添加用户按钮
 */
bindClick("#addRole", function () {
    var id = $("#sid").val();
    showAddRole(id);
});

/**
 * 显示添加用户
 */
var showAddRole = function (id) {
    showModel("addRole-div", function () {
        $("input[name=superId]").val(id);
    });
}

/**
 * 显示修改权限框
 * @param row
 */
var showEditRole = function (row) {
    showModel("editRole-div", function () {
        $("#id").val(row.id);
        $("input[name=name]").val(row.name);
        $("input[name=superId]").val(row.super_id);
    });
}

bindClick("button[data-event=submit-merge]", function () {
    var form = $("#mergeRole");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#modify_name").val().trim();
    if(name.length == 0){
        hint("角色名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("角色名称字数不能超过16位!");
        return;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (data) {
        if (data.state == true && data.res.code == 40000) {
            hint("修改成功");
            closeModel("editRole-div");
            var table = $("#table");
            table.bootstrapTable("refresh");
        } else {
            hint(data.res.msg);
        }
    });
});

bindClick("button[data-event=submit-save]", function (tag) {
    var form = $("#roleForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#role_name").val().trim();
    if(name.length == 0){
        hint("角色名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("角色名称字数不能超过16位!");
        return;
    }

    var params = form.formToArray();
    $.post(form.attr("action"), params, function (res) {

        if (res.state && res.res.code == 40000) {

            hint('添加成功！');
            //关闭model方法
            closeModel('addRole-div');
            comment.refresh();

        } else {
            if (res.state == false) {
                hint(res.msg);
            } else {
                hint(res.res.msg);
            }
        }
    });
});

Role.nameFormatter = function (value, row, index) {
    return '<span class="child line">'+value+'</span>';
}

var queryCity =function(id){
    var table = $("#table");
    var url = $().AbsUrlParse('/web/role/roleQuery?superId='+id);
    table.bootstrapTable("refresh",{url:url});
}

var pathClick = function(id,superId,name){
    queryCity(id);
    $("#sid").val(id);
    $('#path').append('<span class="path" data-id="'+id+'" onclick="clearPathClick('+id+','+superId+')">'+name+'>&nbsp;&nbsp;</span>');
}

var clearPathClick = function(id,superId){
    queryCity(id);
    if(superId==null){
        $("#sid").val('');
    }
    var spans = $('#path').children("span");
    var isStart = false;
    $.each(spans,function(){
        var s = $(this);
        if(isStart){
            s.remove();
        }else{
            var mid = s.attr('data-id');
            if(mid==id){
                isStart = true;
            }
        }
    });
}

Role.operateFormatter = function (value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑"><i class="glyphicon glyphicon-pencil"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;' +
        '<a class="remove" href="javascript:void(0)" title="删除"><i class="fa fa-trash-o"></i></a>'
    ].join('');
}

window.operateEvents = {
    'click .child': function (e, value, row, index) {
        if(row!=null&&row!='')
            pathClick(row.id,row.super_id,row.name);
        else
            hint('已经是最后一层了.');
    },
    'click .edit': function (e, value, row, index) {
            showEditRole(row);
    },
    'click .remove': function (e, value, row, index) {
        comment.showOperationTips("确定删除吗？", function () {
            $.post($().AbsUrlParse('/web/role/delete'), {
                id: row.id
            }, function (data) {
                if (data.state == true) {
                    if (data.res.code == 40000) {
                        hint("删除成功");
                        var table = $('#table');
                        table.bootstrapTable('refresh');
                    } else {
                        hint(data.res.msg);
                    }
                } else {
                    hint(data.msg);
                }
            });
        });
    }
};