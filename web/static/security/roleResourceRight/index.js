/**
 * Created by chentao on 2015/9/9.
 */
var RoleResourceRight
if(!RoleResourceRight)
    RoleResourceRight={}

/**
 * 点击添加按钮事件
 */
//bindClick("#addResourceRight",function(){
//    var rid = $("#roleId").val();
//    if(rid==0||rid==''){
//        hint("请选择角色");
//        return false;
//    }
//    showModel("showAllRight-div",function(){
//        var table = $("#resourceAllTable");
//        var url = $().AbsUrlParse("/web/roleResourceRight/loadResourceNoHaveResource?roleId="+rid);
//        table.bootstrapTable("refresh",{url:url});
//    });
//});


/**
 * 点击保存按钮
 */
bindClick("#addRoleResourceRight",function(){
    var resourceId = $("#resourceId").val();
    if(resourceId==''||resourceId==0){
        hint("请选择资源");
        return false;
    }
    var table = $("#rightTable");
    var json = table.find("input[data-event=checkbox]");
    var ids='';
    for (var i=0;i<json.length;i++ ){
        if(json[i].checked){ //判断复选框是否选中
            ids+=json[i].value + ","; //值的拼凑 .. 具体处理看你的需要,
        }
    }
    var rid = $("#roleId").val();

    comment.post("/web/roleResourceRight/addRoleResourceRight",{roleId:rid,resourceId:resourceId,ids:ids},null,function(data){
        if(data.res.code==40000){
            hint("操作成功");
            var rid = $("#roleId").val();
            var url = $().AbsUrlParse("/web/roleResourceRight/getRightByResourceId?resourceId="+resourceId+"&roleId="+rid);
            var table = $("#rightTable");
            table.bootstrapTable("refresh",{url:url});
        }else{
            hint(data.res.msg);
        }
    });
});

/**
 * 点击添加按钮事件
 */
//bindClick("button[data-event=submit-roleResourceRight]",function(){
//    var table = $("#resourceAllTable");
//    var json = table.bootstrapTable('getSelections');
//    if(json.length==0){
//        hint('请选中数据');
//        return false;
//    }
//    var ids='';
//    for(var i=0;i<json.length;i++){
//        ids+=json[i].id+','
//    }
//    alert(ids);
//    var rid = $("#roleId").val();
//    comment.post("/web/roleResourceRight/addRoleResourceRight",{roleId:rid,ids:ids},null,function(data){
//        if(data.res.code==40000){
//            hint("添加成功");
//            closeModel("showAllRight-div");
//            var url=$().AbsUrlParse("/web/roleResourceRight/getResourceByRoleId?roleId="+rid);
//            $("#resourceTable").bootstrapTable("refresh",{url:url});
//        }else{
//            hint(data.res.msg);
//        }
//    });
//});

/**
 * 角色列表操作按钮
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
RoleResourceRight.operateFormatter = function(value,row,index){
    return[
        '<a class="look" href="javascript:void(0)" title="查看角色资源"><i class="glyphicon glyphicon-arrow-right"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}

/**
 * 资源列表操作按钮
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
RoleResourceRight.rightFormatter = function(value,row,index){
    return[
        '<a class="lookRight" href="javascript:void(0)" title="查看资源权限"><i class="glyphicon glyphicon-arrow-right"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;',
    ].join('');
}

/**
 * 点击资源，得到角色的权限
 */
//var loadRightByRoleId = function(id){
//    var rid = $("#roleId").val();
//    comment.post("/web/roleResourceRight/getResourceRightByRoleId",{roleId:rid},null,function(data){
//        var data = data.res.data;
//        var table = $("#rightTable");
//        $("#resourceId").val(id);
//        var url = $().AbsUrlParse("/web/resourceRight/getRightByResourceId?resourceId="+id);
//        table.bootstrapTable("refresh",{url:url});
//        RoleResourceRight.showCheck = function(value,row,index){
//            if(data.length>0){
//                for(var i=0;i<data.length;i++){
//                    if(data[i].id==row.id){
//                        return[
//                            '<input checked="checked" data-event="checkbox" value='+row.id+' type="checkbox" />' +
//                            '&nbsp;&nbsp;&nbsp;&nbsp;'
//                        ].join('');
//                    }
//                    else{
//                        return[
//                            '<input data-event="checkbox" type="checkbox" value='+row.id+' />' +
//                            '&nbsp;&nbsp;&nbsp;&nbsp;'
//                        ].join('');
//                    }
//                }
//            }else{
//                return[
//                    '<input data-event="checkbox" value='+row.id+' type="checkbox" />' +
//                    '&nbsp;&nbsp;&nbsp;&nbsp;'
//                ].join('');
//            }
//        }
//    });
//}

/**
 * 操作按钮点击事件
 * @type {{click .look: Function, click .lookRight: Function, click .remove: Function}}
 */
window.operateEvents = {
    'click .look': function (e, value, row, index) {
        $("#roleId").val(row.id);
        var table = $("#resourceTable");
        var url = $().AbsUrlParse("/web/roleResourceRight/getResource");
        table.bootstrapTable("refresh",{url:url});
    },
    'click .lookRight': function (e, value, row, index) {
        //loadRightByRoleId(row.id);
        var rid = $("#roleId").val();
        //comment.post("/web/roleResourceRight/getResourceRightByRoleId",{roleId:rid},null,function(data){
        //    var data = data.res.data;
        //    var table = $("#rightTable");
            $("#resourceId").val(row.id);
        //
        //    alert(data);
        //    var url = $().AbsUrlParse("/web/resourceRight/getRightByResourceId?resourceId="+row.id);
        //    table.bootstrapTable("refresh",{url:url});
        //   // RoleResourceRight.showCheck(data,value,row,index);
        //});

        var url = $().AbsUrlParse("/web/roleResourceRight/getRightByResourceId?resourceId="+row.id+"&roleId="+rid);
        var table = $("#rightTable");
        table.bootstrapTable("refresh",{url:url});
    }
}

RoleResourceRight.showCheck = function(value,row,index){
    if(row.selected==true){
        return[
            '<input checked="checked" data-event="checkbox" value='+row.id+' type="checkbox" />' +
            '&nbsp;&nbsp;&nbsp;&nbsp;'
        ].join('');
    }else{
        return[
            '<input data-event="checkbox" value='+row.id+' type="checkbox" />' +
            '&nbsp;&nbsp;&nbsp;&nbsp;'
        ].join('');
    }
}
