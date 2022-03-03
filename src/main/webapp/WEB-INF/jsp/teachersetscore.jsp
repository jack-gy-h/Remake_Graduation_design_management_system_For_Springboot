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

        function openUserAddDialog() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要添加的数据！");
                return;
            }
            var row = selectedRows[0];
            // alert("row.id:"+row.id);
            $("#dlg").dialog("open").dialog("setTitle", "添加学生指导成绩");
            // // $("#fm").form("load", row);
            url = "/task/teacher/set/score?id=" + row.id;
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
                        $.messager.alert("系统提示", "保存成功！");
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    } else if (result == "falseadd") {
                        $.messager.alert("系统提示", "已添加成绩，请勿重复添加");

                    } else if (result == "illegal") {
                        $.messager.alert("系统提示", "填写的分数不合法");

                    } else {
                        $.messager.alert("系统提示", "保存失败！");
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
            $("#score").val("");

        }

        function openUserModifyDialog() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg1").dialog("open").dialog("setTitle", "修改指导成绩信息");
            $("#fm1").form("load", row);
            url = "/task/teacher/modify/score?id=" + row.id;
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
                        $.messager.alert("系统提示", "保存成功！");
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    } else if (result == "illegal") {
                        $.messager.alert("系统提示", "填写的分数不合法");

                    } else {
                        $.messager.alert("系统提示", "保存失败！");
                        return;
                    }
                }
            });
        }

        function closeUserDialog1() {
            $("#dlg1").dialog("close");
            resetValue();
        }



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
                toolbar: "#tb",
                // showHeader:false,
                //studentId
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: '选题ID', width: 200, hidden: true, align: 'center'},
                    {field: 'topic', title: '题目名', width: 200, align: 'center'},
                    {field: 'studentname', title: '学生名', width: 200, align: 'center'},
                    {field: 'pattern', title: '选题模式', width: 200, align: 'center'},
                    {field: 'score', title: '成绩', width: 200, align: 'center'},
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


            return "<a target = '_self'   style = 'text-decoration:none'href = '/task/downloadmaterial?id=" + row.id + "' > 提交学生成绩 </a> "
            // if(row.materialName == null){
            //
            // }else if(row.materialName != null){
            //     return "<a target = '_self'   style = 'text-decoration:none'href = '/task/downloadmaterial?id=" +row.id + "' > 下载相关材料 </a> "
            // }


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
<div id="tb">
    <div>

            <a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit"
               plain="true">修改</a>


    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width:500px;height:400px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">

    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>成绩</td>
                <td><input type="text" id="score" name="score" class="easyui-validatebox" required="true"/>
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
                <td>成绩</td>
                <td><input type="text" id="topicScore1" name="score" class="easyui-validatebox" required="true"/>
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