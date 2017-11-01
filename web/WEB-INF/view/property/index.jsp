<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<script src="${path}/static/houseswill/util/color.js"></script>
<script src="${path}/static/houseswill/property/index.js"></script>

<div>
    <div class="form-inline" role="form" id="toolbar">
        <button type="button" class="btn btn-default" id="add_property">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            添加楼盘
        </button>
        &nbsp;&nbsp;
    <s:authorize ifAllGranted="PROPERTY_CITY">
        城市名称:
        <select id="city_select" class="form-control" onchange="changCity()" style="width: 120px">
        </select>
    </s:authorize>
        <input type="hidden" id="add_property_id"  name="propertyId" />
    </div>
    <table id="table"
           data-toggle="table"
           data-toolbar="#toolbar"
           data-url="${path}/web/property/loadAllProperties"
           data-height="750"
           data-side-pagination="server"
           data-pagination="true"
           data-page-list="[5, 10, 20, 50, 100, 200]"
           data-search="true" data-show-refresh="true" data-show-toggle="true"
           data-show-columns="true">
        <thead>
        <tr>
            <th data-field="picture" data-formatter="pictureFormatter" data-width="50px" >楼盘主图</th>
            <th data-field="name"  data-width="100px" >楼盘名称</th>
            <th data-field="average"  data-width="100px">楼盘均价</th>
            <th data-field="commission" data-width="100px" >楼盘佣金</th>
            <th data-field="cityName" data-width="100px" >所在城市</th>
            <th data-field="created" data-width="100px" >创建时间</th>

            <th data-field="orderNum" data-formatter="orderFormatter" data-width="100px" >排序号</th>

            <th data-formatter="operateFormatter" data-events="operateEvents" data-width="100px">操作</th>
        </tr>
        </thead>
    </table>
</div>

<%--添加楼盘--%>
<div id="property_div" class="slidingmenu box-model box box-info" model-width="70%" model-left="30%" >
    <div class="box-header">
        <h3 class="box-title">添加楼盘</h3>
    </div>
    <div class="box-body">
        <form role="form" id="addPropertyForm" action="/web/property/addProperty" method="post">
            <div class="col-md-4">
                <div class="form-group">
                    <label>楼盘名称:</label>
                    <input type="text" class="form-control" id="property_name" name="name" placeholder="请输入楼盘名称" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘地址:</label>
                    <input type="text" class="form-control" id="property_address" name="address" placeholder="请输入楼盘地址" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >手机号:</label>
                    <input type="text" class="form-control" id="telephone" name="phone" placeholder="请输入11位有效手机号" />
                </div>
            </div>
            <div class="col-md-4">
                <div >
                    <label >楼盘标签名称:</label>
                    <input type="text" class="form-control" id="tag_name" name="tags" placeholder="请输入标签名称" />
                </div>
            </div>
            <div class="col-md-4">
                <div >
                    <label >楼盘标签色值:</label>
                    <input type="text" class="form-control" id="color_value_id" name="colorValue"  />
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘佣金:</label>
                    <input type="text" class="form-control" id="property_commission" name="commission" placeholder="请输入楼盘佣金" />
                </div>
            </div>

            <div class="col-md-12">
                <div class="form-group">
                    <label >楼盘佣金备注:</label>
                    <input type="text" class="form-control" id="commissionNotes" name="commissionNotes" placeholder="请输入楼盘佣金备注" />
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘均价:</label>
                    <input type="text" class="form-control" id="property_average" name="average" placeholder="请输入楼盘均价(非零正整数)"  />
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="price_scope_id" name="priceId" />
                    <label >楼盘价格范围:</label>
                    <select  class="form-control" id="price_scope"  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="type_id" name="typeId" />
                    <label >楼盘类型:</label>
                    <select  class="form-control" id="property_type"  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="city_name" name="cityId" />
                    <label >城市名称:</label>
                    <select  class="form-control" id="city_name_id"   >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="business_name" name="businessId" />
                    <label >所属商圈:</label>
                    <select  class="form-control" id="city_business"  >
                    </select>
                </div>
            </div>

            <div class="col-md-0" style="visibility: hidden" >
                <div class="form-group">
                    <input type="hidden"  name="businessId" />
                    <label >隐藏div:</label>
                    <select  class="form-control" >
                    </select>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label >楼盘卖点:</label>
                    <textarea  class="form-control" style="resize: none; height: 150px" id="property_selling" name="selling" placeholder="请输入楼盘卖点(格式规范)" ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >目标客户:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px" id="property_target" name="targetCustomers" placeholder="请输入目标客户(格式规范)" ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >拓客技巧:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px" id="skill" name="toker" placeholder="请输入拓客技巧(格式规范)" ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group" >
                    <label >楼盘主图:</label>
                    <div>
                        <input type="hidden" id="addHeadPic" name="picturePath" value="" alt="图片路径"/>
                        <img  id="addImage1"  class="addImage" alt="User Image" width="100" height="100" /><br>
                        <span style="color: red">建议上传格式:800*600</span>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>楼盘轮播图:</label>
                    <div>
                        <span style="color: red">建议上传格式:800*600</span>
                    </div>
                    <input id="addpropertyimages" type="hidden" name="propertyImages" value="" alt="图片路径">
                    <div class="col-md-12" id="add_img">
                        <div class="panel-body col-md-2 isFirstAdd">
                            <div class="row">
                                <div data-id="image_div" class="col-md-2">
                                    <div class="col-md-2">
                                        &nbsp;
                                    </div>
                                    <div data-id="div_image" class="col-md-2">
                                        <img class="addImage" data-id="add_image" data-event="add_image"
                                             src="${path}/static/images/commons/img_add.png" width="100" height="100">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit-Advert">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>


