var jqModal;
if (!jqModal)jqModal = {};


//弹出层，选择项

var init = function () {
    var modelView = "<div class='modal fade' style='z-index: 999999999' id='cutomModal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>" +
        "<div class='modal-dialog'>" +
        "<div class='modal-content'>" +
        "<div class='modal-header'>" +
        "<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>" +
        "<h4 class='modal-title' id='modalTitle'></h4>" +
        "</div>" +
        "<div class='modal-body'>" +
        "</div>" +//
        "</div>" +
        "</div>";
    var head = $('body>div:first');
    $(head).before(modelView);
};

var getSelectedItems = function (multiple) {
    var items;
    if (multiple)
        items = $('input:checkbox[name="jqModalBoxName"]:checked');
    else {
        items = $('input:radio[name="jqModalBoxName"]:checked');
    }
    var result = new Array(items.length);
    $.each(items, function (i, item) {
        var val = $(item).val();
        var txt = $(item).attr('txt');
        result[i] = {val: val, txt: txt};
    });
    return result;

};

var modal;
jqModal.closeContentModal = function () {
   // modal.close();
    modal.destroy();
};
jqModal.showContentModal = function (option) {
    if (modal != null || modal != undefined) {
        modal.close();
        modal.destroy();
        modal = null;
    }
    var defaultOption = {
        title: null,
        width: 600,
        height: 400,
        url: '',
        data: {},
        requestMethod: 'POST',
        content: '',
        zIndex:999999999,
        footer:null
    };
    var options;
    options = $.extend({}, defaultOption, option);

    var jBoxOption = {
        title: options.title,
        width: options.width,
        height: options.height,
        persistent: true,
        content: '',
        zIndex:options.zIndex,
        ajax: {
            url: '',
            data: {},
            type: 'POST',
            reload: true
        },
        footer:options.footer
    };
    if(options.footer!=null){
        jBoxOption.footer = options.footer;
    }
    if (options.content.length > 0) {
        options.url = '';
        options.params = [];
        jBoxOption.content = options.content;
        modal = new jBox('Modal', jBoxOption);
        modal.open();
    } else if (options.url.length > 0) {
        if(options.url.startsWith("http:")){
            jBoxOption.ajax.url = options.url;
        }else{
            jBoxOption.ajax.url = $().AbsUrlParse(options.url);
        }
        jBoxOption.ajax.data = options.data;
        jBoxOption.ajax.type = options.requestMethod;
        modal = new jBox('Modal', jBoxOption);
        modal.open();
    }
};

jqModal.showModal = function (option) {
    var defaultOption = {
        title: '请选择',
        buttons: [
            {text: '确定', callback: undefined}
        ],
        multiple: false,
        items: [],//{val:1,txt:'aaa'}
        content: '',
        type: 'SELECT'//'SELECT | CONFIRM'
    };
    var options;
    options = $.extend({}, defaultOption, option);
    $('#modalTitle').empty();
    $('#modalTitle').replaceWith(options.title);
    //移除原有的按钮区域
    $('div.modal-footer').remove();
    //移除选项区域
    $('div.modal-body').empty();

    if (options.buttons.length > 0) {
        var footer = "<div class='modal-footer'>";
        $.each(options.buttons, function (idx, item) {
            var buttonId = 'CutomButton' + idx;
            footer += "<button type='button' class='btn btn-primary' id='" + buttonId + "'>";
            var buttonTxt = item.text.length > 0 ? item.text : ("按钮" + idx);
            footer += buttonTxt;
            footer += "</button>";
        });
        footer += "<button type='button' class='btn btn-default' id='btnModelCancel' data-dismiss='modal'>关闭</button></div>";
        $('div.modal-body').after(footer);
        //绑定按钮事件
        $.each(options.buttons, function (idx, item) {
            var button = $('#CutomButton' + idx);
            $(button).on('click', function () {
                $('#cutomModal').modal('hide');
                if (item.callback != undefined) {
                    if (options.type == 'SELECT') {
                        var ret = getSelectedItems(options.multiple);
                        item.callback(ret);
                    } else {
                        item.callback();
                    }
                }
            });
        });
    }
    if (options.type == 'SELECT') {
        //将选项加入
        if (options.items.length > 0) {
            if (options.multiple) {
                //多选
                var html = "";
                $.each(options.items, function (idx, item) {
                    html += "<label class='cb-checkbox'>" +
                        "<span class='cb-inner'>" +
                        "<i><input type='checkbox' name='jqModalBoxName' txt='" + item.txt + "' value='" + item.val + "'></i>" +
                        "</span>" + item.txt + "</label><br>";
                });
                $('div.modal-body').append(html);
            } else {
                //单选
                var html = "";
                $.each(options.items, function (idx, item) {
                    html += "<label class='cb-radio'>" +
                        "<span class='cb-inner'>" +
                        "<i><input type='radio' name='jqModalBoxName' txt='" + item.txt + "' value='" + item.val + "'></i>" +
                        "</span>" + item.txt + "</label><br>";
                });
                $('div.modal-body').append(html);
            }
            $('input:checkbox[name="jqModalBoxName"]').on('click', function () {
                $(this).parents('label.cb-checkbox').toggleClass('checked');
            });
            $('input:radio[name="jqModalBoxName"]').on('click', function () {
                $('label.cb-radio').removeClass('checked');
                $(this).parents('label.cb-radio').addClass('checked');
            });
        }
    } else {
        $('div.modal-body').append(options.content);
    }
    $('#cutomModal').modal('show');
};


$(document).ready(function () {
    $().loadExtendJsFile('/static/plugins/jsCheckBox/css/checkBo.min.css', 'css');
    $().loadExtendJsFile('/static/plugins/jsCheckBox/js/checkBo.min.js', 'js');
    $().loadExtendJsFile('/static/plugins/jBox/jBox.css', 'css');
    $().loadExtendJsFile('/static/plugins/jBox/jBox.min.js', 'js');
    init();
});


