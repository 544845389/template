<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<script src="${path}/static/houseswill/servicemanager/index.js"></script>


<div>
    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="add_service_manager">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加服务经理
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="MANAGER_CITY">
        城市名称:
        <select id="city_service_manager" class="form-control" onchange="changServiceManagerCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/servicemanager/loadAllServiceManagers"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="propertyName" data-formatter="managerPictureFormatter" data-width="50px">头像</th>
            <th data-field="name" data-width="50px" >姓名</th>
            <th data-field="account" data-width="50px">手机号</th>
            <th data-field="cityName" data-width="50px">所在城市</th>
            <th data-field="state" data-formatter="stateFormatter" data-width="50px" >禁用状态</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>
        </tr>
        </thead>
    </table>
</div>





<%--添加服务经理--%>
<div id="update_service_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">编辑服务经理</h3>
    </div>
    <div class="box-body">
        <form role="form" id="update_manager_form" action="/web/servicemanager/updateOneManger" method="post" >

            <input type="hidden" class="form-control"   name="id"  />

            <div class="form-group">
                <label>头像:</label>
                <input type="hidden" class="form-control" id="up_picture_input"  name="picture"  />
                <img class="addImage" id="up_picture" style="width: 150px;" />
            </div>

            <div class="form-group">
                <label>姓名:</label>
                <input type="text" class="form-control" id="up_manager_name" name="name" placeholder="请输入姓名(限中文)" />
            </div>
            <div class="form-group">
                <label>手机号:</label>
                <input type="text" class="form-control" id="up_manager_telephone" name="account" placeholder="请输入11位有效手机号"/>
            </div>
            <div class="form-group">
                <input type="hidden" id="up_city_name_manager" name="cityId" />
                <label >城市名称:</label>
                <select  class="form-control" id="up_manager_city_name">
                </select>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_update">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>






<%--添加服务经理--%>
<div id="add_service_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">添加服务经理列表</h3>
    </div>
    <div class="box-body">
        <form role="form" id="add_manager_form" action="/web/servicemanager/addOneManger" method="post" >
            <div class="form-group">
                <label>姓名:</label>
                <input type="text" class="form-control" id="manager_name" name="name" placeholder="请输入姓名(限中文)" />
            </div>
            <div class="form-group">
                <label>手机号:</label>
                <input type="text" class="form-control" id="manager_telephone" name="telephone" placeholder="请输入11位有效手机号"/>
            </div>
            <div class="form-group">
                <label>密码:</label>
                <input type="text" class="form-control" id="manager_password" name="password" placeholder="请输入6-16位字母、数字或下划线的任意组合"/>
            </div>
            <div class="form-group">
                <input type="hidden" id="city_name_manager" name="cityId" />
                <label >城市名称:</label>
                <select  class="form-control" id="manager_city_name">
                </select>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_manager">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--重置密码--%>
<div id="modify_service_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">重置密码列表</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modify_manager_form" action="/web/servicemanager/modifyManagerPassword" method="post" >
            <input type="hidden" class="form-control" id="modify_manager_id" name="managerId" />
            <div class="form-group">
                <label>重置密码:</label>
                <input type="text" class="form-control" id="modify_manager_password" name="password" placeholder="请输入6-16位字母、数字或下划线的任意组合"/>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_manager">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>




<%--显示服务经理下的所有经纪人信息--%>
<div id="show_service_agent_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">经纪人列表</h3>
    </div>
    <div class="box-body">
        <table id="agent_table"
               data-toggle="table"
              <%-- data-toolbar="#toolbar"--%>
              <%-- data-url="${path}/web/servicemanager/loadAllServiceManagers"--%>
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">
            <thead>
            <tr>
                <th data-field="certifiedName" data-width="100px" >姓名</th>
                <th data-field="account" data-width="100px">电话</th>
                <th data-field="certifiedStore" data-width="100px">项目门店</th>
                <%--<th data-field="created" data-width="50px">创建时间</th>--%>
                <%--<th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>--%>
            </tr>
            </thead>
        </table>
    </div>
    <div class="box-footer">
      <%--  <button class="btn btn-success" data-event="submit_show_agent">保存</button>
        &nbsp;--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--显示服务经理下的所有客户信息--%>
<div id="show_service_client_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">客户列表</h3>
    </div>
    <div class="box-body">
        <table id="client_table"
               data-toggle="table"
        <%-- data-toolbar="#toolbar"--%>
        <%-- data-url="${path}/web/servicemanager/loadAllServiceManagers"--%>
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">
            <thead>
            <tr>
                <th data-field="clientName" data-width="100px" >姓名</th>
                <th data-field="clientPhone" data-width="100px">电话</th>
                <th data-field="states" data-formatter="statesFormatter" data-width="100px">状态</th>
                <th data-field="agentName" data-width="100px">所属经纪人</th>
                <%--<th data-formatter="operateFormatter" data-events="operateEvents" data-width="150px">操作</th>--%>
            </tr>
            </thead>
        </table>
    </div>
    <div class="box-footer">
        <%--  <button class="btn btn-success" data-event="submit_show_agent">保存</button>
          &nbsp;--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



