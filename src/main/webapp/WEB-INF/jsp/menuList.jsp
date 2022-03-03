<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>菜单管理</title>
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


    <script type="text/javascript">
        $(document).ready(function () {
            $("#treeTable").treeTable({expandLevel: 3}).show();
        });

        function updateSort() {
            loading('正在提交，请稍等...');
            $("#listForm").attr("action", "/menu/updateSort");
            $("#listForm").submit();
        }

        // function showdelete(id) {
        //
        //
        //     //这里将Modal连接/显示出来
        //     $("#delete").modal('show')
        //     //绑定Modal中提交键中的内容
        //     $('#btn_submit1').click(function () {
        //         //如果触发了该按键则执行logout操作
        //         window.location.href = '/menu/delete?id='+id;
        //
        //     })
        //
        //
        // }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="/menu">菜单列表</a></li>
        <li><a href="/menu/form">菜单添加</a></li>
</ul>
<%--<div class="modal fade" id="delete" data-backdrop="static" data-keyboard="false" tabindex="-1"--%>
<%--     aria-labelledby="logoutLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="staticBackdropLabel">系统提示</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">1--%>
<%--                您确定要删除这个菜单吗？--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>--%>
<%--                <button type="button" class="btn btn-primary" id="btn_submit1">确定</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>&lt;%&ndash;<sys:message content="${message}"/>&ndash;%&gt;--%>
<form id="listForm" method="post" action="/menu/updateSort">
    <table id="treeTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>名称</th>
            <th>链接</th>
            <th style="text-align:center;">排序</th>
            <th>可见</th>
<%--            <th>权限标识</th>--%>
                <th>操作</th>
        </thead>
        <tbody><c:forEach items="${list}" var="menu">
            <tr id="${menu.id}" pId="${menu.parent.id ne '1'?menu.parent.id:'0'}">
                <td nowrap><i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><a
                        href="/menu/form?id=${menu.id}">${menu.name}</a></td>
                <td title="${menu.href}">${menu.href}</td>
                <td style="text-align:center;">
                        <input type="hidden" name="ids" value="${menu.id}"/>
                        <input name="sorts" type="text" value="${menu.sort}"
                               style="width:50px;margin:0;padding:0;text-align:center;">
<%--                        ${menu.parentIds}--%>
                </td>
                <td>${menu.isShow eq '1'?'显示':'隐藏'}</td>
<%--                <td title="${menu.permission}">${menu.permission}</td>--%>
                    <td nowrap>
                        <a href="/menu/form?id=${menu.id}">修改</a>
                        <a href="/menu/delete?id=${menu.id}">删除</a>
                        <a href="/menu/form?pid=${menu.id}">添加下级菜单</a>
                    </td>
            </tr>
        </c:forEach></tbody>
    </table>
        <div class="form-actions pagination-left">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="保存排序" />
        </div>
</form>
</body>
</html>