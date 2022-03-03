<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/20
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>
    <script>
        $(function () {
            $.post("/announcement/getAllList",{},function (data) {

                var option = '';

                for (var i=0;i<data.length;i++){
                    option+= '<li><p><a href="/announcement/showannounceforUser?id='+ data[i].id +'">'+data[i].headline+'</a>\n' +
                        '                </p></li>';
                }

                $("#ulNoticeList").html(option);
                $("#ulNoticeList").show();

            })


        });
    </script>


</head>
<body>
<div class="main gxf_teacher_container">
    <div class="gxf_teacher_tabs">
        <ul id="ulNoticeTabs" class="clearfix">
            <li><a href="#" class="active">通告类型</a>
            </li>
        </ul>
    </div>
    <div id="Ncontent" class="Ncontent clearfix" style="width: 100%">
        <!--右侧展示-->
        <div id="divModeList" class="NRnews" style="display: block; width: 100%; padding: 0px; border: 0px;">
            <!--<h2>通知公告</h2>-->
            <ul id="ulNoticeList" class="Narticlelist clearfix" style="padding-left: 10px;">
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=45&amp;typeId=114',false)">教育部关于印发《本科毕业论文（设计）抽检办法（试行）》的通知</a>--%>
<%--                </p></li>--%>
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=22&amp;typeId=114',false)">计算机学院2021届毕业设计工作方案【学院7号文】</a>--%>
<%--                </p></li>--%>
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=18&amp;typeId=114',false)">请登录系统的广大师生及时设置个人的电子签名（操作手册中有流程）</a>--%>
<%--                </p></li>--%>
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=15&amp;typeId=114',false)">2021届毕业设计（论文）规范及表格</a>--%>
<%--                </p></li>--%>
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=14&amp;typeId=114',false)">2021届毕业设计（论文）管理系统各角色操作手册和操作视频</a>--%>
<%--                </p></li>--%>
<%--                <li><p><a href="javascript:openframe('查看通知公告', 'Notice/Details.html?noticeId=13&amp;typeId=114',false)">关于做好2021届毕业设计（论文）工作的通知</a>--%>
<%--                </p></li>--%>
            </ul>

        </div>


        <div id="noContent"
             style="display: none; color: red; min-height: 200px; text-align: left; padding-left: 30px;"></div>
    </div>
</div>
</body>
</html>
