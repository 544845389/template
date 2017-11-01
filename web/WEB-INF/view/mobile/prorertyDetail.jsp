<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<html>

    <link href="${path}/static/houseswill/util/lanren.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${path}/static/houseswill/util/styles.css" type="text/css"> <!-- 轮播图 -->
    <script src="${path}/static/jquery/jquery-1.10.2.min.js"></script>
    <script src="${path}/static/houseswill/util/yxMobileSlider.js"  ></script> <!-- 轮播图 -->
    <script src="${path}/static/houseswill/util/lanren.js"  ></script>
    <!-- jQuery 1.10.2 -->

<head>
    <title>${property.name}</title>
</head>
<body style="padding: 0px;margin: 0px;background-color: white;">

    <!-- 轮播图 -->
        <div class="slider">
            <ul>
                <c:forEach var="item" items="${property.propertyImages}">
                    <li> <img    src="http://114.215.88.167:8080/images/file/${item}" /></li>
                </c:forEach>
                <%--<li><img src="http://114.215.88.167:8080/images/file/20160914/147382097762982934/1473820995009.jpg" ></li>--%>
                <%--<li><img src="http://114.215.88.167:8080/images/file/20160914/147382097762982934/1473820995009.jpg" ></li>--%>
                <%--<li><img src="http://114.215.88.167:8080/images/file/20160914/147382097762982934/1473820995009.jpg" ></li>--%>
                <%--<li><img src="http://114.215.88.167:8080/images/file/20160914/147382097762982934/1473820995009.jpg" ></li>--%>
                <%--<li><img src="http://114.215.88.167:8080/images/file/20160914/147382097762982934/1473820995009.jpg" ></li>--%>
            </ul>
        </div>

    <div style="border-bottom: 1px solid #D7D7D7;text-align: left;padding-left: 25px;padding-top: 35px;padding-bottom: 35px;">
        <p style="font-size: 40px;font-weight: 700;" >${property.name}</p>
    </div>

    <!-- 参数 -->
    <div id="parameter" style="padding-left: 25px;margin-bottom: 20px;">
        <ul>
            <li style="padding-top: 40px;">
                <p >地址：${property.address}</p>
            </li>
            <li>
                <p >均价：<small style="color: #D56272;">${property.average}</small></p>
            </li>
            <li>
                <p >佣金：<small style="color: #D56272;">${property.commission}</small></p>
            </li>
            <li>
                <p >交通状况：<small style="color: #B2B2B2;" >${property.PropertyParameter.traffic}</small></p>
            </li>
            <li>
                <p >项目配套：<small style="color: #B2B2B2;" >${property.PropertyParameter.projectSupport}</small></p>
            </li>
            <li>
                <p >物业公司：<small style="color: #B2B2B2;" >${property.PropertyParameter.propertyCompany}</small></p>
            </li>
            <li>
                <p >开发商：<small style="color: #B2B2B2;" >${property.PropertyParameter.propertyCompany}</small></p>
            </li>
            <li>
                <p  >售楼处：<small style="color: #B2B2B2;" >${property.PropertyParameter.salesOffice}</small></p>
            </li>
            <li>
                <p  >物业费：<small style="color: #B2B2B2;" >${property.PropertyParameter.propertyFee}</small></p>
            </li>
            <li>
                <p>绿化率：<small style="color: #B2B2B2;" >${property.PropertyParameter.greenRate}</small></p>
            </li>
            <li>
                <p>容积率：<small style="color: #B2B2B2;" >${property.PropertyParameter.volumeRatio}</small></p>
            </li>
            <li>
                <p>产权年限：<small style="color: #B2B2B2;" >${property.PropertyParameter.propertyRight}</small></p>
            </li>
            <li>
                <p>装修状况：<small style="color: #B2B2B2;" >${property.PropertyParameter.decoration}</small></p>
            </li>
            <li>
                <p>项目特色：<small style="color: #B2B2B2;" >${property.PropertyParameter.features}</small></p>
            </li>
            <li>
                <p>建筑类型：<small style="color: #B2B2B2;" >${property.PropertyParameter.buildingType}</small></p>
            </li>
            <li >
                <p>开盘时间：<small style="color: #B2B2B2;" >${property.PropertyParameter.openingTime}</small></p>
            </li>
        </ul>
    </div>

    <div style="height: 35px;background-color: #F0F0EB;"></div>

    <!--楼盘买点  -->
        <div style="text-align: left;">
            <div style="border-top: 1px solid #F3F1ED;padding: 20px;" >
                <div>
                    <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy1.png" style="width: 43px;" />
                    <label style="font-size: 21px;font-weight: 700;margin-left: 20px;">楼盘卖点</label>
                </div>
                <div style="padding-left: 25px;">
                    <textarea disabled="disabled" class="form-control" style="font-size:35px;outline:none;resize: none;border: none;width: 100%;background-color: white;" id="selling" onclick="" >${property.selling}</textarea>
                </div>
            </div>
            <div style="border-top: 1px solid #F3F1ED;padding: 20px;">
                <div>
                    <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy2.png" style="width: 43px;"  />
                    <label style="font-size: 21px;font-weight: 700;margin-left: 20px;">目标客户</label>
                </div>
                <div style="padding-left: 25px;">
                    <textarea disabled="disabled" class="form-control" style="font-size:35px;outline:none;resize: none;border: none;width: 100%;background-color: white;"  id="targetCustomers" >${property.targetCustomers}</textarea>
                </div>
            </div>
            <div style="border-bottom: 1px solid #F3F1ED;border-top: 1px solid #F3F1ED;padding: 20px;">
                <div>
                    <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy3.png" style="width: 43px;"  />
                    <label style="font-size: 21px;font-weight: 700;margin-left: 20px;">拓客技巧</label>
                </div>
                <div style="padding-left: 25px;">
                    <textarea disabled="disabled" class="form-control" style="font-size:35px;outline:none;resize: none;border: none;width: 100%;background-color: white;" id="toker" >${property.toker}</textarea>
                </div>
            </div>
        </div>

    <div style="height: 35px;background-color: #F0F0EB;"></div>

    <div>
        <div style="text-align: center;padding-top: 30px;padding-bottom: 30px;">
            <label style="font-size: 15px;" >户型（${property.layoutsSize}套）</label>
        </div>
        <div id="houseType">
            <div class="page_guide_slider">
                <div class="page_guide_balloon" style="display:none;">
                    <div class="page_guide_title">
                        <div class="page_guide_title_text">主题名称</div>
                    </div>
                    <div class="page_guide_pointer">
                        <div class="page_guide_point"></div>
                    </div>
                    <div class="page_guide_bar">
                        <div class="page_guide_progress">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                </div>
                <div class="page_guide_container" onMouseDown="pageGuideMousedown(this,event)" onMouseMove="pageGuideMousemove(this,event)" onMouseUp="pageGuideMouseup(this,event)" onMouseOut="pageGuideMouseout(this,event)" ontouchstart="pageGuideTouchstart(this,event)" ontouchmove="pageGuideTouchmove(this,event)" ontouchend="pageGuideTouchend(this,event)">
                    <div class="page_guide_items">
                        <div id="3_1" class="page_guide_item" >

                            <div class="page_guide_item_text" style="display: none;" >
                                <div class="page_guide_item_title">智能客服</div>
                                <div class="page_guide_item_intr">机器人托管、人工客服接管、机器人辅助; 智能的对话分配机制，灵活自如，效率翻倍，助您打造高效智能的公众号客户服务平台</div>
                            </div>

                            <div class="page_guide_item_image">
                                <c:forEach var="item" items="${property.layouts}">
                                    <img  style="height:250px;padding-left: 10px;"  src="http://114.215.88.167:8080/images/file/${item.houseTypeImages}" />
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>


