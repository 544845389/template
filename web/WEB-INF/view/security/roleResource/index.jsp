<%--
  Created by IntelliJ IDEA.
  User: chentao
  Date: 2015/9/9
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>

<script src="${path}/static/security/roleResource/index.js"></script>

<div class="col-md-12 ">
    <button type="button" class="btn btn-success pull-right" id="saveRoleResource">保存</button>
    <input type="hidden" name="roId" id="roId"/>
</div>
<div class="panel-body">
    <div class="row">
        <div class="col-lg-5">
            <table id="table"
                   data-toggle="table"
                   data-url="${path}/web/roleResource/loadAllRole"
                   data-height="600"
                   data-side-pagination="server"
                    >
                <thead>
                <tr>
                    <th data-field="id">编号</th>
                    <th data-field="name">角色名称</th>
                    <th data-formatter="RoleResource.operateFormatter" data-events="operateEvents">查看资源</th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="col-lg-7">
            <div>
                <button class="btn btn-success" id="open">展开</button>
                &nbsp;
                <button class="btn btn-inverse" id="close">关闭</button>
            </div>
            <div class="zTreeDemoBackground left" style="margin-top: 15px">
                <ul id="jstree_demo_div" class="ztree" data-event="jstree_demo_div"></ul>
            </div>
        </div>
    </div>
</div>

