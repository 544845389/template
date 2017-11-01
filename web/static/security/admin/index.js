/**
 * Created by chentao on 2015/8/13.
 */

var Admin;
if(!Admin){
    Admin={}
}

/**
 * 显示状态
 * @param value
 * @param row
 * @param index
 * @returns {string}
 */
Admin.showEnable = function(value,row,index){
    if(row.id != 1){
        if(value==1){
            return [
                '<a href="javascript:void(0)" onclick="mergeEnable('+0+','+row.id+')"><span style="color: green">可用</span></a>'
            ].join('');
        }else{
            return [
                '<a href="javascript:void(0)" onclick="mergeEnable('+1+','+row.id+')"><span style="color: red">不可用</span></a>'
            ].join('');
        }
    }
}

/**
 * 修改用户状态
 * @param enable
 * @param id
 */
var mergeEnable = function(enable,id){
    comment.post("/web/admin/mergeEnable",{id:id,enable:enable},null,function(data){
        if(data.res.code==40000){
            comment.refresh();
        }else{
            hint("操作失败");
        }
    });
}

/**
 * 点击添加用户按钮
 */
bindClick("#addAdmin",function(){
    showAddAdmin();
});

/**
 * 添加时树
 */
var loadCityTree = function(cityId){
    var url = '';
    if(cityId==0||cityId==null){
        url = $().AbsUrlParse('/web/city/loadCityTree');
    }else{
        url = $().AbsUrlParse('/web/city/loadCityTree?id='+cityId);
    }
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
            chkboxType: {"Y": "s", "N": "s"},
            chkStyle: "radio",
            radioType: "all"
        },
        async: {
            enable: true,
            url: function(){
                return url;
            },
            dataFilter: function (treeId, parentNode, childNodes) {
                return childNodes.res.data;
            }
        }
    };

    var zTree = $.fn.zTree.init($("ul[data-event=jstree_demo_div]"), setting);

    function zTreeBeforeCheck(treeId, treeNode) {
        $("input[name=cityId]").val(treeNode.id);
    }
}


/**
 * 显示添加用户
 */
var showAddAdmin = function(){
    //var id = $("#admin").val();
    showModel("addAdmin-div",function(){
    });

};



var showEditCity = function(row){
    showModel("editAdmin-div",function(){
        $("#id").val(row.id);
        var id = $("#admin").val();
        $("input[name=name]").val(row.userName);
        $("input[name=linkman]").val(row.linkman);
        //var div = $("#mergeCity");
        //if(id==1){
        //    div.empty();
        //    div.append('<label class="city">所属城市:</label>');
        //    loadCityTree(row.city_id);
        //}
        //loadchangeCity();
    });
}

bindClick("button[data-event=submit-merge]",function(){
    var form = $("#mergeAdmin");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    var reg = /^[a-zA-Z0-9_]{6,16}$/;
    var name = $("#modify_admin").val().trim();
    if(name.length == 0){
        hint("管理员名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("管理员名称字数不能超过16位!");
        return;
    }
    var password = $("#modify_admin_pwd").val().trim();
    if(password.length == 0){
        hint("密码不能为空!");
        return;
    }
    if(!reg.test(password)){
        hint("请输入6-16位字母、数字或下划线!");
        return;
    }
    var cityName = $("#modify_city_admin option:selected").text();
    $("#modify_city_name").val(cityName);
    $("#modify_city_id").val($("#modify_city_admin").val());
    var params= form.formToArray();
    $.post(form.attr("action"),params,function(data){
        if(data.state==true&&data.res.code==40000){
            hint("修改成功");
            closeModel("editAdmin-div");
            var table = $("#table");
            table.bootstrapTable("refresh");
        }else{
            hint(data.res.msg);
        }
    });
});

bindClick("button[data-event=submit-admin]",function(tag){
    var form = $("#adminForm");
    var v = form.valid();
    if (v == false) {
        return false;
    }
    //var cityId = $("#addcitySelect").val();
    //$("#addcityId").val(cityId);
    //alert(cityId);
    var reg = /^[a-zA-Z0-9_]{6,16}$/;
    var name = $("#admin_name").val().trim();
    if(name.length == 0){
        hint("管理员名称不能为空!");
        return;
    }
    if(name.length > 16){
        hint("管理员名称字数不能超过16位!");
        return;
    }
    var password = $("#admin_pwd").val().trim();
    if(password.length == 0){
        hint("密码不能为空!");
        return;
    }
    if(!reg.test(password)){
        hint("请输入6-16位字母、数字或下划线!");
        return;
    }
    var cityName = $("#add_city_admin option:selected").text();
    $("#city_name").val(cityName);
    $("#city_id").val($("#add_city_admin").val());
    var params =  form.formToArray();
    $.post(form.attr("action"),params,function(res){
        if(res.state&&res.res.code==40000){
            hint('添加成功！');
            //关闭model方法
            closeModel('addAdmin-div');
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

Admin.operateFormatter = function (value, row, index) {
    if(row.id==1){
        return '<span>超级管理不得操作</span>';
    }else{
        return [
            '<a class="edit" href="javascript:void(0)" title="编辑"><i class="glyphicon glyphicon-pencil"></i></a>' +
            '&nbsp;&nbsp;&nbsp;&nbsp;'+
            '<a class="remove" href="javascript:void(0)" title="删除"><i class="glyphicon glyphicon-trash"></i></a>'
        ].join('');
    }
}

window.operateEvents = {
    'click .edit':function(e, value, row, index){
            showEditCity(row);
            modifyCity(row.cityId);
    },
    'click .remove':function(e,value,row,index){
       comment.showOperationTips("确定删除本条记录吗？",function(){
           $.post($().AbsUrlParse('/web/admin/delete'), {id: row.id}, function (data) {
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




/**
 *  修改 【城市】
 */
function modifyCity(cityId){
    var url = $().AbsUrlParse('/web/city/loadAllCities');
    comment.post(url, null, '加载城市信息', function (data) {
        var option = $("#modify_city_admin");
        option.empty();
        if (data.state && data.res.code == 40000) {
            for(var i = 0; i< data.res.data.length ; i++){
                var obj = data.res.data[i];
                if(obj.id == cityId){
                    option.append('<option selected value="' + obj.id + '">' + obj.name + '</option>');
                }else {
                    option.append('<option  value="' + obj.id + '">' + obj.name + '</option>');
                }
            }
        } else {
            option.append('<option  value="0">城市获取失败</option>');
        }
    });
}


addLoadCity();

/**
 * 添加  【城市】
 */
function addLoadCity(){
    var url = $().AbsUrlParse('/web/city/loadAllCities');
    comment.post(url, null, '加载城市信息', function (data) {
        var option = $("#add_city_admin");
        option.empty();
        if (data.state && data.res.code == 40000) {
            for(var i = 0; i< data.res.data.length ; i++){
                var obj = data.res.data[i];
                option.append('<option  value="' + obj.id + '">' + obj.name + '</option>');
            }
        } else {
            option.append('<option  value="0">城市获取失败</option>');
        }
    });
}