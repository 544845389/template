<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>

<script src="${path}/static/houseswill/feedback/index.js"></script>


<div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/feedback/loadAllFeedback"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="agentName" data-width="100px">反馈人姓名</th>
            <th data-field="content" data-formatter="feedbackContentFormatter" data-width="100px">反馈内容</th>
            <th data-field="isLook" data-formatter="isLookFormatter" data-width="100px">已读状态</th>
            <th data-field="created" data-width="100px">反馈时间</th>
           <th data-formatter="operateFormatter" data-events= "operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>
</div>



<!-- 查看详情-->
<div id="detailsFeedback-div" class="slidingmenu box-model box box-info"  >
    <div class="box box-info">
        <div class="box-header">
            <h3 class="box-title">反馈详情</h3>
        </div>
        <div class="box-body">
            <form role="form" action="/web/feedback/findAllFeedbackPage" method="post" id="detailsFeedbackForm">
                <input type="hidden"  id="id" name="id" />
                <div class="col-md-12">
                    <div class="form-group">
                        <label>反馈人姓名:</label>
                        <input type="text" class="form-control" name="agentName"  readonly="readonly" >
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>反馈时间:</label>
                        <input type="text"  class="form-control" name="created"   readonly="readonly" >
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>反馈内容:</label>
                        <textarea class="form-control" name="content" style="height:100px;resize: none"  readonly="readonly"></textarea>
                    </div>
                </div>
                </form>
            <button style="display: none;" class="btn btn-danger close-model"></button>
            <button class="btn btn-inverse" onclick="closeDivBtn()">关闭</button>
        </div>
        <div class="box-footer">
        </div>
    </div>
</div>




<script type="text/javascript" >
    function closeDivBtn(){
        var id = $("#id").val();
        comment.post("/web/feedback/updateReadState", {"id": id}, '执行更改中...', function (data) {
            if (data.res.code == 40000) {
                var table = $("#table");
                table.bootstrapTable("refresh");
            }
        });
        $("#table").bootstrapTable("refresh");
        closeModel("detailsFeedback-div");
    }
</script>
