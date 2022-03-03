<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/23
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="/static/css/easyui.css" rel="stylesheet" type="text/css">

    <link href="/static/css/icon.css" rel="stylesheet" type="text/css">

    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery.easyui.min.js" type="text/javascript"></script>

    <script src="/static/js/jquery.form.min.js" type="text/javascript"></script>

    <script>
        $(function () {

            loadData();

        });

        function loadData() {
            $("#dg").datagrid({
                title: "所有选题学生",
                url: "/task/teacherviewstudentfinalpaperListData",
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
                    {field: 'filename', title: '文件名', width: 200, align: 'center'},
                    {field: 'studentname', title: '作者', width: 200, align: 'center'},
                    {field: 'createDate', title: '提交时间', width: 200, align: 'center'},
                    {field: 'auditStatus', title: '审核状态', width: 200, align: 'center'},
                    {field: 'auditStatusId', title: "审核状态Id", width: 200, hidden: true, align: 'center'},
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
            if (row.auditStatusId == 1) {
                return "<a target='_self'  style='text-decoration:none' href='/task/view/studentfinalpaper?id=" + row.id + "'>查看详情</a>&nbsp;<a target='_self'  style='text-decoration:none' href='/task/audit/finalpaper?id=" + row.id + "&audit_status=2'>通过</a> <a target='_self'  style='text-decoration:none' href='/task/audit/finalpaper?id=" + row.id + "&audit_status=3'>不通过</a> "
            } else if (row.auditStatusId == 2) {
                return "<a target='_self'  style='text-decoration:none' href='/task/view/studentfinalpaper?id=" + row.id + "'>查看详情</a> <a target='_self'  style='text-decoration:none' href='/task/audit/finalpaper?id=" + row.id + "&audit_status=3'>改为不通过</a> ";
            } else if (row.auditStatusId == 3) {
                //'/task/submit/graduationproject/form?id=" + row.id + "'
            }
            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }

        // function release() {
        //     $.post("/task/get/task/baseInformation", {}, function (data) {
        //
        //         if (data[0].finalPaperid != null) {
        //             alert("您已经提交过毕业设计（论文）最终版，请进行修改");
        //             return;
        //         } else {
        //
        //             window.location.href = '/task/submit/graduationproject/form';
        //
        //         }
        //
        //
        //     });
        //
        //
        // }

        // function chose() {
        //     // $.messager.confirm("系统提示", "您确定要选择这个题目吗？", function (r) {
        //     //     if (r) {
        //     //         // $.post("/student/topic/chosen/"+id , {}, function (result) {
        //     //         //     if (result == "success") {
        //     //         //         $("#topic_status").datagrid("reload");
        //     //         //     } else {
        //     //         //         $.messager.alert("系统提示", "选题失败！");
        //     //         //     }
        //     //         // });
        //     //
        //     //     }
        //     // });
        //     $("#topic_tontent_forstudent_form").ajaxForm({
        //         type: "post",
        //         url: "/task/student/submitmaterial",
        //         contentType: false,
        //         processData: false,
        //         success: function (result) {
        //             if (result == "success") {
        //                 alert("上传任务书成功!");
        //                 window.location.reload();
        //
        //             } else if (result == "filenull") {
        //                 alert("上传的任务书不能为空!");
        //             } else if (result == "fileempty") {
        //                 alert("上传的任务书内容不能为空!");
        //             } else {
        //                 alert("上传任务书失败!");
        //             }
        //         }
        //     })
        //
        //
        // }


    </script>
</head>
<body>

<%--<div id="assignmentBook">--%>


<%--</div>--%>

<%--<input type="button" value="提交毕业设计（论文）最终版" onclick="release()"/>--%>

<table id="dg">

</table>


<%--<form id="topic_tontent_forstudent_form" enctype="multipart/form-data">--%>

<%--    请选择要提交的材料：--%>
<%--    <input type="file" id="file" name="file"/><br>--%>
<%--    已提交的文件名为：${materialfilename}<br>--%>
<%--    <input type="submit" onclick="chose()"/>--%>


<%--</form>--%>


</body>
</html>
