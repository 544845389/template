
bindClick("#addCity",function(){
    var series = $("input[name=tag_series]").val();
    showAddCity(series);
});

var showAddCity = function(series){
    showModel("addCity-div",function(){
        if(series == 1){
            $("#update_title").html("添加县级市");
            $("#label_title").html("县级市名称:");
        } else if(series == 2){
            $("#update_title").html("添加商圈");
            $("#label_title").html("商圈名称:");
        }else {
            $("#update_title").html("添加城市");
            $("#label_title").html("城市名称:");
        }

        $("input[name=superId]").val($("#sid").val());
        $("input[name=series]").val($("input[name=tag_series]").val());
    });
};

var showEditCity = function(row){
    showModel("editCity-div",function(){
        if(row.series == 1){
            $("#edit_title").html("修改城市");
            $("#edit_label").html("城市名称:");
        } else if(row.series == 2){
            $("#edit_title").html("修改县级市");
            $("#edit_label").html("县级市名称:");
        }else {
            $("#edit_title").html("修改商圈");
            $("#edit_label").html("商圈名称:");
        }
        var div = $("#editCity-div");
        var cityName = div.find("input[name=name]");
        $("input[name=id]").val(row.id);
        cityName.val(row.name);
    });
};


/**
 * 添加城市
 */

bindClick("button[data-event=submit-city]",function(tag){
    var form = $("#city_form");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var reg_chinese = /^[\u4e00-\u9fa5]{1,16}$/;
    var name = $("#addName").val().trim();
    if(name.length == 0){
        hint("名称不能为空");
            return false;
    }
    if(!reg_chinese.test(name)){
        hint("请输入1-16位中文.");
        return;
    }
    var params =  form.formToArray();
    $.post(form.attr("action"),params,function(res){
        if(res.state && res.res.code==40000){
            hint('添加成功');
            //关闭model方法
            closeModel('addCity-div');
            var table = $("#table");
            table.bootstrapTable("refresh");
        }else{
            if(res.state==false){
                hint(res.msg);
            }else{
                hint(res.res.msg);
            }
        }
    });
});

bindClick("button[data-event=submit-merge]",function(tag){
    var form = $("#mergeForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var reg_chinese = /^[\u4e00-\u9fa5]{1,16}$/;
    var name = $("#edit_city").val().trim();
    if(name.length == 0){
        hint("名称不能为空");
        return;
    }
    if(!reg_chinese.test(name)){
        hint("请输入1-16位中文.");
        return;
    }
    var params =  form.formToArray();
    $.post(form.attr("action"),params,function(res){
        if(res.state&&res.res.code==40000){
            hint('修改成功');
            //关闭model方法
            closeModel('editCity-div');
            comment.refresh();
        }else{
            if(res.state==false){
                hint(res.msg);
            }else{
                hint(res.res.msg);
            }
        }
    });
});

nameFormatter = function (value, row, index) {
    if(row.series == 3){
        return '<span class="child ">' + value + '</span>';
    }else {
        return '<span class="child line">' + value + '</span>';
    }
    
};


var queryCity =function(id){
    var table = $("#table");
    var url = $().AbsUrlParse('/web/city/findAllCities?superId='+ id);
    table.bootstrapTable("refresh",{url:url});
};

var pathClick = function(id, name, series){
    if(series == null){
        $("#addCity").show();
        $("#addCity").html("添加城市");
    }
    if(series == 1){
        $("#addCity").show();
        $("#addCity").html('<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加县级市');
    }
    if(series == 2){
        $("#addCity").show();
        $("#addCity").html('<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加商圈');

    }
    if(series == 3){
        $("#addCity").hide();
    }
    queryCity(id);
    $("#sid").val(id);
    $("input[name=tag_series]").val(series);
    $('#path').append('<span class="path" data-id="'+id+'" onclick="clearPathClick(' + id + ','+ series +')">'+name+'>&nbsp;&nbsp;</span>');
};

var clearPathClick = function(id, series){
    if(series == null){
        $("#addCity").show();
        $("#addCity").html('<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加城市');
    }
    if(series == 1){
        $("#addCity").show();
        $("#addCity").html('<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加县级市');
    }
    if(series == 2){
        $("#addCity").show();
        $("#addCity").html('<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加商圈');
    }
    if(series == 3){
        $("#addCity").hide();
    }
    queryCity(id);
    $("#sid").val(id);
    $("input[name=tag_series]").val(series);
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
};



operateFormatter = function (value, row, index) {
    return [
        // '<a class="edit" href="javascript:void(0)" title="修改"><i class="glyphicon glyphicon-edit"></i></a>'+
        // '&nbsp;&nbsp;&nbsp;'+
        // '<a class="remove" href="javascript:void(0)" title="删除"><i class="glyphicon glyphicon-trash"></i></a>'+
        // '&nbsp;&nbsp;&nbsp;'
        '<a class="edit" href="javascript:void(0)"><span>编辑</span></a>'+
        '&nbsp;|'+
        '&nbsp;<a class="remove" href="javascript:void(0)"><span>删除</span></a>'
    ].join('');
};


window.operateEvents = {
    'click .child': function (e, value, row, index) {
        pathClick(row.id, row.name, row.series);
    },
    
    'click .edit':function(e, value, row, index){
        showEditCity(row);
    },
    
    'click .remove':function(e, value, row, index){
        comment.showOperationTips("确定删除本条记录吗？",function(){
            comment.post("/web/city/removeOneCity",{"id":row.id, "series":row.series},"执行删除中...",function(data){
                if(data.res.code==40000){
                    hint("删除成功");
                    comment.refresh();
                }else{
                    hint(data.res.msg);
                }
            });
        });
    }
};



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
