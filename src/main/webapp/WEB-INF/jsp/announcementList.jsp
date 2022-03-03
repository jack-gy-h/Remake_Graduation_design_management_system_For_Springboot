<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/8
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>

    <%--    easyui相关文件--%>
    <link rel="stylesheet" type="text/css" href="/static/css/easyui.css">

    <link rel="stylesheet" type="text/css" href="/static/css/icon.css">


    <script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>

    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>

    <script>

        $(function () {
            loadData();


        });

        function loadData() {
            $("#dg").datagrid({
                title: "公告列表",
                url: "/announcement/announcementListData",
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
                    {field: 'id', title: '公告ID', width: 200, hidden: true, align: 'center'},
                    {field: 'headline', title: '标题', width: 200, align: 'center'},
                    {field: 'createDate', title: '创建时间', width: 200, align: 'center'},
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle}

                    // {field: 'grade', title: "年级ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'collegeid', title: "学院ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'majorid', title: "专业ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'roleId', title: "角色Id", width: 200, hidden: true, align: 'center'}
                    //identitysid
                    // {field: 'userAdmin', title: '身份', width: 200, align: 'center'}
                    //    ， formatter: btnDetailed
                ]]

            })
        }



        function formatTitle(val, row) {
           return "<a target='_self' style='text-decoration:none' href='/announcement/showannounceforUser?id=" + row.id + "'>查看详情</a> <a target='_self' style='text-decoration:none' href='/announcement/form?id=" + row.id + "'>修改 </a><a target='_self' style='text-decoration:none' href='/announcement/delete?id=" + row.id + "'>删除</a>"
        }


        // function opentable() {
        //     // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
        //     window.location.href = '/user/form';
        // }<a target = '_self' style = 'text-decoration:none'href = '/teacher/task/doublechoosestudent?id="+row.id+"' > 进行双选 </a>


    </script>
</head>
<body>


<table id="dg"></table>

</body>
</html>