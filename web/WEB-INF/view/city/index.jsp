<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<%--<script src="${path}/static/plugins/bootstrap-table/bootstrap-table.js"></script>--%>
<script src="${path}/static/houseswill/city/index.js"></script>

<div>
    <div class="form-inline" role="form" id="toolbar">
        <div class="form-group">
            <button type="button" class="btn btn-default" id="addCity">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;添加城市
            </button>
        </div>
        &nbsp;&nbsp;
        <input type="hidden" class="form-control" id="sid"/>
        <input type="hidden" class="form-control" name="tag_series" value=""/>
        <div class="form-group" id="path">
            <span class="path" data-id="0" onclick="clearPathClick(0)">首页:&nbsp;&nbsp;</span>
        </div>
    </div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/city/findAllCities"
           data-height="400"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="name" data-formatter="nameFormatter" data-events="operateEvents" data-width="100px">名称</th>
            <th data-field="created" data-events="operateEvents" data-width="100px">创建时间</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>


</div>

<!--修改城市 -->
<div id="editCity-div" class="slidingmenu box-model box box-info">
    <%--<div class="box box-info">--%>
        <div class="box-header">
            <h3 id="edit_title" class="box-title"></h3>
        </div>
        <div class="box-body">
            <form role="form" id="mergeForm" action="${path}/web/city/modifyOneCity" method="post">
                <div class="form-group">
                    <input type="hidden" name="id"/>
                    <label id="edit_label"></label>
                    <input type="text" id="edit_city" class="form-control" name="name" value="" >
                </div><!-- /.form group check-type="required"
                required-message="城市名称不能为空."-->
            </form>
        </div><!-- /.box-body -->
        <div class="box-footer">
            <button class="btn btn-success" data-event="submit-merge">保存</button>
            &nbsp;
            <button class="btn btn-inverse close-model">关闭</button>
        </div>
    <%--</div>--%>
</div>




<!--添加城市 -->
<div id="addCity-div" class="slidingmenu box-model box box-info">
   <%-- <div class="box box-info">--%>
        <div class="box-header">
            <h3 id="update_title" class="box-title"></h3>
        </div>
        <div class="box-body">
            <form role="form" action="${path}/web/city/addOneCity" method="post" id="city_form">
                <input type="hidden" id="AddSuperId" class="form-control" name="superId" value=""/>
                <input type="hidden" id="addSeries" class="form-control" name="series" value=""/>
                <div class="form-group">
                    <label id="label_title"></label>
                    <input type="text" id="addName" class="form-control" name="name" value="" placeholder="请输入名称(限中文)" />
                </div><!-- /.form group -->
            </form>
        </div><!-- /.box-body -->
        <div class="box-footer">
            <button class="btn btn-success" data-event="submit-city">保存</button>
            &nbsp;
            <button class="btn btn-inverse close-model">关闭</button>
        </div>
   <%-- </div>--%>
</div>

