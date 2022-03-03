<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/18
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
<script>
    function submit() {

        // alert("1");

        var email = $("#email").val();

        var gender = $("#gender").val();

        // alert("email:"+email);


        $.post("/information/save",{email:email,gender:gender},function (data){

            if(data == "success"){
                alert("用户信息修改成功，将在下次登陆时生效");
            }




        });

    }


</script>


</head>
<body>

    <div class="main">
        <div class="right" style="height: 30px">
            姓名：
            <input
                    type="" class="" disabled="" value="${user1.name}" readonly>
        </div>

        <div class="right" style="height: 30px">
            学号：
            <input
                    type="" class="textbox-icon-readonly" disabled="" value="${user1.identityNumber}">
        </div>


        <div class="right" style="height: 30px">
            院系：
            <input
                    type="" class="textbox-icon-readonly" disabled="" value="${user1.collegeCnName}">
        </div>

        <div class="right" style="height: 30px">
            专业：
            <input
                    type="" class="textbox-icon-readonly" disabled="" value="${user1.majorCnName}">
        </div>

        <!--<li class="clearfix margt">
    <div class="left">电话：</div>
    <div class="right"><input id="stu_phone" class="easyui-textbox" disabled="disabled" /></div>
    -->

        <div class="right" style="height: 30px">
            性别：
            <select id="gender">
                <option value="">请选择</option>
                <option
                        <c:if test="${user1.gender == '1'}">selected="selected"</c:if> value="1">男
                </option>
                <option <c:if test="${user1.gender == '2'}">selected="selected" </c:if>value="2">女</option>
            </select>

        </div>


        <div class="right" style="height: 30px">
            邮箱：
            <input id="email"
                    type="" class="" value="${user1.email}"/>
        </div>

    </div>
    <input type="button" value="确认修改" onclick="submit()">



</div>

</body>
</html>
