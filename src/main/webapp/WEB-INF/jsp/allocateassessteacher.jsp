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
        var studentname = '';
        var studentidentitynumber = '';
        var teachername = '';
        var teacheridentitynumber = '';
        var topic = '';
        var assessTeachername = '';
        var assessTeacheridentitynumber = '';
        $(function () {
            loadData();
            $.post("/data/user", {majorId: '${user.majorid}', identitys: 2, usergrade: '${user.grade}'}, function (data) {
                var res = $.parseJSON(data);//把后台传回的json数据解析
                var option = '';
                option = '<option value="0">' + '请选择' + '</option>';
                for (var i = 0; i < data.length; i++) {
                    option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                }

                $("#assessTeacher").html(option);//将循环拼接的字符串插入第二个下拉列表
                $("#assessTeacher").show();//把第二个下拉列表展示
                $("#assessTeacher1").html(option);//将循环拼接的字符串插入第二个下拉列表
                $("#assessTeacher1").show();//把第二个下拉列表展示

                // $.each(res, function (i, n) {//循环，i为下标从0开始，n为集合中对应的第i个对象
                //     option += "<option value='" + n.name + "'>" + n.name + "</option>"
                // });
                // alert("option:" + option);
                //
                //身份框值为1的是需要展示专业框的
                //身份框值为2的是不需要展示（或者说不需要选择专业的）
                // if (identitys == 1 || identitys == 3) {
                //     $("#majorid").html(option);//将循环拼接的字符串插入第二个下拉列表
                //     $("#majorid").show();//把第二个下拉列表展示
                // } else if (identitys == 0 || identitys == 2) {
                //     $("#majorid").hide();
                // }

            });


        });

        function loadData(studentname, studentidentitynumber, teachername, teacheridentitynumber, topic, assessTeachername, assessTeacheridentitynumber) {
            $("#dg").datagrid({
                title: "为学生分配审核教师列表",
                url: "/task/allocate/assessteacherListData",
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
                toolbar:"#tb",
                // showHeader:false,
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: '选题ID', width: 200, hidden: true, align: 'center'},
                    {field: 'studentname', title: '学生姓名', width: 200, align: 'center'},
                    {field: 'studentidentitynumber', title: '学生学号', width: 200, align: 'center'},
                    {field: 'teachername', title: '指导教师姓名', width: 200, align: 'center'},
                    {field: 'teacheridentitynumber', title: '指导教师编号', width: 200, align: 'center'},

                    {field: 'topic', title: '课题题目', width: 200, align: 'center'},
                    {field: 'assessTeachername', title: '评阅教师姓名', width: 200, align: 'center'},
                    {field: 'assessTeacheridentitynumber', title: '评阅教师编号', width: 200, align: 'center'},
                    // {field: 'auditStatus', title: '审核状态', width: 200, align: 'center'},
                    {field: 'assessScore', title: '评阅专家成绩', width: 200, align: 'center'},
                    // {
                    //     field: 'auditStatusId',
                    //     title: "审核状态id",
                    //     width: 200,
                    //     hidden: true,
                    //     align: 'center'
                    // },
                    {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle}

                    // {field: 'grade', title: "年级ID", width: 200, hidden: true, align: 'center'}
                    // {field: 'collegeid', title: "学院ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'majorid', title: "专业ID", width: 200, hidden: true, align: 'center'},
                    // {field: 'roleId', title: "角色Id", width: 200, hidden: true, align: 'center'}
                    //identitysid
                    // {field: 'userAdmin', title: '身份', width: 200, align: 'center'}
                    //    ， formatter: btnDetailed
                ]],
                queryParams:
                    {
                        studentname: studentname,
                        studentidentitynumber: studentidentitynumber,
                        teachername: teachername,
                        teacheridentitynumber: teacheridentitynumber,
                        topic: topic,
                        assessTeachername: assessTeachername,
                        assessTeacheridentitynumber: assessTeacheridentitynumber
                    }

            })
        }



        function search() {
            var studentname = $("#studentname").val();

            // alert("studentname:"+studentname);

            var studentidentitynumber = $("#studentidentitynumber").val();
            var teachername = $("#teachername").val();
            var teacheridentitynumber = $("#teacheridentitynumber").val();
            var topic = $("#topic").val();
            var assessTeachername = $("#assessTeachername").val();
            var assessTeacheridentitynumber = $("#assessTeacheridentitynumber").val();
            // alert("selectname:" + selectname);
            // params.name = name ;
            loadData(studentname,studentidentitynumber,teachername,teacheridentitynumber,topic,assessTeachername,assessTeacheridentitynumber);

        }

        function allocate() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要操作的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].id);
            }
            var idss = strIds.join(",");
            $.messager.confirm("系统提示", "您确定要分配这<font color=red>" + selectedRows.length + "</font>个学生吗？", function (r) {
                if (r) {
                    $("#dlg1").dialog("open").dialog("setTitle", "分配评阅教师");
                    // // $("#fm").form("load", row);
                    url = "/task/director/set/assessTeacher?idss="+idss+"&assessteacherstatus=1";


                    // $.post("/task/director/set/assessTeacher?assessteacherstatus=1", {idss: idss}, function (data) {
                    //
                    //     $("#dg").datagrid("reload");
                    //
                    //
                    // });
                }
            });
        }


        function formatTitle(val, row) {
            if(row.assessTeacheridentitynumber == null){

                return "<a target = '_self'   style = 'text-decoration:none'href = 'javascript:openUserAddDialog(\""+ row.id+"\")' > 选择评阅专家 </a>"

            }else{
                if(row.assessScore == null){
                    return "<a target = '_self'   style = 'text-decoration:none'href = 'javascript:openUserAddDialog(\"" + row.id + "\")' > 选择评阅专家 </a><br><a target = '_self'   style = 'text-decoration:none'href = 'javascript:deleteassessTeacher(\"" + row.id + "\")' > 取消已选择评阅专家</a>"
                }else {
                    return "已给分数";
                }

            }



            // return "<a target='_self' style='text-decoration:none' href='/user/addUserRoleForm?userid=" + row.id + "'>添加用户角色</a> <a target='_self' style='text-decoration:none' href='/user/deleteUserRoleForm?userid=" + row.id + "&identitysid=" + row.identitysid + "&grade=" + row.grade + "&collegeid=" + row.collegeid + "&majorid=" + row.majorid + "&roleid=" + row.roleId + "'>删除</a>"
        }

        function openUserAddDialog(taskid) {
            // var selectedRows = $("#dg").datagrid("getSelections");
            // var row = selectedRows[0];
            // alert("row.id:"+row.id);
            $("#dlg").dialog("open").dialog("setTitle", "分配评阅教师");
            // // $("#fm").form("load", row);
            url = "/task/director/set/assessTeacher?taskid=" + taskid+"&assessteacherstatus=1";
        }

        function saveUser() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    // var result = eval('(' + result + ')');
                    if (result == "success") {
                        alert("分配评阅教师成功！");
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    } else if (result == "falseadd") {
                        alert("已有评阅教师，请勿重复添加");

                    }else if(result == "false"){

                        alert("分配的评阅教师为指导教师，请重新选择");

                    }

                    else {
                        alert("操作失败！");
                        return;
                    }
                }
            });
        }

        function closeUserDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }

        function resetValue() {
            $("#assessTeacher").val("0");

        }

        function deleteassessTeacher(taskid) {

            $.post("/task/director/set/assessTeacher?taskid=" + taskid + "&assessteacherstatus=2", {}, function (data) {
                // var result = eval('(' + result + ')');
                if (data == "success") {
                    alert("取消已选择评阅教师成功！");
                    window.location.reload();
                }else {
                    alert("取消已选择评阅教师失败！");
                    return;
                }

            });



        }

        function saveUser1() {
            $("#fm1").form("submit", {
                url: url,
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    // var result = eval('(' + result + ')');
                    if (result == "success") {
                        alert("分配评阅教师成功！");
                        resetValue1();
                        $("#dlg1").dialog("close");
                        $("#dg").datagrid("reload");
                    } else {
                        alert("操作失败！");
                        return;
                    }
                }
            });
        }

        function closeUserDialog1() {
            $("#dlg1").dialog("close");
            resetValue1();
        }

        function resetValue1() {
            $("#assessTeacher1").val("0");

        }




        // function opentable() {
        //     // $("#home")[0].innerHTML = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='/index'></iframe>"
        //     window.location.href = '/user/form';
        // }


    </script>
