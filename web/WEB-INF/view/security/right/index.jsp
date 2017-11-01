<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/8/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>





<script src="${path}/static/security/right/index.js"></script>

<div>
  <div class="form-inline" role="form" id="toolbar">
    <button type="button"  class="btn btn-default" id="addRight">
      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
      添加权限
    </button>
  </div>

  <table id="table"
         data-toggle="table"
         data-toolbar="#toolbar"
         data-url="${path}/web/right/rightQuery"
         data-height="600"
         data-side-pagination="server"
         data-search="true" data-show-refresh="true" data-show-toggle="true"
         data-show-columns="true" >
    <thead>
    <tr>
      <th data-field="id" data-visible="false">编号</th>
      <th data-field="rname" >菜单名称</th>
      <th data-field="code" >菜单标识</th>
      <th data-formatter="Right.operateFormatter" data-events="operateEvents">操作</th>
    </tr>
    </thead>
  </table>


  <div id="addRight-div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
      <div class="box-header">
        <h3 class="box-title">添加菜单</h3>
      </div>
      <div class="box-body">
        <form role="form" action="${path}/web/right/saveOrUpdateRight" method="post" id="rightForm">
          <input type="hidden" name="id" />
          <input type="hidden" name="superId" />
          <div class="form-group">
            <label>菜单名称:</label>
            <input type="text" class="form-control" name="name" value=""  check-type="required" required-message="菜单名称不能为空.">
          </div>
          <div class="form-group">
            <label>菜单标识:</label>
            <input type="text" class="form-control" name="code" value=""  check-type="required" required-message="菜单标识不能为空.">
          </div>
        </form>
      </div><!-- /.box-body -->
    </div>
    <div class="box-footer">
      <button class="btn btn-info" data-event="submit-save">添加</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div>
  </div>
</div>


<div id="editRight-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">编辑菜单</h3>
    </div>
    <div class="box-body">

      <form role="form" id="mergeRight" action="${path}/web/right/saveOrUpdateRight" method="post">
        <input type="hidden" id="id" value="" name="id" />
        <input type="hidden" name="superId" />
        <div class="form-group">
          <label>菜单名称:</label>
          <input type="text" class="form-control" name="name" value=""   check-type="required" required-message="菜单名称不能为空.">
        </div><!-- /.form group -->
        <div class="form-group">
          <label>菜单标识:</label>
          <input type="text" class="form-control" name="code" value=""  check-type="required" required-message="菜单标识不能为空.">
        </div>
      </form>
    </div><!-- /.box-body -->
    <div class="box-footer">
      <button class="btn btn-info" data-event="submit-merge" >保存</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div>

  </div>
</div>
