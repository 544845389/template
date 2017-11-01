<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<!-- Bootstrap 3.3.4 -->
<link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


<!-- bootstrap table-->
<link href="${path}/static/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>
<script src='${path}/static/plugins/bootstrap-table/bootstrap-table.js'></script>


<%--<script>--%>

    <%--(function ($) {--%>
        <%--'use strict';--%>
        <%--$.fn.bootstrapTable.locales['zh-CN'] = {--%>
            <%--formatLoadingMessage: function () {--%>
                <%--alert("11");--%>
                <%--return '正在努力地加载数据中，请稍候……';--%>
            <%--},--%>
            <%--formatRecordsPerPage: function (pageNumber) {--%>
                <%--return '每页显示 ' + pageNumber + ' 条记录';--%>
            <%--},--%>
            <%--formatShowingRows: function (pageFrom, pageTo, totalRows) {--%>
                <%--return '显示第 ' + pageFrom + ' 到第 ' + pageTo + ' 条记录，总共 ' + totalRows + ' 条记录';--%>
            <%--},--%>
            <%--formatSearch: function () {--%>
                <%--return '搜索';--%>
            <%--},--%>
            <%--formatNoMatches: function () {--%>
                <%--return '没有找到匹配的记录';--%>
            <%--},--%>
            <%--formatPaginationSwitch: function () {--%>
                <%--return '隐藏/显示分页';--%>
            <%--},--%>
            <%--formatRefresh: function () {--%>
                <%--return '刷新';--%>
            <%--},--%>
            <%--formatToggle: function () {--%>
                <%--return '切换';--%>
            <%--},--%>
            <%--formatColumns: function () {--%>
                <%--return '列';--%>
            <%--}--%>
        <%--};--%>
        <%--$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);--%>
    <%--})(jQuery);--%>

<%--</script>--%>


<script src="${path}/static/houseswill/agent/audit.js"></script>

<div id="addMajor" >
    <%--<div class="box-header">--%>
        <%--<h3 class="box-title">服务经理列表</h3>--%>
    <%--</div>--%>
    <%--<div class="box-body">--%>
        <s:authorize ifAllGranted="MANAGER_CITY">
        <div class="form-inline" role="form" id="toolbar_service">
            <div>
                <label>城市名称:</label>
                <select id="city_service" class="form-control" onchange="changeManagerCities()" style="width: 120px;" >
                </select>
            </div>
        </div>
        </s:authorize>
        <input type="hidden" class="form-control" id="agentId" value="${agentId}"/>
        <input type="hidden" class="form-control" id="cityId" value="${cityId}"/>
        <table id="service_manager_table"
               data-toggle="table"
               data-toolbar="#toolbar_service"
               data-url="${path}/web/servicemanager/loadAllServiceManagers"
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="false">
            <thead>
            <tr>
                <th data-field="name"  data-width="100px" >姓名</th>
                <th data-field="cityName"  data-width="100px" >所有城市</th>
                <th data-field="created" data-width="100px" >创建时间</th>
                <th data-formatter="addManagerOperateFormatter" data-events="addManagerOperateEvents" data-width="100px">操作</th>
            </tr>
            </thead>
        </table>
    <%--</div>--%>
    <%--<div class="box-footer">--%>
        <%--&lt;%&ndash;<button class="btn btn-info" data-event="submit-Advert">保存</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-inverse close-model">关闭</button>&ndash;%&gt;--%>
    <%--</div>--%>
</div>


<%--<script src="${path}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>
<%--<link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>

<%--<!-- bootstrap table-->--%>
<%--<link href="${path}/static/plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css"/>--%>
<%--<script src='${path}/static/plugins/bootstrap-table/bootstrap-table.js'></script>--%>
<%--&lt;%&ndash;<script src='${path}/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js'></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="${path}/static/jquery/jquery.base64.js"></script>&ndash;%&gt;--%>

<%--<script src="${path}/static/houseswill/agent/aa.js"></script>--%>
<%--&lt;%&ndash;<!-- animatedModal --->&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="${path}/static/plugins/animatedModal/js/animatedModal.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="${path}/static/plugins/animatedModal/js/index.js"></script>&ndash;%&gt;--%>

<%--<!-- bootstrap3Validation --->--%>
<%--<script type="text/javascript" src="${path}/static/validation/bootstrap3-validation.js"></script>--%>
<%--<script src="${path}/static/validation/respond.min.js" type="text/javascript"></script>--%>
<%--<script src="${path}/static/validation/html5.js" type="text/javascript"></script>--%>
