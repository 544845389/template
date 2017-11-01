/**
 * Created by chentao on 2016/2/29.
 */

var GaoDeMap;
if (!GaoDeMap)
    GaoDeMap = {};

var map = null;
var key = '济南'
var lng = null;
var lat = null;
var input = null;
var marker = null;
var placeSearch = null;

/**
 * 点击确定按钮事件
 */
var okGaodeMap = function () {
    $(input).val($('#map-address').val());
    $(input).attr('lng', lng);
    $(input).attr('lat', lat);
    jqModal.closeContentModal();
}

var close = function(){
    jqModal.closeContentModal();
}

/**
 * 点击地图控件事件
 */
$(document).on("click", "input[data-evt=gaode-map]", function () {
    input = this;
    jqModal.showContentModal({
        title: '地址查找',
        width: 640,
        height: 560,
        url: '/weight/gaodeMap',
        requestMethod: 'POST',
        footer: {
            buttons: [
                {text: '确认', type: 'btn-info', click: okGaodeMap},
                {text: '关闭', type: 'btn-info', click: close}
            ]
        }
    });
    return false;
});

/**
 * 初始化地图
 */
GaoDeMap.loadGaodeMap = function () {
    map = new AMap.Map("container", {
        resizeEnable: true,
        zoom: 13
    });
    map.plugin(["AMap.ToolBar"], function () {
        var tool = new AMap.ToolBar();
        map.addControl(tool);
    });
    map.plugin(["AMap.Scale"], function () {
        var scale = new AMap.Scale();
        map.addControl(scale);
    });

    if ($(input).val() != '' && $(input).val() != null) {
        key = $(input).val();
        if ($(input).attr('lng') != null)
            lng = $(input).attr('lng');
        if ($(input).attr('lat') != null)
            lat = $(input).attr('lat');
        $("#map-address").val(key);
        searchMap(key);
    } else {
        showCityInfo();
    }
}

//获取用户所在城市信息
function showCityInfo() {
    //实例化城市查询类
    var citysearch = new AMap.CitySearch();
    //自动获取用户IP，返回当前城市
    citysearch.getLocalCity(function (status, result) {
        if (status === 'complete' && result.info === 'OK') {
            if (result && result.city && result.bounds) {
                var cityinfo = result.city;
                var citybounds = result.bounds;
                hint('您当前所在城市：' + cityinfo);
                //地图显示当前城市
                map.setBounds(citybounds);
                searchMap(cityinfo);
            }
        } else {
            hint(result.info + ',请重新加载地图.');
        }
    });
}

/**
 * 查询回车事件
 */
$(document).on("keyup", "input[id=map-address]", function (event) {
    if (event.keyCode == 13) {
        key = $('#map-address').val();
        searchMap();
    }
});

/**
 * 查询地图
 * @param keys
 */
function searchMap(keys) {
    var address;
    if (keys != null) {
        address = keys;
    } else {
        address = key;
    }
    AMap.service(["AMap.PlaceSearch"], function () {
        placeSearch = new AMap.PlaceSearch({
            pageSize: 1,
            pageIndex: 1,
            offset: 1,
            map: map
        });
        //关键字查询
        placeSearch.search(address, function (status, result) {
            var poi = result.poiList.pois;
            var location = poi[0].location;
            map.clearMap();
            marker = new AMap.Marker({
                position: location,
                draggable: true,
                cursor: 'move',
                map: map
            });
            map.setZoom(15);
            var nowAddress = poi[0].pname + poi[0].cityname + poi[0].address;
            setLocation(nowAddress, location);
            markerListener();
        });
    });

    /**
     * marker拖动监听事件
     */
    function markerListener() {
        AMap.event.addListener(marker, 'dragging', function (e) {
            var location = e.lnglat;
            lat = e.lnglat.lat;
            lng = e.lnglat.lng;
            geoc = new AMap.Geocoder({
                radius: 100,
                extensions: "all"
            });
            geoc.getAddress(location, function (status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    geocoder_CallBack(location, result);
                }
            });
        });
    }
    //marker拖动，回调函数
    function geocoder_CallBack(location, rs) {
        var address = rs.regeocode.formattedAddress;
        setLocation(address, location);
    }

    function setLocation(address, location) {
        //if (key != null && key != '济南') {
        //    $("#map-address").val(key);
        //} else {
        //
        //}
        $("#map-address").val(address);
        $("#map-address").attr('lat', location.lat);
        $("#map-address").attr('lng', location.lng);
        lng = location.lng;
        lat = location.lat;
        $("#map-position").text('(' + location + ')');
    }
}

