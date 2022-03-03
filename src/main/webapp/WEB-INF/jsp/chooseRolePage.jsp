<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/13
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>角色身份选择界面</title>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>

    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">

        $(function () {


            $("#inputForm").validate({

                submitHandler: function (form) {


                    var grade = $("#grade").val();

                    var collegeid = $("#collegeid").val();

                    var majorid = $("#majorid").val();

                    var roleId = $("#roleId").val();

                    // alert("grade:"+grade);
                    //
                    // alert("collegeid:"+collegeid);
                    //
                    // alert("majorid:"+majorid);
                    //
                    // alert("roleId:"+roleId);


                    if (grade == 0) {
                        alert("请选择年份");
                        return;
                    } else if (collegeid == 0) {
                        alert("请选择学院");
                        return;
                    } else if (majorid == 0) {
                        alert("请选择专业");
                        return;
                    }else if (roleId == 0){
                        alert("请选择角色");
                        return;
                    }

                    form.submit();


                }
            })
        })

        function getTwo() {//如果第一个下拉列表的值改变则调用此方法
            // alert("1");
            var userid = $("#id").val();

            // alert("userid:" + userid);

            var gradeid = $("#grade option:selected").attr("value");//得到第一个下拉列表的值
            var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("gradeid:" + gradeid);
            if (gradeid != null && "" != gradeid && -1 != gradeid) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/user/getCollegeByUserIdAndGradeId", {gradeid: gradeid,userid:userid}, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">' + '请选择' + '</option>';
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }

                    // $.each(res, function (i, n) {//循环，i为下标从0开始，n为集合中对应的第i个对象
                    //     option += "<option value='" + n.name + "'>" + n.name + "</option>"
                    // });
                    // alert("option:" + option);
                    //
                    //身份框值为1的是需要展示专业框的
                    //身份框值为2的是不需要展示（或者说不需要选择专业的）
                        $("#collegeid").html(option);//将循环拼接的字符串插入第二个下拉列表
                        $("#collegeid").show();//把第二个下拉列表展示

                });

            }
        }

        function getThree() {//如果第二个下拉列表的值改变则调用此方法
            var gradeid = $("#grade option:selected").attr("value");//得到第一个下拉列表的值
            var collegeid = $("#collegeid option:selected").attr("value");//得到第二个下拉列表的值
            // var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("code:" + code);
            var userid = $("#id").val();
            if (collegeid != null && "" != collegeid && -1 != collegeid) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/user/getMajorByUserIdAndGradeIdAndCollegeid", {userid:userid,gradeid:gradeid,collegeid:collegeid,}, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">' + '请选择' + '</option>';
                    for (var i = 0; i < data.length; i++) {
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

        function getFour() {//如果第二个下拉列表的值改变则调用此方法
            var gradeid = $("#grade option:selected").attr("value");//得到第一个下拉列表的值
            var collegeid = $("#collegeid option:selected").attr("value");//得到第二个下拉列表的值
            var majorid= $("#majorid option:selected").attr("value");//得到第二个下拉列表的值
            // var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("code:" + code);
            var userid = $("#id").val();
            if (collegeid != null && "" != collegeid && -1 != collegeid) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/user/getMajorByUserIdAndGradeIdAndCollegeidAndMajorId", {
                    userid: userid,
                    gradeid: gradeid,
                    collegeid: collegeid,
                    majorid:majorid
                }, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">' + '请选择' + '</option>';
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }

                    // $.each(res, function (i, n) {//循环，i为下标从0开始，n为集合中对应的第i个对象
                    //     option += "<option value='" + n.name + "'>" + n.name + "</option>"
                    // });
                    // alert("option:" + option);
                    //
                    //身份框值为1的是需要展示专业框的
                    //身份框值为2的是不需要展示（或者说不需要选择专业的）
                    $("#roleId").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#roleId").show();//把第二个下拉列表展示


                });

            } else {
                $("#roleId").hide();
            }
        }
    </script>


</head>
<body>
<form:form id="inputForm" modelAttribute="user" action="/user/enter" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <div class="control-group">
        <label class="control-label">学年:</label>
        <div class="controls">
            <form:select path="grade" class="required input-xlarge" onchange="getTwo()">
                <form:option value="0" label="请选择"/>
                <form:options items="${GradeList}" itemLabel="grade" itemValue="grade" htmlEscape="false"
                              class="required"/>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属学院:</label>
        <div class="controls">
            <form:select path="collegeid" class="required input-xlarge" onchange="getThree()">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="collegeid" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属专业:</label>
        <div class="controls">
            <form:select path="majorid" class="required input-xlarge" onchange="getFour()">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="collegeid" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">身份:</label>
        <div class="controls">
            <form:select path="roleId" class="required input-xlarge" onchange="">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="collegeid" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit"
               value="登 录"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
