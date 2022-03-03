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
                title: "所有确认选题学生列表",
                url: "/task/viewchosenstudentallForanypatternListData",
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
                //studentId
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: '选题ID', width: 200, hidden: true, align: 'center'},
                    {field: 'topic', title: '题目名', width: 200, align: 'center'},
                    {field: 'studentname', title: '学生名', width: 200, align: 'center'},
                    {field: 'pattern', title: '选题模式', width: 200, align: 'center'},
                    {field: 'materialName', title: '材料名', width: 200, align: 'center'},
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle},
                    {field: 'auditStatusId', title: "审核状态ID", width: 200, hidden: true, align: 'center'},
                    {field: 'assignmentbookId', title: "课题任务书ID", width: 200, hidden: true, align: 'center'}



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

            if(row.materialName == null){

            }else if(row.materialName != null){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/downloadmaterial?id=" +row.id + "' > 下载相关材料 </a> "
            }


            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }


        // function opentable() {
        //     // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
        //     window.location.href = '/user/form';
        // }<a target = '_self' style = 'text-decoration:none'href = '/teacher/task/doublechoosestudent?id="+row.id+"' > 进行双选 </a>


    </script>
</head>
<body>

<%--<input type="button" value="添加用户" onclick="opentable()"></input>--%>
<table id="dg"></table>
<%--<a href="javascript:select()"></a>--%>
</body>
</html>