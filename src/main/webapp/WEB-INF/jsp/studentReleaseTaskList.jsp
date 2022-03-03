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
                title: "选题信息列表",
                url: "/task/student/releasetaskListData",
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
                    {field: 'id', title: '选题ID', width: 200, hidden: true, align: 'center'},
                    {field: 'topic', title: '题目', width: 200, align: 'center'},
                    {field: 'collegeId', title: '题目所属院系', width: 200, align: 'center'},
                    {field: 'type', title: '题目类型', width: 200, align: 'center'},
                    {field: 'source', title: '题目来源', width: 200, align: 'center'},

                    {field: 'teachername', title: '指导教师', width: 200, align: 'center'},
                    {field: 'teacherId', title: '指导教师编号', width: 200, align: 'center'},
                    {field: 'majorname', title: '教研室', width: 200, align: 'center'},
                    {field: 'teacherchoosestatus', title: '审核状态', width: 200, align: 'center'},
                    {field: 'teacherchoosestatusId', title: '审核状态ID', width: 200, align: 'center'},
                    {field: 'createDate', title: '申报时间', width: 200, align: 'center'},
                    // {
                    //     field: 'auditStatusId',
                    //     title: "审核状态id",
                    //     width: 200,
                    //     hidden: true,
                    //     align: 'center'
                    // },
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
            if(row.teacherchoosestatusId == 1){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' > 查看详情 </a>&nbsp;<a target = '_self' style = 'text-decoration:none'href='/task/student/modifytopic?id=" + row.id + "' > 修改 </a>&nbsp;<a target = '_self' style = 'text-decoration:none'href='/task/student/delete?id=" + row.id + "' > 删除 </a>"
            }else if (row.teacherchoosestatusId == 3){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' > 查看详情 </a>&nbsp;<a target = '_self' style = 'text-decoration:none'href='/task/student/modifytopic?id=" + row.id + "' > 修改后提交 </a>"
            }



            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }




        // function opentable() {
        //     // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
        //     window.location.href = '/user/form';
        // }

        function release() {

            $.post("/task/teacher/judge/haschosenAndPass/", {studentId: '${user.id}'}, function (data) {

                if (data > 0) {
                    alert("您已选题，不能继续申报题目");
                    return;
                } else {
                    // window.location.href = '/teacher/task/chosenstudent?taskid=' + taskid + '&choosestatusId=' + choosestatusId + '&studentId=' + studentId + '&status=2';
                    window.location.href = '/task/student/releasetopic/form';
                }


            });





        }


    </script>
</head>
<body>



<input type="button" value="申报题目" onclick="release()"/>
<%--<input type="button" value="添加用户" onclick="opentable()"></input>--%>
<table id="dg"></table>
</body>
</html>