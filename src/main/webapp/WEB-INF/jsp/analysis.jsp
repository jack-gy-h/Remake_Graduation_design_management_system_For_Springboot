<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/19
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>
    <link href="/static/css/jeesite.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/jeesite.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/bootstrap.min1.css" rel="stylesheet" type="text/css"/>
    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>
    <title></title>

    <script type="text/javascript">


            //使用showContent方法把content显示在id是target的元素中。
            function showContent(content, target) {
                document.getElementById(target).innerHTML = content;
            }


        function analysis() {

            var word = $("#task").val();

            $.post("/taskanalysis/getKeyWord",
                {
                    word:word
                }, function (data) {

                var option = '';

                for(var i=0;i<data.length;i++){

                    option += '<a target="_blank" href="https://www.baidu.com/s?wd=' + data[i] + '&rsv_spt=1&rsv_iqid=0x8a594f3500040c60&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_dl=tb&rsv_sug3=17&rsv_sug1=13&rsv_sug7=101&rsv_sug2=0&rsv_btype=i&prefixsug=%25E9%2580%2589%25E9%25A2%2598%25E5%2588%2586%25E6%259E%2590&rsp=5&inputT=4434&rsv_sug4=6213">'+data[i]+'</a>\n';







                        // alert("第"+(i+1)+"个关键词为：" + data[i]);

                    }

                    $("#result").html(option);//将循环拼接的字符串插入第二个下拉列表
                    $("#result").show();




                });

        }






    </script>
</head>
<body>
<div class="control-group">
    <label class="control-label">选题：</label>
    <div class="controls">
        <input
                type="text" id="task" name="task">
        <span class="help-inline"><font color="red">*</font> </span>
    </div>
</div>

<div>
    关键词：
    <div id="result">

    </div>

</div>


<button onclick="analysis()">选题分析</button>

<%--<h2>Section title</h2>--%>
<%--<div class="table-responsive">--%>
<%--    <table class="table table-striped table-sm">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>#</th>--%>
<%--&lt;%&ndash;            <th>Header</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Header</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Header</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th>Header</th>&ndash;%&gt;--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <td><a href="#">1,001</a></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,002</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,003</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,003</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,004</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,005</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,006</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,007</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,008</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,009</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,010</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,011</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,012</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,013</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,014</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>1,015</td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>

<body>


<%--<div class="main">--%>
<%--    <div class="Dnews">--%>
<%--        <div id="divNoticeHead" class="Dheadline"><h3>教育部关于印发《本科毕业论文（设计）抽检办法（试行）》的通知</h3>--%>
<%--            <p class="NpublishTime">2021-01-11 17:01</p></div>--%>
<%--        <!--下部分内容-->--%>
<%--        <div class="Darticle">--%>
<%--            <div id="pNoticeContent"><p>"教育部关于印发《本科毕业论文（设计）抽检办法（试行）》的通知"，请广大师生下载学习，并请严格按照毕业论文（设计）相关规定、规范做好各环节工作。</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>




</body>
</html>
