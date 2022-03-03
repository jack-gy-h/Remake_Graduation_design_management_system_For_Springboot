<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/20
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
</head>
<body>
<div class="main">
    <div class="Dnews">
        <div id="divNoticeHead" class="Dheadline"><h3>${announcement.headline}</h3>
            <p class="NpublishTime">${announcement.createDate}</p></div>
        <!--下部分内容-->
        <div class="Darticle">
            <div id="pNoticeContent"><p>${announcement.content}</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
