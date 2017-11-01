<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>


<script src="${path}/static/houseswill/systemparams/index.js"></script>


<div>
    <div class="form-inline" role="form" id="toolbar">
        <div class="form-group">
            <button type="button" class="btn btn-default" id="btnAddSystemParameter">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加系统参数
            </button>
        </div>
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/systemparams/findAllSystemParams"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="name" data-width="100px">名称</th>
            <th data-field="code" data-width="100px">标识</th>
            <th data-field="value" data-width="100px">值</th>
            <th data-field="remark" data-formatter="remarkFormatter" data-width="100px">备注</th>
            <th data-formatter="Carouse.operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>
</div>

<!-- 修改 -->
<div id="UpDetail-div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">修改系统参数</h3>
    </div>
    <div class="box-body">
        <form id="modifySystemParameter" method="post" action="/web/systemparams/modifySystemParams">
            <input type="hidden" class="form-control" name="id">
            <div class="form-group">
                <label>名称:</label>
                <input type="text" id="name" class="form-control" name="name"/>
            </div>
            <div class="form-group">
                <label>标识:</label>
                <input type="text" id="type" class="form-control" name="code"/>
            </div>
            <div class="form-group">
                <label>值:</label>
                <input type="text" id="value" class="form-control" name="value"/>
            </div>
            <div class="form-group">
                <label>备注:</label>
                <input type="text" id="remark" class="form-control" name="remark"/>
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
<div id="AddSystemParameter-div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">添加系统参数</h3>
    </div>
    <div class="box-body">
        <form id="AddSystemParameterFrom" method="post" action="/web/systemparams/addSystemParams">
            <input type="hidden" class="form-control" name="id">
            <div class="form-group">
                <label>名称:</label>
                <input type="text" id="AddName" class="form-control" name="name" placeholder="请输入名称" />
            </div>
            <div class="form-group">
                <label>标识:</label>
                <input type="text" id="AddType" class="form-control" name="code" placeholder="请输入标识类型"/>
            </div>
            <div class="form-group">
                <label>值:</label>
                <input type="text" id="AddValue" class="form-control" name="value" placeholder="请输入值(非零正整数)"/>
            </div>
            <div class="form-group">
                <label>备注:</label>
                <input type="text" id="AddRemark" class="form-control" name="remark" placeholder="请输入备注"/>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_save">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>


<%--</div>--%>










