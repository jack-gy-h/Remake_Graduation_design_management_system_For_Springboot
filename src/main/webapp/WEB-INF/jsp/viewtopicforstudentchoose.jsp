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

    <%--    easyui相关文件--%>
    <link rel="stylesheet" type="text/css" href="/static/css/easyui.css">

    <link rel="stylesheet" type="text/css" href="/static/css/icon.css">

    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>


    <script type="text/javascript">

        $(function () {
            var taskid = $("#id").val();
            loadData(taskid);
        });


        function loadData(taskid) {
            $("#dg").datagrid({
                title: "题目操作日志",
                url: "/task/viewlogDatafordoubletask",
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
                    {field: 'operator', title: '操作人', width: 200, align: 'center'},
                    {field: 'operatorRole', title: '操作人角色', width: 200, align: 'center'},
                    {field: 'action', title: '操作类型', width: 200, align: 'center'},
                    {field: 'remark', title: '操作内容', width: 200, align: 'center'},

                    {field: 'createtime', title: '操作时间', width: 200, align: 'center'}
                    // {field: 'teacherId', title: '指导教师编号', width: 200, align: 'center'},
                    // {field: 'majorname', title: '教研室', width: 200, align: 'center'},
                    // // {field: 'auditStatus', title: '审核状态', width: 200, align: 'center'},
                    // {field: 'createDate', title: '申报时间', width: 200, align: 'center'},
                    // {
                    //     field: 'auditStatusId',
                    //     title: "审核状态id",
                    //     width: 200,
                    //     hidden: true,
                    //     align: 'center'
                    // },
                    // {field: 'OperationItem', title: '操作列', width: 250, formatter: formatTitle}

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
                       taskid:taskid
                    }

            })
        }
<%--            $("#inputForm").validate({--%>

<%--                submitHandler: function (form) {--%>

<%--                    var canbechosencollegeid = $("#canbechosencollegeid").val();--%>

<%--                    if (canbechosencollegeid == 1) {--%>

<%--                        var ids = [], nodes = tree1.getCheckedNodes(true);--%>
<%--                        // alert("1");--%>
<%--                        for (var i = 0; i < nodes.length; i++) {--%>

<%--                            if (nodes[i].isParent == false) {--%>
<%--                                ids.push(nodes[i].id);--%>
<%--                            }--%>


<%--                            // ids.push(nodes[i].id);--%>


<%--                        }--%>
<%--                        // alert("ids:"+ids);--%>
<%--                        //少了这一行相当于不更新menuids也就无法更新数据--%>
<%--                        $("#officeIds").val(ids);--%>


<%--                    } else if (canbechosencollegeid == 2) {--%>

<%--                        var ids = [], nodes = tree.getCheckedNodes(true);--%>
<%--                        // alert("1");--%>
<%--                        for (var i = 0; i < nodes.length; i++) {--%>

<%--                            if (nodes[i].isParent == false) {--%>
<%--                                ids.push(nodes[i].id);--%>
<%--                            }--%>


<%--                            // ids.push(nodes[i].id);--%>

<%--                            $("#officeIds").val(ids);--%>


<%--                        }--%>

<%--                    } else if (canbechosencollegeid == 3) {--%>


<%--                        var ids = $("#majorId").val();--%>

<%--                        $("#officeIds").val(ids);--%>
<%--                    }--%>

<%--                    var type = $("#type").val();--%>

<%--                    var source = $("#source").val();--%>

<%--                    if (type == 0) {--%>
<%--                        alert("请填写题目类型");--%>
<%--                        return;--%>
<%--                    } else if (source == 0) {--%>
<%--                        alert("请填写题目来源");--%>
<%--                        return;--%>
<%--                    } else if (canbechosencollegeid == 0) {--%>
<%--                        alert("请选择可选专业");--%>
<%--                        return;--%>
<%--                    }--%>

<%--                    form.submit();--%>


<%--                }--%>
<%--            })--%>


<%--            var setting = {--%>
<%--                check: {--%>
<%--                    enable: true,--%>
<%--                    nocheckInherit: true,--%>
<%--                    chkStyle: "checkbox",--%>
<%--                    chkboxType: {"Y": "s", "N": "ps"}--%>
<%--                },--%>
<%--                data: {--%>
<%--                    simpleData: {--%>
<%--                        enable: true--%>
<%--                    }--%>
<%--                }--%>
<%--            };--%>


