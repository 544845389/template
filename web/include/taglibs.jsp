<%@ page import="com.baichang.framework.Constant" %>
<%@ page import="com.baichang.framework.security.entity.SAdmin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    request.setAttribute("path", path);
    SAdmin admin = (SAdmin) session.getAttribute(Constant.SESSION_USER_WEB);

    String title = "惠售房管理平台";
    String devtitle = "惠售房管理";


    // 编辑器
    String ueditorUrl = "http://127.0.0.1:8080";


    // 图片 上传
    String fileServier = "http://127.0.0.1:8080";

   // 图片 下载
    String Download = "http://127.0.0.1:8080";

    // 用户头像
    String adminPhoto = "http://127.0.0.1:8080";
    if (admin != null && admin.getPhoto() != null){
        adminPhoto += admin.getPhoto();
    } else {
        adminPhoto = path + "/static/images/head_house.gif";
    }

    request.setAttribute("adminPhoto", adminPhoto);
    request.setAttribute("ueditorUrl", ueditorUrl);
    request.setAttribute("fileServier", fileServier);
    request.setAttribute("Download", Download);

    request.setAttribute("title", title);
    request.setAttribute("devtitle", devtitle);
    request.setAttribute("user", admin);
%>