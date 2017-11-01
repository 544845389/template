<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<script src="${path}/static/houseswill/agentcash/record.js"></script>


<div>
    <s:authorize ifAllGranted="CASH_REC_CITY">
    <div class="form-inline" role="form" id="toolbar">
        城市名称:
        <select id="city_select_cash" class="form-control" onchange="changeRecordCity()" style="width: 120px">
        </select>
    </div>
    </s:authorize>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/agentcash/loadAllAgentCashRecord"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="agentName" data-width="50px">姓名</th>
            <th data-field="account" data-width="50px">电话</th>
            <th data-field="cityName" data-width="50px">所在城市</th>
            <th data-field="bank_account" data-width="50px">开户银行</th>
            <th data-field="card" data-width="100px">银行卡号</th>
            <th data-field="money" data-width="50px">提现金额</th>
            <th data-field="cashState" data-formatter="cashStateFormatter" data-width="50px">提现状态</th>
           <%-- <th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>--%>
        </tr>
        </thead>
    </table>
</div>

