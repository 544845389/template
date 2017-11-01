/**
 * Created by chentao on 2015/9/9.
 */
var ResourceRight
if(!ResourceRight)
    ResourceRight={}

/**
 * 点击添加用户按钮
 */
bindClick("#addResourceRight",function(){
    var rid = $("#resourceId").val();
    if(rid==null||rid==''){
        hint("请先选择资源");
    }else{
        showModel("showAllRight-div");
        var table = $("#rightAllTable");
        var url = $().AbsUrlParse("/web/resourceRight/loadRightNoHaveRight?resourceId="+rid);
        table.bootstrapTable("refresh",{url:url});
    }
});

bindClick("button[data-event=submit-resourceRight]",function(){
    var table = $("#rightAllTable");
    var json = table.bootstrapTable('getSelections');
    if(json.length==0){
        hint('请选中数据');
        return false;
    }
    var ids='';
    for(var i=0;i<json.length;i++){
        ids+=json[i].id+','
    }
    var rid = $("#resourceId").val();
    $("input[name=aid]").val(ids);
    comment.post("/web/resourceRight/addResourceRight",{rid:rid,ids:ids},null,function(data){
        if(data.res.code==40000){
            hint("添加成功");
            closeModel("showAllRight-div");
            var url=$().AbsUrlParse("/web/resourceRight/getRightByResourceId?resourceId="+rid);
            $("#rightTable").bootstrapTable("refresh",{url:url});
        }else{
            hint(data.res.msg);
        }
    });
});

ResourceRight.operateFormatter = function(value,row,index){
    return[
        '<a class="look" href="javascript:void(0)" title="查看权限"><i class="glyphicon glyphicon-arrow-right"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}

ResourceRight.rightFormatter = function(value,row,index){
    return[
        '<a class="remove" href="javascript:void(0)" title="删除权限"><i class="glyphicon glyphicon-remove-sign"></i></a>' +
        '&nbsp;&nbsp;&nbsp;&nbsp;'
    ].join('');
}

window.operateEvents = {
    'click .look': function (e, value, row, index) {
        $("#resourceId").val(row.id);
        var table = $("#rightTable");
        var url = $().AbsUrlParse("/web/resourceRight/getRightByResourceId?resourceId="+row.id);
        table.bootstrapTable("refresh",{url:url});
    },
    'click .remove': function (e, value, row, index) {
        var rid = $("#resourceId").val();
        comment.showOperationTips("确定删除吗？", function () {
            $.post($().AbsUrlParse('/web/resourceRight/deleteResourceRight'), {
                id:row.id
            }, function (data) {
                if (data.state == true) {
                    if (data.res.code == 40000) {
                        hint("删除成功");
                        var table = $('#rightTable');
                        var url=$().AbsUrlParse("/web/resourceRight/getRightByResourceId?resourceId="+rid);
                        $("#rightTable").bootstrapTable("refresh",{url:url});
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
