<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/25
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="/static/css/easyui.css">

    <link rel="stylesheet" type="text/css" href="/static/css/icon.css">


    <script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>

    <script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script>

    <script src="/static/js/jquery.validate.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(function () {


            $("#inputForm").validate({

                submitHandler: function (form) {

                    var starttime = $("#starttime").datebox("getValue");

                    var endtime = $("#endtime").datebox("getValue");

                    // alert("starttime:"+starttime);
                    //
                    // alert("endtime:" + endtime);

                    if (starttime == null||starttime == ''){
                        alert("请输入答辩起始时间");
                        return ;
                    }
                    if (endtime == null||endtime == '') {
                        alert("请输入答辩结束时间");
                        return;
                    }

                    // var startDate = toDate(starttime);
                    //
                    // var endDate = toDate(endtime);
                    //
                    // alert(startDate);
                    //
                    // alert(endDate);
                    //
                    //
                    // if(startDate<endDate){
                    //     alert("选择的答辩起始时间晚于答辩结束时间");
                    //     return ;
                    // }

                    // var source = $("#source").val();

                    // if (type == 0) {
                    //     alert("请填写题目类型");
                    //     return;
                    // } else if (source == 0) {
                    //     alert("请填写题目来源");
                    //     return;
                    // } else if (canbechosencollegeid == 0) {
                    //     alert("请选择可选专业");
                    //     return;
                    // }


                    form.submit();


                }
            })


        });

        //改变easyui-datebox的日期格式
        function ww3(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            var str = y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
            return str;
        }

        function w3(s) {
            if (!s) return new Date();
            var y = s.substring(0, 4);
            var m = s.substring(5, 7);
            var d = s.substring(8, 10);
            var h = s.substring(11, 14);
            var min = s.substring(15, 17);
            var sec = s.substring(18, 20);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d) && !isNaN(h) && !isNaN(min) && !isNaN(sec)) {
                return new Date(y, m - 1, d, h, min, sec);
            } else {
                return new Date();
            }
        }

        // function toDate(str){
        //     var sd = str.split("-");
        //
        //     return new Date(sd[0],sd[1],sd[2]);
        // }



    </script>
</head>
<body>

<form:form id="inputForm" modelAttribute="task" action="/task/set/replytime" method="post"
           class="form-horizontal">
    专业答辩时间安排：<br>
    <input id="starttime" name="starttime" type="text" class="easyui-datebox required" required="required"
           data-options="formatter:ww3,parser:w3">
    -
    <input id="endtime" name="endtime" type="text" class="easyui-datebox required" required="required"
           data-options="formatter:ww3,parser:w3">
    <br>
    已设置的答辩时间：<br>
    开始时间：${starttime}<br>
    结束时间：${endtime}
    <br>
    <input id="btnSubmit" class="btn btn-primary" type="submit"
           value="保 存" />

</form:form>


</body>
</html>
