var BaiduMap;
if (!BaiduMap)
    BaiduMap = {};

var map = null;
var marker = null;
var key = '济南'
var geoc = null;
var lng = null;
var lat = null;
var input = null;

$(document).on("click", "#ButtonSearchKey", function() {
	key = $('#map-address').val();
	searchKey();
});


var okMap = function () {
    $(input).val($('#map-address').val());
    $(input).attr('lng', lng);
    $(input).attr('lat', lat);
    jqModal.closeContentModal();
}

$(document).on("focus", "input[data-evt=baidu-map]", function () {
    input = this;
    jqModal.showContentModal({
        title: '地址查找',
        width: 640,
        height: 560,
        url: '/weight/map',
        requestMethod: 'POST',
        footer: {
            buttons: [{text: '确认', type: 'btn-info', click: okMap}]
        }
    });
    return false;
});



//BaiduMap.ButtonSearchKey = function (){
//	key = $('#map-address').val();
//	searchKey();
//}


$(document).on("keyup", "input[id=map-address]", function(event) {
	if (event.keyCode == 13) {
		key = $('#map-address').val();
		searchKey();
	}
});

BaiduMap.loadMap = function() {
	if($(input).val()!=''){
		key = $(input).val();
		if($(input).attr('lng')!=null)
			lng = $(input).attr('lng');
		if($(input).attr('lat')!=null)
			lat = $(input).attr('lat');
	}else{
		key='济南';
		lat = null;
		lng = null;
	}
	

	$('#map-address').val(key);
	
	if (lng != null && lat != null)
		$('#map-position').text("(" + lng + "," + lat + ")");
	map = new BMap.Map("allmap");
	geoc = new BMap.Geocoder();
	map.enableScrollWheelZoom();
	map.enableContinuousZoom();

	if (lng != null && lat != null) {
		var point = new BMap.Point(lng, lat);
		map.centerAndZoom(point, 12);
	} else {
		map.centerAndZoom(key, 12);
	}

	var top_left_control = new BMap.ScaleControl( {
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT
	});
	var top_left_navigation = new BMap.NavigationControl( {
		anchor : BMAP_ANCHOR_TOP_RIGHT
	});

	map.addControl(top_left_control);
	map.addControl(top_left_navigation);
	if (lng != null && lat != null) {
		var point = new BMap.Point(lng, lat);
		marker = new BMap.Marker(point);
		map.clearOverlays();
		map.addOverlay(marker);
		marker.enableDragging();
		marker.addEventListener('dragend', function(point) {
			geoc.getLocation(point.point, function(rs) {
				loadPosition(point.point, rs);
			});
		});
	} else {
		searchKey();
	}

}

function searchKey() {
	var local = new BMap.LocalSearch(map, {
		onSearchComplete : function() {
			var point = local.getResults().getPoi(0).point;
			geoc.getLocation(point, function(rs) {
				loadPosition(point, rs);
			});
			map.centerAndZoom(point, 12);
			marker = new BMap.Marker(point);
			map.clearOverlays();
			map.addOverlay(marker);
			marker.enableDragging();
			marker.addEventListener('dragend', function(point) {
				geoc.getLocation(point.point, function(rs) {
					loadPosition(point.point, rs);
				});
			});
		}
	});
	local.search(key);
}

function loadPosition(point, rs) {
	lng = point.lng;
	lat = point.lat;
	var addComp = rs.addressComponents;
	key = addComp.province + addComp.city + addComp.district + addComp.street
			+ addComp.streetNumber;
	$('#map-address').focus().val(key);
	$('#map-position').text("(" + lng + "," + lat + ")");
}