<%--修改楼盘参数--%>
<div id="modify_property_param_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">添加或修改楼盘参数</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modifyPropertyParamForm" action="/web/propertyparameter/modifyPropertyParameter" method="post">
            <input type="hidden" class="form-control" id="property_param_id" name="id"  />
            <input type="hidden" class="form-control" id="parameter_id" name="paramId"  />
            <div class="col-md-6">
                <div class="form-group">
                    <label >开盘时间:</label>
                    <input type="text" class="form-control" id="modify_opening_time" name="opening_time" placeholder="请输入开盘时间(格式如:****年**月**日)" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >交房时间:</label>
                    <input type="text" class="form-control" id="modify_delivery_time" name="delivery_time" placeholder="请输入交房时间(格式如:****年**月**日)" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >建筑类型:</label>
                    <input type="text" class="form-control" id="modify_building_type" name="building_type"  />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >项目特色:</label>
                    <input type="text" class="form-control" id="modify_project_features" name="features"  />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >装修状况:</label>
                    <input type="text" class="form-control" id="modify_decoration_case" name="decoration"  />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >产权年限:</label>
                    <input type="text" class="form-control" id="modify_property_right" name="property_right" placeholder="请输入产权年限(格式如:**年,没有可写暂无)" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >容积率:</label>
                    <input type="text" class="form-control" id="modify_volume_ratio" name="volume_ratio" placeholder="请输入容积率" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >绿化率:</label>
                    <input type="text" class="form-control" id="modify_green_rate" name="green_rate" placeholder="请输入绿化率" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >物业费:</label>
                    <input type="text" class="form-control" id="modify_property_fee" name="property_fee" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >开发商:</label>
                    <input type="text" class="form-control" id="modify_developers" name="developers" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >物业公司:</label>
                    <input type="text" class="form-control" id="modify_property_company" name="property_company" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >售楼处:</label>
                    <input type="text" class="form-control" id="modify_sales_office" name="sales_office" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >交通状况:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px" id="modify_traffic" name="traffic" ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >项目配套:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px" id="modify_project_support" name="project_support" ></textarea>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_param">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>

