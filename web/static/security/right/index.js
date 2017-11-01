/**
 * Created by chentao on 2015/8/13.
 */

var Right;
if (!Right) {
    Right = {}
}

/**
 * 点击添加用户按钮
 */
bindClick("#addRight", function () {
    showAddRight($("#sid").val());
});

/**
 * 显示添加用户
 */
var showAddRight = function (id) {
    showModel("addRight-div", function () {
        $("input[name=superId]").val(id);
    });
}

/**
 * 显示修改权限框
 * @param row
 */
var showEditRight = function (row) {
    showModel("editRight-div", function () {
        $("#id").val(row.id);
        $("input[name=name]").val(row.rname);
        $("input[name=code]").val(row.code);
        $("input[name=superId]").val(row.superId);
    });
}

bindClick("button[data-event=submit-merge]", function () {
    var form = $("#mergeRight");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (data) {
        if (data.state == true && data.res.code == 40000) {
            hint("修改成功");
            closeModel("editRight-div");
            var table = $("#table");
            table.bootstrapTable("refresh");
        } else {
            hint(data.res.msg);
        }
    });
});

bindClick("button[data-event=submit-save]", function (tag) {
    var form = $("#rightForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (res) {

        if (res.state && res.res.code == 40000) {

            hint('添加成功！');
            //关闭model方法
            closeModel('addRight-div');
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

Right.nameFormatter = function (value, row, index) {
    return '<span class="child line">'+value+'</span>';
}

var queryRight =function(id){
    var table = $("#table");
    var url = $().AbsUrlParse('/web/right/rightQuery?superId='+id);
    table.bootstrapTable("refresh",{url:url});
}

var pathClick = function(id,superId,name){
    queryRight(id);
    $("#sid").val(id);
    $('#path').append('<span class="path" data-id="'+id+'" onclick="clearPathClick('+id+','+superId+')">'+name+'>&nbsp;&nbsp;</span>');
}

var clearPathClick = function(id,superId){
    queryRight(id);
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

Right.operateFormatter = function (value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑"><i class="glyphicon glyphicon-pencil"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;' +
        '<a class="remove" href="javascript:void(0)" title="删除"><i class="fa fa-trash-o"></i></a>'
    ].join('');
}

window.operateEvents = {
    'click .child': function (e, value, row, index) {
        pathClick(row.id,row.superId,row.rname);
    },
    'click .edit': function (e, value, row, index) {
            showEditRight(row);
    },
    'click .remove': function (e, value, row, index) {
        comment.showOperationTips("确定删除吗？", function () {
            $.post($().AbsUrlParse('/web/right/delete'), {
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