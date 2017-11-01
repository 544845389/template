<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>


<script src="${path}/static/houseswill/appversion/index.js"></script>
<div>
  <%--<div class="form-inline" role="form" id="toolbar">--%>
    <%--<div class="form-group">--%>
      <%--<button type="button" class="btn btn-default" id="btnAddAppVersion">--%>
        <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>--%>
        <%--添加App版本--%>
      <%--</button>--%>
    <%--</div>--%>
  <%--</div>--%>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/appversion/findAllAppVersion"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="false" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true" >
      <thead>
      <tr>
        <%--<th data-field="id" data-width="50px">编号</th>--%>
        <th data-field="version" data-width="100px" >版本名称</th>
        <th data-field="platform" data-formatter="Carouse.showPlatform" data-width="100px" >平台</th>
        <th data-field="isImposed" data-formatter="Carouse.showCashState" data-width="100px" >是否强制更新</th>
        <th data-field="detail" data-width="100px" >详情说明</th>
        <th data-field="linkAddress" data-width="300px" >下载地址</th>
        <%--<th data-field="created" >创建时间</th>--%>
        <th data-formatter="Carouse.operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
      </tr>
      </thead>
    </table>
</div>


<!-- 修改 -->
<div id="modify_app_div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">修改App版本</h3>
  </div>
  <div class="box-body">
    <form id="modifyAppVersion" method="post" action="/web/appversion/modifyAppVersion">
      <input type="hidden"  class="form-control" name="id"/>
      <div class="form-group">
        <label>版本名称:</label>
        <input type="text" id="modify_version" class="form-control" name="version"/>
      </div>
      <div class="form-group">
        <label>平台:</label>
        <input type="text" id="modify_platform" class="form-control"  readonly="readonly" />
      </div>
      <div class="form-group">
        <label>详情说明:</label>
        <input type="text" id="modify_detail" class="form-control" name="detail" />
      </div>
      <div class="form-group">
        <label>下载地址:</label>
        <input type="text" id="modify_link" class="form-control" name="linkAddress" />
      </div>
      <div class="form-group">
        <label>是否强制更新:</label>
        <input type="hidden" id="is_imposed" class="form-control" name="isImposed"/>
        <select class="form-control" id="modify_imposed" >
        </select>
      </div>
    </form>
  </div>
  <div class="box-footer">
    <button class="btn btn-success" data-event="submit_modify">保存</button>
    &nbsp;
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>







<!-- 添加 -->
<div id="AddAppShare-div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">添加App版本</h3>
  </div>
  <div class="box-body">
    <form id="AddAppShareFrom" method="post" action="/web/appversion/saveAppVersion">
      <input type="hidden"  class="form-control" name="id"  >
      <div class="form-group">
        <label>版本名称:</label>
        <input type="text" id="add_version" class="form-control" name="version" />
      </div>
      <div class="form-group">
        <label>平台:</label>
        <select class="form-control" id="add_platform" name ="platform">
          <option value="1" selected="selected">Android</option>'
          <option value="2" >iOS</option>'
        </select>
      </div>
      <div class="form-group">
        <label>是否强制更新:</label>
        <select class="form-control" id="add_is_imposed" name ="isImposed">
          <option value="0" selected="selected">否</option>
          <option value="1" >是</option>
        </select>
      </div>
      <div class="form-group">
        <label>详情说明:</label>
        <textarea id="add_detail" class="form-control" name="detail" style="height: 100px; resize: none"></textarea>
      </div>
      <div class="form-group">
        <label>下载地址:</label>
        <input type="text" id="add_download_link" class="form-control" name="downloadLink" />
      </div>
    </form>
  </div>
  <div class="box-footer">
    <button class="btn btn-success" data-event="submit_add_app">保存</button>
    &nbsp;
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>








