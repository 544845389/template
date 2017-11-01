;
(function ($) {
    $.fn.jqGetWebRoot = function () {
        //获取当前网址，如： http://localhost:8088/test/test.jsp
        var curPath = window.document.location.href;
        //获取主机地址之后的目录，如： test/test.jsp
        var pathName = window.document.location.pathname;
        var pos = curPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8088
        var localhostPath = curPath.substring(0, pos);
        //获取带"/"的项目名，如：/test
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPath + projectName);
    };
    
    
    $.fn.AbsUrlParse = function (url) {
        var serverUrl = $().jqGetWebRoot();
        if(url.indexOf("http:") != -1)
            return url;
        else
            return serverUrl + url;
    };

 
    //动态加载js
    $.fn.loadExtendJsFile = function (filePath, fileType) {
        var head = $('head').first();
        var html;
        if (fileType == "js") {
            html = "<script type='text/javascript' src='" + $().AbsUrlParse(filePath) + "'></script>"
        } else if (fileType == "css") {
            html = "<link href='" + $().AbsUrlParse(filePath) + "' rel='stylesheet'>"
        }
        $(head).append(html);
    };

    //弹出模态框

    //option:{"title":"",type:"multi|single",items:[{"val":1,text:""}],btnConfirm:{"text":"",callback:func}}
    $.fn.showModelView = function (option) {

        if (option != undefined) {
            var title = option.title == undefined ? "标题" : option.title;
            var btnText = (option.btnConfirm == undefined || option.btnConfirm.text.length == 0) ? "确定" : option.btnConfirm.text;
            var modelView = "<div class='modal fade' id='myModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>" +
                "<div class='modal-dialog'>" +
                "<div class='modal-content'>" +
                "<div class='modal-header'>" +
                "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>" +
                "<h4 class='modal-title' id='myModalLabel'>" + title +
                "</h4>" +
                "</div>" +
                "<div class='modal-body'>" +
                "在这里添加一些文本" +
                "</div>" +
                "<div class='modal-footer'>" +
                "<button type='button' class='btn btn-default' id='btnModelCancel' data-dismiss='modal'>关闭</button>" +
                "<button type='button' class='btn btn-primary' id='btnModelConfirm'>" + btnText +
                "</button>" +
                "</div>" +
                "</div>" +
                "</div>";
            $(document).off('click', '#btnModelConfirm');
            $(document).on('click', '#btnModelConfirm', function () {
                $('#myModal').modal('hide');
                if (option.btnConfirm.callback) {
                    option.btnConfirm.callback('aaaaa');
                }
            });
            $(modelView).modal('show');
        }
    };
})(jQuery);