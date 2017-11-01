<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<script src="${path}/static/houseswill/agentcash/index.js"></script>


<div>
    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="export_data">
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
            导出数据
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="AGENT_CASH_CITY">
        城市名称:
        <select id="city_select_cash" class="form-control" onchange="changeCashCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/agentcash/loadAllAgentCash"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="state" data-checkbox="true"></th>
            <th data-field="agentName" data-width="50px">姓名</th>
            <th data-field="account" data-width="50px">手机号</th>
            <th data-field="cityName" data-width="50px">所在城市</th>
            <th data-field="bank_account" data-width="50px">开户银行</th>
            <th data-field="card" data-width="10px">银行卡号</th>
            <th data-field="money" data-width="50px">提现金额</th>
            <th data-field="cashState" data-formatter="cashStateFormatter" data-width="50px">提现状态</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>
        </tr>
        </thead>
    </table>
</div>

