<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/4
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>

    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>

    <%-- $、jquery相关js --%>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <%--    <script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>--%>

    <%--    Ztree相关功能js --%>
    <%--    <script src="/static/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>--%>

    <script src="/static/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>

    <%--    <script src="/static/js/jquery.js" type="text/javascript"></script>--%>


    <%--    <script src="/static/js/ckeditor_base.js" type="text/javascript"></script>--%>

    <%--    <script src="/static/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>--%>

    <%--    <script src="/static/js/jquery.ztree.exhide-3.5.js" type="text/javascript"></script>--%>

    <%--    <script src="/static/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>--%>

    <%--    <script src="/static/js/jquery.ztree.core-3.5.min.js" type="text/javascript"></script>--%>

    <script type="text/javascript">
        <%--        $(document).ready(function(){--%>
        <%--            var setting = {--%>
        <%--                check: {enable: true, nocheckInherit: true}, view: {selectedMulti: false},--%>
        <%--                data: {simpleData: {enable: true}}, callback: {--%>
        <%--                    beforeClick: function (id, node) {--%>
        <%--                        tree.checkNode(node, !node.checked, true, true);--%>
        <%--                        return false;--%>
        <%--                    }--%>
        <%--                }--%>
        <%--            };--%>
        <%--// 用户-菜单--%>
        <%--            var zNodes = [--%>
        <%--                    <c:forEach items="${menuList}" var="menu">{--%>
        <%--                    id: "${menu.id}",--%>
        <%--                    pId: "${not empty menu.parent.id?menu.parent.id:0}",--%>
        <%--                    name: "${not empty menu.parent.id?menu.name:'权限列表'}"--%>
        <%--                },--%>
        <%--                </c:forEach>];--%>
        <%--// 初始化树结构--%>
        <%--            var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);--%>
        <%--// 不选择父节点--%>
        <%--            tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};--%>
        <%--            &lt;%&ndash;// 默认选择节点&ndash;%&gt;--%>
        <%--            &lt;%&ndash;var ids = "${role.menuIds}".split(",");&ndash;%&gt;--%>
        <%--// for (var i = 0; i < ids.length; i++) {--%>
        <%--//     var node = tree.getNodeByParam("id", ids[i]);--%>
        <%--//     try {--%>
        <%--//         tree.checkNode(node, true, false);--%>
        <%--//     } catch (e) {--%>
        <%--//     }--%>
        <%--// }--%>
        <%--// 默认展开全部节点--%>
        <%--            tree.expandAll(true);--%>


        <%--        });--%>
        $(document).ready(function () {

            // if(mark == 0){
            //     alert
            // }
            // $("#name").focus();
            // $("#inputForm").validate({
            //     submitHandler: function (form) {
            //         var ids = [], nodes = tree.getCheckedNodes(true);
            //         for (var i = 0; i < nodes.length; i++) {
            //             ids.push(nodes[i].id);
            //         }
            //         $("#menuIds").val(ids);
            //         alert(ids);
            //         // var ids2 = [], nodes2 = tree2.getCheckedNodes(true);
            //         // for (var i = 0; i < nodes2.length; i++) {
            //         //     ids2.push(nodes2[i].id);
            //         // }
            //         // $("#officeIds").val(ids2);
            //         // loading('正在提交，请稍等...');
            //         // form.submit();
            //     }
            // });

            $("#inputForm").validate({
                rules:{
                    name:{remote:"/role/checkName?oldName="+encodeURIComponent("${role.name}")},
                    enname: {remote: "/role/checkEnname?oldEnname=" + encodeURIComponent("${role.enname}")}
                },
                messages:{
                    name:{remote:"角色名已存在"},
                    enname:{remote:"英文名已存在"}
                },
                submitHandler: function (form) {

                    // var oldname = $("#oldName").val();
                    //
                    // var name = $("#name").val();

                    var oldEnname = $("#oldEnname").val();

                    var enname= $("#enname").val();

                    // if(oldname == name){
                    //     alert("角色名已存在");
                    //
                    // }

                    // if(oldEnname == enname){
                    //     alert("角色英文名已存在");
                    //     return ;
                    // }
                    // alert("oldEnname:"+oldEnname+ "enname:" + enname);







                    var ids = [], nodes = tree.getCheckedNodes(true);

                    for (var i = 0; i < nodes.length; i++) {

                        ids.push(nodes[i].id);

                    }
                    // alert("ids:"+ids);
                    $("#menuIds").val(ids);


                    form.submit();


                }


            });


            var setting = {
                check: {
                    enable: true,
                    nocheckInherit: true,
                    chkStyle: "checkbox",
                    // chkboxType: {"Y": "s", "N": "ps"}
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                }
            };
// 用户-菜单
            var zNodes = [
                    <c:forEach items="${menuList}" var="menu">{
                    id: "${menu.id}",
                    pId: "${menu.parent.id}",
                    name: "${menu.name}"
                },
                </c:forEach>];

// 初始化树结构
            var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
// 不选择父节点
//             tree.setting.check.chkboxType = {"Y": "ps", "N": "s"};
            <%--// 默认选择节点--%>
            var ids = "${role.menuIds}".split(",");

            // alert("ids:"+ids);

            for (var i = 0; i < ids.length; i++) {
                var node = tree.getNodeByParam("id", ids[i]);
                try {
                    tree.checkNode(node, true, false);
                } catch (e) {
                }
            }
// 默认展开全部节点
//             tree.expandAll(true);

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="/role">角色列表</a></li>
    <li class="active"><a href="/role/form">角色${not empty role.id?'修改':'添加'}</a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="role" action="/role/form/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <div class="control-group">
        <label class="control-label">角色名称:</label>
        <div class="controls">
            <input id="oldName" name="oldName" type="hidden" value="${role.name}">
            <form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">英文名称:</label>
        <div class="controls">
            <input id="oldEnname" name="oldEnname" type="hidden" value="${role.enname}">
            <form:input path="enname" htmlEscape="false" maxlength="50" class="required"/>
            <span class="help-inline"><font color="red">*</font> </span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">角色授权:</label>
        <div class="controls">
            <div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
                        <form:hidden path="menuIds"/>
            <div id="officeTree" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>
                <%--        <form:hidden path="officeIds"/>--%>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
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
