<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/8/20
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>

<style type="text/css">
  .tab-selected {
    color:#eb8f00;
  }
</style>

<script src="${path}/static/security/resource/index.js"></script>

<div>

  <div class="panel-body">
    <div class="row">
      <div class="col-lg-8">
        <div class="form-inline" role="form" id="toolbar">
          <div class="form-group">
            <button type="button"  class="btn btn-default" id="addResource">
              <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
              添加资源
            </button>
          </div>
          &nbsp;&nbsp;
          <input type="hidden"  id="sid"/>
          <div class="form-group" id="path">
            <span class="path" data-id="0" onclick="clearPathClick(0)">首页:&nbsp;&nbsp;</span>
          </div>
        </div>
        <table id="table"
               data-toggle="table"
               data-toolbar="#toolbar"
               data-url="${path}/web/resource/resourceQuery"
               data-height="600"
               data-side-pagination="server"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true" >
          <thead>
          <tr>
            <th data-field="id" data-visible="false">编号</th>
            <th data-field="name" data-formatter="Resource.nameFormatter" data-events="operateEvents">资源名称</th>
            <th data-formatter="Resource.iconFormatter">资源图标</th>
            <th data-field="url" >资源地址</th>
            <th data-field="code" >资源code</th>
            <th data-formatter="Resource.orderNum">排序</th>
            <th data-formatter="Resource.operateFormatter" data-events="operateEvents">操作</th>
          </tr>
          </thead>
        </table>
      </div>
      <div class="col-lg-4">
        <div class="form-inline" role="form" id="toolbar2">
          <h4 id="right-title">全局功能权限</h4>
          <input type="hidden"   value="0" id="rightId">
          <button type="button"  class="btn btn-default" id="addRight">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加功能
          </button>
        </div>
        <table id="rightTable"
               data-toggle="table"
               data-toolbar="#toolbar2"
               data-url="${path}/web/resource/findResourceRight?id="
               data-height="600"
               data-side-pagination="server">
          <thead>
          <tr>
            <th data-field="name">功能名称</th>
            <th data-field="code" >功能code</th>
            <th data-formatter="Resource.rightOperateFormatter" data-events="operateEvents">操作</th>
          </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>


  <div id="showOrderNum-div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
      <div class="box-header">
        <h3 class="box-title">修改排名顺序</h3>
      </div>
      <div class="box-body">
        <form role="form" action="/web/resource/mergeOrderNum" method="post" id="mergeOrderNum">
          <div class="form-group">
            <input type="hidden" class="form-control required" id="pid" name="id" value="">
            <input type="text" class="form-control required" id="orderNum" name="orderNum" value="">
          </div>
        </form>
        <div class="box-footer">
          <button class="btn btn-info" data-event="merge-orderNum">保存</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
        </div>
      </div><!-- /.box-body -->

    </div>
  </div>

  <div id="addResource-div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
      <div class="box-header">
        <h3 class="box-title">添加资源</h3>
      </div>
      <div class="box-body">
        <form role="form" action="${path}/web/resource/saveOrUpdateResource" method="post" id="resourceForm">
          <input type="hidden" name="id" />
          <input type="hidden" name="rightId" />
          <input type="hidden" name="superId" />
          <div class="form-group">
            <label>资源名称:</label>
            <input type="text" id="resource_name" class="form-control" name="name" value="" check-type="required" required-message="资源名称不能为空"  >
          </div>
          <div class="form-group">
            <label>资源地址:</label>
            <input type="text" id="resource_address" class="form-control" name="url" value="" check-type="required" required-message="资源地址不能为空" >
          </div><!-- /.form group -->
          <div class="form-group">
            <label>资源CODE:</label>
            <input type="text" id="resource_code" class="form-control" name="code" value="" check-type="required" required-message="资源地址不能为空" >
          </div><!-- /.form group -->
          <div class="form-group">
            <label>图标:</label>
            <i data-event="icon" class="fa fa-circle-o" style="font-size: 18px;margin-top: 10px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="icon" value="fa fa-circle-o" type="hidden" />
            <span onclick="showIcon()" style="cursor: pointer">选择</span>
          </div><!-- /.form group -->
        </form>
        <button class="btn btn-info" data-event="submit-save">添加</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
      </div><!-- /.box-body -->
    </div>
  </div>
