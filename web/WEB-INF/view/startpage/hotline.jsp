<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>


<script src="${path}/static/houseswill/startpage/hotline.js"></script>

<div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/startpage/loadAllServiceHotLine"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           <%--data-search="true" data-show-refresh="true" data-show-toggle="true"--%>
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="picture" data-width="100px" >客服热线</th>
            <th data-field="created" data-width="100px" >修改时间</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>

</div>





<%--修改启动页图片--%>
<div id="modify_start_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">修改客服热线</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modify_start_form" action="/web/startpage/modifyServiceHotLine" method="post">
            <input type="hidden" id="hot_line_id"  name="id" />
            <div class="form-group" >
                <label >客服热线:</label>
                <input type="text" class="form-control required" id="phone" name="picture"  />
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_start">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>


