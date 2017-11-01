<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${push.title}</title>
</head>
<body>
<div style="text-align: center;font-size: larger;font-weight: bold;">
    标题:${push.title}
</div>
<hr/>
<div style="text-align: center;">
    推送时间:${push.created}
</div>
<hr/>
<div>
    ${push.content}
</div>
</body>
</html>
