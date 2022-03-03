<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>


	<link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

	<link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

	<script src="/static/js/jeesite.js" type="text/javascript"></script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="/role">角色列表</a></li>
		<<li><a href="/role/form">角色添加</a></li>
	</ul>
<%--	<sys:message content="${message}"/>--%>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<tr><th>角色名称</th><th>英文名称</th><th>操作</th></tr>
		<c:forEach items="${Rolelist}" var="role">
			<tr>
				<td><a href="/role/form?id=${role.id}">${role.name}</a></td>
				<td><a href="/role/form?id=${role.id}">${role.enname}</a></td>
<%--				<td>--%>
<%--				<td>${fns:getDictLabel(role.dataScope, 'sys_data_scope', '无')}</td>--%>
				<td>
<%--					<a href="${ctx}/sys/role/assign?id=${role.id}">分配</a>--%>
					<a href="/role/form?id=${role.id}">修改</a>
					<a href="/role/delete?id=${role.id}" onclick="return confirmx('确认要删除该角色吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>