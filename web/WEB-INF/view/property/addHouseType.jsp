<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>
<%--添加楼盘户型--%>
<div id="add_house_type_div" class="slidingmenu box-model box box-info" >

    <div class="box box-info">
        <div class="box-body">
            <form role="form" id="addHouseTypeForm" action="/web/housetype/addHouseType" method="post">
                <input type="hidden" class="form-control" id="property_name_id"  name="propertyId"  value="${propertyId}" />
                <div class="form-group">
                    <label>户型名称:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="add_type_name"  name="typeName"  />
                </div>
                <div class="form-group">
                    <label>户型说明:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="add_description" name="description"  />
                </div>
                <div class="form-group">
                    <label>户型优惠:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="add_type_discount" name="typeDiscount"  />
                </div>
                <div class="form-group" >
                    <label >单击上传户型主图:</label>
                    <span style="color: #ff9966">*</span>
                    <div>
                        <input type="hidden" id="house_type_images" name="image" value="" alt="图片路径"/>
                        <img  id="addImage6" class="addImage"  alt="User Image" width="100" height="100"
                              src="${path}/static/images/commons/img_add.png" /><br>
                    </div>
                </div>
                <div class="form-group">
                    <label>单击上传户型轮播图:</label>
                    <span style="color: #ff9966">*</span>
                    <input id="addHouseTypePictures" type="hidden" name="HouseTypePictures" value="" alt="图片路径">
                    <div class="col-md-12" id="houseTypeadd_img">
                        <div class="panel-body col-md-3 isFirstAdd">
                            <div class="row">
                                <div data-id="houseTypeimage_div" class="col-md-12">
                                    <div class="col-md-12">
                                        &nbsp;
                                    </div>
                                    <div data-id="houseTypediv_image" class="col-md-12">
                                        <img class="addImage" data-id="houseTypeadd_image" data-event="houseTypeadd_image"
                                             src="${path}/static/images/commons/img_add.png" width="100" height="100">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div><!-- /.box-body -->
    </div>
</div>

<script>

$(function () {

    var houseTypeadd_image = $("img[data-id=houseTypeadd_image]");
    houseTypeadd_image.bind("loadImageAfter", function () {
        houseTypeimageLoadAfter(this);
    });

})

</script>