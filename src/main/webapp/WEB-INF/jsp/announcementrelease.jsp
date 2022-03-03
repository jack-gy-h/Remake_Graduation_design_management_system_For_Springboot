<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/20
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>
    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/editormd.css" rel="stylesheet" type="text/css"/>
    <%--    <link href="/static/css/editormd.min.css" rel="stylesheet" type="text/css"/>--%>
    <script src="/static/js/editormd.min.js"></script>
    <%--    src/main/webapp/static/js/editormd.min.js--%>

    <script type="text/javascript">

        var editor;

        $(function () {
            editor = editormd("content-editormd", {
                width: "100%",
                height: 600,
                syncScrolling: "single",
                path: "/static/plugin/mdeditor/lib/",
                htmlDecode: "style,script,iframe",
                saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea

                // /**上传图片相关配置如下*/
                // imageUpload: true,
                // imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                // imageUploadURL: "/admin/uploadImg"

            });
        })
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="#">发布公告</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="announcement" action="/announcement/form/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <c:if test="${announcement.createDate != null}"> <form:hidden path="createDate"/></c:if>
    <form:hidden path="delFlag"/>
    <div class="control-group">
        <label class="control-label">名称:</label>
        <div class="controls">
            <form:input path="headline" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">内容:</label>
        <div class="controls">
            <div id="content-editormd" class="form-group" style="z-index: 10">
                <form:textarea path="content" style="display: none"></form:textarea>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit"
               value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
