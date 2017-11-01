<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>


<script src="${path}/static/houseswill/push/pushindex.js"></script>

<div>

    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="addPushMsg">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            创建推送信息
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="PUSH_CITY">
            城市:
            <select id="city_select" class="form-control" onchange="changCity()" style="width: 120px">
            </select>
        </s:authorize>
    </div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/push/findAllPush"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <%--<th data-field="id" data-width="50px">编号</th>--%>
            <th data-field="title" data-width="100px">标题</th>
            <th data-field="pushtype" data-width="100px" >类型</th>
            <th data-field="pushUsers" data-width="100px">被推送人</th>
            <th data-field="name" data-width="100px"  data-formatter="cityName" >所属城市</th>
            <th data-field="created" data-width="100px">创建时间</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>


    <div id="addPushmsg-div" class="slidingmenu box-model box box-info"  ><!--添加推送信息 開始-->
        <%--<div class="box box-info">--%>
        <div class="box-header">
            <h3 class="box-title">推送信息</h3>
        </div>
        <div class="box-body">
            <form role="form" action="/web/push/addPush" method="post" id="pushmsgform">
                <input type="text"  value="" style="display: none;">

                <div class="form-group">
                    <label>标题:</label>
                    <input type="text" id="push_title" class="form-control" name="title" placeholder="请输入标题"   />
                </div>

                <%--<div class="form-group">--%>
                    <%--<label>图片:</label>--%>

                    <%--<div>--%>
                        <%--<input type="hidden" name="imgpath" value="" alt="图片路径">--%>
                        <%--<img  id="addImage1" src="${path}/static/images/commons/img_add.png"  class="img-circle addImage"  data-url-upload="${adminFileUploadUrl}" data-url-download="${adminFileDownloadUrl}" data-id="admin-photo"--%>
                             <%--data-event="admin_photo" alt="User Image"  width="150"--%>
                              <%--height="150" />--%>

                    <%--</div>--%>
                <%--</div>--%>

                <div class="form-group">
                    <label>发布信息:</label>
                    <textarea id="content" name="content" hidden="hidden"></textarea>
                    <%
                        String time = String.valueOf(System.currentTimeMillis());
                    %>
                    <input id="time" type="hidden" value="<%=time%>"/>
                    <script class="editor" id="editor<%=time%>" type="text/plain"
                            style="width:100%;height:200px;"></script>
                </div>

                <div class="form-group">
                    <label>推送类型：</label>

                    <div class="radio-inline">
                        <label>
                            <input type="radio" name="pushType" value="1" checked/>
                            身份
                        </label>
                    </div>
                    <div class="radio-inline">
                        <label>
                            <input type="radio" name="pushType" value="0"/>
                            别名
                        </label>
                    </div>
                    <div class="radio-inline">
                        <label>
                            <input type="radio" name="pushType" value="2"/>
                            全部
                        </label>
                    </div>
                </div>

                <div class="form-group" id="div-identity">
                    <label>推送对象：</label>
                    <select class="form-control required" id="tagstype" name="tagstype" style="width: 40%" >
                        <option value="2">经纪人</option>
                        <option value="3">服务经理</option>
                    </select>
                </div>


                <div class="form-group" id="div-alias" style="display: none">
                    <div>
                        <label>推送对象：</label>
                    </div>
                    <div class="form-group">
                        <textarea name="users" style="width: 70%;" class="form-control"
                                  placeholder="请输入手机号(多个编号可以用','分割，最多50个编号)"></textarea>
                    </div>
                </div>


                <s:authorize ifAllGranted="ADDPUSH_CITY">
                    <div  id="div-tags" >
                        <label>城市：</label><br/>
                        <select class="form-control required" id="city" name="cityId" style="width: 40%">
                        </select>
                    </div>
                </s:authorize>

            </form>
        </div>
        <div class="box-footer">
            <button class="btn btn-success" data-event="submit-savepushmsg">保存</button>
            &nbsp;
            <button class="btn btn-inverse close-model">关闭</button>
        </div>
        <!-- /.box-body -->

        <%--</div>--%>
    </div>
    <!--添加信息 结束-->

    <div id="findpushmsg-div" class="slidingmenu box-model box box-info"><!--查看推送信息 開始-->
        <%--<div class="box box-info">--%>
        <div class="box-header">
            <h3 class="box-title">推送详情</h3>
        </div>
        <div class="box-body">
            <form role="form" method="post" id="pushform">
                <div >
                    <label>标题:</label>
                    <input type="text" class="form-control" name="title">
                </div>

                <div class="form-group">
                    <a id="imgpath" href="http://img0.bdstatic.com/img/image/shouye/fengjing0826.jpg"
                       alt="图片路径"></a>
                </div>

                <div >
                    <label>发布信息:</label>
                    <div id="content1">
                    </div>
                </div>
            </form>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button class="btn btn-inverse close-model">关闭</button>
        </div>
        <%--</div>--%>
    </div>
    <!--信息 结束-->

</div>

<script>
    var editor = UE.getEditor('editor<%=time%>');
</script>
