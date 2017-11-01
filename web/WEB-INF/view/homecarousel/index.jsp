<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"  %>

<script src="${path}/static/houseswill/homecarousel/index.js"></script>

<div>

    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="add_home_carousel">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加首页楼盘轮播图
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="PRO_CAR_CITY">
        城市名称:
        <select id="city_select" class="form-control" onchange="changHomeCarouselCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/homecarousel/findAllHomeCarousel"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="propertyPicture" data-formatter="headPic" data-width="100px">楼盘轮播图</th>
            <th data-field="propertyName"  data-width="100px" >楼盘名称</th>
            <th data-field="cityName"  data-width="100px">所在城市</th>
            <th data-field="created" data-width="100px" >创建时间</th>
            <th data-field="orderNum" data-formatter="orderFormatter" data-width="100px" >排序号</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>

</div>





<%--修改首页轮播图--%>
<div id="modify_home_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">修改首页楼盘轮播图</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modify_home_form" action="/web/homecarousel/modifyHomeCarousel" method="post">
            <div class="form-group" >
                <label >单击上传首页楼盘轮播图:</label>
                <div>
                    <input type="hidden" id="modify_home_carousel_id"  name="homeId" value="" />
                    <input type="hidden" id="modifyHeadPic" name="picturePath" value="" alt="图片路径"/>
                    <img  id="addImage2"  class="addImage" alt="User Image"  height="100" /><br>
                </div>
                <span style="color: red">建议上传格式:800*600</span>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_home">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--添加首页轮播图--%>
<div id="add_home_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">添加首页楼盘轮播图</h3>
    </div>
    <input type="hidden" id="add_property_id"  name="propertyId" value="">
    <input type="hidden" id="add_city_id"  name="cityId" value="">
    <div class="box-body">
        <s:authorize ifAllGranted="PRO_CAR_CITY">
        <div class="form-inline" role="form" id="toolbar_home" >
            <div>
                <label>城市名称:</label>
                <select id="add_city_list" class="form-control" onchange="changePropertyCities()" style="width: 120px;" >
                </select>
             </div>
        </div>
        </s:authorize>
        <table id="home_table"
               data-toggle="table"
               data-toolbar="#toolbar_home"
               data-url="${path}/web/property/loadAllProperties"
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">
            <thead>
            <tr>
                <th data-field="name"  data-width="100px" >楼盘名称</th>
                <th data-field="cityName"  data-width="100px" >所在城市</th>
                <th data-field="created" data-width="100px" >创建时间</th>
                <th data-formatter="addOperateFormatter" data-events="addOperateEvents" data-width="100px">操作</th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="box-footer">
        <%--<button class="btn btn-info" data-event="submit-Advert">保存</button>--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>


<%--修改排序--%>
<div id="modify_OrderNum_div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
        <div class="box-header">
            <h3 class="box-title">修改轮播图排序号</h3>
        </div>
        <div class="box-body">
            <form role="form" action="/web/homecarousel/modifyOrderNum" method="post" id="mergeOrderNum">
                <div class="form-group">
                    <label>序号:</label>
                    <input type="hidden" class="form-control required" id="home_id" name="id" value="">
                    <input type="text" class="form-control required" id="orderNum" name="orderNum" value="">
                </div>
            </form>
            <div class="box-footer">
                <button class="btn btn-success" data-event="merge-orderNum">保存</button>
                &nbsp;
                <button class="btn btn-inverse close-model">关闭</button>
            </div>
        </div><!-- /.box-body -->

    </div>
</div>

