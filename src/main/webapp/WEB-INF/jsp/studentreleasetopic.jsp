<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/13
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>release_topic</title>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>

    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>


    <script type="text/javascript">

        $(function () {
            $.post("/data/UserParentOffice", {}, function (data) {
                var res = $.parseJSON(data);//把后台传回的json数据解析
                var option = '';
                option = '<option value="0">' + '请选择' + '</option>';
                for (var i = 0; i < data.length; i++) {
                    option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                }

                $("#collegeId").html(option);//将循环拼接的字符串插入第二个下拉列表
                $("#collegeId").show();//把第二个下拉列表展示

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



            $("#inputForm").validate({

                submitHandler: function (form) {

                    var type = $("#type").val();

                    var source = $("#source").val();

                    if (type == 0) {
                        alert("请填写题目类型");
                        return;
                    } else if (source == 0) {
                        alert("请填写题目来源");
                        return;
                    } else if (canbechosencollegeid == 0) {
                        alert("请选择可选专业");
                        return;
                    }

                    form.submit();


                }
            })














        });


        //获取学院下相应的专业
        function getSecond() {//如果第一个下拉列表的值改变则调用此方法
            var code = $("#collegeId option:selected").attr("value");//得到第一个下拉列表的值
            // var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("code:" + code);
            if (code != null && "" != code && -1 != code) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/user/getMajor", {code: code}, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">' + '请选择' + '</option>';
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }

                    $("#majorId").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#majorId").show();//把第二个下拉列表展示

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

            }
            // else {
            //     $("#majorid").hide();
            // }
        }

        function getThree() {//如果第一个下拉列表的值改变则调用此方法
            var majorId = $("#majorId option:selected").attr("value");//得到第一个下拉列表的值
            // var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
            // alert("majorId:" + majorId);
            if (majorId != null && "" != majorId && -1 != majorId) {
                //通过ajax传入后台，把orderTypeName数据传到后端
                $.post("/data/user", {majorId: majorId,identitys:2,usergrade: '${usergrade}'}, function (data) {
                    var res = $.parseJSON(data);//把后台传回的json数据解析
                    var option = '';
                    option = '<option value="0">' + '请选择' + '</option>';
                    for (var i = 0; i < data.length; i++) {
                        option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
                    }

                    $("#teachername").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#teachername").show();//把第二个下拉列表展示

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

            }
            // else {
            //     $("#majorid").hide();
            // }
        }



    </script>
</head>
<body>

<form:form id="inputForm" modelAttribute="task" action="/task/student/release/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <form:hidden path="pattern"/>
    <form:hidden path="teacherId"/>
    <form:hidden path="grade"/>
    <%--    <form:hidden path="createDate"/>--%>
    <c:if test="${task.createDate != null}"> <form:hidden path="createDate"/></c:if>
    <form:hidden path="delFlag"/>
    <div class="control-group">
        <label class="control-label">课题题目：</label>
        <div class="controls">
            <form:textarea path="topic" htmlEscape="false" rows="2" maxlength="2000" class="input-xxlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">所属学院:</label>
        <div class="controls">
            <form:select path="collegeId" class="required input-xlarge" onchange="getSecond()">
<%--                <form:option value="0" label="请选择"/>--%>
<%--                <form:options items="${UserParentOffice}" itemLabel="name" itemValue="id" htmlEscape="false"--%>
<%--                              class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属专业:</label>
        <div class="controls">
            <form:select path="majorId" class="required input-xlarge" onchange="getThree()">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="Office" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">教师名称:</label>
        <div class="controls">
            <form:select path="teachername" class="required input-xlarge" onchange="">
                <%--            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="Office" htmlEscape="false"--%>
                <%--                          class="required"/>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">题目类型:</label>
        <div class="controls">
            <form:select path="type" class="required input-xlarge" onchange="">
                <%--                <form:option value="0" label="请选择"/>--%>
                <%--                <form:option value="1" label="全校"/>--%>
                <%--                <form:option value="2" label="部分专业"/>--%>
                <%--                <form:option value="3" label="所属专业"/>--%>
                <option value="0">请选择</option>
                <option value="1" <c:if test="${task.type == 1}"> selected = "selected"</c:if>>应用研究
                </option>
                <option value="2" <c:if test="${task.type == 2}"> selected = "selected"</c:if>>其他
                </option>
                <option value="3" <c:if test="${task.type == 3}"> selected = "selected"</c:if>>软件设计
                </option>
                <option value="4" <c:if test="${task.type == 4}"> selected = "selected"</c:if>>艺术设计
                </option>
                <option value="5" <c:if test="${task.type == 5}"> selected = "selected"</c:if>>工程设计
                </option>
                <option value="6" <c:if test="${task.type == 6}"> selected = "selected"</c:if>>实验研究
                </option>
                <option value="7" <c:if test="${task.type == 7}"> selected = "selected"</c:if>>理论研究
                </option>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">题目来源:</label>
        <div class="controls">
            <form:select path="source" class="required input-xlarge" onchange="">
                <%--                <form:option value="0" label="请选择"/>--%>
                <%--                <form:option value="1" label="全校"/>--%>
                <%--                <form:option value="2" label="部分专业"/>--%>
                <%--                <form:option value="3" label="所属专业"/>--%>
                <option value="0">请选择</option>
                <option value="1" <c:if test="${task.source == 1}"> selected = "selected"</c:if>>学生社会调查
                </option>
                <option value="2" <c:if test="${task.source == 2}"> selected = "selected"</c:if>>学生实验、实习、工程实践
                </option>
                <option value="3" <c:if test="${task.source == 3}"> selected = "selected"</c:if>>教师社会调查
                </option>
                <option value="4" <c:if test="${task.source == 4}"> selected = "selected"</c:if>>其他
                </option>
                <option value="5" <c:if test="${task.source == 5}"> selected = "selected"</c:if>>教师实验、实习、工程实践
                </option>
                <option value="6" <c:if test="${task.source == 6}"> selected = "selected"</c:if>>教师科研题
                </option>
                <%--                <option value="7" <c:if test="${task.canbechosencollegeid == 3}"> selected = "selected"</c:if>>--%>
                <%--                </option>--%>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>

<%--    <div class="control-group">--%>
<%--        <label class="control-label">可选专业:</label>--%>
<%--        <div class="controls">--%>
<%--            <form:select path="canbechosencollegeid" class="required input-xlarge" onchange="getThree()">--%>
<%--                &lt;%&ndash;                <form:option value="0" label="请选择"/>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                <form:option value="1" label="全校"/>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                <form:option value="2" label="部分专业"/>&ndash;%&gt;--%>
<%--                &lt;%&ndash;                <form:option value="3" label="所属专业"/>&ndash;%&gt;--%>
<%--                <option value="0">请选择</option>--%>
<%--                <option value="1" <c:if test="${task.canbechosencollegeid == 1}"> selected = "selected"</c:if>>全校--%>
<%--                </option>--%>
<%--                <option value="2" <c:if test="${task.canbechosencollegeid == 2}"> selected = "selected"</c:if>>部分专业--%>
<%--                </option>--%>
<%--                <option value="3" <c:if test="${task.canbechosencollegeid == 3}"> selected = "selected"</c:if>>所属专业--%>
<%--                </option>--%>
<%--                &lt;%&ndash;            <form:option value="1" label="系统用户"/>&ndash;%&gt;--%>
<%--            </form:select>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="control-group">--%>
<%--        <label class="control-label"></label>--%>
<%--        <div class="controls">--%>
<%--                &lt;%&ndash;            <div id="officeTree" class="ztree" style="margin-top:3px;float:left;"></div>&ndash;%&gt;--%>
<%--            <form:hidden path="officeIds"/>--%>
<%--            <div id="officeTree" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>--%>
<%--            <div id="officeTree1" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>--%>
<%--                &lt;%&ndash;        <form:hidden path="officeIds"/>&ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="control-group">
        <label class="control-label">研究方向：</label>
        <div class="controls">
            <form:textarea path="researchDirection" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">题目简介：</label>
        <div class="controls">
            <form:textarea path="briefIntroduction" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">基本要求：</label>
        <div class="controls">
            <form:textarea path="basicRequirements" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">参考资料：</label>
        <div class="controls">
                <%--            <form:input path="referenceData" htmlEscape="false" maxlength="50" class="required input-xlarge"/>--%>
            <form:textarea path="referenceData" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required"/>
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
