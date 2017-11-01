<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<script src="${path}/static/houseswill/agent/index.js"></script>


<div>

    <div class="form-inline" role="form" id="toolbar">
        <s:authorize ifAllGranted="AGENT_CITY">
        城市名称:
        <select id="city_select" class="form-control" onchange="changCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/agent/loadAllAgents"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="propertyName" data-formatter="agentPictureFormatter" data-width="50px">头像</th>
            <th data-field="certifiedName" data-formatter="agentNameFormatter"  data-width="50px" >姓名</th>
            <th data-field="account" data-width="50px">手机号</th>
            <th data-field="cityName" data-formatter="cityFormatter" data-width="50px">所在城市</th>
            <th data-field="managerName" data-formatter="managerFormatter" data-width="50px">所属服务经理</th>
            <th data-field="state" data-formatter="stateFormatter" data-width="50px" >认证状态</th>
            <th data-field="states" data-formatter="statesFormatter" data-width="50px" >禁用状态</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>
        </tr>
        </thead>
    </table>
</div>


<%--更换服务经理框--%>
<div id="transfer_service_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">服务经理列表</h3>
    </div>
    <div class="box-body">
        <input type="hidden" class="form-control" id="agentId" />
        <input type="hidden" class="form-control" id="cityId" />
        <s:authorize ifAllGranted="AGENT_CITY">
        <div class="form-inline" role="form" id="toolbar_service" >
            <div>
                <label>城市名称:</label>
                <select id="add_city_service" class="form-control" onchange="changeServiceCities()" style="width: 120px;" >
                </select>
            </div>
        </div>
        </s:authorize>
        <table id="service_table"
               data-toggle="table"
               data-toolbar="#toolbar_service"
               data-url="${path}/web/servicemanager/loadAllServiceManagers"
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">
            <thead>
            <tr>
                <th data-field="name"  data-width="100px" >姓名</th>
                <th data-field="cityName"  data-width="100px" >所有城市</th>
                <th data-field="created" data-width="100px" >创建时间</th>
                <th data-formatter="addOperateFormatter" data-events="addOperateEvents" data-width="100px">操作</th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="box-footer">
        <%--<button class="btn btn-info" data-event="submit-Advert">保存</button>--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>
