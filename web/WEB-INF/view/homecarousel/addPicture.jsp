<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>

<div id="addMajor">
    <div class="form-group" >
        <div>
            <input type="hidden" id="add_property_id"   value="">
            <input type="hidden" id="add_city_id"  value="">
            <input type="hidden" id="modifyHeadPic" name="picturePath" value="" alt="图片路径"/>
            <img  id="addImage3"  class="addImage" alt="User Image" width="250" height="250" src="${path}/static/images/commons/img_add.png" />
        </div>
        <div>
            <span style="color: red">建议上传格式:800*600</span>
        </div>
    </div>
</div>
