/**
 * Created by chentao on 2015/8/6.
 */

var CityInfo;
if (!CityInfo)
    CityInfo = {};

/**
 * 增加省份弹出框
 */
$(document).on('click','button[id="addCityInfo"]'),function(){
    jqModal.showContentModal({
        title:'添加省份',
        width:'600',
        height:'500',
        url:'web/city/addProvice',
        requestMethod:'POST',
        footer:{buttons:[{text:'添加',type:'btn-info',id:'addCitySubmit'}]}
    });
}
