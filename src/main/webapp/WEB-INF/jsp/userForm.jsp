<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/8
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>

    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">

        $(document).ready(function () {

            // $("#majorid").show();

            $("#inputForm").validate({
                rules:{
                    username: {remote: "/user/checkUsername?oldUsername=" + encodeURIComponent("${user.username}")},
                    password:{remote:"/user/checkPassword?oldPassword="+encodeURIComponent("${user.password}")},
                    // confirmpassword:{remote:"/user/checkConfirmPassword?password="+ $("#password").val()},
                    identityNumber: {remote: "/user/checkIdentityNumber?oldIdentityNumber="+encodeURIComponent("${user.identityNumber}")}
                },
                messages: {
                    username:{remote:"用户名已被使用"},
                    password: {remote: "与原密码相同"},
                    // confirmpassword: {remote: "与原密码不同"},
                    identityNumber:{remote:"该身份号已存在"}

                },
                submitHandler:function (form) {

                    var password = $("#password").val();

                    var confirmpassword = $("#confirmpassword").val();



                    var roleId = $("#roleId").val();





                    var identitys = $("#identitys").val();

                    var gender = $("#gender").val();

                    var collegeid = $("#collegeid").val();

                    var majorid = $("#majorid").val();

                    // alert("roleId:"+roleId);
                    //
                    // alert("majorid:"+majorid);

                    // var identityNumber =  $("#identityNumber").val();

                    if(password != confirmpassword){
                        alert("两次输入的密码不一致");
                        return ;
                    }
                    if (identitys == 0) {
                        alert("请选择身份");
                        return;
                    }
                    if (gender == 0) {
                        alert("请选择性别");
                        return;
                    }
                    if (collegeid == 0) {
                        alert("请选择学院");
                        return;
                    }
                    //没选专业可以理解成：可以选但没选，
                    // 即身份为非教师（因为前面已经判断过identitys不能为0）identitys != 2
                    //
                    if (majorid == 0 && identitys != 2) {
                        alert("请选择专业");
                        return;
                    }

                    // alert("password:"+password);
                    //
                    // alert("confirmpassword:"+confirmpassword);
                    //
                    // alert("identityNumber:"+identityNumber);
                    form.submit();

                }



            })


        });

        function getSecond() {//如果第一个下拉列表的值改变则调用此方法
            var code = $("#collegeid option:selected").attr("value");//得到第一个下拉列表的值
            var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("code:" + code);
            if (code != null && "" != code && -1 != code) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/user/getMajor", {code: code}, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">'+'请选择'+'</option>';
                    for(var i = 0;i < data.length;i++){
                        option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }

                    // $.each(res, function (i, n) {//循环，i为下标从0开始，n为集合中对应的第i个对象
                    //     option += "<option value='" + n.name + "'>" + n.name + "</option>"
                    // });
                    // alert("option:" + option);
                    //
                    //身份框值为1的是需要展示专业框的
                    //身份框值为2的是不需要展示（或者说不需要选择专业的）

                        $("#majorid").html(option);//将循环拼接的字符串插入第二个下拉列表
                        $("#majorid").show();//把第二个下拉列表展示

                });

            } else {
                $("#majorid").hide();
            }
        }


    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="">用户${not empty user.id?'修改':'添加'}</a></li>
</ul>

<form:form id="inputForm" modelAttribute="user" action="/user/form/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <form:hidden path="identity"/>
    <form:hidden path="uiaid"/>
    <div class="control-group">
        <div class="control-group">
            <label class="control-label">个人姓名:</label>
            <div class="controls">
                <form:input path="name" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
                <span class="help-inline"><font color="red">*</font> </span>
            </div>
        </div>
        <label class="control-label">用户名:</label>
        <div class="controls">
            <input id="oldUsername" name="oldUsername" type="hidden" value="${user.username}">
            <form:input path="username" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">密码:</label>
        <div class="controls">
            <input id="oldPassword" name="oldPassword" type="hidden" value="${user.password}">
            <form:input path="password" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">确认密码:</label>
        <div class="controls">
            <form:input path="confirmpassword" htmlEscape="false" maxlength="50" class="required input-xlarge" value = "${user.password}"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份:</label>
        <div class="controls">
            <form:select path="identitys" class="required input-xlarge" onchange="">
                <form:option value="0" >请选择</form:option>
                <form:option value="1" >学生</form:option>
                <form:option value="2" >普通教师</form:option>
                <form:option value="3" >系主任</form:option>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份号:</label>
        <div class="controls">
            <input id="oldIdentityNumber" name="oldIdentityNumber" type="hidden" value="${user.identityNumber}">
            <form:input path="identityNumber" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">性别:</label>
        <div class="controls">
            <form:select path="gender" class="required input-xlarge" onchange="">
                <form:option value="0">请选择</form:option>
                <form:option value="1">男</form:option>
                <form:option value="2">女</form:option>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属年级:</label>
        <div class="controls">
            <form:input path="grade" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">邮箱:</label>
        <div class="controls">
            <form:input path="email" htmlEscape="false" maxlength="50" class="required input-xlarge"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">所属学院:</label>
        <div class="controls">
            <form:select path="collegeid" class="required input-xlarge" onchange="getSecond()">
                <form:option value="0" label="请选择"/>
                <form:options items="${UserParentOffice}" itemLabel="name" itemValue="id" htmlEscape="false"
                              class="required"/>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class = "control-group">
        <label class="control-label">所属专业:</label>
        <div class="controls">
            <form:select path="majorid" class="required input-xlarge" value = "${user.majorid}">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="collegeid" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">用户角色:</label>
        <div class="controls">
            <form:radiobuttons path="roleId" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false"
                             class="required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit"
               value="保 存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>


</body>
</html>
