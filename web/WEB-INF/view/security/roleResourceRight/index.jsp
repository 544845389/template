<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/9/9
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>

<script src="${path}/static/security/roleResourceRight/index.js"></script>

<div class="form-inline" role="form" id="toolbar">
  <button type="button"  class="btn btn-default" id="addRoleResourceRight">
    保存
  </button>
  <input type="hidden" class="glyphicon glyphicon-plus" id="roleId">
    <input type="hidden" class="glyphicon glyphicon-plus" id="resourceId">
</div>
<div class="panel-body">
  <div class="row">
    <div class="col-lg-3">
      <table id="table"
             data-toggle="table"
             data-toolbar="#toolbar"
             data-url="${path}/web/roleResourceRight/loadAllRole"
             data-height="600"
             data-side-pagination="server"
              >
        <thead>
        <tr>
          <th data-field="id">编号</th>
          <th data-field="name">角色名称</th>
          <th data-formatter="RoleResourceRight.operateFormatter" data-events="operateEvents">查看资源</th>
        </tr>
        </thead>
      </table>
    </div>
    <div class="col-lg-5">
      <table id="resourceTable"
             data-toggle="table"
             data-toolbar="#toolbar"
             data-height="600"
             data-side-pagination="server">
        <thead>
        <tr>
          <th data-field="name">资源名称</th>
          <th data-field="url">资源地址</th>
          <th data-formatter="RoleResourceRight.rightFormatter" data-events="operateEvents">操作</th>
        </tr>
        </thead>
      </table>
    </div>
      <div class="col-lg-4">
          <table id="rightTable"
                 data-toggle="table"
                 data-toolbar="#toolbar"
                 data-height="600"
                 data-side-pagination="server">
              <thead>
              <tr>
                  <th data-field="name">权限名称</th>
                  <th data-field="code">权限标识</th>
                  <th data-field="state" data-formatter="RoleResourceRight.showCheck" >选择</th>
              </tr>
              </thead>
          </table>
      </div>
  </div>
</div>

  <div id="showAllRight-div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        添加资源权限
    </div>
    <div class="box-body" id="historyDiv">
      <table id="resourceAllTable"
             data-toggle="table"
             data-height="400"
             data-side-pagination="server">
        <thead>
        <tr>
          <th data-field="state" data-checkbox="true"></th>
          <th data-field="name" data-events="operateEvents">资源名称</th>
        </tr>
        </thead>
      </table>
    </div>
    <div class="box-footer">
        <button class="btn btn-info" data-event="submit-roleResourceRight">添加</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div>
  </div>

</html>
