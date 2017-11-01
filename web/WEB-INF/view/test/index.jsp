<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>

<div>

    <%--<div class="checkbox">--%>
        <%--<label><input type="checkbox" value="">选项 1</label>--%>
    <%--</div>--%>
    <%--<div class="checkbox">--%>
        <%--<label><input type="checkbox" value="">选项 2</label>--%>
    <%--</div>--%>
    <%--<div class="radio">--%>
        <%--<label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked></label>--%>
    <%--</div>--%>
    <%--<div class="radio">--%>
        <%--<label>--%>
            <%--<input type="radio" name="optionsRadios" id="optionsRadios2"--%>
                   <%--value="option2">--%>
            <%--选项 2 - 选择它将会取消选择选项 1--%>
        <%--</label>--%>
    <%--</div>--%>



    <%--<div class="panel-body col-md-3 delImage">--%>
        <%--<div class="row">--%>
            <%--<div data-id="image_div" class="col-md-12">--%>
                <%--&lt;%&ndash;<div class="col-md-12">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<i data-id="delete_image" onclick="deleteImage(this)" class="fa fa-times"></i>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--<div data-id="div_image" class="col-md-11">--%>
                <%--</div>--%>
                    <%--<img  data-id="add_image" data-event="add_image" src="' + nPath + '" width="100%" >--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>



        <div class="panel-body col-md-2 delImage">
            <div class="row">
                <div data-id="houseTypeimage_div" class="col-md-12">
                    <div class="col-md-12">
                        <i data-id="delete_image" onclick="houseTypedeleteImage(this)" class="fa fa-times"></i>
                    </div>
                    <div data-id="houseTypediv_image" class="col-md-12">
                        <img class="addImage" data-id="houseTypeadd_image" data-event="add_image" src="" width="100" height="100">
                    </div>
                </div>
            </div>
        </div>


        <div class="form-inline">
            <p>adfadsf</p>
            <p>adfasdfsdf</p>
        </div>









    <%--hello test !!!!--%>

    <%--<input type="text" id="test" />--%>


    <div style="border: 1px solid red;width: 800px;height: 300px;">

        <div class="col-md-12">
            <div class="form-group">
                <label>轮播图:</label>
                <input type="test" name="company_images" value="" alt="图片路径">
                <div class="col-md-12" id="add_img">
                    <div class="panel-body col-md-3 isFirstAdd">
                        <div class="row">
                            <div data-id="image_div" class="col-md-12">
                                <div class="col-md-12">
                                    &nbsp;
                                </div>
                                <div data-id="div_image" class="col-md-12">
                                    <img class="addImage" data-id="add_image" data-event="add_image"
                                         src="${path}/static/images/commons/img_add.png" width="150"
                                         height="150">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>


</div>