<%--修改楼盘--%>
<div id="modify_property_div" class="slidingmenu box-model box box-info" model-width="70%" model-left="30%" >
    <div class="box-header">
        <h3 class="box-title">修改楼盘</h3>
    </div>
    <div class="box-body">
        <form role="form" id="modifyPropertyForm" action="/web/property/modifyProperty" method="post">
            <input type="hidden" class="form-control" id="property_id" name="id" />
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘名称:</label>
                    <input type="text" class="form-control" id="modify_name" name="name"  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘地址:</label>
                    <input type="text" class="form-control" id="modify_address" name="address"  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >手机号:</label>
                    <input type="text" class="form-control" id="modify_telephone" name="phone"  />
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <label >楼盘标签名称:</label>
                    <input type="text" class="form-control" id="modify_tag_name" name="tags"  />
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <label >楼盘标签色值:</label>
                    <input type="text" class="form-control" id="color_value_modify" name="colorValue"  />
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘佣金:</label>
                    <input type="text" class="form-control" id="modify_commission" name="commission"  />
                </div>
            </div>

            <div class="col-md-12">
                <div class="form-group">
                    <label >楼盘佣金备注:</label>
                    <input type="text" class="form-control"  name="commissionNotes" placeholder="请输入楼盘佣金备注" />
                </div>
            </div>


            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘均价:</label>
                    <input type="text" class="form-control" id="modify_average" name="average"  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="price_scope_modify" name="priceId" />
                    <label >楼盘价格范围:</label>
                    <select  class="form-control" id="price_scope_"  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="type_id_" name="typeId" />
                    <label >楼盘类型:</label>
                    <select  class="form-control" id="modify_type"  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="city_name_modify" name="cityId" />
                    <label >城市名称:</label>
                    <select  class="form-control" id="city_name_"   >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" id="business_modify" name="businessId" />
                    <label >所属商圈:</label>
                    <select  class="form-control" id="city_business_id"  >
                    </select>
                </div>
            </div>
            <div class="col-md-0" style="visibility: hidden" >
                <div class="form-group">
                    <input type="hidden"  name="businessId" />
                    <label >隐藏div:</label>
                    <select  class="form-control"   >
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >楼盘卖点:</label>
                    <textarea  class="form-control" style="resize:none;height: 150px" id="modify_selling" name="selling"  ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >目标客户:</label>
                    <textarea  class="form-control" style="resize:none;height: 150px" id="modify_target" name="targetCustomers"  ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label >拓客技巧:</label>
                    <textarea  class="form-control" style="resize:none;height: 150px" id="modify_skill" name="toker"  ></textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group" >
                    <label >楼盘主图:</label>
                    <div>
                        <input type="hidden" id="modifyHeadPic" name="picture"  alt="图片路径"/>
                        <img  id="addImage3"  class="addImage" alt="User Image" width="100" height="100" /><br>
                        <%--<label style="color: green">建议上传大小为1300*700的图片!</label>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>楼盘轮播图:</label>
                    <input type="hidden" name="images" value="" alt="图片路径">
                    <div class="col-md-12" id="update_img">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
        <button class="btn btn-success" data-event="submit_modify_property">保存</button>
        &nbsp;
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>


