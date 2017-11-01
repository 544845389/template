/**
 * Created by yuliang on 2015/8/4.
 */

var bindClick = function (mtag, evt) {
    var tag = $(mtag)
    $(tag).unbind('click');
    $(tag).click(function () {
        evt(this);
        return false;
    });
}

var bindChange = function (mtag, evt) {
    var tag = $(mtag)
    $(tag).unbind('change');
    $(tag).change(function () {
        evt(this);
        return false;
    });
}

var bindBlur = function (mtag, evt) {
    var tag = $(mtag)
    $(tag).unbind('blur');
    $(tag).blur(function () {
        evt(this);
        return false;
    });
}

/**
 * 后台返回的对象数据填充到表单中
 * @param frm
 * @param data
 */
var setFrm = function (frmid, obj) {
    $("#" + frmid + "")[0].reset();
    var inputs = $("#" + frmid + " :input");//表单中的控件
    inputs.each(function () {
        if (obj.res.data != null && obj.res.data[this.name] != undefined) {
            this.value = obj.res.data[this.name];
        }
    });
}

/**
 * 将列表中的行数据填充到表单中
 * @param frm
 * @param data
 */
var setRowToFrm = function (frmid, obj) {
    $("#" + frmid + "")[0].reset();
    var inputs = $("#" + frmid + " :input");//表单中的控件
    inputs.each(function () {
        if (obj != null && obj[this.name] != undefined) {
            this.value = obj[this.name];
        }
    });
}