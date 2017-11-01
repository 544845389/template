
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>

<script src="${path}/static/security/userRole/index.js"></script>

<div class="form-inline" role="form" id="toolbar">
  <button type="button"  class="btn btn-default" id="addUserRole">
    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
    添加用户
  </button>
  <input type="hidden" class="glyphicon glyphicon-plus" id="rid">
</div>
<div>
<div class="panel-body">
  <div class="row">
    <div class="col-lg-6">
      <table id="table"
             data-toggle="table"
             data-toolbar="#toolbar"
             data-url="${path}/web/userRole/loadRoleAll"
             data-height="600"
             data-side-pagination="server"
              >
        <thead>
        <tr>
          <th data-field="id">权限编号</th>
          <th data-field="name">权限名称</th>
          <th data-formatter="UserRole.operateFormatter" data-events="operateEvents">查看用户</th>
        </tr>
        </thead>
      </table>
    </div>
    <div class="col-lg-6">
      <table id="userTable"
             data-toggle="table"
             data-toolbar="#toolbar"
             data-url="${path}/web/userRole/getUserByRoleId"
             data-height="600"
             data-side-pagination="server">
        <thead>
        <tr>
          <th data-field="aid">用户编号</th>
          <th data-field="user_name"  >用户名称</th>
          <th data-formatter="UserRole.userFormatter" data-events="operateEvents">操作</th>
        </tr>
        </thead>
      </table>
    </div>
  </div>
</div>

  <div id="showAllUser-div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        添加角色用户
    </div>
    <div class="box-body" id="historyDiv">
      <table id="userAllTable"
             data-toggle="table"
             data-height="400"
             data-side-pagination="server">
        <thead>
        <tr>
          <th data-field="state" data-checkbox="true"></th>
          <th data-field="userName" data-events="operateEvents">用户名称</th>
        </tr>
        </thead>
      </table>
    </div>
    <div class="box-footer">
        <button class="btn btn-info" data-event="submit-userRole">添加</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div>
  </div>

</div>
</html>
