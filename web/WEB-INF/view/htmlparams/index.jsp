<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/10/19
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>


<script src="${path}/static/houseswill/htmlparams/index.js"></script>

<div class="form-inline" role="form" id="toolbar">

  <div class="form-group">
    <button type="button" class="btn btn-default" id="btnAddHtmlParam">
      <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
      添加网页参数
    </button>
  </div>
</div>

  <table id="table"
         data-toggle="table"
         data-toolbar="#toolbar"
         data-url="${path}/web/htmlparams/findAllHtmlParams"
         data-height="750"
         data-side-pagination="server"
         data-pagination="true"
         data-page-list="[5, 10, 20, 50, 100, 200]"
         data-search="true" data-show-refresh="true" data-show-toggle="true"
         data-show-columns="true" >
    <thead>
    <tr>
      <th data-field="name" data-width="100px" >名称</th>
      <th data-field="code" data-width="100px">标识</th>
      <th data-field="created" data-width="100px" >创建时间</th>
      <th data-formatter="Carouse.operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
    </tr>
    </thead>
  </table>


<!--详情 -->
<div id="showDetail-div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">网页参数详情</h3>
  </div>
    <div class="box-body">
      <form id="Detail">
        <div class="form-group">
          <label>名称:</label>
          <input type="text" class="form-control" name="name" readonly="readonly"/>
        </div>
        <div class="form-group">
          <label>标识:</label>
          <input type="text" class="form-control" name="code" readonly="readonly"/>
        </div>
        <div class="form-group">
          <label>创建时间:</label>
          <input type="text" class="form-control" name="created" readonly="readonly"/>
        </div>
      <div>
      <div class="form-group">
          <label>内容:</label>
          <textarea name="content" hidden="hidden" ></textarea>
          <script class="editor" id="editor" type="text/plain"
                  style="width:100%;height:300px;"></script>
      </div>
      </div>
      </form>
    </div>
  <div class="box-footer">
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>
</div>



<!-- 修改 -->
<div id="UpDetail-div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">修改网页参数</h3>
  </div>
  <div class="box-body">
    <form id="modifyHtmlParam" method="post" action="/web/htmlparams/modifyHtmlParams">
      <input type="hidden"  class="form-control" name="id"  >
      <div class="form-group">
        <label>名称:</label>
        <input type="text" id="name" class="form-control" name="name"  >
      </div>

      <div class="form-group">
        <label>标识:</label>
        <input type="text" id="code" class="form-control" name="code"  >
      </div>

      <div class="form-group">
        <label>内容:</label>
        <textarea id="UpContent" name="content" hidden="hidden" ></textarea>
        <script class="editor" id="Upeditor" type="text/plain"
                style="width:100%;height:300px;"></script>
      </div>
    </form>
  </div>
  <div class="box-footer">
    <button class="btn btn-success" data-event="submit-save">保存</button>
    &nbsp;
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>
</div>


<!-- 添加 -->
<div id="AddCarousel-div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">添加网页参数</h3>
  </div>
  <div class="box-body">
    <form id="AddCarouselFrom" method="post" action="/web/htmlparams/addHtmlParams" >
      <input type="hidden"  class="form-control" name="id"  />
      <div class="form-group">
        <label>名称:</label>
        <input type="text" id="AddName" class="form-control" name="name" />
      </div>
      <div class="form-group">
        <label>标识:</label>
        <input type="text" id="AddCode" class="form-control" name="code" />
      </div>
      <div class="form-group">
        <label>内容:</label>
        <textarea id="AddContent" name="content" hidden="hidden" ></textarea>
        <script class="editor" id="Addeditor" type="text/plain"
                style="width:100%;height:300px;"></script>
      </div>
    </form>
  </div>
  <div class="box-footer">
    <button class="btn btn-success" data-event="submit">保存</button>
    &nbsp;
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>
</div>



<script>

  var editor = UE.getEditor('editor');

  var Addeditor = UE.getEditor('Addeditor');

  var Upeditor = UE.getEditor('Upeditor');

</script>











