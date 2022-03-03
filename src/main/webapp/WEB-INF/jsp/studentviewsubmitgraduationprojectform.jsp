<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021/4/29
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <link href="/static/css/base.css" rel="stylesheet" type="text/css"/>

    <script src="/static/js/jquery-1.8.3.js" type="text/javascript"></script>

    <script>
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
            // $("#topic_tontent_forstudent_form").ajaxForm({
            //     type: "post",
            //     url: "/task/student/submitmaterial",
            //     contentType: false,
            //     processData: false,
            //     success: function (result) {
            //         if (result == "success") {
            //             alert("上传任务书成功!");
            //             window.location.reload();
            //
            //         } else if (result == "filenull") {
            //             alert("上传的任务书不能为空!");
            //         } else if (result == "fileempty") {
            //             alert("上传的任务书内容不能为空!");
            //         } else {
            //             alert("上传任务书失败!");
            //         }
            //     }
            // })

            var formData = new FormData();
            var file = document.getElementById('file').files[0];
            var finalPaperid = $('#finalPaperid').val();
            var keywords = $('#keywords').val();
            var innovationpoint = $('#innovationpoint').val();
            var chineseabstract = $('#chineseabstract').val();
            var englishabstract = $('#englishabstract').val();
            var other = $('#other').val();

            // alert("keywords:"+keywords);

            formData.append("file", file);
            formData.append("finalPaperid", finalPaperid);
            formData.append("keywords", keywords);
            formData.append("innovationpoint", innovationpoint);
            formData.append("chineseabstract", chineseabstract);
            formData.append("englishabstract", englishabstract);
            formData.append("other", other);

            $.ajax({
                    url: "/task/submit/graduationproject/save",
                    type: "post",
                    data: formData,
                    dataType: "json",
                    cache: false,//上传文件无需缓存
                    processData: false,//用于对data参数进行序列化处理 这里必须false
                    contentType: false, //必须*/
                    success: function (data) {

                        // alert("result:" + data);

                        if (data == "success") {
                            alert("提交毕业设计（论文）最终版成功!");
                            window.location.href = '/task/submit/graduationproject';

                        } else if (data == "filenull") {
                            alert("提交的毕业设计（论文）最终版文件不能为空!");
                        } else if (data == "fileempty") {
                            alert("提交的毕业设计（论文）最终版内容不能为空!");
                        } else {
                            alert("提交毕业设计（论文）最终版失败!");
                        }
                    }
                }
            );


        }


    </script>
</head>
<body>


<div class=" gxf_problem gxf_problem_title">
    <%--    <div>--%>
    <%--        <h2><span></span>提交内容</h2>--%>
    <%--        <div class="txt_red" id="projectName2" style="text-indent: 24px; line-height: 24px;">--%>
    <%--            您当前的题目是：“广东石油化工学院毕业设计管理系统的设计与实现”，若与您的实际题目不一致，请按照学校或院系要求进行题目修改。--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div class="gxf_pro_content">
        <form:form id="inputForm" modelAttribute="task">
            <form:hidden path="finalPaperid"/>
            <ul class="gxf_report_box" id="isShow">
                <li>
                    <p>关键词：<span class="writerText margl"> </span>
                        <span class="statement"> 多个关键词用分号“；”隔开</span></p>
                    <form:textarea path="keywords" class="textbox-text validatebox-text textbox-prompt"
                                   autocomplete="off" style="margin: 0px; height: 20.3333px; width: 1229.33px;"/>
                    </span>
                </li>
                <li>
                    <p>创新点<span class="writerText margl"> </span>
                        <span class="statement">请在下方的输入框内填写创新点内容，若无内容请填写“无”</span></p>
                    <form:textarea path="innovationpoint" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" style="margin: 0px; height: 109.333px; width: 1196.33px;"/>
                    </span>
                </li>
                <li>
                    <p>中文摘要<span class="writerText margl"> </span>
                        <span class="statement">请在下方的输入框内填写中文摘要内容，若无内容请填写“无”</span></p>
                        <form:textarea path="chineseabstract" class="textbox-text validatebox-text textbox-prompt"
                                autocomplete="off" style="margin: 0px; height: 109.333px; width: 1196.33px;"/>
                    </span>
                </li>
                <li>
                    <p>英文摘要<span class="writerText margl"> </span>
                        <span class="statement">请在下方的输入框内填写英文摘要内容，若无内容请填写“无”</span></p>
                    <form:textarea path="englishabstract" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" style="margin: 0px; height: 109.333px; width: 1196.33px;"/>
                    </span>
                </li>
                <li>
                    <p>其他<span class="writerText margl"> </span>
                        <span class="statement">请在下方的输入框内填写其他内容，若无内容请填写“无”</span></p>
                    <form:textarea
                            path="other" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" style="margin: 0px; height: 20.3333px; width: 1196.33px;"/>
                    </span>
                </li>
                <!--<li>
                    <p>
                        论文文档：<span class="statement">请按照学校的要求上传文档，支持格式为doc,docx,pdf,wps；</span>
                    </p>
                    <input class="easyui-textbox" data-options="readonly:true,prompt: '此处提交的文档将在符合条件后进行检测'" id="txtFileName" style="width: 300px;" />
                    <span id="webUploaderPick"></span>
                    <div id="divFileProgressContainer"></div>
                </li>
                <li id="FormatBox" class="FormatDetection" style="display:none;"></li>
                <li id="thesisAtt" style="display: none;">
                    <p>
                        添加附件：<span class="statement" id="scfj">上传相关的附件，上传的文件将以附件的形式显示。支持附件格式为doc，docx，pdf，wps，rar，zip</span>
                        <div style="color: #f00; font-size: 12px;">提示：附件内容不检测，需要检测的论文请提交至“论文文档”处，不提交论文文档将不进行检测</div>
                    </p>
                    <input class="easyui-textbox" data-options="readonly:true,prompt: '此处为附件文件，不检测'" id="attTxtFileName" style="width: 300px;" />
                    <span id="attachmentWebUploaderPick"></span>
                    <div id="divAttachmentFileProgressContainer"></div>
                </li>-->
            </ul>
            <div class="clearfix scheduleBox">
                    <%--            <ul class="clearfix scheduleTitle" id="scheduleTitle">--%>
                    <%--                <li class="active titleNAme">上传论文（待检测）</li>--%>
                    <%--                <li class="">上传论文以外其他附件</li>--%>
                    <%--            </ul>--%>
                <div class="scheduleContent">
                    <div class="details">
                        <ul class="gxf_report_box">
                            <li>
                                <div id="redTips" class="statement txt_red disNone">请在本页面提交<span class="dictionary_18">毕业论文最终版</span>。您提交的文档根据学校设置确定是否进行检测，若设置的是需要检测，则学生提交文档后，系统将进行检测；若设置的是不检测，则提交后不进行检测（具体是否检测请咨询学院或学校）。
                                </div>
                                <p>
                                    论文文档：
                                    <span class="statement">
                                            请按照学校的要求上传文档，支持格式为<span id="docFixName">doc,docx,pdf,wps</span>；
                                            若您准备上传的文档是小语种文献，为提供更好的服务和体验，建议您上传word文档(doc、 docx)
                                        </span>
                                </p>
                                <div></div>
                                <span id="webUploaderPick" class="webuploader-container">
                                    <div class="webuploader-pick">上传论文（待检测）
                                    <input type="file" id="file" name="file"/>

                                    </div>
                                    <div
                                            id="rt_rt_1f4epa36617mi1ui7102tpn016jb2"
                                            style="position: absolute; inset: -3.125px auto auto 5px; width: 145px; height: 24px; overflow: hidden;">