<%--//                部分专业可选时的ztree--%>
<%--// 用户-菜单--%>
<%--            var zNodes = [--%>
<%--                    <c:forEach items="${officeList}" var="office">{--%>
<%--                    id: "${office.id}",--%>
<%--                    pId: "${office.parent.id}",--%>
<%--                    name: "${office.name}"--%>
<%--                },--%>
<%--                </c:forEach>];--%>

<%--// 初始化树结构--%>
<%--            var tree = $.fn.zTree.init($("#officeTree"), setting, zNodes);--%>

<%--            // tree.checkAllNodes(true);--%>
<%--// 不选择父节点--%>
<%--//             tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};--%>
<%--            &lt;%&ndash;// 默认选择节点&ndash;%&gt;--%>
<%--            var ids = "${task.officeIds}".split(",");--%>

<%--            // alert("ids:"+ids);--%>

<%--            for (var i = 0; i < ids.length; i++) {--%>
<%--                var node = tree.getNodeByParam("id", ids[i]);--%>
<%--                try {--%>
<%--                    tree.checkNode(node, true, false);--%>
<%--                } catch (e) {--%>
<%--                }--%>
<%--            }--%>


<%--            //全校专业隐藏的ztree1--%>

<%--            var tree1 = $.fn.zTree.init($("#officeTree1"), setting, zNodes);--%>

<%--            tree1.checkAllNodes(true);--%>

<%--            tree1.expandAll(true);--%>

<%--            $("#officeTree1").hide();--%>


<%--            var code = $("#canbechosencollegeid option:selected").attr("value");//得到第一个下拉列表的值--%>
<%--            // alert("code:" + code);--%>
<%--            if (code == 2) {--%>

<%--                $("#officeTree").show();--%>


<%--// 默认展开全部节点--%>
<%--//                 tree.expandAll(true);--%>


<%--            } else {--%>
<%--                $("#officeTree").hide();--%>
<%--            }--%>


<%--        });--%>


        //获取学院下相应的专业
        // function getSecond() {//如果第一个下拉列表的值改变则调用此方法
        //     var code = $("#collegeId option:selected").attr("value");//得到第一个下拉列表的值
        //     // var identitys = $("#identitys").val();//得到身份框的值从而判断其是否需要填专业
        //     // alert("code:" + code);
        //     if (code != null && "" != code && -1 != code) {
        //         //通过ajax传入后台，把orderTypeName数据传到后端
        //         $.post("/user/getMajor", {code: code}, function (data) {
        //             var res = $.parseJSON(data);//把后台传回的json数据解析
        //             var option = '';
        //             option = '<option value="0">' + '请选择' + '</option>';
        //             for (var i = 0; i < data.length; i++) {
        //                 option += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
        //             }
        //
        //             $("#majorId").html(option);//将循环拼接的字符串插入第二个下拉列表
        //             $("#majorId").show();//把第二个下拉列表展示
        //
        //             // $.each(res, function (i, n) {//循环，i为下标从0开始，n为集合中对应的第i个对象
        //             //     option += "<option value='" + n.name + "'>" + n.name + "</option>"
        //             // });
        //             // alert("option:" + option);
        //             //
        //             //身份框值为1的是需要展示专业框的
        //             //身份框值为2的是不需要展示（或者说不需要选择专业的）
        //             // if (identitys == 1 || identitys == 3) {
        //             //     $("#majorid").html(option);//将循环拼接的字符串插入第二个下拉列表
        //             //     $("#majorid").show();//把第二个下拉列表展示
        //             // } else if (identitys == 0 || identitys == 2) {
        //             //     $("#majorid").hide();
        //             // }
        //
        //         });
        //
        //     }
        //     // else {
        //     //     $("#majorid").hide();
        //     // }
        // }


        <%--        当选择部分专业时才显示，否则要隐藏  --%>

