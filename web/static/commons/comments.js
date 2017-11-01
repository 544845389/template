/**
 * Created by chentao on 2015/8/21.
 */
var comment;
if (!comment)
    comment = {};

/**
 * 操作提示框显示
 * @param msg 提醒消息
 * @param callBack  提醒后的执行事件
 */
comment.showOperationTips = function (msg, callBack) {
    jqModal.showModal({
        content: '<label class="text-danger">' + msg + '</label>',
        type: 'CONFIRM',
        buttons: [{
            text: '确定',
            callback: function () {
                callBack();
            }
        }]
    });
}

/**
 * 刷新table首页面
 */
comment.refresh = function () {
    var table = $('#table');
    table.bootstrapTable('refresh');
}

/**
 * post提交事件
 * @param url   地址
 * @param params    参数
 * @param msg   提示信息
 * @param success   成功回调
 */
comment.post = function (url, params, msg, success) {
    if (msg == null)
        msg = '加载中...';
    if (!url.startsWith("http://")) {
        url = $().AbsUrlParse(url);
    }
    $.blockUI(
        {
            message: msg,
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
    $.post(url, params,
        function (data) {
            $.unblockUI();
            if (success != null) {
                if (data.state) {
                    if (data.res.code == 40000)
                        success(data);
                    else
                        hint(data.res.msg);
                } else {
                    hint(data.msg);
                }
            }
        });
}


comment.get = function (url, msg, success) {
    if (msg == null)
        msg = '加载中...';
    if (!url.startsWith("http://")) {
        url = $().AbsUrlParse(url);
    }
    $.blockUI(
        {
            message: msg,
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
    $.get(url,
        function (data) {
            $.unblockUI();
            if (success != null) {
                if (data.res.code == 40000)
                    success(data);
                else
                    hint(data.res.msg);
            } else {
                hint(data.msg);
            }
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