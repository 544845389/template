<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<html>
<head>
    <title>${information.titile}</title>
</head>
<body style="padding: 20px 5px 20px 5px">
<!-- 标题  -->
<div>
    <label style="font-weight: 600;font-size: 20px;">${information.titile}</label>
</div>
<!-- 时间  -->
<div style="padding-top: 20px;padding-bottom: 20px;">
    <label style="color: #6A6A6A;">${information.created}</label>
</div>
<!-- 图片  -->
<div style="padding-bottom: 20px;">
    <img src="${Download}/${information.picture}" style="width: 100%" />
</div>
<div>
    ${information.content}
</div>
</body>
</html>
