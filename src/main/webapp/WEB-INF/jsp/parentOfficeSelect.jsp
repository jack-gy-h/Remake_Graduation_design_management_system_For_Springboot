<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>机构管理</title>
    <meta name="decorator" content="default"/>
    <%--    <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <%--    <link href="/static/css/bootstrap.css" rel="stylesheet" type="text/css"/>--%>
    <%--    <link href="/static/css/bootstrap1.css" rel="stylesheet" type="text/css"/>--%>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>
    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <%--bootstrap.min.css--%>
    <style>
        .table1 {
            width: 30%;
            margin-bottom: 20px
        }

        .table2 {
            border-collapse: separate;
            text-indent: initial;
            white-space: normal;
            line-height: normal;
            font-weight: normal;
            font-size: 5px;
            font-style: normal;
            color: -internal-quirk-inherit;
            text-align: start;
            border-spacing: 2px;
            font-variant: normal;
        }

        .td1 {
            display: table-cell;
            vertical-align: inherit;
            weight:50%;
        }

    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            $("#treeTable").treeTable({expandLevel: 3}).show();
        });

        function updateSort() {
            loading('正在提交，请稍等...');
            $("#listForm").attr("action", "");
            $("#listForm").submit();
        }
    </script>

    <script type = "text/javascript">

        function setofficeid(officeid) {


        }


    </script>
</head>
<body>
<%--<ul class="nav nav-tabs">--%>
<%--    <li class="active"><a href="/office">机构列表</a></li>--%>
<%--    <li><a href="">机构添加</a></li>--%>
<%--</ul>--%>
<%--<sys:message content="${message}"/>--%>
<form id="listForm" method="post">
    <table id="treeTable" class="table1 table2 table-striped table-bordered table-condensed ">
        <thead>
        <tr>
            <th>名称</th>
<%--            <th>链接</th>--%>
<%--            <th style="text-align:center;">排序</th>--%>
<%--            <th>可见</th>--%>
<%--            &lt;%&ndash;            <th>权限标识</th>&ndash;%&gt;--%>
<%--            <th>操作</th>--%>
        </thead>
        <tbody><c:forEach items="${list}" var="office">
            <tr id="${office.id}" pId="${office.parent.id ne '1'?office.parent.id:'0'}">
                <td nowrap class="td1">
<%--                    <a href="" onclick="setofficeid(${office.id})">${office.name}</a>--%>
                    <a href="/office/form?pid=${office.id}" >${office.name}</a>
                </td>
<%--                <td title="${office.href}">${office.href}</td>--%>
<%--                <td style="text-align:center;">--%>
<%--                    <input type="hidden" name="ids" value="${office.id}"/>--%>
<%--                    <input name="sorts" type="text" value="${office.sort}"--%>
<%--                           style="width:50px;margin:0;padding:0;text-align:center;">--%>
<%--                        &lt;%&ndash;                        ${office.parentIds}&ndash;%&gt;--%>
<%--                </td>--%>
<%--                <td>${office.isShow eq '1'?'显示':'隐藏'}</td>--%>
<%--                    &lt;%&ndash;                <td title="${office.permission}">${office.permission}</td>&ndash;%&gt;--%>
<%--                <td nowrap>--%>
<%--                    <a href="">修改</a>--%>
<%--                    <a href=""--%>
<%--                       onclick="">删除</a>--%>
<%--                    <a href="">添加下级机构</a>--%>
<%--                </td>--%>
            </tr>
        </c:forEach></tbody>
    </table>
    <div class="form-actions pagination-left">
        <input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
    </div>
</form>
</body>
</html>