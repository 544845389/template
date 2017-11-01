<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/taglibs.jsp" %>
<html>
<head>
    <meta name="decorator" content="default">
    <script src="${path}/static/commons/index.js"></script>

    <title></title>
</head>
<body class="skin-blue sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="index" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">惠售房</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>惠售房</b>管理平台</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <%--<li class="dropdown messages-menu">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                            <%--<i class="fa fa-envelope-o"></i>--%>
                            <%--<span class="label label-success" id="msgcount">0</span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li class="header" id="msghead">您有0条反馈消息</li>--%>
                            <%--<li id="msgmenu-div">--%>
                                <%--<!--反馈消息内容-->--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- Notifications: style can be found in dropdown.less -->
                    <%--<li class="dropdown notifications-menu">--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                            <%--<i class="fa fa-bell-o"></i>--%>
                            <%--<span class="label label-warning" id="ordercount">0</span>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li class="header" id="orderhead">您有0条发货提醒</li>--%>
                            <%--<li id="ordermenu-div">--%>
                                <%--<!--订单提醒发货消息-->--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${adminPhoto}" data-id="admin-photo" class="user-image" alt="User Image"/>
                            <span class="hidden-xs">${user.userName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="${adminPhoto}" class="img-circle addImage" data-id="admin-photo"
                                     data-event="admin_photo" alt="User Image"/>

                                <p>
                                    ${user.userName}管理员
                                    <%--<small>2015-2018</small>--%>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="javascript:void(0)" onclick="showMergeModel(${user.id})"
                                       class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" data-event="logout" class="btn btn-default btn-flat">退&nbsp;&nbsp;出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <%--<li>--%>
                        <%--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>--%>
                    <%--</li>--%>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${adminPhoto}" class="img-circle" data-id="admin-photo" alt="User Image"/>
                </div>
                <div class="pull-left info">
                    <p>${user.userName}</p>
                    <a><i class="fa fa-circle text-success"></i>online</a>
                </div>
            </div>
            <!-- search form
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='button' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            -->
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" id="menu">

            </ul>
        </section>
        <script>

            var addChildMenu = function (li, item) {
                var path = '${path}';
                if (item.childs.length > 0) {
                    var ul = $("<ul class=\"treeview-menu\"></ul>");
                    for (var i = 0; i < item.childs.length; i++) {
                        var c = item.childs[i];
                        var a = li.children("a");
                        var mli = null;
                        if (c.childs.length > 0) {
                            mli = $("<li><a href=\"#\"><i class=\"" + c.icon + "\"></i>" + c.name + "<i class=\"fa fa-angle-left pull-right\"></i></a></li>");
                            addChildMenu(mli, c);
                        } else {
                            var mpath = path + c.url;
                            if (c.url == "" || c.url == "#") {
                                mpath = "#";
                            }
                            mli = $("<li><a event-url=\"" + mpath + "\" href=\"#\"><i class=\"" + c.icon + "\"></i>" + c.name + "</a></li>");
                        }
                        ul.append(mli);
                        a.after(ul);
                    }
                }
            };

            var loadMenu = function () {
                comment.get('/web/resource/loadAdminMenu', '菜单加载中....', function (res) {
                    var menu = $("#menu");
                    if (res.state && res.res.code == 40000) {
                        for (var i = 0; i < res.res.data.length; i++) {
                            var item = res.res.data[i];
                            var li = $("<li class=\"treeview\"><a href=\"#\"><i class=\"" + item.icon + "\"></i> <span>" + item.name + "</span> <i class=\"fa fa-angle-left pull-right\"></i></a></li>");
                            addChildMenu(li, item);
                            menu.append(li);
                        }
                    }
                    $.AdminLTE.tree('#menu');
                });
            };

            $(document).on("click", "#search-btn", function () {
                alert($("input[name=q]").val());
            });
            loadMenu();
        </script>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                &nbsp;
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb" id="menu-path">
                <li><a href="${path}/web/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">首页</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content" id="main-content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3 id="not_audit_count"></h3>
                            <p>未审核经纪人数量</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="javascript:void(0)" menu-click="true" event-url="${path}/web/agent/notaudit"  class="small-box-footer" id="not_count">More info<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3 id="agent_cash_count"></h3>
                            <p>申请提现经纪人数量</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="javascript:void(0)" menu-click="true" event-url="${path}/web/agentcash/index" class="small-box-footer" id="">More info<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <%--<div class="col-lg-3 col-xs-6">--%>
                    <%--<!-- small box -->--%>
                    <%--<div class="small-box bg-yellow">--%>
                        <%--<div class="inner">--%>
                            <%--<h4 id="companyCount"></h4>--%>

                            <%--<p>商家</p>--%>
                        <%--</div>--%>
                        <%--<div class="icon">--%>
                            <%--<i class="ion ion-person-add"></i>--%>
                        <%--</div>--%>
                        <%--<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<!-- ./col -->--%>
                <%--<div class="col-lg-3 col-xs-6">--%>
                    <%--<!-- small box -->--%>
                    <%--<div class="small-box bg-red">--%>
                        <%--<div class="inner">--%>
                            <%--<h3 id="depotCount"></h3>--%>

                            <%--<p>修理厂</p>--%>
                        <%--</div>--%>
                        <%--<div class="icon">--%>
                            <%--<i class="ion ion-pie-graph"></i>--%>
                        <%--</div>--%>
                        <%--<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<!-- ./col -->--%>
            <%--</div>--%>
            <%--<!-- /.row -->--%>
            <%--<!-- Main row -->--%>
            <%--<div class="row">--%>
                <%--<!-- Left col -->--%>
                <%--<section class="col-lg-12 connectedSortable">--%>
                    <%--<div id="canvasDiv"></div>--%>
                <%--</section>--%>
            <%--</div>--%>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>版本</b>1.0
        </div>
        <strong>Copyright &copy; 2016<a href="http://www.sdbaichang.com/" target="_blank">山东佰昌信息科技有限公司</a>.</strong> 所有权利保留
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">最近的活动</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript:;'>
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">兰登的生日</h4>

                                <p>4月24日</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <i class="menu-icon fa fa-user bg-yellow"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">更新资料</h4>

                                <p>新电话 +1(800)555-1234</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">快播加入邮件列表</h4>

                                <p>nora@example.com</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <i class="menu-icon fa fa-file-code-o bg-green"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">作业254执行</h4>

                                <p>执行时间5秒</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">任务进展</h3>
                <ul class='control-sidebar-menu'>
                    <li>
                        <a href='javascript:;'>
                            <h4 class="control-sidebar-subheading">
                                自定义模板设计
                                <span class="label label-danger pull-right">70%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <h4 class="control-sidebar-subheading">
                                更新简历
                                <span class="label label-success pull-right">95%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <h4 class="control-sidebar-subheading">
                                laravel一体化
                                <span class="label label-waring pull-right">50%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href='javascript:;'>
                            <h4 class="control-sidebar-subheading">
                                后端框架
                                <span class="label label-primary pull-right">68%</span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">一般设置</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            面板使用
                            <input type="checkbox" class="pull-right" checked/>
                        </label>

                        <p>
                            关于此一般设置选项的信息
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            允许重定向
                            <input type="checkbox" class="pull-right" checked/>
                        </label>

                        <p>
                            其他组的选项是可用的
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            揭露作者姓名
                            <input type="checkbox" class="pull-right" checked/>
                        </label>

                        <p>
                            允许用户在博客文章中显示自己的名字
                        </p>
                    </div>
                    <!-- /.form-group -->

                    <h3 class="control-sidebar-heading">聊天设置</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            给我看在线
                            <input type="checkbox" class="pull-right" checked/>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            关闭通知
                            <input type="checkbox" class="pull-right"/>
                        </label>
                    </div>
                    <!-- /.form-group -->

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            删除聊天记录
                            <a href="javascript:" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                        </label>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class='control-sidebar-bg'></div>
</div>
<!-- ./wrapper -->


<!-- AdminLTE App -->
<script src="${path}/static/admin/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="${path}/static/admin/js/demo.js" type="text/javascript"></script>

<script src='${path}/static/commons/table-resize.js'></script>



<script>
    //修改头像
    var admin_photo = $("img[data-event=admin_photo]");
    admin_photo.bind("loadImageAfter", function () {
        var url = $(this).attr("img-url");
        var path = $(this).attr("img-path");
        comment.post('/web/admin/changePhoto', {path: path}, null, function (data) {
            if (data.res.code != 40000) {
                hint(data.res.msg);
                return;
            }
        });
        var adminPhotos = $('img[data-id=admin-photo]');
        $.each(adminPhotos, function () {
            var item = $(this);
            item.attr('src', url);
        });
    });
  /*  var socket = io.connect('${sessionScope.get("socketurl")}');
    socket.on('connect', function () {
        console.log("socket连接成功");
    });

    socket.on('feedbackevent', function (data) {
        //手机客户端提交反馈后更新反馈消息列表和数量
        unReadMsg();

        unReadOrder();
    });

    socket.on('disconnect', function () {
        console.log("socket断开连接");
    });
    var menulist = ${sessionScope.get("menulist")};
    console.log(menulist);*/



    $(function (){
        findNotAgentCount();
        findAgentCashCount();
    });


    /**
     *  未审核经纪人数量
     */
    function findNotAgentCount(){
        comment.post('/web/agent/findNotAgentCount', null, null, function (data) {
            if (data.res.code == 40000) {
                $("#not_audit_count").text(data.res.data.num);
            } else {
                hint(data.res.msg);
            }
        });
    }



    /**
     * 申请提现经纪人数量
     */
    function findAgentCashCount(){
        comment.post('/web/agentcash/findAgentCashCount', null, null, function (data) {
            if (data.res.code == 40000) {
                $("#agent_cash_count").text(data.res.data.num);
            } else {
                hint(data.res.msg);
            }
        });
    }


    <%--bindClick("#not_count", function () {--%>
        <%--var url = ${path} + "/web/agent/notaudit";--%>
        <%--window.location.href = url;--%>
    <%--})--%>

</script>

<!--定义反馈消息模板 -->
<%--<script id="msgtpl" type="text/html">
    <ul class='menu'>
        {{each res.data as obj i}}
        <li msgid="{{obj.id}}">
            <a href='#'>
                <div class='pull-left'>
                    <img src="{{imgbaseurl}}{{obj.head_pic}}" class='img-circle' alt='User Image'/>
                </div>
                <h4>{{obj.user_name}}</h4>

                <p>{{obj.feedback_detail}}</p>
            </a>
        </li>
        {{/each}}
    </ul>
</script>--%>
<!--定义订单提醒发货-->
<%--<script id="ordertpl" type="text/html">
    <ul class="menu">
        {{each res.data as obj i}}
        <li orderid="{{obj.order_id}}">
            <a href="#">
                <i class="fa fa-bell-o"></i>订单号为:{{obj.order_id}}已提醒发货
            </a>
        </li>
        {{/each}}
    </ul>
</script>--%>


</body>
</html>
