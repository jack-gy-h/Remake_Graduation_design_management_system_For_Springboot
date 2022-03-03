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
            loadData1();


        });

        function loadData(office, topic, teacher, teacheridentitynumber, type, source) {
            $("#dg").datagrid({
                title: "选题信息列表",
                url: "/task/student/doubletaskListData",
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
                    // {field: 'auditStatus', title: '审核状态', width: 200, align: 'center'},
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

        function loadData1() {
            $("#dg1").datagrid({
                title: "已选信息列表",
                url: "/task/student/haschosendoubletaskListData",
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
                    {field: 'type', title: '题目类型', width: 200, align: 'center'},
                    {field: 'source', title: '题目来源', width: 200, align: 'center'},
                    {field: 'teachername', title: '指导教师', width: 200, align: 'center'},
                    {field: 'teacherId', title: '指导教师编号', width: 200, align: 'center'},
                    {field: 'teacherchoosestatus', title: '确认状态', width: 200, align: 'center'},
                    // {field: 'auditStatus', title: '审核状态', width: 200, align: 'center'},
                    // {field: 'createDate', title: '申报时间', width: 200, align: 'center'},
                    // {
                    //     field: 'auditStatusId',
                    //     title: "审核状态id",
                    //     width: 200,
                    //     hidden: true,
                    //     align: 'center'
                    // },
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle1},

                    {field: 'teacherchoosestatusId', title: "确认状态Id", width: 200, hidden: true, align: 'center'}
                    // {field: 'collegeid', title: "学院ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'majorid', title: "专业ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'roleId', title: "角色Id", width: 200, hidden: true, align: 'center'}
                    //identitysid
                    // {field: 'userAdmin', title: '身份', width: 200, align: 'center'}
                    //    ， formatter: btnDetailed
                ]]

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

        function jsmethod(taskid) {


            $.post("/task/student/judge/chosenpeople",{taskid:taskid},function (data) {

                if(data>0){
                    alert("该题目已经有人选择，请选择其他题目");

                }else{

                    $.post("/task/student/judge/haschosenAndPass", {}, function (data) {

                        if (data > 0) {
                            alert("您已经有选题，无法重复选题");
                            return;
                        } else {
                            $.post("/task/student/judge/haschosenThree", {}, function (data) {

                                if (data >= 3) {
                                    alert("您已选择了三个题目，无法继续选题");
                                    return;
                                } else {
                                    $.post("/task/student/judge/haschosenPeople", {taskid: taskid}, function (data) {

                                        if (data > 3) {
                                            alert("选择的人数超过三个，请选择其他题目");
                                            return;
                                        } else {
                                            $.post("/task/student/judge/whetherchoosethistask", {taskid: taskid}, function (data) {
                                                if (data > 0) {
                                                    alert("您已选择过该题目，请勿重复选择");
                                                    return;
                                                } else {
                                                    window.location.href = '/task/student/double/choose?taskid=' + taskid;
                                                }

                                            })

                                        }


                                    });
                                }


                            });
                        }


                    });



                }


            })
            // alert(1);









        }

        function formatTitle(val, row) {
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' > 查看详情 </a>&nbsp;<a target = '_self' style = 'text-decoration:none'href='javascript:jsmethod(\""+row.id+"\")' > 选择题目 </a>"


            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }

        function formatTitle1(val, row) {
            if(row.teacherchoosestatusId == 2|| row.teacherchoosestatusId == 3){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' > 查看详情 </a>"
            }else if(row.teacherchoosestatusId == 1){
                return "<a target = '_self'   style = 'text-decoration:none'href = '/task/student/viewtopic?id=" + row.id + "' > 查看详情 </a>&nbsp;<a target = '_self' style = 'text-decoration:none'href='/task/student/deletehaschosentopic?taskid="+row.id+"' > 取消选择选题 </a>"

            }




            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }


        // function opentable() {
        //     // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
        //     window.location.href = '/user/form';
        // }


    </script>
</head>
<body>
<table id="dg1"></table>
题目所属院系：
<select id="office" name="office">
    <option value="0">请选择
    </option>

    <c:forEach items="${UserParentOffice}" var="office">

        <option value="${office.id}">${office.name}</option>

    </c:forEach>

</select>
题目：<input class="easyui-textbox" id="topic" style="width:150px;height:32px;">

教师：<input class="easyui-textbox" id="teacher" style="width:150px;height:32px;">

教师编号：<input class="easyui-textbox" id="teacheridentitynumber" style="width:150px;height:32px;">

题目类型：
<select id="type" name="type">
    <option value="0">请选择</option>
    <option value="1">应用研究
    </option>
    <option value="2">其他
    </option>
    <option value="3">软件设计
    </option>
    <option value="4">艺术设计
    </option>
    <option value="5">工程设计
    </option>
    <option value="6">实验研究
    </option>
    <option value="7">理论研究
    </option>

</select>

题目来源：
<select id="source" name="source" class="input-xlarge">

    <option value="0">请选择</option>
    <option value="1">学生社会调查
    </option>
    <option value="2">学生实验、实习、工程实践
    </option>
    <option value="3">教师社会调查
    </option>
    <option value="4">其他
    </option>
    <option value="5">教师实验、实习、工程实践
    </option>
    <option value="6">教师科研题
    </option>


</select>


<input type="button" value="搜索" onclick="search()"/>
<%--<input type="button" value="添加用户" onclick="opentable()"></input>--%>
<table id="dg"></table>
</body>
</html>