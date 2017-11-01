/**
 * Created by yuliang on 2015/8/13.
 */


var _showModel = function(bindTag,showTagId){

    //var width = '45%';
    //var height = '90%';
    //var left = '55%';
    //var top = '55px';
    //var color = 'white';
    //var animatedIn = 'lightSpeedIn';
    //var animatedOut = 'lightSpeedOut';

    var width = $('#'+showTagId).attr('model-width');
    if(width==null){
        width = '45%';
    }

    var height = $('#'+showTagId).attr('model-height');
    if(height==null){
        height = '90%';
    }

    var left = $('#'+showTagId).attr('model-left');
    if(left==null){
        left = '55%';
    }

    var top = $('#'+showTagId).attr('model-top');
    if(top==null){
        top = '55px';
    }

    var color = $('#'+showTagId).attr('model-color');
    if(color==null){
        color = 'white';
    }

    var animatedIn = $('#'+showTagId).attr('model-animatedIn');
    if(animatedIn==null){
        animatedIn = 'lightSpeedIn';
    }

    var animatedOut = $('#'+showTagId).attr('model-animatedOut');
    if(animatedOut==null){
        animatedOut = 'lightSpeedOut';
    }

    var zIndexIn = $('#'+showTagId).attr('model-zIndexIn');
    if(zIndexIn==null){
        zIndexIn = 9999999;
    }
    $(bindTag).animatedModal({
        modalTarget:showTagId,
        animatedIn:animatedIn,
        animatedOut:animatedOut,
        width:width,
        height:height,
        left:left,
        top:top,
        color:color,
        zIndexIn:zIndexIn,
        // Callbacks
        beforeOpen: function() {
            var div = $("#"+showTagId);
            $.each(div.find("form"),function(){
                $(this).validation();
                $(this)[0].reset();
                var spans = $(this).find("span[class=help-block]");
                $.each(spans,function(){
                    $(this).empty();
                });
            });

            var button = $(bindTag);
            try{
                button.trigger("beforeOpen");
            }catch(e){}

        },
        afterOpen: function() {
            var button = $(bindTag);
            try{
                button.trigger("afterOpen");
            }catch(e){}
        },
        beforeClose: function() {
            var button = $(bindTag);
            try{
                button.trigger("beforeClose");
            }catch(e){}
            var div = $("#"+showTagId);
            $.each(div.find(".delImage"),function(){
                $(this).remove();
            });
            $.each(div.find(".addImage"),function(){
                $(this).removeAttr("img-url");
                $(this).removeAttr("img-path");

                var url = $().AbsUrlParse('/static/images/commons/img_add.png');
                $(this).attr("src",url);
            });
        },
        afterClose: function() {
            var button = $(bindTag);
            try{
                button.trigger("afterClose");
            }catch(e){}
        }
    });
}

/**
 * 展示弹出层
 * @param showId    divid
 * @param beforeOpen
 * @param afterOpen
 * @param beforeClose
 * @param afterClose
 */

var showAnimateModalCount = 0;
var showModel = function(showId,beforeOpen,afterOpen,beforeClose,afterClose){
    var showDiv = $("#show_"+showId);
    showDiv.unbind("beforeOpen");
    showDiv.bind("beforeOpen",function(){
        if(beforeOpen!=null)
            beforeOpen();
    });
    showDiv.unbind("afterOpen");
    showDiv.bind("afterOpen",function(){
        if(afterOpen!=null)
            afterOpen();
    });
    showDiv.unbind("beforeClose");
    showDiv.bind("beforeClose",function(){
        if(beforeClose!=null)
            beforeClose();
    });
    showDiv.unbind("afterClose");
    showDiv.bind("afterClose",function(){
        if(afterClose!=null)
            afterClose();
    });
    showDiv.trigger("click");
    showAnimateModalCount++;
}


/**
 * 关闭侧滑
 * @param showId
 */
var closeModel = function(showId){
    var closeBt = $(".close-"+showId);
    $("#table").bootstrapTable("refresh");
    closeBt.trigger("click");
}


