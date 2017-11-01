<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/8/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>





<script src="${path}/static/security/admin/index.js"></script>

<div>
  <div class="form-inline" role="form" id="toolbar">
    <input id="admin" type="hidden" value="<%=request.getSession().getAttribute("super") %>" />
    <button type="button"  class="btn btn-default" id="addAdmin">
      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
      添加用户
    </button>
  </div>

  <table id="table"
         data-toggle="table"
         data-toolbar="#toolbar"
         data-url="${path}/web/admin/adminQuery"
         data-height="400"
         data-side-pagination="server"
         data-pagination="true"
         data-page-list="[5, 10, 20, 50, 100, 200]"
         data-search="true" data-show-refresh="true" data-show-toggle="true"
         data-show-columns="true" >
    <thead>
    <tr>
     <%-- <th data-field="id">编号</th>--%>
      <th data-field="userName" >用户名称</th>
      <th data-field="linkman" >所属城市</th>
      <th data-field="enable" data-formatter="Admin.showEnable" >状态</th>
      <th data-formatter="Admin.operateFormatter" data-events="operateEvents">操作</th>
    </tr>
    </thead>
  </table>


  <div id="addAdmin-div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
      <div class="box-header">
        <h3 class="box-title">添加管理员</h3>
      </div>
      <div class="box-body">
        <form role="form" action="${path}/web/admin/saveOrUpdateAdmin" method="post" id="adminForm">
          <input type="hidden" name="id" />
          <div class="form-group">
            <label>用户名称:</label>
            <input type="text" id="admin_name" class="form-control" name="name" value=""  >
          </div>
          <div class="form-group">
            <label>用户密码:</label>
            <input type="text" id="admin_pwd" class="form-control" name="pwd" value=""  >
          </div>
          <div class="form-group">
            <input type="hidden" id="city_id" name="cityId" />
            <input type="hidden" id="city_name" name="linkman" />
            <label >城市名称:</label>
            <select  class="form-control" id="add_city_admin">
            </select>
          </div>
          <button class="btn btn-success" data-event="submit-admin">添加</button>
          &nbsp;
          <button class="btn btn-inverse close-model">关闭</button>
        </form>
      </div><!-- /.box-body -->
    </div>
  </div>
</div>


<div id="editAdmin-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">编辑管理员</h3>
    </div>
    <div class="box-body">
      <form role="form" id="mergeAdmin" action="${path}/web/admin/saveOrUpdateAdmin" method="post">
        <input type="hidden" id="id" value="" name="id" />
        <div class="form-group">
          <label>用户名:</label>
          <input type="text" id="modify_admin" class="form-control" name="name" value=""   />
        </div><!-- /.form group -->
        <div class="form-group">
          <label>密码:</label>
          <input type="text" id="modify_admin_pwd" class="form-control" name="pwd" value=""  />
        </div><!-- /.form group -->
        <div id="mergeCity" class="form-group">
        </div>
        <div class="form-group">
          <label id="citySelectTest">所属城市:</label>
          <select id="modify_city_admin" name="cityId" class="form-control"  >
          </select>
        </div><!-- /.form group -->
        <input type="hidden" id="modify_city_id" name="cityId" />
        <input type="hidden" id="modify_city_name" name="linkman" />
      </form>
      <button class="btn btn-success" data-event="submit-merge" >保存</button>
      &nbsp;
      <button class="btn btn-inverse close-model">关闭</button>
    </div><!-- /.box-body -->


  </div>
</div>
