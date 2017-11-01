<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%--添加楼盘户型--%>
<div id="addMajor">
    <div class="form-group" >
        <div>
            <input type="hidden" id="add_property_id"   value="">
            <input type="hidden" id="add_city_id"  value="">
            <input type="hidden" id="buy_picture" name="picturePath" value="${buyPicture}" alt="图片路径"/>
            <img  id="buy_image" alt="User Image" height="450" />
        </div>
    </div>
</div>

<script>
    var path = $("#buy_picture").val();
    if(path == null || path == ""){
        $("#buy_image").attr("src", $().AbsUrlParse("/static/images/no.png"));
    }else {
        $("#buy_image").attr("src", "${Download}/${buyPicture}");
    }
</script>