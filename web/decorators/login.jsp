<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/include/taglibs.jsp" %>
<!DOCTYPE html>
<html class="background" >
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link rel="shortcut icon" href="${path}/static/images/logo.png" type="image/x-icon"/>
    <link rel="icon" href="${path}/static/images/logo.png" type="image/x-icon"/>
    <!-- Bootstrap 3.3.4 -->
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- FontAwesome 4.3.0 -->
    <link href="${path}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="${path}/static/admin/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- iCheck -->
    <link href="${path}/static/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css"/>

	 <!-- bootstrap wysihtml5 - text editor -->
    <link href="${path}/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet"
          type="text/css"/>

	<!--[if lt IE 9]>
    <script src="${path}/static/plugins/html5shiv/html5shiv.js"></script>
    <script src="${path}/static/plugins/respond/respond.js"></script>
    <![endif]-->

    <!-- jQuery 1.10.2 -->
    <script src="${path}/static/jquery/jquery-1.10.2.min.js"></script>

    <script src="${path}/static/jquery/jquery.cookie.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${path}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="${path}/static/plugins/iCheck/icheck.min.js"></script>

    <!-- commons-->
    <script src='${path}/static/commons/hint.js'></script>
    <script src='${path}/static/commons/jqExtension.js'></script>
    <script src='${path}/static/commons/jqModal.js'></script>
    <script src='${path}/static/commons/comments.js'></script>

	<script src='${path}/static/validation/html5.js'></script>



    <style>
        .background{
            background-image: url("${path}/static/images/background_house.jpg");
            background-size: 100% 100%;
        }
    </style>

    <title>${title}</title>
    <decorator:head/>
</head>
<body class="login-page"  style="background:rgba(0,0,0,-0.3)">
<decorator:body/>
</body>
</html>



