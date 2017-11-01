<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/8/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>





<script src="${path}/static/security/role/index.js"></script>

<div>
  <div class="form-inline" role="form" id="toolbar">
    <button type="button"  class="btn btn-default" id="addRole">
      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
      添加角色
    </button>
  </div>

  <table id="table"
         data-toggle="table"
         data-toolbar="#toolbar"
         data-url="${path}/web/role/roleQuery"
         data-height="400"
         data-side-pagination="server"
         data-pagination="true"
         data-page-list="[5, 10, 20, 50, 100, 200]"
         data-search="true" data-show-refresh="true" data-show-toggle="true"
         data-show-columns="true" >
    <thead>
    <tr>
      <th data-field="id">编号</th>
      <th data-field="name" >角色名称</th>
      <th data-formatter="Role.operateFormatter" data-events="operateEvents">操作</th>
    </tr>
    </thead>
  </table>


  <div id="addRole-div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
      <div class="box-header">
        <h3 class="box-title">添加角色</h3>
      </div>
      <div class="box-body">
        <form role="form" action="${path}/web/role/saveOrUpdateRole" method="post" id="roleForm">
          <input type="text"  style="display:none"/>
          <input type="hidden" name="id" />
          <input type="hidden" name="superId" />
          <div class="form-group">
            <label>角色名称:</label>
            <input type="text" id="role_name" class="form-control" name="name" value=""  />
          </div>
        </form>
        <button class="btn btn-info" data-event="submit-save">添加</button>
        &nbsp;
        <button class="btn btn-danger close-model">关闭</button>
      </div><!-- /.box-body -->
    </div>
  </div>
</div>


<div id="editRole-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">编辑角色</h3>
    </div>
    <div class="box-body">

      <form role="form" id="mergeRole" action="${path}/web/role/saveOrUpdateRole" method="post" >
        <input type="hidden" id="id" value="" name="id" />
        <input type="hidden" name="superId" />
        <div class="form-group">
          <label>角色名:</label>
          <input type="text" id="modify_name"  class="form-control" name="name" value="" />
        </div><!-- /.form group -->
      </form>
      <button class="btn btn-info" data-event="submit-merge" >保存</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div><!-- /.box-body -->
  </div>
</div>