<script>

    $(function(){
        $(".slider").yxMobileSlider({during:3000});
        selling();
        targetCustomers();
        toker();
    })



    var observe;
    if (window.attachEvent) {
        observe = function (element, event, handler) {
            element.attachEvent('on'+event, handler);
        };
    }
    else {
        observe = function (element, event, handler) {
            element.addEventListener(event, handler, false);
        };
    }



    function selling () {
        var text = document.getElementById('selling');
        function resize () {
            text.style.height = 'auto';
            text.style.height = text.scrollHeight+'px';
        }
        /* 0-timeout to get the already changed text */
        function delayedResize () {
            window.setTimeout(resize, 0);
        }
        observe(text, 'change',  resize);
        observe(text, 'cut',     delayedResize);
        observe(text, 'paste',   delayedResize);
        observe(text, 'drop',    delayedResize);
        observe(text, 'keydown', delayedResize);
        resize();
    }


    function targetCustomers () {
        var targetCustomers = document.getElementById('targetCustomers');
        function resize () {
            targetCustomers.style.height = 'auto';
            targetCustomers.style.height = targetCustomers.scrollHeight+'px';
        }
        /* 0-timeout to get the already changed text */
        function delayedResize () {
            window.setTimeout(resize, 0);
        }
        observe(targetCustomers, 'change',  resize);
        observe(targetCustomers, 'cut',     delayedResize);
        observe(targetCustomers, 'paste',   delayedResize);
        observe(targetCustomers, 'drop',    delayedResize);
        observe(targetCustomers, 'keydown', delayedResize);
        resize();
    }


    function toker () {
        var toker = document.getElementById('toker');
        function resize () {
            toker.style.height = 'auto';
            toker.style.height = toker.scrollHeight+'px';
        }
        /* 0-timeout to get the already changed text */
        function delayedResize () {
            window.setTimeout(resize, 0);
        }
        observe(toker, 'change',  resize);
        observe(toker, 'cut',     delayedResize);
        observe(toker, 'paste',   delayedResize);
        observe(toker, 'drop',    delayedResize);
        observe(toker, 'keydown', delayedResize);

        resize();
    }


</script>

<style>
    #parameter ul li{
        padding-top: 20px;
        padding-bottom: 20px;
        text-align: left;
    }
    #parameter ul li p{
       font-size: 21px;
    }




</style>

</html>
