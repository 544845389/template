/**
 * Created by chentao on 2016/2/27.
 */
var Socket;

if (Socket == null) {
    Socket = function () {
    }
}

var sio = null;
var taskId = null;

Socket.setTaskId = function (id) {
    taskId = id;
}

Socket.login = function (url) {
    sio = io.connect(url);
    sio.on('connect', function () {
        console.log("socket连接成功");
    });

    sio.on('chatevent', function (data) {
        var lng = data.lng;
        var lat = data.lat;
        var isLocation = data.isLocation;

        if (taskId != null && data.taskId == taskId && isLocation == 0) {
            alert(isLocation);
            addMarker(lng, lat, 1);
        }
        //if (taskId != null && data.taskId == taskId && isLocation == 0) {
        //    addMarker(lng, lat, 1);
        //}
        if (taskId != null && data.taskId == taskId && isLocation == 1) {
            addMarker(lng, lat, 3);
        }
        if (taskId != null && data.taskId == taskId && isLocation == 4) {
            if (markers != null)
                map.remove(markers);
        }
    });
}
