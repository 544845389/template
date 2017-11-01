<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%--添加楼盘户型--%>
<div id="addMajor">
    <div class="form-group" >
        <div>
            <input type="hidden" id="add_property_id"   value="">
            <input type="hidden" id="add_city_id"  value="">
            <input type="hidden" id="deal_picture" name="picturePath" value="${dealPicture}" alt="图片路径"/>
            <img  id="deal_image" alt="User Image" height="450" />
        </div>
    </div>
</div>

<script>
    var path = $("#deal_picture").val();
    if(path == null || path == ""){
        $("#deal_image").attr("src", $().AbsUrlParse("/static/images/no.png"));
    }else {
        $("#deal_image").attr("src", "${Download}/${dealPicture}");
    }
</script>