<%--                                <input type="file" capture="camera" name="file" class="webuploader-element-invisible" accept=".doc,.docx,.pdf,.wps">--%>
                                <label
                                        style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);">

                                </label>
                                    </div>
                                </span>


                            </li>

                        </ul>
                    </div>
                        <%--                <div class="details disNone">--%>
                        <%--                    <ul class="gxf_report_box">--%>
                        <%--                        <li id="thesisAtt" style="">--%>
                        <%--                            <p>--%>
                        <%--                                添加附件：<span class="statement" id="scfj">上传相关的附件，上传的文件将以附件的形式显示。支持附件格式为doc，docx，pdf，wps，rar，zip</span>--%>
                        <%--                            </p>--%>
                        <%--                            <div style="color: #f00; font-size: 12px;">--%>
                        <%--                                提示：附件内容不检测，也不作为毕设论文存储和查询（仅作为论文以外其他附件处理）；需要检测或存档的论文请提交至“--%>
                        <%--                                <span class="titleNAme">上传论文（待检测）</span>”处--%>
                        <%--                            </div>--%>
                        <%--                            <p></p>--%>
                        <%--                            <input class="easyui-textbox textbox-f" data-options="readonly:true,prompt: '此处为附件文件，不检测'"--%>
                        <%--                                   id="attTxtFileName" style="width: 300px; display: none;"><span--%>
                        <%--                                class="textbox textbox-readonly" style="width: 298px;"><input--%>
                        <%--                                id="_easyui_textbox_input8" type="text"--%>
                        <%--                                class="textbox-text validatebox-text validatebox-readonly textbox-prompt"--%>
                        <%--                                autocomplete="off" tabindex="" readonly="" placeholder="此处为附件文件，不检测"--%>
                        <%--                                style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 24px; line-height: 24px; width: 290px;"><input--%>
                        <%--                                type="hidden" class="textbox-value" value=""></span>--%>
                        <%--                            <span id="attachmentWebUploaderPick" class="webuploader-container"><div--%>
                        <%--                                    class="webuploader-pick">选择附件（不检测）</div><div id="rt_rt_1f4epa375th69tf13cph8u1hba6"--%>
                        <%--                                                                                 style="position: absolute; inset: 0px auto auto 0px; width: 20px; height: 4px; overflow: hidden;"><input--%>
                        <%--                                    type="file" capture="camera" name="file" class="webuploader-element-invisible"--%>
                        <%--                                    accept=".doc,.docx,.pdf,.wps,.rar,.zip"><label--%>
                        <%--                                    style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label></div></span>--%>
                        <%--                            <div id="divAttachmentFileProgressContainer"></div>--%>
                        <%--                        </li>--%>
                        <%--                    </ul>--%>
                        <%--                </div>--%>
                </div>
            </div>
        </form:form>

    </div>

    <ul class="margt">
        <li>
            <input type="submit" onclick="chose()"/>
            <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </li>
    </ul>
</div>

</body>
</html>
