<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/include/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <meta charset="UTF-8">
    <title>${title}</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <link rel="shortcut icon" href="${path}/static/images/logo.png" type="image/x-icon"/>
    <link rel="icon" href="${path}/static/images/logo.png" type="image/x-icon"/>

    <!-- Bootstrap 3.3.4 -->
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- FontAwesome 4.3.0 -->
    <link href="${path}/static/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Ionicons 2.0.0 -->
    <link href="${path}/static/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="${path}/static/admin/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="${path}/static/admin/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    <!-- iCheck -->
    <link href="${path}/static/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css"/>
    <!-- Morris chart -->
    <link href="${path}/static/plugins/morris/morris.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/static/plugins/morris/prettify.min.css" rel="stylesheet" type="text/css"/>
    <!-- jvectormap -->
    <link href="${path}/static/plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css"/>
    <!-- Date Picker -->
    <link href="${path}/static/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>
    <!-- Daterange picker -->
    <%--<link href="${path}/static/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />--%>
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${path}/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- animatedModal -->
    <link rel="stylesheet" href="${path}/static/plugins/animatedModal/css/normalize.min.css">
    <link rel="stylesheet" href="${path}/static/plugins/animatedModal/css/animate.min.css">
    <link rel="stylesheet" href="${path}/static/plugins/animatedModal/css/index.css">
    <!-- bootstrap3Validation -->
    <link href="${path}/static/validation/bootstrap-ie78.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/static/commons/css/commons.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="${path}/static/plugins/ztree/css/zTreeStyle/zTreeStyle.css"/>


    <script>

        var File_Upload_Url = '${fileServier}/fileupload/file/uploadImages';//图片上传路径
        var File_Download_Url = '${Download}/';//图片下载路径




    </script>

    <script src='${path}/static/commons/javascript.js'></script>
    <script src="${path}/static/commons/comments.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${path}/static/plugins/html5shiv/html5shiv.js"></script>
    <script src="${path}/static/plugins/respond/respond.js"></script>
    <![endif]-->


    <!-- jQuery 1.10.2 -->
    <script src="${path}/static/jquery/jquery-1.10.2.min.js"></script>
    <script src="${path}/static/jquery/jquery.form.js"></script>
    <script src="${path}/static/jquery/jquery.blockUI-css.js"></script>
    <script src="${path}/static/jquery/jquery.blockUI.min.js"></script>

    <script src='${path}/static/commons/mfunction.js'></script>
    <!-- artTemplate 模板引擎-->
    <script src='${path}/static/plugins/arttemplate/template.js'></script>

    <!--公共头部 -->
    <script src='${path}/static/commons/head.js'></script>


    <script src="${path}/static/socket/socket.io/socket.io.js"></script>
    <script src="${path}/static/socket/moment.min.js"></script>

    <!-- jQuery UI 1.11.2 -->
    <script src="${path}/static/jquery/jquery-ui-1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>

        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${path}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <!-- qrcode -->
    <script src="${path}/static/plugins/qrcode/qrcode.min.js" type="text/javascript"></script>

    <!-- Morris.js charts -->
    <script src="${path}/static/plugins/raphael/raphael-min.js"></script>
    <script src="${path}/static/plugins/morris/morris.min.js" type="text/javascript"></script>
    <script src="${path}/static/plugins/morris/prettify.min.js" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="${path}/static/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="${path}/static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="${path}/static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <!-- jQuery Knob Chart -->
    <script src="${path}/static/plugins/knob/jquery.knob.js" type="text/javascript"></script>
    <%--<!-- daterangepicker -->--%>
    <%--<script src="${path}/static/plugins/moment/moment.min.js" type="text/javascript"></script>--%>
    <%--<script src="${path}/static/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>--%>

    <!-- datepicker -->
    <script src="${path}/static/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="${path}/static/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"
            type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${path}/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
            type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="${path}/static/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${path}/static/plugins/fastclick/fastclick.min.js'></script>
    <!-- iCheck -->
    <script src="${path}/static/plugins/iCheck/icheck.min.js"></script>


    <!-- bootstrap table-->
    <link href="${path}/static/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
    <script src='${path}/static/plugins/bootstrap-table/bootstrap-table.js'></script>
    <%--<script src="${path}/static/jquery/jquery.base64.js"></script>--%>
    <script src='${path}/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js'></script>

    <!-- animatedModal --->
    <script src="${path}/static/plugins/animatedModal/js/animatedModal.min.js"></script>
    <script src="${path}/static/plugins/animatedModal/js/index.js"></script>

    <!-- bootstrap3Validation --->
    <script type="text/javascript" src="${path}/static/validation/bootstrap3-validation.js"></script>
    <script src="${path}/static/validation/respond.min.js" type="text/javascript"></script>
    <script src="${path}/static/validation/html5.js" type="text/javascript"></script>

    <!-- commons-->
    <script src='${path}/static/commons/base64.js'></script>
    <script src='${path}/static/commons/hint.js'></script>
    <script src='${path}/static/commons/jqExtension.js'></script>
    <script src='${path}/static/commons/jqModal.js'></script>
    <script src='${path}/static/commons/comments.js'></script>

    <script src="${path}/static/commons/image.js"></script>
    <script src='${path}/static/commons/resize.js'></script>

    <script src='${path}/static/commons/slidingmenu.js'></script>

    <!-- 百度地图 -->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=${baidu_key}"></script>
    <script src="${path}/static/commons/BaiduMap.js"></script>


    <!-- 高德地图 -->
    <script type="text/javascript"
            src="http://webapi.amap.com/maps?v=1.3&key=89f361f80bf12aecc4d8177f35fb7f15&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder,AMap.CitySearch"></script>
    <script  type="text/javascript" src="${path}/static/commons/gaodeMap.js"/>
    <script type="text/javascript" src="${path}/static/commons/addToolbar.js"></script>


    <script type="text/javascript" charset="utf-8" src="${ueditorUrl}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ueditorUrl}/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ueditorUrl}/ueditor/lang/zh-cn/zh-cn.js"></script>


    <script src="${path}/static/plugins/ztree/js/jquery.ztree.all-3.5.min.js"></script>


    <link href="${path}/static/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <script type="text/javascript" src="${path}/static/plugins/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${path}/static/plugins/datetimepicker/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

    <script src="${path}/static/uploadFile/jquery.ui.widget.js" type="text/javascript" ></script>
    <script src="${path}/static/uploadFile/bootstrap-paginator.js" type="text/javascript" ></script>
    <script src="${path}/static/uploadFile/jquery.fileupload.js" type="text/javascript" ></script>


    <decorator:head/>
</head>
<body>
<decorator:body/>
</body>
</html>