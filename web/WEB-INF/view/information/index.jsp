<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"  %>

<script src="${path}/static/houseswill/information/index.js"></script>

<div>

    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="add_info">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加资讯
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="INFO_CITY">
        城市名称:
        <select id="city_select_info" class="form-control" onchange="changInfoCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>

    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/information/loadAllInformation"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="picture" data-formatter="headPic" data-width="50px" >资讯主图</th>
            <th data-field="titile" data-formatter="titleFormatter"  data-width="50px" >资讯标题</th>
            <th data-field="cityName"  data-width="50px" >城市</th>
            <th data-field="created" data-width="100px" >创建时间</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>

</div>



<%--添加资讯--%>
<div id="add_info_div" class="slidingmenu box-model box box-info" model-width="70%" model-left="30%">
    <div class="box-header">
        <h3 class="box-title">添加资讯列表</h3>
    </div>
    <div class="box-body">
        <form role="form" action="/web/information/addOneInformation" method="post" id="add_info_form">
            <div class="col-md-6">
                <div class="form-group">
                    <label>标题:</label>
                    <input type="text" class="form-control"  id="add_info_title"  name="title" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>摘要:</label>
                    <input type="text" class="form-control"  id="add_info_summary"  name="summary" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>URL地址:</label>
                    <input type="text" class="form-control"  id="add_info_url"  name="url" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <input type="hidden" id="add_city_info" name="cityId" />
                    <label >城市:</label>
                    <select  class="form-control" id="city_info"  >
                    </select>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>内容:</label>
                    <textarea id="content" name="content" style="display: none;" >
                    </textarea>
                    <script class="editor" id="editor" type="text/plain"
                            style="width:100%;height:300px;"></script>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group" >
                    <label >资讯主图:</label>
                        <div>
                            <input type="hidden" id="add_info_pic" name="picturePath" value="" alt="图片路径"/>
                            <img  id="add_info_image"  class="addImage" alt="User Image"  height="100" />
                        </div>
                        <div>
                            <span style="color: red">建议上传格式:800*600</span>
                        </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_info">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>




<%--修改资讯--%>
<div id="modify_info_div" class="slidingmenu box-model box box-info" model-width="70%" model-left="30%">
    <div class="box-header">
        <h3 class="box-title">修改资讯列表</h3>
    </div>

    <div class="box-body">
        <form role="form" action="/web/information/modifyOneInformation" method="post" id="modify_info_form">
            <input type="hidden"  name="id" value="" />
            <div class="col-md-6">
                <div class="form-group">
                    <label>标题:</label>
                    <input type="text" class="form-control"  id="modify_info_title"  name="titile" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>摘要:</label>
                    <input type="text" class="form-control"  id="modify_info_summary"  name="abstractTest" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label>URL地址:</label>
                    <input type="text" class="form-control"  id="modify_info_url"  name="url_info" value="" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <input type="hidden" id="modify_city_info" name="cityId" />
                    <label >城市:</label>
                    <select  class="form-control" id="city_info_modify"  >
                    </select>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>内容:</label>
                    <textarea id="modify_content" name="subContent" style="display: none"></textarea>
                    <script class="editor" id="editor1" type="text/plain"
                            style="width:100%;height:300px;"></script>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group" >
                    <label >资讯主图:</label>
                    <div>
                        <input type="hidden" id="modify_info_pic" name="picture" value="" alt="图片路径"/>
                        <img  id="modify_info_image"  class="addImage" alt="User Image"  height="100" />
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="modify_info">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<script>

    $(function(){

        var ue = UE.getEditor("editor");

    });

</script>