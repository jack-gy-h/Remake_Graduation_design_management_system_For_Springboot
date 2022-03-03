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
        var office = '';
        var topic = '';
        var teacher = '';
        var teacheridentitynumber = '';
        var type = '';
        var source = '';
        $(function () {
            loadData();


        });

        function judge(taskid, choosestatusId, studentId, status) {
            // alert("taskid:"+taskid);
            // alert("choosestatusId:"+choosestatusId);
            // alert("studentId:"+studentId);
            // alert("status:"+status);

            $.post("/task/teacher/judge/haschosenAndPass/", {studentId:studentId}, function (data) {

                if (data > 0) {
                    alert("该学生已有选题，请退选");
                    return;
                }else {
                    window.location.href = '/teacher/task/chosenstudent?taskid=' + taskid+ '&choosestatusId=' + choosestatusId + '&studentId=' + studentId + '&status=2&studentrelease=1&auditstatus=1';
                }






            });



        }

        function loadData(office, topic, teacher, teacheridentitynumber, type, source) {
            $("#dg").datagrid({
                title: "审核学生申报题目信息列表",
                url: "/task/viewauditstudentreleaseListData",
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
                    {field: 'topic', title: '题目', width: 200, align: 'center'},
                    {field: 'studentname', title: '学生名', width: 200, align: 'center'},
                    {field: 'teacherchoosestatus', title: '选题状态', width: 200, align: 'center'},
                    {field: 'teacherchoosestatusId', title: "选题状态id", width: 200, hidden: true, align: 'center'},
                    {field: 'studentId', title: "学生id", width: 200, hidden: true, align: 'center'},
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle}

                    // {field: 'grade', title: "年级ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'collegeid', title: "学院ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'majorid', title: "专业ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'roleId', title: "角色Id", width: 200, hidden: true, align: 'center'}
                    //identitysid
                    // {field: 'userAdmin', title: '身份', width: 200, align: 'center'}
                    //    ， formatter: btnDetailed
                ]],
                queryParams:
                    {
                        office: office,
                        topic: topic,
                        teacher: teacher,
                        teacheridentitynumber: teacheridentitynumber,
                        type: type,
                        source: source
                    }

            })
        }

        function search() {
            var office = $("#office").val();
            var topic = $("#topic").val();
            var teacher = $("#teacher").val();
            var teacheridentitynumber = $("#teacheridentitynumber").val();
            var type = $("#type").val();
            var source = $("#source").val();
            // alert("selectname:" + selectname);
            // params.name = name ;
            loadData(office, topic, teacher, teacheridentitynumber, type, source);

        }

        function formatTitle(val, row) {
            if (row.teacherchoosestatusId == 1) {
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' >查看详情 </a>&nbsp;<a target = '_self'   style = 'text-decoration:none'href = 'javascript:judge(\"" + row.id + "\",\"" + row.teacherchoosestatusId+"\",\""+ row.studentId+"\",2)' > 通过 </a>&nbsp;<a target = '_self'   style = 'text-decoration:none'href = '/teacher/task/chosenstudent?taskid=" + row.id + "&choosestatusId=" + row.teacherchoosestatusId + "&studentId=" + row.studentId + "&status=3&studentrelease=1&auditstatus=2' > 不通过 </a>"
            }else if(row.teacherchoosestatusId == 2){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' >查看详情 </a><a target = '_self'   style = 'text-decoration:none'href = '/teacher/task/chosenstudent?taskid=" + row.id + "&choosestatusId=" + row.teacherchoosestatusId + "&studentId=" + row.studentId + "&status=3&studentrelease=1&auditstatus=2' > 更改为不通过 </a>"
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