<%--        function getThree() {//如果第一个下拉列表的值改变则调用此方法--%>

<%--            var code = $("#canbechosencollegeid option:selected").attr("value");//得到第一个下拉列表的值--%>
<%--            alert("code:" + code);--%>
<%--            if (code == 2) {--%>
<%--                $("#officeTree").show();--%>

<%--                &lt;%&ndash;                var setting = {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    check: {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        enable: true,&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        nocheckInherit: true,&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        chkStyle: "checkbox",&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        chkboxType: {"Y": "s", "N": "ps"}&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    },&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    data: {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        simpleData: {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                            enable: true&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        }&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    }&ndash;%&gt;--%>
<%--                &lt;%&ndash;                };&ndash;%&gt;--%>
<%--                &lt;%&ndash;// 用户-菜单&ndash;%&gt;--%>
<%--                &lt;%&ndash;                var zNodes = [&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        <c:forEach items="${officeList}" var="office">{&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        id: "${office.id}",&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        pId: "${office.parent.id}",&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        name: "${office.name}"&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    },&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    </c:forEach>];&ndash;%&gt;--%>

<%--                &lt;%&ndash;// 初始化树结构&ndash;%&gt;--%>
<%--                &lt;%&ndash;                var tree = $.fn.zTree.init($("#officeTree"), setting, zNodes);&ndash;%&gt;--%>
<%--                &lt;%&ndash;// 不选择父节点&ndash;%&gt;--%>
<%--                &lt;%&ndash;//             tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};&ndash;%&gt;--%>
<%--                &lt;%&ndash;                &lt;%&ndash;// 默认选择节点&ndash;%&gt;&ndash;%&gt;--%>
<%--                &lt;%&ndash;                var ids = "${task.officeIds}".split(",");&ndash;%&gt;--%>

<%--                &lt;%&ndash;                // alert("ids:"+ids);&ndash;%&gt;--%>

<%--                &lt;%&ndash;                for (var i = 0; i < ids.length; i++) {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    var node = tree.getNodeByParam("id", ids[i]);&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    try {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                        tree.checkNode(node, true, false);&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    } catch (e) {&ndash;%&gt;--%>
<%--                &lt;%&ndash;                    }&ndash;%&gt;--%>
<%--                &lt;%&ndash;                }&ndash;%&gt;--%>
<%--// 默认展开全部节点--%>
<%--//                 tree.expandAll(true);--%>


<%--            } else {--%>
<%--                $("#officeTree").hide();--%>
<%--            }--%>

<%--        }--%>


    </script>
</head>
<body>