</head>
<body>
<%--<table id="dg1"></table>--%>
学生姓名：<input class="easyui-textbox" id="studentname" style="width:150px;height:32px;">

学生学号：<input class="easyui-textbox" id="studentidentitynumber" style="width:150px;height:32px;">

指导教师姓名：<input class="easyui-textbox" id="teachername" style="width:150px;height:32px;">

指导教师编号：<input class="easyui-textbox" id="teacheridentitynumber" style="width:150px;height:32px;"><br>

课题题目：<input class="easyui-textbox" id="topic" style="width:150px;height:32px;">

评阅教师姓名：<input class="easyui-textbox" id="assessTeachername" style="width:150px;height:32px;">

评阅教师编号：<input class="easyui-textbox" id="assessTeacheridentitynumber" style="width:150px;height:32px;">


<input type="button" value="搜索" onclick="search()"/>

<div id="tb">
    <div>
        <a href="javascript:allocate()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">一键分配评阅专家</a>
    </div>
</div>
<%--<input type="button" value="添加用户" onclick="opentable()"></input>--%>
<table id="dg"></table>
<div id="dlg" class="easyui-dialog" style="width:500px;height:400px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">

    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>相应教师</td>
                <td><select id="assessTeacher" name="assessTeacher"></select>
                </td>
            </tr>

            <%--一个表单下，如果只有一个文本框时，按下回车将会触发表单的提交事件，加上hiddentext可以防止提交--%>
            <input id="hiddenText" type="text" style="display:none"/>
        </table>
    </form>


</div>
<div id="dlg-buttons">
    <a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>

<div id="dlg1" class="easyui-dialog" style="width:500px;height:400px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons1">

    <form id="fm1" method="post">
        <table cellspacing="8px">
            <tr>
                <td>相应教师</td>
                <td><select id="assessTeacher1" name="assessTeacher"></select>
                </td>
            </tr>

            <%--一个表单下，如果只有一个文本框时，按下回车将会触发表单的提交事件，加上hiddentext可以防止提交--%>
            <input id="hiddenText" type="text" style="display:none"/>
        </table>
    </form>


</div>
<div id="dlg-buttons1">
    <a href="javascript:saveUser1()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeUserDialog1()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>