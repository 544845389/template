<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/include/taglibs.jsp"%>


<script src="${path}/static/houseswill/propertyprice/index.js"></script>




<div>
  <div class="form-inline" role="form" id="toolbar">
    <div class="form-group">
      <button type="button" class="btn btn-default" id="addPropertyPrice">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        添加楼盘价格
      </button>
    </div>
  </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/propertyprice/findAllPropertyPrice"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="false" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true" >
      <thead>
      <tr>
        <th data-field="price" data-width="100px" >价格</th>
        <th data-field="created" data-width="100px" >创建时间</th>
        <th data-formatter="Carouse.operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
      </tr>
      </thead>
    </table>
</div>


<!-- 修改 -->
<div id="modify_property_price_div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">修改价格</h3>
  </div>
  <div class="box-body">
    <form id="modifyPropertyPrice" method="post" action="/web/propertyprice/modifyPropertyPrice">
      <input type="hidden"  class="form-control" name="id"/>
      <div class="form-group">
        <label>价格:</label>
        <input type="text" id="modify_price" class="form-control" name="price"/>
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
<div id="add_property_price_div" class="slidingmenu box-model box box-info">
  <div class="box-header">
    <h3 class="box-title">添加价格</h3>
  </div>
  <div class="box-body">
    <form id="addPropertyPriceForm" method="post" action="/web/propertyprice/addPropertyPrice">
      <input type="hidden"  class="form-control" name="id"/>
      <div class="form-group">
        <label>价格:</label>
        <input type="text" id="add_price" class="form-control" name="price"/>
      </div>
    </form>
  </div>
  <div class="box-footer">
    <button class="btn btn-success" data-event="submit_add">保存</button>
    &nbsp;
    <button class="btn btn-inverse close-model">关闭</button>
  </div>
</div>