<form:form id="inputForm" modelAttribute="task" action="/teacher/task/form" method="post" class="form-horizontal">
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
            <form:textarea path="topic" htmlEscape="false" rows="2" maxlength="2000" class="input-xxlarge required"
                           readonly="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">所属学院:</label>
        <div class="controls">
                <%--            <form:select path="collegeId" class="required input-xlarge" onchange="getSecond()" >--%>
                <%--                <form:option value="0" label="请选择"/>--%>
                <%--                <form:options items="${UserParentOffice}" itemLabel="name" itemValue="id" htmlEscape="false"--%>
                <%--                              class="required"/>--%>
                <%--                &lt;%&ndash;            <form:option value="1" label="系统用户"/>&ndash;%&gt;--%>
                <%--            </form:select>--%>
                <%--    <form:input path="name" htmlEscape="false" maxlength="50" class="required input-xlarge"/>--%>
            <form:input path="collegename" class="required input-xlarge" readonly="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">所属专业:</label>
        <div class="controls">
                <%--            <form:select path="majorId" class="required input-xlarge" onchange="">--%>
                <%--                &lt;%&ndash;            <form:options items="${UserParentMenu}" itemLabel="name" itemValue="Office" htmlEscape="false"&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                          class="required"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;            <form:option value="1" label="系统用户"/>&ndash;%&gt;--%>
                <%--            </form:select>--%>
            <form:input path="majorname" class="required input-xlarge" readonly="true"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">题目类型:</label>
        <div class="controls">
                <%--            <form:select path="type" class="required input-xlarge" onchange="">--%>
                <%--                &lt;%&ndash;                <form:option value="0" label="请选择"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="1" label="全校"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="2" label="部分专业"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="3" label="所属专业"/>&ndash;%&gt;--%>
                <%--                <option value="0">请选择</option>--%>
                <%--                <option value="1" <c:if test="${task.type == 1}"> selected = "selected"</c:if>>应用研究--%>
                <%--                </option>--%>
                <%--                <option value="2" <c:if test="${task.type == 2}"> selected = "selected"</c:if>>其他--%>
                <%--                </option>--%>
                <%--                <option value="3" <c:if test="${task.type == 3}"> selected = "selected"</c:if>>软件设计--%>
                <%--                </option>--%>
                <%--                <option value="4" <c:if test="${task.type == 4}"> selected = "selected"</c:if>>艺术设计--%>
                <%--                </option>--%>
                <%--                <option value="5" <c:if test="${task.type == 5}"> selected = "selected"</c:if>>工程设计--%>
                <%--                </option>--%>
                <%--                <option value="6" <c:if test="${task.type == 6}"> selected = "selected"</c:if>>实验研究--%>
                <%--                </option>--%>
                <%--                <option value="7" <c:if test="${task.type == 7}"> selected = "selected"</c:if>>理论研究--%>
                <%--                </option>--%>
                <%--                &lt;%&ndash;            <form:option value="1" label="系统用户"/>&ndash;%&gt;--%>
                <%--            </form:select>--%>
            <form:input path="typename" class="required input-xlarge" readonly="true"/>

        </div>
    </div>


    <div class="control-group">
        <label class="control-label">题目来源:</label>
        <div class="controls">
                <%--            <form:select path="source" class="required input-xlarge" onchange="">--%>
                <%--                &lt;%&ndash;                <form:option value="0" label="请选择"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="1" label="全校"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="2" label="部分专业"/>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                <form:option value="3" label="所属专业"/>&ndash;%&gt;--%>
                <%--                <option value="0">请选择</option>--%>
                <%--                <option value="1" <c:if test="${task.source == 1}"> selected = "selected"</c:if>>学生社会调查--%>
                <%--                </option>--%>
                <%--                <option value="2" <c:if test="${task.source == 2}"> selected = "selected"</c:if>>学生实验、实习、工程实践--%>
                <%--                </option>--%>
                <%--                <option value="3" <c:if test="${task.source == 3}"> selected = "selected"</c:if>>教师社会调查--%>
                <%--                </option>--%>
                <%--                <option value="4" <c:if test="${task.source == 4}"> selected = "selected"</c:if>>其他--%>
                <%--                </option>--%>
                <%--                <option value="5" <c:if test="${task.source == 5}"> selected = "selected"</c:if>>教师实验、实习、工程实践--%>
                <%--                </option>--%>
                <%--                <option value="6" <c:if test="${task.source == 6}"> selected = "selected"</c:if>>教师科研题--%>
                <%--                </option>--%>
                <%--                &lt;%&ndash;                <option value="7" <c:if test="${task.canbechosencollegeid == 3}"> selected = "selected"</c:if>>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;                </option>&ndash;%&gt;--%>
                <%--                &lt;%&ndash;            <form:option value="1" label="系统用户"/>&ndash;%&gt;--%>
                <%--            </form:select>--%>
            <form:input path="sourcename" class="required input-xlarge" readonly="true"/>
        </div>
    </div>
    <c:if test="${task.canbechosentypename != null}" >
    <div class="control-group">
        <label class="control-label">可选专业:</label>
        <div class="controls">
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
            <form:input path="canbechosentypename" class="required input-xlarge" readonly="true"/>
        </div>
    </div>

</c:if>

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
                           class="input-xxlarge required" readonly="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">题目简介：</label>
        <div class="controls">
            <form:textarea path="briefIntroduction" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required" readonly="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">基本要求：</label>
        <div class="controls">
            <form:textarea path="basicRequirements" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required" readonly="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">参考资料：</label>
        <div class="controls">
                <%--            <form:input path="referenceData" htmlEscape="false" maxlength="50" class="required input-xlarge"/>--%>
            <form:textarea path="referenceData" htmlEscape="false" rows="6" maxlength="2000"
                           class="input-xxlarge required" readonly="true"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <table id="dg"></table>

    <div class="form-actions">
<%--                    <input id="btnSubmit" class="btn btn-primary" type="submit"--%>
<%--                           value="修 改"/>&nbsp;--%>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>


</form:form>


</body>
</html>
