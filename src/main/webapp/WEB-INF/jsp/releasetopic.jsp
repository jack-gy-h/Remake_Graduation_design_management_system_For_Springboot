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

            $("#inputForm").validate({

                submitHandler: function (form) {

                    var canbechosencollegeid = $("#canbechosencollegeid").val();

                    if (canbechosencollegeid == 1) {

                        var ids = [], nodes = tree1.getCheckedNodes(true);
                        // alert("1");
                        for (var i = 0; i < nodes.length; i++) {

                            if (nodes[i].isParent == false) {
                                ids.push(nodes[i].id);
                            }


                            // ids.push(nodes[i].id);


                        }
                        // alert("ids:"+ids);
                        //少了这一行相当于不更新menuids也就无法更新数据
                        $("#officeIds").val(ids);


                    } else if (canbechosencollegeid == 2) {

                        var ids = [], nodes = tree.getCheckedNodes(true);
                        // alert("1");
                        for (var i = 0; i < nodes.length; i++) {

                            if (nodes[i].isParent == false) {
                                ids.push(nodes[i].id);
                            }


                            // ids.push(nodes[i].id);

                            $("#officeIds").val(ids);


                        }

                    } else if (canbechosencollegeid == 3) {


                        var ids = $("#majorId").val();

                        $("#officeIds").val(ids);
                    }

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


            var setting = {
                check: {
                    enable: true,
                    nocheckInherit: true,
                    chkStyle: "checkbox",
                    chkboxType: {"Y": "s", "N": "ps"}
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                }
            };


//                部分专业可选时的ztree
// 用户-菜单
            var zNodes = [
                    <c:forEach items="${officeList}" var="office">{
                    id: "${office.id}",
                    pId: "${office.parent.id}",
                    name: "${office.name}"
                },
                </c:forEach>];

// 初始化树结构
            var tree = $.fn.zTree.init($("#officeTree"), setting, zNodes);

            // tree.checkAllNodes(true);
// 不选择父节点
//             tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};
            <%--// 默认选择节点--%>
            var ids = "${task.officeIds}".split(",");

            // alert("ids:"+ids);

            for (var i = 0; i < ids.length; i++) {
                var node = tree.getNodeByParam("id", ids[i]);
                try {
                    tree.checkNode(node, true, false);
                } catch (e) {
                }
            }


            //全校专业隐藏的ztree1

            var tree1 = $.fn.zTree.init($("#officeTree1"), setting, zNodes);

            tree1.checkAllNodes(true);

            tree1.expandAll(true);

            $("#officeTree1").hide();


            var code = $("#canbechosencollegeid option:selected").attr("value");//得到第一个下拉列表的值
            // alert("code:" + code);
            if (code == 2) {

                $("#officeTree").show();


// 默认展开全部节点
//                 tree.expandAll(true);


            } else {
                $("#officeTree").hide();
            }


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


        <%--        当选择部分专业时才显示，否则要隐藏  --%>

        function getThree() {//如果第一个下拉列表的值改变则调用此方法

            var code = $("#canbechosencollegeid option:selected").attr("value");//得到第一个下拉列表的值
            // alert("code:" + code);
            if (code == 2) {
                $("#officeTree").show();

                <%--                var setting = {--%>
                <%--                    check: {--%>
                <%--                        enable: true,--%>
                <%--                        nocheckInherit: true,--%>
                <%--                        chkStyle: "checkbox",--%>
                <%--                        chkboxType: {"Y": "s", "N": "ps"}--%>
                <%--                    },--%>
                <%--                    data: {--%>
                <%--                        simpleData: {--%>
                <%--                            enable: true--%>
                <%--                        }--%>
                <%--                    }--%>
                <%--                };--%>
                <%--// 用户-菜单--%>
                <%--                var zNodes = [--%>
                <%--                        <c:forEach items="${officeList}" var="office">{--%>
                <%--                        id: "${office.id}",--%>
                <%--                        pId: "${office.parent.id}",--%>
                <%--                        name: "${office.name}"--%>
                <%--                    },--%>
                <%--                    </c:forEach>];--%>

                <%--// 初始化树结构--%>
                <%--                var tree = $.fn.zTree.init($("#officeTree"), setting, zNodes);--%>
                <%--// 不选择父节点--%>
                <%--//             tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};--%>
                <%--                &lt;%&ndash;// 默认选择节点&ndash;%&gt;--%>
                <%--                var ids = "${task.officeIds}".split(",");--%>

                <%--                // alert("ids:"+ids);--%>

                <%--                for (var i = 0; i < ids.length; i++) {--%>
                <%--                    var node = tree.getNodeByParam("id", ids[i]);--%>
                <%--                    try {--%>
                <%--                        tree.checkNode(node, true, false);--%>
                <%--                    } catch (e) {--%>
                <%--                    }--%>
                <%--                }--%>
// 默认展开全部节点
//                 tree.expandAll(true);


            } else {
                $("#officeTree").hide();
            }

        }


    </script>
</head>
<body>

<form:form id="inputForm" modelAttribute="task" action="/task/form/save" method="post" class="form-horizontal">
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
                <form:option value="0" label="请选择"/>
                <form:options items="${UserParentOffice}" itemLabel="name" itemValue="id" htmlEscape="false"
                              class="required"/>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属专业:</label>
        <div class="controls">
            <form:select path="majorId" class="required input-xlarge" onchange="">
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

    <div class="control-group">
        <label class="control-label">可选专业:</label>
        <div class="controls">
            <form:select path="canbechosencollegeid" class="required input-xlarge" onchange="getThree()">
                <%--                <form:option value="0" label="请选择"/>--%>
                <%--                <form:option value="1" label="全校"/>--%>
                <%--                <form:option value="2" label="部分专业"/>--%>
                <%--                <form:option value="3" label="所属专业"/>--%>
                <option value="0">请选择</option>
                <option value="1" <c:if test="${task.canbechosencollegeid == 1}"> selected = "selected"</c:if>>全校
                </option>
                <option value="2" <c:if test="${task.canbechosencollegeid == 2}"> selected = "selected"</c:if>>部分专业
                </option>
                <option value="3" <c:if test="${task.canbechosencollegeid == 3}"> selected = "selected"</c:if>>所属专业
                </option>
                <%--            <form:option value="1" label="系统用户"/>--%>
            </form:select>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label"></label>
        <div class="controls">
                <%--            <div id="officeTree" class="ztree" style="margin-top:3px;float:left;"></div>--%>
            <form:hidden path="officeIds"/>
            <div id="officeTree" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>
            <div id="officeTree1" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>
                <%--        <form:hidden path="officeIds"/>--%>
        </div>
    </div>

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
