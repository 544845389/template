<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/9/17
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${path}/static/security/index/index.js"></script>
<%--<!DOCTYPE html>--%>
<!-- saved from url=(0030)http://www.bootstrapicons.com/ -->
    <div class="box box-info">
        <div class="box-body">
            <form role="form" action="${path}/web/admin/mergePwd" method="post" id="mergeform">
                <input type="hidden" name="id" value="${id}" />
                <div class="form-group">
                    <label>原密码:</label>
                    <span style="color: #ff9966">*</span>
                    <input class="form-control" name="pwd"  check-type="required" required-message="原密码不能为空."/>
                </div>
                <div class="form-group">
                    <label>新密码:</label>
                    <span style="color: #ff9966">*</span>
                    <input class="form-control" id="nPwd" name="nPwd" check-type="required" required-message="新密码不能为空."/>
                </div>
                <div class="form-group">
                    <label>确认密码:</label>
                    <span style="color: #ff9966">*</span>
                    <input onmouseout="load()" id="nPwds" class="form-control" name="password" check-type="required" required-message="确认密码不能为空."/>
                </div>
            </form>
        </div>
    </div>
