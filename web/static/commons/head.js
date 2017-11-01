///**
// * Created by menghuan on 2015/9/16.
// */
///**
// * 登录后和推送消息后更新未读信息
// */
//var unReadMsg = function () {
//    $.post("/shop/web/feedback/unreadlist", function (data) {
//        if (data.res.code = 40000) {
//            clearUnReadMsg();
//            var msgarray = data.res.data;
//            var msgcount = msgarray.length;
//            $("#msgcount").html(msgcount);
//            $("#msghead").html("您有" + msgcount + "条反馈消息");
//
//            data.imgbaseurl=File_Download_Url;
//            var msghtml = template('msgtpl', data);
//            $("#msgmenu-div").html(msghtml);
//
//            $("#msgmenu-div li").click(function () {
//                showMsgDetail($(this).attr("msgid"));
//            });
//        }
//    });
//}
//
///**
// * 未读的订单提醒发货信息
// */
//var unReadOrder = function () {
//    $.post("/shop/web/order/orderReminder", function (data) {
//        if (data.res.code = 40000) {
//            clearUnReadOrder();
//            var msgarray = data.res.data;
//            var msgcount = msgarray.length;
//            $("#ordercount").html(msgcount);
//            $("#orderhead").html("您有"+msgcount+"条发货提醒");
//
//            data.imgbaseurl=File_Download_Url;
//            var orderhtml = template('ordertpl', data);
//            $("#ordermenu-div").html(orderhtml);
//
//            $("#ordermenu-div li").click(function () {
//                showOrderDetail($(this).attr("orderid"));
//            });
//        }
//    });
//}
//
///**
// * 点击消息反馈后，弹出对话框
// */
//var showMsgDetail = function (msgid) {
//    jqModal.showContentModal({
//        width: 700,
//        height: 500,
//        title: '反馈信息',
//        url: '/web/feedback/msg',
//        data: {"msgid": msgid},
//        footer: {buttons: [{text: '关闭', type: 'btn-info', id: 'closeModal'}]}
//    });
//}
//
///**
// * 点击发货提醒后，弹出对话框
// */
//var showOrderDetail = function (id) {
//    jqModal.showContentModal({
//        width: 700,
//        height: 500,
//        title: '开始发货',
//        url: '/web/order/faOrderReminder',
//        data: {"orderkid": id},
//        footer: {buttons: [{text: '保存', type: 'btn-info', 'data-event':'save-mergeOrderState'}]}
//    });
//}
//
///**
// * 清空未读反馈消息
// */
//var clearUnReadMsg = function () {
//    $("#msghead").html("");
//    $("#msgmenu-div").html("");
//}
//
///**
// * 清空未读订单提醒消息
// */
//var clearUnReadOrder = function () {
//    $("#msgorder").html("");
//    $("#ordermenu-div").html("");
//}