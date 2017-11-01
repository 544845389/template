/**
 * Created by chentao on 2015/8/13.
 */

var Resource;
if (!Resource) {
    Resource = {}
}

/**
 * 显示资源图标
 * @param value
 * @param row
 * @param inde
 */
Resource.iconFormatter = function(value,row,inde){
    if(row.icon!=''&&row.icon!=null){
        return[
            '<i class="'+row.icon+'" ></i>'
        ].join('');
    }else{
        return[
            '<span>无</span>'
        ].join('');
    }
}

/**
 * 当前排名
 * @param value
 * @param row
 * @param index
 */
Resource.orderNum = function(value,row,index){
    return "<a href='javascript:void(0)' onclick='showOrderNum("+row.ordernum+","+row.id+")'><span>"+row.ordernum+"</span></a>";
}

/**
 * 显示修改排名页面
 * @param orderNum
 */
var showOrderNum = function(orderNum,id){
    showModel("showOrderNum-div",function(){
        $("#pid").val(id);
        $("#orderNum").val(orderNum);
    });
}

/**
 * 判断输入是否为数字
 * @param v
 * @returns {boolean}
 */
function isNumber(v) {
    var str = v.val();
    var reg = parseFloat(str);
    var re = /^\+?[0-9][0-9]*$/;
    if (!re.test(str)) {
        return false;
    }
    return !isNaN(reg);
}

/**
 * 修改排名按钮
 */
bindClick("button[data-event=merge-orderNum]",function(){
    var form = $("#mergeOrderNum");
    if(!form.valid){
        return false;
    }
    var orderNum = $("#orderNum");
    if(!isNumber(orderNum)){
        hint("请填入非负的正整数.");
        return false;
    }
    var param = form.formToArray();
    comment.post(form.attr('action'),param,null,function(data){
        if(data.res.code==40000){
            hint("修改成功");
            closeModel("showOrderNum-div");
            comment.refresh();
        }else{
            hint(data.res.msg);
        }
    });
});

/**
 * 点击添加用户按钮
 */
bindClick("#addResource", function () {
    showAddResource($("#sid").val());
});

bindClick("#addRight",function(){
    showAddRight($("#rightId").val());
});

/**
 * 显示添加用户
 */
var showAddResource = function (id) {
    showModel("addResource-div", function () {
        $("input[name=superId]").val(id);
    });
}

var showAddRight = function(id){
    showModel("addRight-div", function () {
        $("input[name=superId]").val(id);
    });
}


var findResourceRight = function(row){
    var id = row.id;
    var table = $("#rightTable");
    var url = $().AbsUrlParse("/web/resource/findResourceRight?id="+id);
    table.bootstrapTable("refresh",{url:url});
}



/**
 * 显示修改权限框
 * @param row
 */
var showEditResource = function (row) {
    showModel("editResource-div", function () {
        $("#id").val(row.id);
        $("input[name=name]").val(row.name);
        $("input[name=url]").val(row.url);
        $("input[name=code]").val(row.code);
        if(row.icon!=''&&row.icon!=null){
            $("i[data-event=icon]").attr("class",row.icon);
            $("input[name=icon]").val(row.icon);
        }
    });
}


var showEditRight = function(row){
    showModel("editRight-div", function () {
        $("#r_id").val(row.id);
        $("input[name=name]").val(row.name);
        $("input[name=url]").val(row.url);
        $("input[name=code]").val(row.code);
    });
}

/**
 * 显示icon图标页面
 * @returns {boolean}
 */
var showIcon = function(){
    jqModal.showContentModal({
        title: '选择图标',
        width: 700,
        height: 480,
        url: '/web/resource/showIcon',
        requestMethod: 'POST',
        footer:{buttons:[{text:'确定',type:'btn-info',id:'addCarFactoryInfoSubmit',click:function(jmodal){
            var li = jmodal.find("li[selected]");
            var txt =  li.find(".glyphicon-class").text();
            var icon = $("i[data-event=icon]");
            icon.attr("class",txt);
            $("input[name=icon]").val(txt);
            jqModal.closeContentModal();
        }}]}
    });
    return true;
}



