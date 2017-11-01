<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<script src="${path}/static/houseswill/agent/audit.js"></script>


<div>
    <s:authorize ifAllGranted="NOT_AUDIT_CITY">
    <div class="form-inline" role="form" id="toolbar_audit">
        城市名称:
        <select id="city_select_audit" class="form-control" onchange="changAuditCity()" style="width: 120px">
        </select>
    </div>
    </s:authorize>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar_audit"
           data-url="${path}/web/agent/loadNotAuditAgents"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="propertyName" data-formatter="agentPictureFormatter" data-width="50px">头像</th>
            <th data-field="certifiedName"  data-width="50px" >姓名</th>
            <th data-field="account" data-width="50px">手机号</th>
            <th data-field="certifiedStore" data-width="50px">项目门店</th>
            <th data-field="cityName" data-width="50px">所在城市</th>
            <th data-field="state" data-formatter="stateFormatter" data-width="50px" >认证状态</th>
           <%-- <th data-field="states" data-formatter="statesFormatter" data-width="50px" >禁用状态</th>--%>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>
        </tr>
        </thead>
    </table>
</div>



<%--经纪人提交认证信息--%>
<div id="check_agent_div" class="slidingmenu box-model box box-info" >
    <div class="box-header">
        <h3 class="box-title">认证信息列表</h3>
    </div>
    <div class="box-body">
        <form role="form" id="checkAgentForm" action="" method="post">
            <input type="hidden" id="agent_id" class="form-control"  name="id"  />
            <input type="hidden" id="city_id" class="form-control"  name="cityId"  />
            <div class="col-md-12">
                    <div>
                        <label>姓名:</label>
                        <input type="text" class="form-control"  name="certifiedName" readonly  />
                    </div>
            </div>
            <div style="visibility: hidden">
                    <label></label>
            </div>
            <div class="col-md-12">
                <div>
                    <label>城市:</label>
                    <input type="text" class="form-control"  id="sex" name="cityName" readonly />
                </div>
            </div>
            <div style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-12">
                <div>
                    <label>项目门店:</label>
                    <input type="text" class="form-control"  name="certifiedStore" readonly />
                </div>
            </div>
            <div style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-12">
                <div>
                    <label>门店地址:</label>
                    <input type="text" class="form-control"  name="certifiedAddress" readonly />
                </div>
            </div>
            <div style="visibility: hidden">
                <label></label>
            </div>
            <div class="col-md-6">
                <div>
                    <label>名片:</label>
                    <div>
                        <img id="certifiedBusinessCard"  alt="User Image" width="200" height="140" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label>身份证:</label>
                    <div>
                        <img id="certifiedIdentity"  alt="User Image" width="200" height="140" />
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_card_success">通过</button>
        &nbsp;&nbsp;
        <button class="btn btn-danger" data-event="submit_identity_refuse">拒绝</button>
        &nbsp;&nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>