</div>


<div id="editResource-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">编辑资源</h3>
    </div>
    <div class="box-body">

      <form role="form" id="mergeResource" action="${path}/web/resource/saveOrUpdateResource" method="post">
        <input type="hidden" id="id" value="" name="id" />
        <input type="hidden" name="superId" />
        <div class="form-group">
          <label>资源名称:</label>
          <input type="text" class="form-control" id="modify_name"  name="name" value=""   />
        </div><!-- /.form group -->
        <div class="form-group">
          <label>资源地址:</label>
          <input type="text" class="form-control" id="modify_address"  name="url" value=""  >
        </div><!-- /.form group -->
        <div class="form-group">
          <label>资源CODE:</label>
          <input type="text" class="form-control" id="modify_code"  name="code" value=""  >
        </div><!-- /.form group -->
        <div class="form-group">
          <label>图标:</label>
          <i data-event="icon" class="fa fa-circle-o" style="font-size: 18px;margin-top: 10px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="icon" type="hidden" value="fa fa-circle-o" />
          <span onclick="showIcon()" style="cursor: pointer">选择</span>
        </div><!-- /.form group -->
      </form>
      <button class="btn btn-info" data-event="submit-merge" >保存</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div><!-- /.box-body -->
  </div>
</div>



<div id="addRight-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">添加功能</h3>
    </div>
    <div class="box-body">
      <form role="form" action="${path}/web/resource/saveOrUpdateResource" method="post" id="rightForm">
        <input type="hidden" name="id" />
        <input type="hidden" name="type" value="1"/>
        <input type="hidden" name="superId" />
        <div class="form-group">
          <label>功能名称:</label>
          <input type="text" id="right_name" class="form-control" name="name" value="" check-type="required" required-message="资源名称不能为空"  >
        </div>
        <div class="form-group">
          <label>资源CODE:</label>
          <input type="text" id="right_code" class="form-control" name="code" value="" check-type="required" required-message="资源地址不能为空" >
        </div><!-- /.form group -->
        <div class="form-group">
          <label>功能地址:</label>
          <input type="text" id="right_address" class="form-control" name="url" value="" check-type="required" required-message="资源地址不能为空" >
        </div><!-- /.form group -->
      </form>
      <button class="btn btn-info" data-event="right-submit-save">添加</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div><!-- /.box-body -->
  </div>
</div>
</div>


<div id="editRight-div" class="slidingmenu box-model box box-info">
  <div class="box box-info">
    <div class="box-header">
      <h3 class="box-title">编辑功能</h3>
    </div>
    <div class="box-body">
      <form role="form" id="mergeRight" action="${path}/web/resource/saveOrUpdateResource" method="post">
        <input type="hidden" id="r_id" value="" name="id" />
        <input type="hidden" name="superId" />
        <input type="hidden" name="type" value="1"/>
        <div class="form-group">
          <label>功能名称:</label>
          <input type="text" class="form-control" id="modify_right_name"  name="name" value=""   />
        </div><!-- /.form group -->
        <div class="form-group">
          <label>资源CODE:</label>
          <input type="text" class="form-control" id="modify_right_code"  name="code" value=""  >
        </div><!-- /.form group -->
        <div class="form-group">
          <label>功能地址:</label>
          <input type="text" class="form-control" id="modify_right_address"  name="url" value=""  >
        </div><!-- /.form group -->
      </form>
      <button class="btn btn-info" data-event="right-submit-merge" >保存</button>&nbsp;<button class="btn btn-danger close-model">关闭</button>
    </div><!-- /.box-body -->
  </div>
</div>
