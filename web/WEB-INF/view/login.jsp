<%--
  Created by IntelliJ IDEA.
  User: yuliang
  Date: 2015/8/24
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/include/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="login">
    <style>
        #logo{
            background-image: url("${path}/static/images/login.png");
        }
    </style>
</head>

<body class="login-page">
    <div class="login-box">
    <%--<div class="login-logo">--%>
        <%--<a><b>惠售房</b>管理平台</a>--%>
    <%--</div>--%>
    <!-- /.login-logo -->
    <%--<div class="login-box-body" >--%>
        <div id="logo" style="width: 405px;height: 335px;padding: 0px 70px 0px 50px;">
        <%--<p class="login-box-msg"></p>--%>
            <div>
                <div class="row" style="padding-bottom: 30px;">
                    <div class="col-md-3">
                        <img src="${path}/static/images/logo.png" style="margin-top: 20px;" />
                    </div>
                    <div class="col-md-9" style="padding-top: 25px;">
                        <label style="font-size: 28px;color: white">惠售房管理平台</label>
                    </div>
                </div>
                <form action="${path}/j_spring_security_check" method="post">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" name="j_username" placeholder="请输入用户名..."/>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" name="j_password" placeholder="请输入密码..."/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-xs-8">
                                <input type="text" value="" class="form-control" name="code" placeholder="请输入验证码..."/>
                            </div>
                            <div class="col-lg-4 col-md-4 col-xs-4">
                                <img src="${path}/static/images/commons/code.jsp" title="点击更换图片" alt="点击更换图片" id="code"
                                     onclick="changeImg()"  style="height: 34px;">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox" value="1" name="remember">&nbsp;记住密码
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <!-- /.login-box-body -->

<!-- /.login-box -->


<script>
    $(function () {
        var j_username= $.cookie('j_username');
        var j_password= $.cookie('j_password');

        var remember = $("input[name=remember]");
        var username = $('input[name=j_username]');
        var password = $('input[name=j_password]');

        if(j_username!=null&&j_password!=null){
            remember.attr("checked",true);
            username.val(j_username);
            password.val(j_password);
        }else{
            remember.attr("checked",false);

        }
        var msg = '${msg}';
        if(msg!=''){
            hint(msg);
        }
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    function changeImg(){
        $("#code").attr("src", "${path}/static/images/commons/code.jsp?t="+new Date().getTime());
    }
</script>
</body>
</html>

