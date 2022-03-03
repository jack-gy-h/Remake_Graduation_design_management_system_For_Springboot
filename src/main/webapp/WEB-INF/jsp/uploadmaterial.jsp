<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/23
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script src="/static/js/jquery.form.min.js" type="text/javascript"></script>

    <script>
        $(function () {
            $.post("/task/get/task/baseInformation", {}, function (data) {

                if (data[0] == null) {
                    alert("您尚未有选题，不能提交相关资料");
                    return;
                } else {
                    var option = '<div id="gxf-project-information">\n' +
                        '    <div class="gxf_problem gxf_problem_detail">\n' +
                        '        <div><h2><span></span>题目基本信息</h2></div>\n' +
                        '        <div class="gxf_pro_content gxf_content_table">\n' +
                        '            <div style="width:100%;position: relative;padding: 0;padding-left: 120px;box-sizing: border-box;-moz-box-sizing: border-box;-webkit-box-sizing: border-box;-o-box-sizing: border-box;-ms-box-sizing: border-box;line-height: 30px;">\n' +
                        '                <div style="position: absolute;left: 0; top: 2px;width: 120px; text-align: right;"> 题目：</div>\n' +
                        '                <div style="width:100%; white-space: normal;" class="detadil_txt_right proTitle"\n' +
                        '                     title="'+data[0].topic+'">'+data[0].topic+'<a class="listA margl" href="/task/student/viewtopic?id='+data[0].id+'"\n' +
                        '                                                                             onclick="">查看详情</a>\n' +
                        '                </div>\n' +
                        '            </div>\n' +
                        '            <ul class="clearfix gxf_project_detadil_ul" style="">\n' +
                        '                <li><span class="detadil_txt_left"> 可选专业：</span><span class="detadil_txt_right">'+data[0].canbechosencollegeid+'</span>\n' +
                        '                </li>\n' +
                        '                <li><span class="detadil_txt_left"> 题目申报时间：</span><span class="detadil_txt_right">'+data[0].createDate+'</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 题目类型：</span><span class="detadil_txt_right">'+data[0].typename+'</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 题目来源：</span><span class="detadil_txt_right">'+data[0].source+'</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 选择模式：</span><span class="detadil_txt_right">'+data[0].pattern+'</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 题目所属专业：</span><span class="detadil_txt_right">'+data[0].collegename+'-'+data[0].majorname+'</span>\n' +
                        '                </li>\n' +
                        '                <li><span class="detadil_txt_left"> 指导教师：</span><span class="detadil_txt_right">'+data[0].teachername+'（'+ data[0].teacheridentitynumber+'）</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 导师联系邮箱：</span><span class="detadil_txt_right">'+data[0].email+'</span></li>\n' +
                        '                <li><span class="detadil_txt_left"> 学生姓名：</span><span class="detadil_txt_right">'+data[0].studentname+'（'+data[0].studentidentitynumber+'）</span>\n' +
                        '                </li>\n'  +
                        '            </ul>\n' +
                        '    </div>\n' +
                        '</div>\n' +
                        '</div>';
                    $("#assignmentBook").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#assignmentBook").show();

                    var option1 = '<form id="topic_tontent_forstudent_form" enctype="multipart/form-data">\n' +
                        '\n' +
                        '    请选择要提交的材料：\n' +
                        '    <input type="file" id="file" name="file"/><br>\n' +
                        '    已提交的文件名为：${materialfilename}<br>\n' +
                        '    <input type="submit" onclick="chose()"/>\n' +
                        '\n' +
                        '\n' +
                        '\n' +
                        '</form>';

                    $("#material").html(option1);//将循环拼接的字符串插入第二个下拉列表
                    $("#material").show();

                }


            });


        });

        function chose() {
            // $.messager.confirm("系统提示", "您确定要选择这个题目吗？", function (r) {
            //     if (r) {
            //         // $.post("/student/topic/chosen/"+id , {}, function (result) {
            //         //     if (result == "success") {
            //         //         $("#topic_status").datagrid("reload");
            //         //     } else {
            //         //         $.messager.alert("系统提示", "选题失败！");
            //         //     }
            //         // });
            //
            //     }
            // });
            $("#topic_tontent_forstudent_form").ajaxForm({
                type: "post",
                url: "/task/student/submitmaterial",
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result == "success") {
                        alert("上传任务书成功!");
                        window.location.reload();

                    } else if (result == "filenull") {
                        alert("上传的任务书不能为空!");
                    } else if (result == "fileempty") {
                        alert("上传的任务书内容不能为空!");
                    } else {
                        alert("上传任务书失败!");
                    }
                }
            })


        }


    </script>
</head>
<body>

<div id="assignmentBook">


</div>

<div id="material">


</div>





</body>
</html>