bindClick("button[data-event=submit-merge]", function () {
    var form = $("#mergeResource");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#modify_name").val().trim();
    if(name.length == 0){
        hint("资源名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("资源名称字数不能超过16位!");
        return;
    }
    var code = $("#modify_code").val().trim();
    if(code.length == 0){
        hint("资源CODE不能为空!");
        return;
    }
    if(code.length > 16){
        hint("资源CODE字数不能超过16位!");
        return;
    }
    var address = $("#modify_address").val().trim();
    if(address.length == 0){
        hint("资源地址不能为空!");
        return;
    }
    if(address.length > 50) {
        hint("资源地址字数不能超过50位!");
        return;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (data) {
        if (data.state == true && data.res.code == 40000) {
            hint("修改成功");
            closeModel("editResource-div");
            var table = $("#table");
            table.bootstrapTable("refresh");
        } else {
            hint(data.res.msg);
        }
    });
});


bindClick("button[data-event=right-submit-merge]", function () {
    var form = $("#mergeRight");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#modify_right_name").val().trim();
    if(name.length == 0){
        hint("功能名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("功能名称字数不能超过16位!");
        return;
    }
    var code = $("#modify_right_code").val().trim();
    if(code.length == 0){
        hint("功能CODE不能为空!");
        return;
    }
    if(code.length > 16){
        hint("功能CODE字数不能超过16位!");
        return;
    }
    var address = $("#modify_right_address").val().trim();
    if(address.length == 0){
        hint("功能地址不能为空!");
        return;
    }
    if(address.length > 50) {
        hint("功能地址字数不能超过50位!");
        return;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (data) {
        if (data.state == true && data.res.code == 40000) {
            hint("修改成功");
            closeModel("editRight-div");
            var table = $("#rightTable");
            table.bootstrapTable("refresh");
        } else {
            hint(data.res.msg);
        }
    });
});

/**
 * 保存添加 资源按钮
 */
bindClick("button[data-event=submit-save]", function (tag) {
    var form = $("#resourceForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#resource_name").val().trim();
    if(name.length == 0){
        hint("资源名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("资源名称字数不能超过16位!");
        return;
    }
    var code = $("#resource_code").val().trim();
    if(code.length == 0){
        hint("资源CODE不能为空!");
        return;
    }
    if(code.length > 16){
        hint("资源CODE字数不能超过16位!");
        return;
    }
    var address = $("#resource_address").val().trim();
    if(address.length == 0){
        hint("资源地址不能为空!");
        return;
    }
    if(address.length > 50){
        hint("资源地址字数不能超过50位!");
        return;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (res) {
        if (res.state && res.res.code == 40000) {
            hint('添加成功！');
            //关闭model方法
            closeModel('addResource-div');
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


bindClick("button[data-event=right-submit-save]", function (tag) {
    var form = $("#rightForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var name = $("#right_name").val().trim();
    if(name.length == 0){
        hint("功能名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("功能名称字数不能超过16位!");
        return;
    }
    var code = $("#right_code").val().trim();
    if(code.length == 0){
        hint("功能CODE不能为空!");
        return;
    }
    if(code.length > 16){
        hint("功能CODE字数不能超过16位!");
        return;
    }

    var address = $("#right_address").val().trim();
    if(address.length == 0){
        hint("功能地址不能为空!");
        return;
    }
    if(address.length > 50){
        hint("功能地址字数不能超过50位!");
        return;
    }
    var params = form.formToArray();
    $.post(form.attr("action"), params, function (res) {
        if (res.state && res.res.code == 40000) {
            hint('添加成功！');
            //关闭model方法
            closeModel('addRight-div');
            var table = $("#rightTable");
            table.bootstrapTable("refresh");

        } else {
            if (res.state == false) {
                hint(res.msg);
            } else {
                hint(res.res.msg);
            }
        }
    });
});

Resource.nameFormatter = function (value, row, index) {
    return [
        '<span class="child line" style="color: #3D8EBC" >'+value+'</span>'
    ].join('');

}

var queryResource =function(id){
    var table = $("#table");
    var url = $().AbsUrlParse('/web/resource/resourceQuery?superId='+id);
    table.bootstrapTable("refresh",{url:url});
}

var pathClick = function(id,superId,name){
    queryResource(id);
    $("#sid").val(id);
    $('#path').append('<span class="path" data-id="'+id+'" onclick="clearPathClick('+id+','+superId+')">'+name+'>&nbsp;&nbsp;</span>');
}

var clearPathClick = function(id,superId){
    queryResource(id);
    if(superId==null){
        $("#sid").val('');
        $('#right-title').text('全局功能权限');
        $("#rightId").val(0);
        findResourceRight(0);
    }
    $("#sid").val(id);
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

Resource.operateFormatter = function (value, row, index) {
    return [
        '<a class="edit" href="javascript:void(0)" title="编辑"><i class="glyphicon glyphicon-pencil"></i></a>' +
        '&nbsp;&nbsp;' +
        '<a class="remove" href="javascript:void(0)" title="删除"><i class="fa fa-trash-o"></i></a>'+
        '&nbsp;&nbsp;' +
        '<a class="show" href="javascript:void(0)" title="功能"><i class="glyphicon glyphicon-arrow-right"></i></a>'
    ].join('');
}

Resource.rightOperateFormatter = function (value, row, index) {
    return [
        '<a class="edit_right" href="javascript:void(0)" title="编辑"><i class="glyphicon glyphicon-pencil"></i></a>' +
        '&nbsp;&nbsp;' +
        '<a class="remove_right" href="javascript:void(0)" title="删除"><i class="fa fa-trash-o"></i></a>'
    ].join('');
}

var deleteRes = function(e, value, row, index){
    comment.showOperationTips("确定删除吗？", function () {
        $.post($().AbsUrlParse('/web/resource/delete'), {
            id: row.id
        }, function (data) {
            if (data.state == true) {
                if (data.res.code == 40000) {
                    hint("删除成功");
                    var table1 = $('#table');
                    table1.bootstrapTable('refresh');

                    var table2 = $('#rightTable');
                    table2.bootstrapTable('refresh');


                } else {
                    hint(data.res.msg);
                }
            } else {
                hint(data.msg);
            }
        });
    });
}

window.operateEvents = {
    'click .child': function (e, value, row, index) {
        pathClick(row.id,row.superId,row.name);
    },
    'click .edit': function (e, value, row, index) {
        showEditResource(row);
    },
    'click .remove': function (e, value, row, index) {
        deleteRes(e, value, row, index);
    },
    'click .show':function(e, value, row, index){
        var trs = $(this).parents('table').find("tr");
        trs.each(function(){
            $(this).removeClass("tab-selected");
        });
        //1px solid
        $(this).parents('tr').addClass("tab-selected");

        $('#right-title').text(row.name+'模块功能列表');
        $("#rightId").val(row.id);
        findResourceRight(row);
    },
    'click .remove_right':function(e, value, row, index){
        deleteRes(e, value, row, index);
    },
    'click .edit_right':function(e, value, row, index){
        showEditRight(row);
    }

};