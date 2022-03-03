<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/27
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<div id="nochoiceDiv" style="" class="gxf_tips">
    <div class="gxf_tip">
        <i></i>信息提示
    </div>
    <div>
        <c:if test="${starttime =='1'}"><p>暂无您需要参加的答辩安排信息。</p></c:if>
        <c:if test="${starttime !='1'}">答辩时间安排：<br>
            开始时间：${starttime}<br>
            结束时间：${endtime}<br>
            请大家注意答辩时间，在答辩时间前做好充足准备</c:if>

    </div>
</div>

</body>
</html>
