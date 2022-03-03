<%--<jsp:useBean id="Menu" class="com.example.demo.entity.Menu" scope="request"/>--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
	<title>菜单管理</title>
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

	<script>

		$(function () {

			var isEnd = false;

			$.ajaxSettings.async = false ;

			$.post("/menu/listData",{},
			function (data) {
				var menus = data;
				var length = menus.length;
				var result = '';
				var parentid = '';
				var num = 1 ;

				for (var i = 0; i < length; i++) {
					result += '<div class="card">';
					var menu = menus[i];
					//获取父节点，parentid为1的都是父节点
					if (menu.parentid == 1) {
						result += '                        <div class="card-header" id="heading' + num + '">\n' +
								'                            <h2 class="mb-0">\n' +
								'                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"\n' +
								'                                        data-target="#collapseOne" aria-expanded="false" aria-controls="collapse' + num + '">\n' +
								'                                    ' + menu.name + '\n' +
								'                                </button>\n' +
								'                            </h2>\n' +
								'                        </div>' +
								'                        <div id="collapse' + num + '" class="collapse" aria-labelledby="heading' + num + '"\n' +
								'                             data-parent="#accordionExample">\n' +
								'                            <div class="card-body">\n' +
								'                                <div style="width:100%">'
						;
						parentid = menu.id;
						for (var j = 0; j < length; j++) {
							var menuchild = menus[j];
							if (menuchild.parentid == parentid) {
								result += '<button type="button" class="btn btn-light button-style-for-light"\n' +
										'                                            onclick="opentable(\'' + menu.href + '\')">\n' +
										'                                        ' + menu.name + '\n' +
										'                                    </button>\n' +
										'                                    <br>'
								;

							}

						}
						result += '                                </div>\n' +
								'                            </div>\n' +
								'                        </div>\n' +
								'                    </div>'
						;

					}


				}
				$('.accordionExample').append(result);


			}
			,"json");


			$.ajaxSettings.async = false;

		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="/menu">菜单列表</a></li>
		<li class="active"><a href="/menu/form">菜单添加</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="menu" action="/menu/form/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>

		<form:hidden path="parent.id"/>
<%--		<sys:message content="${message}"/>--%>
		<div class="control-group">
			<label class="control-label">上级菜单:</label>
			<div class="controls">
<%--				<form:input path="parent.name" htmlEscape="false" maxlength="50" class="required input-xlarge" readonly="true "/>--%>
				<input id="name"  style="width: 270px;height: 20px" readonly value="${menu.parent.name}">
<%--	            <button></button>--%>
	            <a href="/menu/form/parentMenuSelect">选择<a>
<%--                <sys:treeselect id="menu" name="parent.id" value="${menu.parent.id}" labelName="parent.name" labelValue="${menu.parent.name}"--%>
<%--					title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="required"/>--%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required input-xlarge" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">链接:</label>
			<div class="controls">
				<form:input path="href" htmlEscape="false" maxlength="2000" class="input-xxlarge"/>
				<span class="help-inline">点击菜单跳转的页面</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目标:</label>
			<div class="controls">
				<form:input path="target" htmlEscape="false" maxlength="10" class="input-small"/>
				<span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标:</label>
			<div class="controls">
				<sys:iconselect id="icon" name="icon" value="${menu.icon}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序:</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required digits input-small"/>
				<span class="help-inline">排列顺序，升序。</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">可见:</label>
			<div class="controls">
				<div></div>
				<span class="help-inline">该菜单或操作是否显示到系统菜单中</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权限标识:</label>
			<div class="controls">
				<form:input path="permission" htmlEscape="false" maxlength="100" class="input-xxlarge"/>
				<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>
			</div>
		</div>
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