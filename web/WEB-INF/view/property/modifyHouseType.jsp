<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/include/taglibs.jsp" %>


<%--修改楼盘户型--%>
<div id="modify_house_type_div" class="slidingmenu box-model box box-info" >
    <div class="box box-info">
        <div class="box-body">
            <form role="form" id="modifyHouseTypeForm" action="/web/housetype/modifyOneHouseType" method="post">
                <input type="hidden" class="form-control" id="property_name_id"  name="typeId"  value="${houseType.id}" />
                <div class="form-group">
                    <label>户型名称:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="modify_type_name"  name="houseTypeName" value="${houseType.houseTypeName}" />
                </div>
                <div class="form-group">
                    <label>户型说明:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="modify_description" name="description" value="${houseType.description}"  />
                </div>
                <div class="form-group">
                    <label>户型优惠:</label>
                    <span style="color: #ff9966">*</span>
                    <input type="text" class="form-control" id="modify_type_discount" name="houseTypeDiscount" value="${houseType.houseTypeDiscount}"  />
                </div>
                <div class="form-group" >
                    <label >单击上传户型主图:</label>
                    <span style="color: #ff9966">*</span>
                    <div>
                        <input type="hidden" id="modify_house_type_images" name="image" value="${houseType.houseTypeImages}" alt="图片路径"/>
                        <img  id="addImage7" class="addImage"  alt="User Image" width="100" height="100"
                              src="${Download}/${houseType.houseTypeImages}" /><br>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>单击上传户型轮播图:</label>
                        <span style="color: #ff9966">*</span>
                        <input type="hidden" id="modify_house_pictures" name="houseTypePicture" value="${houseType.houseTypePicture}" alt="图片路径">
                        <div class="col-md-12" id="modify_house_img">
                        </div>
                    </div>
                </div>
            </form>
        </div><!-- /.box-body -->

    </div>
</div>


<script>

   $(function () {
       var path = $("#modify_house_pictures").val();
       var imgDiv = $("#modify_house_img");

       if(path == "" || path == null){
           imgDiv.append(createAddImgDiv());
       }else{
           var paths = path.split(",");
           for (var i = 0; i < paths.length; i++) {
               if (paths[i] != "") {
                   var imgPath = paths[i];
                   var div = createImgDivHouseType(File_Download_Url + imgPath);
                   var img = div.find("img");
                   img.attr("is_up_company", 1);
                   img.attr("img-path", imgPath);
                   imgDiv.append(div);
               }
           }
           imgDiv.append(createAddImgDivHouseType());
       }

   });


</script>