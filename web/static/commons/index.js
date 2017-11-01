/**
 * Created by yuliang on 2015/8/13.
 */


var loginOutSystem = function () {
    var path = $().AbsUrlParse('/j_spring_security_logout');
    window.location = path;
};


var clearAllActiveItem = function () {
    var as = $("li>a");
    $.each(as, function () {
        $(this).parent().removeClass("active");
    });
};

window.onload = function () {

    document.getElementsByTagName("body")[0].onkeydown = function () {
        if (event.keyCode == 8) {
            var elem = event.srcElement;
            var name = elem.nodeName;
            if (name != 'INPUT' && name != 'TEXTAREA') {
                event.returnValue = false;
                return;
            }
            var type_e = elem.type.toUpperCase();
            if (name == 'INPUT' && (type_e != 'TEXT' && type_e != 'TEXTAREA' && type_e != 'PASSWORD' && type_e != 'FILE')) {
                event.returnValue = false;
                return;
            }
            if (name == 'INPUT' && (elem.readOnly == true || elem.disabled == true)) {
                event.returnValue = false;
                return;
            }
        }
    };

//选择默认系统样式
    $(".list-unstyled li:eq(0)").find("div:eq(1)").click();
    //var ie = myBrowser();
    //if (ie == 'ie9') {
    //    hint('不支持ie9浏览器以下版本，建议更换..');
    //    return false;
    //}
};

//function myBrowser() {
//    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
//    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE浏览器
//    if (isIE) {
//        var ie9 = false;
//        var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
//        reIE.test(userAgent);
//        var fIEVersion = parseFloat(RegExp["$1"]);
//        ie9 == 9.0;
//        if (ie9 < 9.0) {
//            return "ie9";
//        }
//    }
//}


var menuClick = function(tag,items){
    //请求链接打开界面
    var content = $("#main-content");
    var menuPath = $("#menu-path");


    var url = $(tag).attr("event-url");

    if (url == "#") {
        return;
    }
    $.blockUI(
        {
            message: '请求网络中,请稍后...',
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

    var timeout = setTimeout(function () {
            //超时啦，干点什么
            $.unblockUI();
            hint("请求超时，请稍后再试");
        },
        1000 * 15 //超时时间，考虑到网络问题，5秒还是比较合理的
    );

    $.get(url, function (res) {
        if (timeout) { //清除定时器
            clearTimeout(timeout);
            timeout = null;
        }
        $.unblockUI();
        if (res == 'login error')
            loginOutSystem();

        //释放ueditor
        var editors = content.find(".editor");
        $.each(editors, function () {
            var id = $(this).attr("id");
            var ue = UE.getEditor(id);
            ue.destroy();
        });
        content.empty();

        var actives = menuPath.find(".active");
        $.each(actives, function () {
            $(this).remove();
        });
        if(items!=null){
            items.reverse();
            $.each(items, function () {
                menuPath.append($(this));
            })
        }

        var slidingmenu = new SlidingMenu();
        var html = $(res);
        var tables = html.find("table[data-toggle=table]");
        $.each(tables, function () {
            $(this).attr("data-height", 600);
        });

        var timepickers = html.find(".timepicker");
        $.each(timepickers, function () {
            var format = $(this).attr("format");
            if (format == null || format == '') {
                format = "yyyy-mm-dd";
            }
            $(this).datepicker({
                format: format,
                todayHighlight: true,
                clearBtn: true,
                language: "zh-CN"
            });
        });

        slidingmenu.init(html);
        content.html(html);
        slidingmenu.loadDiv(content);
        $('[data-toggle="table"]').bootstrapTable();
    });
};
//消息提醒跳转
$(document).on("click", "a[menu-click]", function () {
    menuClick(this,null);
    return false;
});
//左侧菜单跳转
$(document).on("click", "a[event-url]", function () {
    //清空选中项
    clearAllActiveItem();

    //选择选中项
    var parent = $(this);

    var items = new Array();

    while (true) {
        parent = parent.parent();
        if (parent.hasClass("sidebar-menu"))
            break;
        var tagName = parent[0].tagName;
        if (tagName == "UL" || tagName == "LI") {
            parent.addClass("active");
            var name = parent.children("a").text();
            if (name != '')
                items.push($('<li class="active">' + name + '</li>'));
        }
    }
    $(this).parent().addClass("active");

    menuClick(this,items);
    return false;
});

/**
 * 退出系统
 */
$(document).on("click", "a[data-event=logout]", function () {
    loginOutSystem();
    return false;
});


/**
 * 修改密码点击事件
 * @param id
 */
var showMergeModel = function (id) {
    jqModal.showContentModal({
        title: '重置密码',
        width: 500,
        height: 380,
        url: '/web/admin/mergePwdIndex?id=' + id,
        requestMethod: 'POST',
        footer: {
            buttons: [{
                text: '确定', type: 'btn-success', id: 'mergePwd', click: function () {
                    var form = $("#mergeform");
                    if (!form.valid) {
                        return false;
                    }
                    var param = form.formToArray();
                    comment.post('/web/admin/mergePwd', param, "执行修改中...", function (data) {
                        if (data.res.code == 40000) {
                            hint("修改成功");
                            jqModal.closeContentModal();
                            var path = $().AbsUrlParse('/j_spring_security_logout');
                            window.location = path;
                        } else {
                            hint(data.res.msg);
                        }
                    });
                }
            }]
        }
    });
};

/**
 * js判断
 */

var load = function () {
    //判断新密码和确认新密码是否一致
    var nPwd = $("#nPwd").val();
    var nPwds = $("#nPwds").val();
    if (nPwds != nPwd) {
        $("#span").html("不一致");
        $("#nPwd").val("");
        $("#nPwds").val("");
        return;
    }
    if (nPwd.length < 6) {
        $("#spans").html("长度不得小于6位");
        return;
    } else {
        $("#span").empty();
        $("#spans").empty();
    }
};



