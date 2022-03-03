<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/8
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--    easyui相关文件--%>
    <link rel="stylesheet" type="text/css" href="/static/css/easyui.css">

    <link rel="stylesheet" type="text/css" href="/static/css/icon.css">


    <script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>

    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>

    <script>
        var selectname = '';
        $(function () {
            loadData(selectname);


        });

        function loadData(selectname) {
            $("#dg").datagrid({
                title: "用户信息列表",
                url: "/user/userListData",
                method: "POST",
                pagination: true,
                pageSize: 20,
                pageList: [10, 20, 30],
                rownumbers: true,
                singleSelect: false,
                fit: false,
                border: false,
                idField: "id",
                fitColumns: true, //去除滚动条
                // showHeader:false,
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: '用户ID', width: 200, hidden: true, align: 'center'},
                    {field: 'name', title: '姓名', width: 200, align: 'center'},
                    {field: 'username', title: '用户名', width: 200, align: 'center'},
                    {field: 'password', title: '密码', width: 200, align: 'center'},
                    {field: 'identity', title: '身份', width: 200, align: 'center'},
                    {field: 'identityNumber', title: '身份码', width: 200, align: 'center'},
                    {field: 'collegeCnName', title: '学院', width: 200, align: 'center'},
                    {field: 'majorCnName', title: '专业', width: 200, align: 'center'},
                    {field: 'roleCnName', title: '角色名', width: 200, align: 'center'},
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle},
                    {field: 'identitysid', title: "身份ID", width: 200, hidden: true, align: 'center'},
                    {field: 'grade', title: "年级ID", width: 200, hidden: true, align: 'center'},
                    {field: 'collegeid', title: "学院ID", width: 200, hidden: true, align: 'center'},
                    {field: 'majorid', title: "专业ID", width: 200, hidden: true, align: 'center'},
                    {field: 'roleId', title: "角色Id", width: 200, hidden: true, align: 'center'},
                    {field: 'uiaid', title: '用户角色id', width: 200, hidden: true, align: 'center'}
                    //identitysid
                    // {field: 'userAdmin', title: '身份', width: 200, align: 'center'}
                    //    ， formatter: btnDetailed
                ]],
                queryParams: {selectname: selectname}

            })
        }

        function search() {
            var selectname = $("#btnSearchName").val();
            // alert("selectname:" + selectname);
            // params.name = name ;
            loadData(selectname);

        }

        function formatTitle(val, row) {
            return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a>  <a target='_self' style='text-decoration:none' href='/user/form?uiaid=" + row.uiaid + "'>修改</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?uiaid=" + row.uiaid + "'>删除</a>"
        }


        function opentable() {
            // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
            window.location.href = '/user/form';
        }


    </script>
</head>
<body>
身份码：<input class="easyui-textbox" id="btnSearchName" style="width:150px;height:32px;">
<input type="button" value="搜索" onclick="search()"/>
<input type="button" value="添加用户" onclick="opentable()"></input>
<table id="dg"></table>
</body>
</html>
