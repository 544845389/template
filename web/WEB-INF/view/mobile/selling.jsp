<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <script type="application/javascript" >
        window.onload = function (){
            selling();
            targetCustomers();
            toker();
        }

        var observe;
        if (window.attachEvent) {
            observe = function (element, event, handler) {
                element.attachEvent('on'+event, handler);
            };
        }
        else {
            observe = function (element, event, handler) {
                element.addEventListener(event, handler, false);
            };
        }

        function selling () {
            var text = document.getElementById('selling');
            function resize () {
                text.style.height = 'auto';
                text.style.height = text.scrollHeight+'px';
            }
            /* 0-timeout to get the already changed text */
            function delayedResize () {
                window.setTimeout(resize, 0);
            }
            observe(text, 'change',  resize);
            observe(text, 'cut',     delayedResize);
            observe(text, 'paste',   delayedResize);
            observe(text, 'drop',    delayedResize);
            observe(text, 'keydown', delayedResize);
            resize();
        }


        function targetCustomers () {
            var targetCustomers = document.getElementById('targetCustomers');
            function resize () {
                targetCustomers.style.height = 'auto';
                targetCustomers.style.height = targetCustomers.scrollHeight+'px';
            }
            /* 0-timeout to get the already changed text */
            function delayedResize () {
                window.setTimeout(resize, 0);
            }
            observe(targetCustomers, 'change',  resize);
            observe(targetCustomers, 'cut',     delayedResize);
            observe(targetCustomers, 'paste',   delayedResize);
            observe(targetCustomers, 'drop',    delayedResize);
            observe(targetCustomers, 'keydown', delayedResize);
            resize();
        }


        function toker () {
            var toker = document.getElementById('toker');
            function resize () {
                toker.style.height = 'auto';
                toker.style.height = toker.scrollHeight+'px';
            }
            /* 0-timeout to get the already changed text */
            function delayedResize () {
                window.setTimeout(resize, 0);
            }
            observe(toker, 'change',  resize);
            observe(toker, 'cut',     delayedResize);
            observe(toker, 'paste',   delayedResize);
            observe(toker, 'drop',    delayedResize);
            observe(toker, 'keydown', delayedResize);

            resize();
        }
    </script>

    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

</head>
<body>

<div style="margin: 0px;padding: 0px;">
    <div style="border-top: 1px solid #F3F1ED;padding: 20px;" >
        <div>
            <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy1.png" style="width: 20px;" />
            <label style="font-size: 15px;font-weight: 900;">楼盘卖点</label>
        </div>
        <div>
            <textarea disabled="disabled" class="form-control" style="outline:none;resize: none;border: none;width: 100%;background-color: white;font-size: 15px;line-height: 22px" id="selling" onclick="" >${property.selling}</textarea>
        </div>
    </div>
    <div style="border-top: 1px solid #F3F1ED;padding: 20px;">
        <div>
            <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy2.png" style="width: 20px;"  />
            <label style="font-size: 15px;font-weight: 900;">目标客户</label>
        </div>
        <div>
            <textarea disabled="disabled" class="form-control" style="outline:none;resize: none;border: none;width: 100%;background-color: white;font-size: 15px;line-height: 22px"  id="targetCustomers" >${property.targetCustomers}</textarea>
        </div>
    </div>
    <div style="border-bottom: 1px solid #F3F1ED;border-top: 1px solid #F3F1ED;padding: 20px;">
        <div>
            <img src="http://114.215.88.167:8080/houseswill/static/images/mall/buy3.png" style="width: 20px;"  />
            <label style="font-size: 15px;font-weight: 900;">拓客技巧</label>
        </div>
        <div>
            <textarea disabled="disabled" class="form-control" style="outline:none;resize: none;border: none;width: 100%;background-color: white;font-size: 15px;line-height: 22px" id="toker" >${property.toker}</textarea>
        </div>
    </div>
</div>
</body>
</html>