<script>


    // 多图

    $(document).ready(function(){

        var add_image = $("img[data-id=add_image]");
        add_image.bind("loadImageAfter", function () {
            imageLoadAfter(this);

        });

    });



     function imageLoadAfter (t) {
        var isUpdate = $(t).attr("img-isUpdate");
        if (isUpdate == "false") {
            var nPath = $().AbsUrlParse("/static/images/commons/img_add.png");

            var div = createImgDiv(nPath);
            var img = div.find("img[data-id=add_image]");

            img.bind("loadImageAfter", function () {
                imageLoadAfter(this);
            });
            if ($(t).attr("is_up_company") != null) {
                img.attr("is_up_company", "1");
                $("#update_img").append(div);
            } else {
                $("#add_img").append(div);
            }
        }
    }



    function createImgDiv (nPath) {
        var img = $('<img class="addImage" data-id="add_image" data-event="add_image" src="' + nPath + '" width="150" height="150">');
        var div = $('' +
                '<div class="panel-body col-md-3 delImage">' +
                '<div class="row">' +
                '<div data-id="image_div" class="col-md-12">' +
                '<div class="col-md-12">' +
                '<i data-id="delete_image" onclick="deleteImage(this)" class="fa fa-times"></i>' +
                '</div>' +
                '<div data-id="div_image" class="col-md-11">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '</div>');
        var imgdiv = div.find("div[data-id=div_image]");
        imgdiv.append(img);


        return div;
    }










//
//    (function($){
//        $.fn.extend({
//            selectColor:function(){
//                var _d = new Date();
//                var _tem = _d.getTime();
//                return this.each(function(){
//                    var showColor = function(_obj){
//                        var _left = parseInt($(_obj).offset().left);
//                        var _top = parseInt($(_obj).offset().top);
//                        var _width = parseInt($(_obj).width());
//                        var _height = parseInt($(_obj).height());
//                        var _maxindex = function(){
//                            var ___index = 0;
//                            $.each($("*"),function(i,n){
//                                var __tem = $(n).css("z-index");
//                                if(__tem>0)
//                                {
//                                    if(__tem > ___index)
//                                    {
//                                        ___index = __tem + 1;
//                                    }
//                                }
//                            });
//                            return ___index;
//                        }();
//                        var colorH = new Array('00','33','66','99','CC','FF');
//                        var ScolorH = new Array('FF0000','00FF00','0000FF','FFFF00','00FFFF','FF00FF');
//                        var _str = new Array();
//                        for(var n = 0 ; n < 6 ; n++)
//                        {
//                            _str.push('<tr height="11">');
//                            _str.push('<td style="width:11px;background-color:#'+colorH[n]+colorH[n]+colorH[n]+'"></td>');
//                            for(var i = 0 ; i < 3; i++)
//                            {
//                                for(var j = 0 ; j < 6 ; j++)
//                                {
//                                    _str.push('<td style="width:11px;background-color:#'+colorH[i]+colorH[j]+colorH[n]+'"></td>');
//                                }
//                            }
//                            _str.push('</tr>');
//                        }
//                        for(var n = 0 ; n < 6 ; n++)
//                        {
//                            _str.push('<tr height="11">');
//                            _str.push('<td style="width:11px;background-color:#'+ScolorH[n]+'"></td>')
//                            for(var i = 3 ; i < 6; i++)
//                            {
//                                for(var j = 0 ; j < 6 ; j++)
//                                {
//                                    _str.push('<td style="width:11px;background-color:#'+colorH[i]+colorH[j]+colorH[n]+'"></td>');
//                                }
//                            }
//                            _str.push('</tr>');
//                        }
//                        var colorStr = '<div id="colorShowDiv_'+_tem+'" style="width:229px;position:absolute;z-index:'+_maxindex+';left:'+(_left+_width)+'px;top:'+(_top+_height)+'px;"><table style="width:100%; height:30px; background-color:#CCCCCC;"><tr><td style="width:40%;"><div id="colorShow_'+_tem+'" style="width:80px; height:18px; border:solid 1px #000000; background-color:#FFFFFF;"></div></td><td style="width:60%;"><input id="color_txt_'+_tem+'" type="text" style="width:100px; height:16px;" value="#FFFFFF" /></td></tr></table><table id="colorShowTable_'+_tem+'" cellpadding="0" cellspacing="1" style="background-color:#000000;">'+_str.join('')+'</table></div>'
//                        $("body").append(colorStr);
//                        var _currColor;
//                        var _currColor2;
//                        $("#colorShowTable_"+_tem+" td").mouseover(function(){
//                            var _color = $(this).css("background-color");
//                            if(_color.indexOf("rgb")>=0)
//                            {
//                                var _tmeColor = _color;
//                                _tmeColor = _color.replace("rgb","");
//                                _tmeColor = _tmeColor.replace("(","");
//                                _tmeColor = _tmeColor.replace(")","");
//                                _tmeColor = _tmeColor.replace(new RegExp(" ","gm"),"");
//                                var _arr = _tmeColor.split(",");
//                                var _tmeColorStr = "#";
//                                for(var ii = 0 ; ii < _arr.length ; ii++)
//                                {
//                                    var _temstr = parseInt(_arr[ii]).toString(16);
//                                    _temstr = _temstr.length < 2 ? "0"+_temstr : _temstr;
//                                    _tmeColorStr += _temstr;
//                                }
//                            }
//                            $("#color_txt_"+_tem).val(_tmeColorStr);
//                            $("#colorShow_"+_tem).css("background-color",_color);
//                            _currColor = _color;
//                            _currColor2 = _tmeColorStr;
//                            $(this).css("background-color","#FFFFFF");
//                        });
//                        $("#colorShowTable_"+_tem+" td").mouseout(function(){
//                            $(this).css("background-color",_currColor);
//                        });
//                        $("#colorShowTable_"+_tem+" td").click(function(){
//                            $(_obj).val(_currColor2);
//                        });
//                    }
//                    $(this).click(function(){
//                        showColor(this);
//                    });
//                    var _sobj = this;
//                    $(document).click(function(e){
//                        e = e ? e : window.event;
//                        var tag = e.srcElement || e.target;
//                        if(_sobj.id==tag.id)return;
//                        var _temObj = tag;
//                        while(_temObj)
//                        {
//                            if(_temObj.id=="colorShowDiv_"+_tem)return;
//                            _temObj = _temObj.parentNode;
//                        }
//                        $("#colorShowDiv_"+_tem).remove();
//                    });
//                });
//            }
//        });
//    })(jQuery);
//
//
//    $(document).ready(function(){
//        $("#test").selectColor();
//    });
//
//
//
//



</script>


<%--<div class="login">--%>
    <%--<div class="logincont">--%>
        <%--<h1>登&nbsp;&nbsp;录</h1>--%>
        <%--<ul>--%>
            <%--<li>--%>
                <%--<p class="leftp">邮箱账号</p>--%>
                <%--<p class="logerror">输入的账号或者密码有误！</p>--%>
                <%--<p class="logr tsa">还没有账号？<a href="#" onclick="locationToHref('/web/user/register_new.html')">15秒注册</a></p>--%>
                <%--<input id="l_login_name" type="text" placeholder="请输入邮箱">--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<p class="leftp">登录密码</p>--%>
                <%--<p class="passerror">请输入密码！</p>--%>
                <%--<p class="logr"><a onclick="findpass()" class="forgetpassword">忘记密码？</a></p>--%>
                <%--<input id="l_password" class="logpwd" type="password" placeholder="请输入登录密码（6-16位数字、字母或字符的组合）">--%>
            <%--</li>--%>
            <%--<li class="logyzm" style="display: none;">--%>
                <%--<p>验证码</p>--%>
                <%--<input id="l_validateCode" class="lyzmbg" type="text" >--%>
                <%--<img id="validateCodeImg" width="109" height="40" onclick="refreshImg()"/>--%>
                <%--<p class="yzmch">看不清楚？<a href="#" class="yzm_change" onclick="refreshImg()">换一张</a></p>--%>
                <%--<p class="error"><span class="suc"></span></p>--%>
            <%--</li>--%>
            <%--<li class="cook">--%>
                <%--<input id="l_auto_login" checked type="checkbox" value=""/>--%>
                <%--<p>7天自动登录</p>--%>
            <%--</li>--%>
            <%--<li class="zhbut">--%>
                <%--<!--<input id="l_login_in" type="button" value="登录" />-->--%>
                <%--<a id="l_login_in" onclick="loginNew()">登录</a>--%>
            <%--</li>--%>
            <%--<li class="share" style="display: none;">--%>
                <%--<ul>--%>
                    <%--<li>--%>
                        <%--<a></a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a></a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a></a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a></a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<p>可以使用以下方式登录</p>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</div>--%>