<%--楼盘详情--%>
<div id="property_details_div" class="slidingmenu box-model box box-info" model-width="70%" model-left="30%">
    <div class="box-header">
        <h3 class="box-title">楼盘详情</h3>
    </div>
    <div class="box-body">
        <form role="form" id="propertyDetailsForm" action="/web/property/modifyProperty" method="post">
            <input type="hidden" class="form-control"  name="id"  />
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘名称:</label>
                    <input type="text" class="form-control"  name="name" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘地址:</label>
                    <input type="text" class="form-control"  name="address" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘标签名称:</label>
                    <input type="text" class="form-control"  name="tags" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘标签色值:</label>
                    <input type="text" class="form-control"  name="colorValue" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >手机号:</label>
                    <input type="text" class="form-control"  name="phone"  readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘佣金:</label>
                    <input type="text" class="form-control"  name="commission" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘均价:</label>
                    <input type="text" class="form-control"  name="average" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden"  name="priceId" />
                    <label >楼盘价格范围:</label>
                    <select  class="form-control" id="price_scope_details" disabled >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden"  name="typeId" />
                    <label >楼盘类型:</label>
                    <select  class="form-control" id="type_details" disabled >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden"  name="cityId" />
                    <label >城市名称:</label>
                    <select  class="form-control" id="city_name_details" disabled  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden"  name="businessId" />
                    <label >所属商圈:</label>
                    <select  class="form-control" id="business_id_details" disabled  >
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >开盘时间:</label>
                    <input type="text" class="form-control"  name="opening_time" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >交房时间:</label>
                    <input type="text" class="form-control"  name="delivery_time" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >建筑类型:</label>
                    <input type="text" class="form-control"  name="building_type" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >项目特色:</label>
                    <input type="text" class="form-control"  name="features" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >装修状况:</label>
                    <input type="text" class="form-control"  name="decoration" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >产权年限:</label>
                    <input type="text" class="form-control"  name="property_right" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >容积率:</label>
                    <input type="text" class="form-control"  name="volume_ratio" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >绿化率:</label>
                    <input type="text" class="form-control"  name="green_rate" readonly  />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >物业费:</label>
                    <input type="text" class="form-control"  name="property_fee" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >开发商:</label>
                    <input type="text" class="form-control"  name="developers" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >物业公司:</label>
                    <input type="text" class="form-control"  name="property_company" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >售楼处:</label>
                    <input type="text" class="form-control"  name="sales_office" readonly />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >交通状况:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px"  name="traffic" readonly ></textarea>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >项目配套:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px"  name="project_support" readonly ></textarea>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label >楼盘卖点:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px"  name="selling" readonly ></textarea>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label >目标客户:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px"  name="targetCustomers" readonly ></textarea>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label >拓客技巧:</label>
                    <textarea  class="form-control" style="resize: none;height: 150px"  name="toker" readonly ></textarea>
                </div>
            </div>


            <div class="col-md-4">
                <div class="form-group" >
                    <label >楼盘主图:</label>
                    <div>
                        <input type="hidden" id="detailsHeadPic" name="picturePath" value="" alt="图片路径"/>
                        <img  id="addImage5"  alt="User Image" width="100" height="100"  /><br>
                        <%--<label style="color: green">建议上传大小为1300*700的图片!</label>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>楼盘轮播图:</label>
                    <div class="col-md-12" id="de_imgs">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="box-footer">
       <%-- <button class="btn btn-info" data-event="submit_modify_property">保存</button>
        &nbsp;--%>
        <button class="btn btn-inverse close-model">关闭</button>
    </div>
</div>



<%--查看楼盘户型--%>
<div id="check_house_type_div" class="slidingmenu box-model box box-info">
    <div class="box-header">
        <h3 class="box-title">楼盘户型列表</h3>
    </div>
    <input type="hidden" class="form-control" id="property_house_id"   />
    <div class="box-body">
        <div class="form-inline" role="form" id="toolbar_house">
            <button type="button" class="btn btn-default" id="add_house_type">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加楼盘户型
            </button>
        </div>
        <table id="home_table"
               data-toggle="table"
               data-toolbar="#toolbar_house"
               <%--data-url="${path}/web/housetype/loadAllHouseType"--%>
               data-height="750"
               data-side-pagination="server"
               data-pagination="true"
               data-page-list="[5, 10, 20, 50, 100, 200]"
              <%-- data-search="true" data-show-refresh="true" data-show-toggle="true"--%>
               data-show-columns="true">
            <thead>
            <tr>

                <th data-field="houseTypePicture" data-formatter="headPic"  data-width="100px" >户型主图</th>
                <th data-field="houseTypeName"  data-width="100px" >户型名称</th>
                <th data-formatter="addOperateFormatter" data-events="addOperateEvents" data-width="100px">操作</th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="box-footer">
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
            <form role="form" action="/web/property/modifyOrderNum" method="post" id="mergeOrderNum">
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
