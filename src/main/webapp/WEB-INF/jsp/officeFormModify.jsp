<%--<jsp:useBean id="Office" class="com.example.demo.entity.Office" scope="request"/>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="default"/>

	<script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
	<script src="/static/js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>
	<link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>
	<script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>
	<link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>
	<link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="/office">机构列表</a></li>
		<li class="active"><a href="/office/form">机构修改</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="office" action="/office/form/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>

		<form:hidden path="parent.id"/>

<%--		<sys:message content="${message}"/>--%>
		<div class="control-group">
			<label class="control-label">上级机构:</label>
			<div class="controls">
<%--				<form:input path="parent.name" htmlEscape="false" maxlength="50" class="required input-xlarge" readonly="true "/>--%>
<%--	     <form:hidden path="parent.id"/>--%>

<%--	     <form:input path="parent"/>--%>


				<input id="name"  style="width: 270px;height: 20px" readonly value="${office.parent.name}">
<%--	            <button></button>--%>
<%--	            <a href="/office/form/parentOfficeSelect">选择<a>--%>
<%--                <sys:treeselect id="office" name="parent.id" value="${office.parent.id}" labelName="parent.name" labelValue="${office.parent.name}"--%>
<%--					title="机构" url="/sys/office/treeData" extId="${office.id}" cssClass="required"/>--%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required input-xlarge" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
<%--		<div class="control-group">--%>
<%--			<label class="control-label">链接:</label>--%>
<%--			<div class="controls">--%>
<%--				<form:input path="href" htmlEscape="false" maxlength="2000" class="input-xxlarge"/>--%>
<%--				<span class="help-inline">点击机构跳转的页面</span>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="control-group">--%>
<%--			<label class="control-label">目标:</label>--%>
<%--			<div class="controls">--%>
<%--				<form:input path="target" htmlEscape="false" maxlength="10" class="input-small"/>--%>
<%--				<span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="control-group">--%>
<%--			<label class="control-label">图标:</label>--%>
<%--			<div class="controls">--%>
<%--				<sys:iconselect id="icon" name="icon" value="${office.icon}"/>--%>
<%--			</div>--%>
<%--		</div>--%>
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required digits input-small"/>
				<span class="help-inline">排列顺序，升序。</span>
			</div>
		</div>
<%--		<div class="control-group">--%>
<%--			<label class="control-label">可见:</label>--%>
<%--			<div class="controls">--%>
<%--				<div></div>--%>
<%--				<span class="help-inline">该机构或操作是否显示到系统机构中</span>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--		<div class="control-group">--%>
<%--			<label class="control-label">权限标识:</label>--%>
<%--			<div class="controls">--%>
<%--				<form:input path="permission" htmlEscape="false" maxlength="100" class="input-xxlarge"/>--%>
<%--				<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>--%>
<%--			</div>--%>
<%--		</div>--%>
		<div class="control-group">
			<label class="control-label">备注:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
<%--			<span><font color="red" id="error">${errorInfo }</font></span>--%>
		</div>
	</form:form>


</body>
</html>