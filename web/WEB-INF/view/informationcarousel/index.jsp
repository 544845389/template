<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<script src="${path}/static/houseswill/informationcarousel/index.js"></script>

<div>

    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="add_info_carousel">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加资讯轮播图
        </button>
        &nbsp;&nbsp;
        <s:authorize ifAllGranted="INFO_CAR_CITY">
        城市名称:
        <select id="city_select_info" class="form-control" onchange="changInformationCity()" style="width: 120px">
        </select>
        </s:authorize>
    </div>

    <table id="information_table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/informationcarousel/findAllInformationCarousel"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="propertyPicture" data-formatter="headPic" data-width="100px">资讯轮播图</th>
            <th data-field="titile" data-formatter="titleFormatter" data-width="100px" >资讯标题</th>
            <th data-field="cityName"  data-width="100px">所在城市</th>
            <th data-field="created" data-width="100px" >创建时间</th>
            <th data-field="sort" data-formatter="sortFormatter" data-width="100px" >排序号</th>
            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>

</div>





<%--修改资讯轮播图--%>
<div id="modify_info_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">修改资讯轮播图</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modify_info_form" action="/web/informationcarousel/modifyInfoCarPicture" method="post">
            <div class="form-group" >
                <label >单击上传资讯轮播图:</label>
                <div>
                    <input type="hidden" id="modify_info_carousel_id"  name="infoId" value="" />
                    <input type="hidden" id="modify_car_pic" name="picturePath" value="" alt="图片路径"/>
                    <img  id="modify_info_car_image"  class="addImage" alt="User Image" height="100" /><br>
                    <span style="color: red">建议上传格式:800*600</span>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_info">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--添加资讯轮播图--%>
<div id="add_info_car_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">添加资讯轮播图</h3>
    </div>
    <input type="hidden" id="add_property_id"  name="propertyId" value="">
    <input type="hidden" id="add_city_id"  name="cityId" value="">
    <div class="box-body">
        <s:authorize ifAllGranted="INFO_CAR_CITY">
        <div class="form-inline" role="form" id="toolbar_info_car">
            <div>
                <label>城市名称:</label>
                <select id="add_city_info" class="form-control" onchange="changeInfoCities()" style="width: 120px;" >
                </select>
            </div>
        </div>
        </s:authorize>
        <table id="info_car_table"
               data-toggle="table"
               data-toolbar="#toolbar_info_car"
               data-url="${path}/web/information/loadAllInformation"
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">
            <thead>
            <tr>
                <th data-field="titile" data-formatter="titleFormatter"  data-width="100px" >资讯标题</th>
                <th data-field="picture" data-formatter="headPic" data-width="100px" >资讯主图</th>
                <th data-field="cityName"  data-width="50px" >城市</th>
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
<div id="modify_info_car_sort_div" class="slidingmenu box-model box box-info">
    <div class="box box-info">
        <div class="box-header">
            <h3 class="box-title">修改轮播图排序号</h3>
        </div>
        <div class="box-body">
            <form role="form" action="/web/informationcarousel/modifySort" method="post" id="info_sort_form">
                <div class="form-group">
                    <label>序号:</label>
                    <input type="hidden" class="form-control required" id="info_car_id" name="id" value="">
                    <input type="text" class="form-control required" id="order_num" name="orderNum" value="">
                </div>
            </form>
            <div class="box-footer">
                <button class="btn btn-success" data-event="submit_sort">保存</button>
                &nbsp;
                <button class="btn btn-inverse close-model">关闭</button>
            </div>
        </div><!-- /.box-body -->

    </div>
</div>

