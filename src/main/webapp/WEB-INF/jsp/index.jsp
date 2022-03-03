<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>登陆</title>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">--%>
<%--    <meta name="generator" content="Jekyll v4.1.1">--%>
<%--    <link rel="shortcut icon" href="#"/>--%>
<%--    <link href="/static/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    --%>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="canonical" href="/static/html/jumbotron-index.html">
    <link href="/static/css/jumbotron.css" rel="stylesheet">
    <link href="/static/css/floating-labels.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>


<main role="main">
    <form class="form-signin" action="${pageContext.request.contextPath}/login" method="post">
        <div class="text-center mb-4">
<%--            <img class="mb-4" src="/static/bootstrap-4.5.3-examples/assets/brand/bootstrap-solid.svg" alt="" width="72"--%>
<%--                 height="72">--%>
            <h1 class="h3 mb-3 font-weight-normal">用户登录</h1>
            <%--        <p></p>--%>
        </div>
        <%--这里使用了input type="email"进行判别是否是邮箱的格式--%>
        <%--  <label for=""> 中for的作用是和哪个表单元素绑定 --%>
        <%--    <label for="inputEmail">则是与<input type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>来进行绑定--%>
        <div class="form-label-group">
            <input type="text" id="username" name="username" class="form-control" placeholder="Email address" required
                   autofocus>
            <label for="username">请输入用户名</label>
        </div>

        <div class="form-label-group">
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
            <label for="password">请输入密码</label>
        </div>

        <div>
            <h6><a>&nbsp;</a></h6>
            <span><font color="red" id="error">${errorInfo }</font></span>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
<%--        <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2020</p>--%>
    </form>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">毕业设计管理系统</h1>
            <p>欢迎来到毕业设计管理系统，下面我们将会提供相关资讯以及操作指南</p>
            <p>&nbsp;</p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2></h2>
                <p></p>
                <%--                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>--%>
            </div>
            <div class="col-md-4">
                <h2></h2>
                <p></p>
                <%--                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>--%>
            </div>
            <div class="col-md-4">
                <h2></h2>
                <p></p>
                <p></p>
                <p></p>
                <p></p>
                <p></p>
                <p></p>

                <%--                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>--%>
            </div>
        </div>

        <hr>

    </div> <!-- /container -->

</main>

<footer class="container">
    <p>&copy; Company 2017-2020</p>
</footer>
<%--<script src="/static/jquery/jquery-3.5.1.slim.min.js"--%>
<%--></script>--%>
<%--<script>window.jQuery || document.write('<script src="/static/bootstrap-4.5.3-examples/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>--%>
<%--<script src="/static/bootstrap-4.5.3-examples/assets/dist/js/bootstrap.bundle.min.js"></script>--%>
</body>
</html>
