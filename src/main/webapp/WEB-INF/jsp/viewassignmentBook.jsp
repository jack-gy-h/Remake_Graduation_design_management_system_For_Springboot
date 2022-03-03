<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/22
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>

    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/treeTable.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.treeTable.js" type="text/javascript"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>

    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/easyui.css" rel="stylesheet" type="text/css"/>

    <link href="/static/css/common.css" rel="stylesheet" type="text/css"/>

    <script>
        $(function () {
            $.post("/task/get/assignmentBook", {}, function (data) {


                if (data[0] == null) {
                    alert("您尚未有任务书");
                    return;
                } else {
                    var option = '\n' +
                        '<div class="main">\n' +
                        '    <div class="gxf_problem gxf_problem_require" id="detailDiv" style="">\n' +
                        '        <div><h2><span></span><i class="dictionary_9">任务书</i>详情</h2></div>\n' +
                        '        <div class="gxf_designTable_content gxf_designTable_ResizefontSize">\n' +
                        '\n' +
                        '            <!--自定义  -->\n' +
                        '            <ul class="gxf_designTable_box" id="designTaskTable" style="">\n' +
                        '                <li><p><b style="color: #f00;position:relative;top:3px;"> * </b>毕业设计（论文）的内容要求<span\n' +
                        '                        class="statement margl"></span></p>\n' +
                        '                    <div class="gxf_designTable_detailes clearfix">' + data[0].contentRequirements + '</div>\n' +
                        '                </li>\n' +
                        '                <li><p><b style="color: #f00;position:relative;top:3px;"> * </b>进度安排<span\n' +
                        '                        class="statement margl"></span></p>\n' +
                        '                    <div class="gxf_designTable_detailes clearfix">' + data[0].scheduling + '</div>\n' +
                        '                </li>\n' +
                        '                <li><p><b style="color: #f00;position:relative;top:3px;"> * </b>参考文献<span\n' +
                        '                        class="statement margl"></span></p>\n' +
                        '                    <div class="gxf_designTable_detailes clearfix">' + data[0].references + '</div>\n' +
                        '                </li>\n' +
                        '                <li><p><b style="color: #f00;position:relative;top:3px;"> * </b>导出任务书<span\n' +
                        '                        class="statement margl"></span></p>\n' +
                        '                    <div class="gxf_designTable_detailes clearfix"><a target = "_self"   style = "text-decoration:none" href = "/task/teacher/exportExcelForAssignmentbook?assignmentbookid=' + data[0].id + '" > 导出文档 </a></div>\n' +
                        '                </li>\n' +
                        '            </ul>\n' +
                        '            <!--  附件 -->\n' +
                        '\n' +
                        '        </div>\n' +
                        '    </div>\n' +
                        '</div>';
                    $("#assignmentBook").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#assignmentBook").show();
                }


            });


        });


    </script>
</head>
<body>
<div id="assignmentBook">


</div>



</body>
</html>
