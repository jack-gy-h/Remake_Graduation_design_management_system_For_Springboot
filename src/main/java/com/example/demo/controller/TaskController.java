package com.example.demo.controller;


import com.example.demo.Util.ExportExcel;
import com.example.demo.Util.UUIDUtil;
//import com.example.demo.annotation.ControllerLog;
import com.example.demo.entity.*;
import com.example.demo.service.AssignmentBookService;
import com.example.demo.service.LogServiceI;
import com.example.demo.service.OfficeService;
import com.example.demo.service.TaskService;
import com.google.common.collect.Maps;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "task")
public class TaskController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

    @Autowired
    private TaskService taskService;

    @Autowired
    private LogServiceI logServiceI;

    @Autowired
    private OfficeService officeService;

    @Autowired
    private AssignmentBookService assignmentBookService;


    //    师生双选保存功能
    @RequestMapping(value = "/form/save")
    public String saveTask(Task task, HttpServletRequest request, Log log) {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        Date date = new Date();

        System.out.print("task.getId():" + task.getId());

//        如果id是空的，则说明是添加操作
        if (task.getId() == null || task.getId().equals("")) {

            String Id = UUIDUtil.getUUID();


//            由于是添加操作，因此要添加taskid。
            task.setId(Id);
//          师生双选
            task.setPattern("1");

            task.setTeacherId(userId);

            task.setAuditStatus("3");

            task.setGrade(((User) SecurityUtils.getSubject().getSession().getAttribute("user")).getGrade());

//            task.setUpdateBy(userId);
//
//            task.setCreateBy(userId);

            task.setCreateDate(date);

            task.setUpdateDate(date);


//            task.setDelFlag("0");


            taskService.inserttask(task);

            String id = UUID.randomUUID().toString().replace("-", "");

            String requestUri = request.getRequestURI();//请求的Uri

            User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//            String userId = loginUser.getId();

            String roleid = loginUser.getRoleId();


            log.setLid(id);

            log.setLaction("添加");

            log.setLcreator(userId);

            log.setIurl(requestUri);

            log.setLremark("课题");

            log.setLtask(Id);

            log.setLcreatorrole(roleid);

            log.setLcreatetime(new Date());

            logServiceI.insertSelective(log);

        } else {

//            task.setUpdateBy(userId);


//修改之后肯定是未审核状态

            task.setAuditStatus("3");

            task.setUpdateDate(date);
//            if (task.getCreateBy() == null) {
//                task.setCreateBy(userId);
//            }
//            if (task.getCreateDate() == null) {
//
//                task.setCreateDate(date);
//
//            }

            taskService.updateTask(task);

            String id = UUID.randomUUID().toString().replace("-", "");

            String requestUri = request.getRequestURI();//请求的Uri

            User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//            String userId = loginUser.getId();

            String roleid = loginUser.getRoleId();


            log.setLid(id);

            log.setLaction("修改");

            log.setLcreator(userId);

            log.setIurl(requestUri);

            log.setLremark("课题");

            log.setLtask(task.getId());

            log.setLcreatorrole(roleid);

            log.setLcreatetime(new Date());

            logServiceI.insertSelective(log);


        }

        System.out.print("task.getOfficeList()1:" + task.getOfficeList());

        System.out.print("task.getOfficeIdList()1:" + task.getOfficeIdList());

        System.out.print("task.getOfficeIds()1:" + task.getOfficeIds());

        taskService.deleteTaskOffice(task);

        taskService.insertTaskOffice(task);

        System.out.println("task.getOfficeIdList():" + task.getOfficeIdList());


        return "teacherTaskList";


    }

    //    系主任审核双选题目
    @RequestMapping(value = "/audit/doublelist")
    public String auditdoublelist(Task task, HttpServletRequest request, Log log) {


        return "auditdoubleTaskList";


    }


    //    整体思路：
//    取出该学年的
//    本专业下的
//    双选题目（t.pattern=1）
//    而且该题目还没有被审核（t.audit_status = 3）
//    而且是正常状态下的题目（t.del_Flag = 0）
    @RequestMapping(value = "/audit/double/ListData")
    @ResponseBody
    public Map<String, Object> auditdoubleListData(int page, int rows) {

        //        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String officet = office;

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);
//        System.out.println("source:" + source);

        List<Task> taskList = taskService.getdoubletaskListByPageAndRowsForAuditDouble(page, rows, grade, majorid);


//        System.out.print("taskList.get(0).getTopic():"+taskList.get(0));
//
//        System.out.print("taskList.get(0).getCreateDate():" + taskList.get(0).getCreateDate());

//        System.out.print(taskList.get(0).get);


//        System.out.println("taskList.get(0).getIdentityNumber():" + taskList.get(0).getIdentityNumber());
//
//        System.out.print("taskList.get(0).getCollegeid():" + taskList.get(0).getCollegeid());


//        for (int i = 0; i < taskList.size(); i++) {
//            String collegeid = taskList.get(i).getCollegeid();
//
//            if (collegeid != null) {
//
//                Office college = officeService.getOffice(collegeid);
//
//                String college_name = college.getName();
//
//                taskList.get(i).setCollegeid(college_name);
//            }
//
//        }

//        Office office = officeService.getOffice(college_id);
//
//        String college_id_CN = office.getName();

        Count = taskService.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }


    //    只有返回键的viewtopic
    @RequestMapping(value = "/viewtopic")

    public String viewtopic(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");

        Task task = taskService.getTaskTotalInformationById(id);

//        task.get


        model.addAttribute("task", task);
//
//        List<Office> officeList = officeService.getOfficeParentListById("1");
//        for (int i = 0; i < officeList.size(); i++) {
//            System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
//        }
//
//        model.addAttribute("UserParentOffice", officeList);

//        model.addAttribute("task",task);

        return "viewtopicfordoubleaudit";


    }

    @RequestMapping(value = "/audit/double")
    public String auditdouble(HttpServletRequest request, Log log) {

        String id = request.getParameter("id");

        String audit_status = request.getParameter("audit_status");

        System.out.print("id:" + id);

        System.out.print("audit_status:" + audit_status);

        String idss = request.getParameter("idss");

        String state = request.getParameter("state");

        if (audit_status != null) {
            if (audit_status.equals("1") || audit_status.equals("2")) {
                System.out.print("111111111111111111111111");

                Task task = taskService.getTaskByIdTrue(id);

                System.out.print("2222222222222222222222222222");

                task.setAuditStatus(audit_status);

                System.out.print("task.getCreateDate():" + task.getCreateDate());

                taskService.updateTask(task);

                System.out.print("444444444444444444444444");

                String logid = UUID.randomUUID().toString().replace("-", "");

                String requestUri = request.getRequestURI();//请求的Uri

                User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

                String userId = loginUser.getId();

                String roleid = loginUser.getRoleId();


                log.setLid(logid);

                if (audit_status.equals("1")) {

                    log.setLaction("通过");

                } else if (audit_status.equals("2")) {

                    log.setLaction("不通过");
                }


                log.setLcreator(userId);

                log.setIurl(requestUri);

                log.setLremark("双选课题审核");

                log.setLtask(id);

                log.setLcreatorrole(roleid);

                log.setLcreatetime(new Date());

                logServiceI.insertSelective(log);


            }

        }


        if (state != null) {
            if (state.equals("1") || state.equals("2")) {
                String[] strings = idss.split(",");
                for (String str : strings) {

                    Task task = taskService.getTaskByIdTrue(str);

                    task.setAuditStatus(state);

                    taskService.updateTask(task);

                    String logid = UUID.randomUUID().toString().replace("-", "");

                    String requestUri = request.getRequestURI();//请求的Uri

                    User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

                    String userId = loginUser.getId();

                    String roleid = loginUser.getRoleId();


                    log.setLid(logid);

                    if (state.equals("1")) {

                        log.setLaction("通过");

                    } else if (state.equals("2")) {

                        log.setLaction("不通过");
                    }


                    log.setLcreator(userId);

                    log.setIurl(requestUri);

                    log.setLremark("双选课题审核");

                    log.setLtask(str);

                    log.setLcreatorrole(roleid);

                    log.setLcreatetime(new Date());

                    logServiceI.insertSelective(log);
//                int id = Integer.parseInt(str);
//                Topic topic = topicService.getTopicById(id);
//                topic.setTopicAuditStatus(state);
//                topicService.updateTopic(topic);
//            Blog blog = blogService.getBlogById(comment.getBlogId());
//            blog.setReplyCount(commentService.getPassedCommentCountByBlogId(blog.getId()));
//            blogService.updateBlog(blog);
                }

            }

        }

        return "redirect:/task/audit/doublelist";


    }

    //    学生双选查看列表
    @RequestMapping(value = "/student/doublechoselist")
    public String studentdoublechoselist(Model model) {

        List<Office> officeList = officeService.getOfficeParentListById("1");
        for (int i = 0; i < officeList.size(); i++) {
            System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
        }

        model.addAttribute("UserParentOffice", officeList);

        return "studentTaskList";


    }

    // 学生双选列表加载
    /*
    只能看你能选的（tc.CanBeChosenMajor = #{majorid}）
    双选的（t.pattern = 1）
    通过审核的（t.audit_status = 1）
   该学年的（t.grade = #{grade}）
   正常的题目（AND t.del_flag = 0）
   */
    @RequestMapping(value = "/student/doubletaskListData")
    @ResponseBody
    public Map<String, Object> doubletaskListData(int page, int rows, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
//        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String officet = office;

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        System.out.println("page:" + page);
        System.out.println("rows:" + rows);
        System.out.println("grade:" + grade);
        System.out.println("userId:" + userId);
        System.out.println("office:" + office);
        System.out.println("topic:" + topic);
        System.out.println("teacher:" + teacher);
        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
        System.out.println("type:" + type);


        List<Task> taskList = taskService.getstudentdoubletaskListByPageAndRows(page, rows, grade, majorid, office, topic, teacher, teacheridentitynumber, type, source);

//        List<Task>  list = Lists.newArrayList();
//
//
//        for(int i =0 ; i <taskList.size();i++){
//            if (taskList.get(i).getTcs() == null || !taskList.get(i).getTcs().equals("2")) {
//
//                list.add(taskList.get(i));
//
//            }
//        }


//        System.out.println("taskList.get(0).getTcs():" + taskList.get(0).getTcs());


//        System.out.print("taskList.get(0).getTopic():"+taskList.get(0));
//
//        System.out.print("taskList.get(0).getCreateDate():" + taskList.get(0).getCreateDate());

//        System.out.print(taskList.get(0).get);


//        System.out.println("taskList.get(0).getIdentityNumber():" + taskList.get(0).getIdentityNumber());
//
//        System.out.print("taskList.get(0).getCollegeid():" + taskList.get(0).getCollegeid());


//        for (int i = 0; i < taskList.size(); i++) {
//            String collegeid = taskList.get(i).getCollegeid();
//
//            if (collegeid != null) {
//
//                Office college = officeService.getOffice(collegeid);
//
//                String college_name = college.getName();
//
//                taskList.get(i).setCollegeid(college_name);
//            }
//
//        }

//        Office office = officeService.getOffice(college_id);
//
//        String college_id_CN = office.getName();


//        Count = taskService.getdoubletaskListCountByPageAndRows(page, rows, grade, userId, office, topic, teacher, teacheridentitynumber, type, source);

        Count = taskService.getstudentdoubletaskListCountByPageAndRows(page, rows, grade, majorid, office, topic, teacher, teacheridentitynumber, type, source);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }

    //    学生查看题目，附带日志记录
    @RequestMapping(value = "/student/viewtopic")

    public String studentviewtopic(Model model, HttpServletRequest request) {

        String id = request.getParameter("id");

        Task task = taskService.getTaskTotalInformationById(id);

//        task.get


        model.addAttribute("task", task);
//
//        List<Office> officeList = officeService.getOfficeParentListById("1");
//        for (int i = 0; i < officeList.size(); i++) {
//            System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
//        }
//
//        model.addAttribute("UserParentOffice", officeList);

//        model.addAttribute("task",task);

        return "viewtopicforstudentchoose";


    }

    //    获取当前课题下的操作日志记录数据
    @RequestMapping(value = "/viewlogDatafordoubletask")
    @ResponseBody
    public Map<String, Object> viewlogDatafordoubletask(int page, int rows, String taskid) {
//        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String officet = office;

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);
//        System.out.println("source:" + source);

//        遴选出属于这个选题的日志
        List<Task> taskList = taskService.getviewlogDatafordoubletaskByPageAndRows(page, rows, taskid);

        System.out.print("taskList.get(0).getOperator():" + taskList.get(0).getOperator());


//        System.out.print("taskList.get(0).getTopic():"+taskList.get(0));
//
//        System.out.print("taskList.get(0).getCreateDate():" + taskList.get(0).getCreateDate());

//        System.out.print(taskList.get(0).get);


//        System.out.println("taskList.get(0).getIdentityNumber():" + taskList.get(0).getIdentityNumber());
//
//        System.out.print("taskList.get(0).getCollegeid():" + taskList.get(0).getCollegeid());


//        for (int i = 0; i < taskList.size(); i++) {
//            String collegeid = taskList.get(i).getCollegeid();
//
//            if (collegeid != null) {
//
//                Office college = officeService.getOffice(collegeid);
//
//                String college_name = college.getName();
//
//                taskList.get(i).setCollegeid(college_name);
//            }
//
//        }

//        Office office = officeService.getOffice(college_id);
//
//        String college_id_CN = office.getName();


//        Count = taskService.getdoubletaskListCountByPageAndRows(page, rows, grade, userId, office, topic, teacher, teacheridentitynumber, type, source);

//        Count = taskService.getstudentdoubletaskListCountByPageAndRows(page, rows, grade, majorid, office, topic, teacher, teacheridentitynumber, type, source);

        Count = taskService.getviewlogDatafordoubletaskCountByPageAndRows(page, rows, taskid);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }


//    查看确认通过的选题的数目

//    有选题是指自己本身id在task_chosen表中（即tc.chosen_student = #{userId}）

//    而且teacher_choose_status为2（确认通过）（tc.teacher_choose_status = 2）

    //    这里无论是什么类型的选题，只要被选上都符合上面的条件
    @RequestMapping(value = "/student/judge/haschosenAndPass")
    @ResponseBody
    public int taskstudentjudgehaschosenAndPass() {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId();

        String majorid = user.getMajorid();

        String grade = user.getGrade();

        int Count = taskService.gettaskstudentjudgehaschosen(userId);

        return Count;


    }

//    查看等待确认的课题数，即已选题数

//    你自己

//    WHERE tc.chosen_student = #{userId}

//    等待确认的课题
//          AND tc.teacher_choose_status = 1


    @RequestMapping(value = "/student/judge/haschosenThree")
    @ResponseBody
    public int taskstudentjudgehaschosenThree() {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId();

        int Count = taskService.gettaskstudentjudgehaschosenThreeTitle(userId);

        return Count;


    }

    //学生选题时
//判断选了几个人
//            WHERE tc.task_id = #{taskid}
//          AND tc.teacher_choose_status = 1
//    该选题下等待确认的人数
//    即使是退选或者选上了也需要老师手动退选，因此无需担心
    @RequestMapping(value = "/student/judge/haschosenPeople")
    @ResponseBody
    public int taskstudentjudgehaschosenPeople(String taskid) {

        System.out.print("taskid:" + taskid);

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId();

        int Count = taskService.gettaskstudentjudgehaschosenThreePeople(taskid);

        return Count;


    }

    //    学生选题时
//    判断是否选择了这个题目
    @RequestMapping(value = "/student/judge/whetherchoosethistask")
    @ResponseBody
    public int studentjudgewhetherchoosethistask(String taskid) {

        System.out.print("taskid:" + taskid);

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId();

        int Count = taskService.gettaskstudentjudgewhetherchoosethistask(taskid, userId);

        return Count;


    }
//   @ControllerLog(Action = "选择",Remark = "课题")
    //    学生双选题目选择 插入操作
    @RequestMapping(value = "/student/double/choose")
    public String taskstudentdoublechoose(HttpServletRequest request, Log log) {

        String taskid = request.getParameter("taskid");

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId();

        taskService.studentdoublechoose(taskid, userId);

//        String id = UUID.randomUUID().toString().replace("-", "");
//
//        String requestUri = request.getRequestURI();//请求的Uri
//
////        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
////            String userId = loginUser.getId();
//
//        String roleid = user.getRoleId();
//
//
//        log.setLid(id);
//
//        log.setLaction("选择");
//
//        log.setLcreator(userId);
//
//        log.setIurl(requestUri);
//
//        log.setLremark("课题");
//
//        log.setLtask(taskid);
//
//        log.setLcreatorrole(roleid);
//
//        log.setLcreatetime(new Date());
//
//        logServiceI.insertSelective(log);

        return "redirect:/task/student/doublechoselist";


    }

    //    学生已经进行双选的题目列表
    @RequestMapping(value = "/student/haschosendoubletaskListData")
    @ResponseBody
    public Map<String, Object> taskstudenthaschosendoubletaskListData(int page, int rows) {

        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);


        List<Task> taskList = taskService.gettaskstudenthaschosendoubletaskListDataByPageAndRows(page, rows, userId);


        Count = taskService.gettaskstudenthaschosendoubletaskListDataCountByPageAndRows(page, rows, userId);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }
//@ControllerLog(Action = "退选",Remark = "题目")
    //    学生取消选题
    @RequestMapping(value = "/student/deletehaschosentopic")
    public String taskstudentdeletehaschosentopic(HttpServletRequest request, Log log) {

        String taskid = request.getParameter("taskid");

//        System.out.print("taskid:" + taskid);

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = loginUser.getId();

        taskService.deletehaschosentopic(taskid, userId);

//        Role role = roleService.getRoleById(id);
//
//        role.setDelFlag("1");
//
//        roleService.deleteRole(role);

//        String id1 = UUID.randomUUID().toString().replace("-", "");
//
//        String requestUri = request.getRequestURI();//请求的Uri
//
//
//        String roleid = loginUser.getRoleId();
//
//
//        log.setLid(id1);
//
//        log.setLaction("退选");
//
//        log.setLcreator(userId);
//
//        log.setIurl(requestUri);
//
//        log.setLremark("题目");
//
//        log.setLtask(taskid);
//
//        log.setLcreatorrole(roleid);
//
//        log.setLcreatetime(new Date());
//
//        logServiceI.insertSelective(log);

        return "redirect:/task/student/doublechoselist";


    }

    //    选出选了自己的题目的双选的学生
//    选出自己的t.teacher_id = #{userId}
//    审核状态不为空的AND tc.teacher_choose_status is not null
//    而且属于自己学年的题目AND t.grade = #{grade}
//    并且是双选的t.pattern = 1
    @RequestMapping(value = "/viewchosenstudentallListData")
    @ResponseBody
    public Map<String, Object> viewchosenstudentallListData(int page, int rows) {

        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);

        System.out.print("userId:" + userId);


        List<Task> taskList = taskService.getviewchosenstudentallListData(page, rows, userId, grade);

//    System.out.print(taskList.get(0));


        Count = taskService.getviewchosenstudentallListDataCountByPageAndRows(page, rows, userId, grade);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }

    @RequestMapping(value = "/teacher/judge/haschosenAndPass")
    @ResponseBody
    public int taskteacherjudgehaschosenAndPass(String studentId) {

        int Count = taskService.gettaskstudentjudgehaschosen(studentId);

        return Count;


    }


    //    进入学生申报题目的发布界面
    @RequestMapping(value = "/student/releasetopic")
    public String taskstudentreleasetopic() {


        return "studentReleaseTaskList";


    }

    //添加学生申报题目操作
    @RequestMapping(value = "/student/releasetopic/form")
    public String taskstudentreleasetopicform(HttpServletRequest request, Task task, Model model) {

        String id = request.getParameter("id");
        String taskid = task.getId();


        if (taskid != null) {
            task = taskService.getTaskById(id);


            model.addAttribute("task", task);
//            System.out.println("id:"+id);
            System.out.println("task.getCreateDate():" + task.getCreateDate());

            System.out.print("task.getOfficeIdList():" + task.getOfficeIdList());

            System.out.print("task.getOfficeIds()" + task.getOfficeIds());


        }
//        没有id肯定是添加操作
//        这里就开始，什么都没有
        else if (id == null) {
            task = new Task();

//            task.setCanbechosencollegeid("1");
//            task.setCanbechosencollegeid("2");
            model.addAttribute("task", task);
        }
//        有id肯定是修改操作
        else if (id != null) {
//            这里并不会提交表单，因此也不会有task传过来

            task = taskService.getTaskById(id);


            model.addAttribute("task", task);
//            System.out.println("id:"+id);
            System.out.println("task.getCreateDate():" + task.getCreateDate());

            System.out.print("task.getOfficeIdList():" + task.getOfficeIdList());

            System.out.print("task.getOfficeIds()" + task.getOfficeIds());
        }
//    List<Office> officeList = officeService.getOfficeParentListById("1");
//    for (int i = 0; i < officeList.size(); i++) {
//        System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
//    }
//
//    model.addAttribute("UserParentOffice", officeList);
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String usergrade = user.getGrade();

        model.addAttribute("usergrade", usergrade);

        return "studentreleasetopic";

    }


    //获取学生申报题目的列表
//获取选题模式为学生申报（即pattern = 3）
//    而且正常的（t.del_flag = 0）
//    属于自己的（tc.chosen_student = #{userId}）
//    而且是自己年级（t.grade = #{grade}）
//    的课题
//    最后一个年级主要是预防留级学生的获取
    @RequestMapping(value = "/student/releasetaskListData")
    @ResponseBody
    public Map<String, Object> taskstudentreleasetaskListData(int page, int rows) {


        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);

        System.out.print("userId:" + userId);


        List<Task> taskList = taskService.gettaskstudentreleasetaskListData(page, rows, userId, grade);


//    Count = taskService.getviewchosenstudentallListDataCountByPageAndRows(page, rows, userId, grade);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }

    //保存申报题目操作（包括添加和修改操作）
    @RequestMapping(value = "/student/release/save")
    public String taskstudentreleasesave(Task task) {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        String grade = user.getGrade();

        Date date = new Date();

        System.out.print("task.getId():" + task.getId());

        if (task.getId() == null || task.getId().equals("")) {

            String Id = UUIDUtil.getUUID();


//            由于是添加操作，因此要添加taskid。
            task.setId(Id);

            task.setPattern("3");

            task.setTeacherId(task.getTeachername());

            task.setAuditStatus("3");

            task.setGrade(grade);

            task.setCreateDate(new Date());

            task.setUpdateDate(new Date());

            task.setDelFlag("0");

            taskService.inserttask(task);

            task.setStudentId(userId);

            taskService.inserttaskchosen(task);


//        task.setCanbechosencollegeid();

        } else {
            task.setAuditStatus("3");

            task.setUpdateDate(new Date());

            taskService.updatetask(task);

            task.setStudentId(userId);

            taskService.updatetaskchosen(task);


        }

        return "redirect:/task/student/releasetopic";


    }

    ///student/modifytopic
//    学生申报题目的修改
    @RequestMapping(value = "/student/modifytopic")
    public String taskstudentmodifytopic(HttpServletRequest request, Task task, Model model) {

        String id = request.getParameter("id");

        task = taskService.getTaskForstudentchoosemodifyById(id);


        model.addAttribute("task", task);

        return "modifystudentreleasetopic";


    }

    //    学生申报题目的自我删除
    @RequestMapping(value = "/student/delete")
    public String taskstudentreleasefordelete(HttpServletRequest request, Task task, Model model) {

        String id = request.getParameter("id");


        task = taskService.getTaskById(id);

        task.setDelFlag("1");

        taskService.deleteTask(task);


        model.addAttribute("task", task);

        return "redirect:/task/student/releasetopic";


    }

    //    /task/teacher/audit/studentrelese
//    教师进入审核学生申报题目的信息的界面
    @RequestMapping(value = "/teacher/audit/studentrelese")
    public String taskteacherauditstudentrelese(HttpServletRequest request, Task task, Model model) {


        return "teacherauditstudentrelease";


    }

//教师获取学生申报题目列表

    //获取学生申报的（t.pattern = 3）
//    指定自己的（t.teacher_id = #{userId}）
//    当前年限的（t.grade = #{grade}）
//    正常的（即没有被删除的）题目（t.del_flag = 0）
//    由于没有中间人的审核，因此无所谓审核状态
    @RequestMapping(value = "/viewauditstudentreleaseListData")
    @ResponseBody
    public Map<String, Object> taskviewauditstudentreleaseListData(int page, int rows) {

        //        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String officet = office;

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);
//        System.out.println("source:" + source);

        List<Task> taskList = taskService.gettaskviewauditstudentreleaseListData(page, rows, userId, grade);


//        System.out.print("taskList.get(0).getTopic():"+taskList.get(0));
//
//        System.out.print("taskList.get(0).getCreateDate():" + taskList.get(0).getCreateDate());

//        System.out.print(taskList.get(0).get);


//        System.out.println("taskList.get(0).getIdentityNumber():" + taskList.get(0).getIdentityNumber());
//
//        System.out.print("taskList.get(0).getCollegeid():" + taskList.get(0).getCollegeid());


//        for (int i = 0; i < taskList.size(); i++) {
//            String collegeid = taskList.get(i).getCollegeid();
//
//            if (collegeid != null) {
//
//                Office college = officeService.getOffice(collegeid);
//
//                String college_name = college.getName();
//
//                taskList.get(i).setCollegeid(college_name);
//            }
//
//        }

//        Office office = officeService.getOffice(college_id);
//
//        String college_id_CN = office.getName();

//    Count = taskService.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }

    //教师申报题目列表界面
    @RequestMapping(value = "/teacher/assignstudent")
    public String taskteacherassignstudent() {


        return "TeacherassignstudentTaskList";


    }

    //    教师申报题目
//    添加/修改界面进入
    @RequestMapping(value = "/teacher/assignstudent/form")
    public String taskteacherassignstudentform(HttpServletRequest request, Task task, Model model) {

        String id = request.getParameter("id");
        String taskid = task.getId();


        if (taskid != null) {
            task = taskService.getTaskById(id);


            model.addAttribute("task", task);
//            System.out.println("id:"+id);
            System.out.println("task.getCreateDate():" + task.getCreateDate());

            System.out.print("task.getOfficeIdList():" + task.getOfficeIdList());

            System.out.print("task.getOfficeIds()" + task.getOfficeIds());


        }
//        没有id肯定是添加操作
//        这里就开始，什么都没有
        else if (id == null) {
            task = new Task();

//            task.setCanbechosencollegeid("1");
//            task.setCanbechosencollegeid("2");
            model.addAttribute("task", task);
        }
//        有id肯定是修改操作
        else if (id != null) {
//            这里并不会提交表单，因此也不会有task传过来

            task = taskService.getTaskById(id);


            model.addAttribute("task", task);
//            System.out.println("id:"+id);
            System.out.println("task.getCreateDate():" + task.getCreateDate());

            System.out.print("task.getOfficeIdList():" + task.getOfficeIdList());

            System.out.print("task.getOfficeIds()" + task.getOfficeIds());
        }
//    List<Office> officeList = officeService.getOfficeParentListById("1");
//    for (int i = 0; i < officeList.size(); i++) {
//        System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
//    }
//
//    model.addAttribute("UserParentOffice", officeList);
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String usergrade = user.getGrade();

        model.addAttribute("usergrade", usergrade);

        return "teacherassignstudent";

    }

    //教师申报题目
// 保存功能
    @RequestMapping(value = "/teacher/assignstudent/save")
    public String taskteacherassignstudentsave(Task task) {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        String grade = user.getGrade();

        Date date = new Date();

        System.out.print("task.getId():" + task.getId());

        if (task.getId() == null || task.getId().equals("")) {

            String Id = UUIDUtil.getUUID();


//            由于是添加操作，因此要添加taskid。
            task.setId(Id);

            task.setPattern("2");

            task.setTeacherId(userId);

            task.setAuditStatus("3");

            task.setGrade(grade);

            task.setCreateDate(new Date());

            task.setUpdateDate(new Date());

            task.setDelFlag("0");

            taskService.inserttask(task);

            task.setStudentId(task.getStudentname());

            taskService.inserttaskchosen(task);


//        task.setCanbechosencollegeid();

        } else {
            task.setAuditStatus("3");

            task.setUpdateDate(new Date());

            taskService.updatetask(task);

            taskService.updatetaskchosen(task);


        }

        return "redirect:/task/teacher/assignstudent";


    }

    //    教师申报题目列表数据获取
    @RequestMapping(value = "/teacherassignListData")
    @ResponseBody
    public Map<String, Object> taskteacherassignListData(int page, int rows) {


        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);

        System.out.print("userId:" + userId);


        List<Task> taskList = taskService.gettaskteacherassignListData(page, rows, userId, grade);


//    Count = taskService.getviewchosenstudentallListDataCountByPageAndRows(page, rows, userId, grade);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }

    //  教师修改申报课题界面进入
    @RequestMapping(value = "/teacher/modifyassigntopic")
    public String taskteachermodifyassigntopic(HttpServletRequest request, Task task, Model model) {

        String id = request.getParameter("id");

        task = taskService.getTaskForstudentchoosemodifyById(id);


        model.addAttribute("task", task);

        return "modifyteacherassigntopic";
//


    }

//    /task/audit/teacherassign


    //    系主任审核教师申报题目
    @RequestMapping(value = "/audit/teacherassign")
    public String taskauditteacherassign(HttpServletRequest request, Task task, Model model) {


        return "directorauditteacherassign";


    }

    //    系主任获取教师申报题目列表数据
    @RequestMapping(value = "/viewauditteacherassignListData")
    @ResponseBody
    public Map<String, Object> taskviewauditteacherassignListData(int page, int rows) {

        //        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String officet = office;

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);
//        System.out.println("source:" + source);

        List<Task> taskList = taskService.gettaskviewauditteacherassignListData(page, rows, grade, majorid);


//        System.out.print("taskList.get(0).getTopic():"+taskList.get(0));
//
//        System.out.print("taskList.get(0).getCreateDate():" + taskList.get(0).getCreateDate());

//        System.out.print(taskList.get(0).get);


//        System.out.println("taskList.get(0).getIdentityNumber():" + taskList.get(0).getIdentityNumber());
//
//        System.out.print("taskList.get(0).getCollegeid():" + taskList.get(0).getCollegeid());


//        for (int i = 0; i < taskList.size(); i++) {
//            String collegeid = taskList.get(i).getCollegeid();
//
//            if (collegeid != null) {
//
//                Office college = officeService.getOffice(collegeid);
//
//                String college_name = college.getName();
//
//                taskList.get(i).setCollegeid(college_name);
//            }
//
//        }

//        Office office = officeService.getOffice(college_id);
//
//        String college_id_CN = office.getName();

//    Count = taskService.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }

    //    系主任审核教师申报题目操作
    @RequestMapping(value = "/audit/teacherassignTask")
    public String auditteacherassign(HttpServletRequest request, Log log) {

        String id = request.getParameter("id");

        String audit_status = request.getParameter("audit_status");

//        studentid

        String studentid = request.getParameter("studentid");

        String teacherchoosestatus = request.getParameter("teacherchoosestatus");

//        teacherchoosestatus

        System.out.print("id:" + id);

        System.out.print("audit_status:" + audit_status);

        if (audit_status.equals("1") || audit_status.equals("2")) {

            Task task = taskService.getTaskById(id);

            task.setAuditStatus(audit_status);

            taskService.updateTask(task);

            task.setStudentId(studentid);

            task.setTeacherchoosestatusId(teacherchoosestatus);

            taskService.updatetaskteacherassign(task);

            String logid = UUID.randomUUID().toString().replace("-", "");

            String requestUri = request.getRequestURI();//请求的Uri

            User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

            String userId = loginUser.getId();

            String roleid = loginUser.getRoleId();


            log.setLid(logid);

            if (audit_status.equals("1")) {

                log.setLaction("通过");

            } else if (audit_status.equals("2")) {

                log.setLaction("不通过");
            }


            log.setLcreator(userId);

            log.setIurl(requestUri);

            log.setLremark("双选课题审核");

            log.setLtask(id);

            log.setLcreatorrole(roleid);

            log.setLcreatetime(new Date());

            logServiceI.insertSelective(log);


        }
        return "redirect:/task/audit/teacherassign";


    }

    //    教师进入自己
    //    已经确认选题
    //    的学生列表
//    三种选题模式均可
    @RequestMapping(value = "/assignment/bookList")
    public String taskassignmentbookList() {


        return "teacherAllWasChosen";


    }

    //    获取所有确认选题学生的列表
    @RequestMapping(value = "/viewchosenstudentallForanypatternListData")
    @ResponseBody
    public Map<String, Object> viewchosenstudentallForanypatternListData(int page, int rows) {

        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.println("page:" + page);
//        System.out.println("rows:" + rows);
//        System.out.println("grade:" + grade);
//        System.out.println("userId:" + userId);
//        System.out.println("office:" + office);
//        System.out.println("topic:" + topic);
//        System.out.println("teacher:" + teacher);
//        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
//        System.out.println("type:" + type);

        System.out.print("userId:" + userId);


        List<Task> taskList = taskService.getviewchosenstudentallForanypatternListData(page, rows, userId, grade);


        Count = taskService.getviewchosenstudentallListDataCountByPageAndRows(page, rows, userId, grade);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }

    //    进入添加/修改任务书界面
    @RequestMapping(value = "/assignmentbook/form")
    public String taskassignmentbookform(HttpServletRequest request, AssignmentBook assignmentBook, Model model) {

        String taskid = request.getParameter("taskid");

        String assignmentbookid = request.getParameter("assignmentbookid");

        String viewid = request.getParameter("viewid");


//        String taskid = task.getId();


        if (assignmentbookid != null) {
            assignmentBook = assignmentBookService.getAssignmentBookById(assignmentbookid);

            if (viewid != null) {
                if (viewid.equals("1")) {

                    assignmentBook.setViewid(viewid);


                }
            }


//            assignmentBook.setTaskid(taskid);


            model.addAttribute("assignmentBook", assignmentBook);


        }
//        没有id肯定是添加操作
//        这里就开始，什么都没有
        else if (assignmentbookid == null) {

            assignmentBook.setTaskid(taskid);

            System.out.print("assignmentBook.getTaskid():" + assignmentBook.getTaskid());

//            task.setCanbechosencollegeid("1");
//            task.setCanbechosencollegeid("2");
            model.addAttribute("assignmentBook", assignmentBook);
        }


        return "AssignmentForm";

    }

    //    添加/保存任务书操作
    @RequestMapping(value = "/assignmentbook/form/save")
    public String taskassignmentbookformsave(AssignmentBook assignmentBook, Task task) {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        String grade = user.getGrade();

        Date date = new Date();

//        System.out.print("task.getId():" + task.getId());

        if (assignmentBook.getId() == null || assignmentBook.getId().equals("")) {

            String Id = UUIDUtil.getUUID();


//            由于是添加操作，因此要添加taskid。
            assignmentBook.setId(Id);


            assignmentBook.setAuditStatus("1");

//            System.out.print("assignmentBook.getId():"+assignmentBook.getId());
//
//            System.out.print("assignmentBook.getContentRequirements():" + assignmentBook.getContentRequirements());
//
//            System.out.print(" assignmentBook.getReferences():" + assignmentBook.getReferences());
//
//            System.out.print("assignmentBook.getScheduling():" + assignmentBook.getScheduling());
//
//            System.out.print("assignmentBook.getAuditStatus():" + assignmentBook.getAuditStatus());
//
//            System.out.print("assignmentBook.getTaskid():" + assignmentBook.getTaskid());


            assignmentBookService.insertassignmentBook(assignmentBook);

//            要更新task表中任务书的id
//            先按照传过来的taskid查询到相应的task
//            再将任务书id set进去
//            之后再进行update

            task = taskService.getTaskByIdTrue(assignmentBook.getTaskid());

            task.setAssignmentbookId(Id);

            System.out.print("task.getAssignmentbookId():" + task.getAssignmentbookId());

            taskService.updateTask(task);


//        task.setCanbechosencollegeid();

        } else {

            System.out.print("assignmentBook.getId()111:" + assignmentBook.getId());


            assignmentBook.setAuditStatus("1");

            assignmentBookService.updateAssignmentBook(assignmentBook);


//            task.setAuditStatus("3");
//
//            task.setUpdateDate(new Date());
//
//            taskService.updatetask(task);
//
//            taskService.updatetaskchosen(task);


        }

        return "redirect:/task/assignment/bookList";


    }


    //教师查看任务书详情
    @RequestMapping(value = "/assignmentbook/viewform")
    public String taskassignmentbookviewform(HttpServletRequest request, AssignmentBook assignmentBook, Model model) {


        String assignmentbookid = request.getParameter("assignmentbookid");


        assignmentBook = assignmentBookService.getAssignmentBookById(assignmentbookid);

        model.addAttribute("assignmentBook", assignmentBook);


        return "AssignmentViewForm";

    }

    //    进入审核教师任务书列表界面
    @RequestMapping(value = "/audit/assignment/bookList")
    public String taskauditassignmentbookList() {


        return "directorauditassignment";


    }

    //系主任获取当前专业（t.major_id = #{majorid}）
//    当前年级下（t.grade = #{grade}）
//    未审核的（ab.audit_status = 1）
//    状态正常的t.del_flag = 0的任务书
    @RequestMapping(value = "/viewauditassignmentbookListData")
    @ResponseBody
    public Map<String, Object> taskviewauditassignmentbookListData(int page, int rows) {


        int Count = 0;

        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getviewauditassignmentbookListData(page, rows, majorid, grade);

        map.put("total", Count);

        map.put("rows", taskList);
        return map;


    }

    //    系主任审核任务书操作
    @RequestMapping(value = "/assignmentbook/audit")
    public String taskassignmentbookaudit(AssignmentBook assignmentBook, Task task, HttpServletRequest request) {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        String grade = user.getGrade();

        Date date = new Date();

        String id = request.getParameter("id");

        String assignmentid = request.getParameter("assignmentid");

        assignmentBook = assignmentBookService.getAssignmentBookById(assignmentid);

        if (id.equals("2") || id.equals("3")) {

            assignmentBook.setAuditStatus(id);

            assignmentBookService.updateAssignmentBook(assignmentBook);

        }


        return "redirect:/task/audit/assignment/bookList";


    }

    //查看任务书操作
    @RequestMapping(value = "/view/assignmentBook")
    public String taskviewassignmentBook() {


        return "viewassignmentBook";


    }

    //    获取学生个人任务书数据
    @RequestMapping(value = "/get/assignmentBook")
    @ResponseBody
    public List<AssignmentBook> taskgetassignmentBook() {


        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<AssignmentBook> assignmentBookList = assignmentBookService.getAssignmentBookByUser(userId);

        return assignmentBookList;


    }

    //    uploadmaterial
//进入上传材料界面
    @RequestMapping(value = "uploadmaterial")
    public String taskuploadmaterial(Model model) {

//        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
//        String userId = user1.getId();
//
//        List<Task> data = taskService.getbaseInformationForView(userId);
//
//
//        model.addAttribute("data",data);
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();


        List<Task> taskList = taskService.getbaseInformationForView(userId);

        String materialfilename = "";

        try {
            materialfilename = taskList.get(0).getMaterialName();

        } catch (IndexOutOfBoundsException e) {
            materialfilename = "";
        }


        System.out.print("materialfilename:" + materialfilename);

        model.addAttribute("materialfilename", materialfilename);


        return "uploadmaterial";


    }

    //    获取学生已选课题的详细信息
    @RequestMapping(value = "/get/task/baseInformation")
    @ResponseBody
    public List<Task> taskgettaskbaseInformation() {


        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getbaseInformationForView(userId);

        return taskList;


    }

    //    学生上传相关资料操作
    @RequestMapping("/student/submitmaterial")
    @ResponseBody
    public String Upload(MultipartFile file, HttpServletRequest request) throws IOException {


        String path = request.getServletContext().getRealPath(UPLOAD_PATH);
        if (file == null) {
            return "filenull";
        }
        String fileName = file.getOriginalFilename();
        File dir = new File(path, fileName);
//        System.out.println("filename" + fileName);
//        System.out.println(dir.exists());
//        System.out.println("file_status:" + file.isEmpty());

//判断文件内容是否为空
        if (file.isEmpty() == true) {
            return "fileempty";
        }
//         判断指定文件夹是否存在
        else if (!dir.exists()) {
            System.out.println("111111111111111111111111111111111111111111111");
            dir.mkdirs();
            file.transferTo(dir);
        } else {
            file.transferTo(dir);

        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getbaseInformationForView(userId);

        String taskid = taskList.get(0).getId();

        Task task = taskService.getTaskByIdTrue(taskid);

        task.setMaterialAddress(UPLOAD_PATH + "/" + fileName);

        task.setMaterialName(fileName);

        taskService.updateTask(task);

//        Topic topic = topicService.getTopicById(id1);
//        topic.setTopicAssignmentbookAddress(UPLOAD_PATH + "/" + fileName);
//        topic.setTopicAssignmentbookName(fileName);
//        System.out.println(UPLOAD_PATH + "/" + fileName);
//        topicService.updateTopic(topic);

        return "success";

    }

    //    /task/get/material
//    教师进入获取学生材料界面
    @RequestMapping(value = "/get/material")
    public String taskgetmaterial() {


        return "teachergetmaterial";


    }

    //教师下载材料
    @RequestMapping(value = "downloadmaterial", method = RequestMethod.GET)
    @ResponseBody
    public void Upload(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id");

        Task task = taskService.getTaskByIdTrue(id);

        String Totalpath = task.getMaterialAddress();


//        Topic topic = topicService.getTopicById(id5);
//
//        String Totalpath = topic.getTopicReportAddress();

        String path = request.getServletContext().getRealPath(Totalpath);

        File fullURL = new File(path);

//        System.out.println(fullURL.getName());
//
//        System.out.println(path);

        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));


//        String Originfilename = path.substring(path.lastIndexOf("\\") + 1);
        String filename = fullURL.getName();


        filename = URLEncoder.encode(filename, "UTF-8");


        response.addHeader("Content-Disposition", "attachment;filename=" + filename);


        response.setContentType("multipart/form-data");


        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());

        int len = 0;
        while ((len = bis.read()) != -1) {
            out.write(len);
            out.flush();
        }
        out.close();

    }

    //    进入提交成绩界面。
    @RequestMapping(value = "/set/score")
    public String tasksetscore() {


        return "teachersetscore";


    }

    //    添加成绩操作
    @RequestMapping(value = "/teacher/set/score")
    @ResponseBody
    public String taskteachersetscore(HttpServletRequest request, Task task) {


        String id = request.getParameter("id");

//        获取该选题的所有信息，用于查看是否已经存在成绩
//        以及作为update的载体
        Task task1 = taskService.getTaskByIdTrue(id);

        if (task1.getScore() != null) {
            return "falseadd";

        } else if (Integer.parseInt(task.getScore()) < 0 || Integer.parseInt(task.getScore()) > 100) {
            return "illegal";
        }
        task1.setScore(task.getScore());

        taskService.updateTask(task1);

        return "success";


    }

    //修改成绩操作
    @RequestMapping(value = "/teacher/modify/score")
    @ResponseBody
    public String taskteachermodifyscore(HttpServletRequest request, Task task) {


        String id = request.getParameter("id");

//        获取该选题的所有信息，用于查看是否已经存在成绩
//        以及作为update的载体
        Task task1 = taskService.getTaskByIdTrue(id);

        if (Integer.parseInt(task.getScore()) < 0 || Integer.parseInt(task.getScore()) > 100) {
            return "illegal";
        }
        task1.setScore(task.getScore());

        taskService.updateTask(task1);

        return "success";


    }

    @RequestMapping(value = "/student/see/final/score")
    public String taskstudentseefinalscore(Model model) {
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        List<Task> taskList = taskService.getbaseInformationForView(userId);

        model.addAttribute("task", taskList.get(0));


        return "studentseefinalscore";


    }

    //    提交专业答辩时间安排
    @RequestMapping(value = "/set/replytime")
    public String tasksetreplytime(Task task) {
//        task用于传输页面传过来的数据的Task载体

//        task1用于获取当前专业下答辩时间的Task载体

//        task2用于insert操作下插入数据的Task载体

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        System.out.print("majorid:" + majorid);

        Task task1 = taskService.getreplytimeBymajorid(majorid);


        try {
//            String replytime = task1.getReplytime();
            String starttime = task1.getStarttime();

            Task task3 = new Task();

            task3.setMajorId(majorid);

            task3.setStarttime(task.getStarttime());

            task3.setEndtime(task.getEndtime());

            taskService.updateschedule(task3);


        } catch (NullPointerException e) {
            Task task2 = new Task();

            task2.setMajorId(majorid);

//            task2.setReplytime(task.getReplytime());

            task2.setStarttime(task.getStarttime());

            task2.setEndtime(task.getEndtime());

            taskService.insertreplytime(task2);
        }


//        如果是空的，说明还没有时间安排，是插入操作


        return "redirect:/review/schedule";


    }


//    @RequestMapping(value = "/student/submit/thesisproposal")
//    public String taskstudentsubmitthesisproposal(){
//
//
//        return "studentviewthesisproposal";
//
//
//
//
//
//
//    }

    //    教师导出任务书功能
    @RequestMapping(value = "/teacher/exportExcelForAssignmentbook", method = RequestMethod.GET)
    public void export(HttpServletResponse response, HttpServletRequest request) {

        String assignmentbookid = request.getParameter("assignmentbookid");

//        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
//        String TeacherName = user.getName();
//
//        System.out.println(TeacherName + "111111111111111");

        List<AssignmentBook> assignmentBookList = assignmentBookService.getAssignmentBookListById(assignmentbookid);

        System.out.println("22222");

//        System.out.println(topicList.get(33).getTopicSource() +"--------------------------------------------------------");

        ExportExcel<AssignmentBook> ee = new ExportExcel<AssignmentBook>();

        String[] headers = {"内容要求", "进度安排", "参考文献"};

        String fileName = "个人任务书";

        ee.exportExcel(headers, assignmentBookList, fileName, response);

    }

    //    进入学提交毕业设计（论文）最终版界面
//    /task/submit/graduationproject
    @RequestMapping(value = "/submit/graduationproject")
    public String tasksubmitgraduationproject() {


        return "studentviewsubmitgraduationproject";


    }

    //进入提交毕业设计（论文）最终版表单 界面
    @RequestMapping(value = "/submit/graduationproject/form")
    public String tasksubmitgraduationprojectform(HttpServletRequest request, Model model) {

        String id = request.getParameter("id");

        Task task1 = new Task();

        if (id != null) {


            task1.setFinalPaperid(id);


            List<Task> finalpaperList = taskService.getfinalpaperByid(task1);

            Task task = finalpaperList.get(0);

            model.addAttribute("task", task);


        } else {
            model.addAttribute("task", task1);
        }


        return "studentviewsubmitgraduationprojectform";


    }


    //添加、修改提交毕业设计（论文）最终版 操作
    @RequestMapping(value = "/submit/graduationproject/save", method = RequestMethod.POST)
    @ResponseBody
    public String upload(MultipartFile file, String finalPaperid, String keywords, String innovationpoint, String chineseabstract, String englishabstract, String other, HttpServletRequest request) throws IOException {

        System.out.print("finalPaperid:" + finalPaperid);

        String path = request.getServletContext().getRealPath(UPLOAD_PATH);
        if (file == null) {
            return "filenull";
        }
        String fileName = file.getOriginalFilename();
        File dir = new File(path, fileName);
//        System.out.println("filename" + fileName);
//        System.out.println(dir.exists());
//        System.out.println("file_status:" + file.isEmpty());

//判断文件内容是否为空
        if (file.isEmpty() == true) {
            return "fileempty";
        }
//         判断指定文件夹是否存在
        else if (!dir.exists()) {
            System.out.println("111111111111111111111111111111111111111111111");
            dir.mkdirs();
            file.transferTo(dir);
        } else {
            file.transferTo(dir);

        }


        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getbaseInformationForView(userId);

        String taskid = taskList.get(0).getId();

        Task task = taskService.getTaskByIdTrue(taskid);

        task.setKeywords(keywords);

        task.setInnovationpoint(innovationpoint);

        task.setChineseabstract(chineseabstract);

        task.setEnglishabstract(englishabstract);

        task.setOther(other);

        task.setFileaddress(UPLOAD_PATH + "/" + fileName);

        task.setFilename(fileName);


        if (finalPaperid == null || finalPaperid.equals("")) {


            String finalpaperid = UUIDUtil.getUUID();

            task.setFinalPaperid(finalpaperid);

//        task.setMaterialName(fileName);

            taskService.updateTask(task);

            task.setCreateDate(new Date());

            taskService.insertfinalpaper(task);

//        Topic topic = topicService.getTopicById(id1);
//        topic.setTopicAssignmentbookAddress(UPLOAD_PATH + "/" + fileName);
//        topic.setTopicAssignmentbookName(fileName);
//        System.out.println(UPLOAD_PATH + "/" + fileName);
//        topicService.updateTopic(topic);

            System.out.print("1111111111111111111111111111111111");

            return "success";


        } else {
            task.setFinalPaperid(finalPaperid);

            task.setCreateDate(new Date());

            task.setAuditStatusId("1");

            taskService.updatefinalpaper(task);
        }


        return "success";


    }

    //    获取学生本人毕业设计（论文）最终版
    @RequestMapping(value = "/viewstudentfinalpaperListData")
    @ResponseBody
    public Map<String, Object> taskviewstudentfinalpaperListData(int page, int rows) {


        int Count = 1;

        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getviewstudentfinalpaperListData(page, rows, userId);

        map.put("total", Count);

        map.put("rows", taskList);
        return map;


    }

    //查看毕业设计（论文）最终版详细页
    @RequestMapping(value = "/view/studentfinalpaper")
    public String taskviewstudentfinalpaper(HttpServletRequest request, Model model) {

        String id = request.getParameter("id");

        model.addAttribute("finalpaperid", id);


        return "viewstudentfinalpaper";


    }

    //    根据paperid获取毕业设计（论文）最终版数据
    @RequestMapping(value = "/get/finalpaper")
    @ResponseBody
    public List<Task> taskgetfinalpaper(String finalpaperid, Task task) {


//        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
//        String userId = user1.getId();
//
//        String grade = user1.getGrade();
//
//        String majorid = user1.getMajorid();
        task.setFinalPaperid(finalpaperid);

        List<Task> finalpaperList = taskService.getfinalpaperByid(task);

        return finalpaperList;


    }

    //    下载毕业设计（论文）最终版附带文件
    @RequestMapping(value = "/downloadfinalpaperfile", method = RequestMethod.GET)
    @ResponseBody
    public void downloadfinalpaperfile(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String finalpaperid = request.getParameter("finalpaperid");

        Task task = new Task();

        task.setFinalPaperid(finalpaperid);


        List<Task> taskList = taskService.getfinalpaperByid(task);

        String Totalpath = taskList.get(0).getFileaddress();

        System.out.print("Totalpath:" + Totalpath);

//        Task task = taskService.getTaskByIdTrue(id);

//        String Totalpath = task.getMaterialAddress();


//        Topic topic = topicService.getTopicById(id5);
//
//        String Totalpath = topic.getTopicReportAddress();

        String path = request.getServletContext().getRealPath(Totalpath);

        System.out.print("path:" + path);

        File fullURL = new File(path);

//        System.out.println(fullURL.getName());
//
//        System.out.println(path);

        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));


//        String Originfilename = path.substring(path.lastIndexOf("\\") + 1);
        String filename = fullURL.getName();


        filename = URLEncoder.encode(filename, "UTF-8");


        response.addHeader("Content-Disposition", "attachment;filename=" + filename);


        response.setContentType("multipart/form-data");


        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());

        int len = 0;
        while ((len = bis.read()) != -1) {
            out.write(len);
            out.flush();
        }
        out.close();

    }

    //    进入教师审核毕业设计论文最终版界面
    @RequestMapping(value = "/teacher/audit/finalpaper")
    public String taskteacherauditfinalpaper() {


        return "taskteacherauditfinalpaper";


    }

    //    获取教师审核的毕业设计论文最终版学生的列表
    @RequestMapping(value = "/teacherviewstudentfinalpaperListData")
    @ResponseBody
    public Map<String, Object> taskteacherviewstudentfinalpaperListData(int page, int rows) {


        int Count = 0;

        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

        List<Task> taskList = taskService.getteacherviewstudentfinalpaperListData(page, rows, userId, grade);

        Count = taskService.getteacherviewstudentfinalpaperCountListData(page, rows, userId, grade);


        map.put("total", Count);

        map.put("rows", taskList);
        return map;


    }

    //审核毕业设计论文最终版操作
    @RequestMapping(value = "/audit/finalpaper")
    public String taskauditfinalpaper(HttpServletRequest request) {

        String id = request.getParameter("id");

        String audit_status = request.getParameter("audit_status");

        Task task = new Task();

        task.setFinalPaperid(id);


        List<Task> taskList = taskService.getfinalpaperByid(task);

        Task task1 = taskList.get(0);

        task1.setAuditStatusId(audit_status);

        taskService.updatefinalpaper(task1);

        return "redirect:/task/teacher/audit/finalpaper";


    }

    //    /allocate/assessteacher
//进入分配评阅教师界面
    @RequestMapping(value = "/allocate/assessteacher")
    public String taskallocateassessteacher() {


        return "allocateassessteacher";


    }

    //    获取当前学年下t.grade = #{grade}
//    本专业t.major_id = #{majorid}
//    已确认选题学生的信息tc.teacher_choose_status = 2
//    用于进行分配
    @RequestMapping(value = "/allocate/assessteacherListData")
    @ResponseBody
    public Map<String, Object> taskallocateassessteacherListData(int page, int rows, String studentname, String studentidentitynumber, String teachername, String teacheridentitynumber, String topic, String assessTeachername, String assessTeacheridentitynumber) {


        int Count = 0;

        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();

//        System.out.print("studentname:"+studentname);
//
//        System.out.print("studentidentitynumber:" + studentidentitynumber);

        List<Task> taskList = taskService.gettaskallocateassessteacherListData(page, rows, grade, majorid, studentname, studentidentitynumber, teachername, teacheridentitynumber, topic, assessTeachername, assessTeacheridentitynumber);

        Count = taskService.gettaskallocateassessteacherCountListData(page, rows, grade, majorid, studentname, studentidentitynumber, teachername, teacheridentitynumber, topic, assessTeachername, assessTeacheridentitynumber);


        map.put("total", Count);

        map.put("rows", taskList);
        return map;


    }

    //    添加/取消评阅教师操作
    @RequestMapping(value = "/director/set/assessTeacher")
    @ResponseBody
    public String taskdirectorsetassessTeacher(HttpServletRequest request, Task task) {


        String taskid = request.getParameter("taskid");

        String idss = request.getParameter("idss");

        String assessteacherstatus = request.getParameter("assessteacherstatus");

//        获取该选题的所有信息，用于查看是否已经存在成绩
//        以及作为update的载体
//        task1:单个学生添加或修改评阅专家时的载体
//        task2：多个学生同时添加评阅专家时的载体

        Task task1 = taskService.getTaskByIdTrue(taskid);

//        assessteacherstatus为1说明是添加操作
        if (assessteacherstatus.equals("1")) {
//如果评阅教师字段不是空的且是空字符串的（取消评阅教师就是将评阅教师字段变为空字符串，但是空字符也可以添加）
//         由于只有null，空字符串和字符三种情况
//            因此，不能添加的情况便是除了字符外的两种情况同时不成立即可
//说明已有数据，不能添加
            if (idss != null) {

                String[] strings = idss.split(",");

                for (String str : strings) {

                    Task task2 = taskService.getTaskByIdTrue(str);

                    if (task2.getAssessTeacher() != null && !task2.getAssessTeacher().equals("")) {
                        return "falseadd";

                    }
                    //            对于指导老师就是评阅老师的情况也不予以提交
                    else if (task.getAssessTeacher().equals(task2.getTeacherId())) {
                        return "false";
                    }
                    task2.setAssessTeacher(task.getAssessTeacher());

                    taskService.updateTask(task2);


                }
                return "success";


            } else {
                if (task1.getAssessTeacher() != null && !task1.getAssessTeacher().equals("")) {
                    return "falseadd";

                }
                //            对于指导老师就是评阅老师的情况也不予以提交
                else if (task.getAssessTeacher().equals(task1.getTeacherId())) {
                    return "false";
                }
                task1.setAssessTeacher(task.getAssessTeacher());

            }


        } else if (assessteacherstatus.equals("2")) {

            task1.setAssessTeacher("");
        }

        taskService.updateTask(task1);
        return "success";


    }

    //
//    教师进入评阅功能界面
    @RequestMapping(value = "/teacher/set/assessscore")
    public String taskteachersetassessscore() {


        return "taskteachersetassessscore";


    }


    //由于能交给教师审阅的都是系主任的
//    当前学年下t.grade = #{grade}
//    本专业t.major_id = #{majorid}
//    已确认选题学生tc.teacher_choose_status = 2
//    因此这里获取列表只需要获取选题中属于自己的、当前学年的题目
    @RequestMapping(value = "/viewAllAssessStudentListData")
    @ResponseBody
    public Map<String, Object> taskviewAllAssessStudentListData(int page, int rows) {


        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();


        String grade = user1.getGrade();

        String majorid = user1.getMajorid();


        List<Task> taskList = taskService.gettaskviewAllAssessStudentListData(page, rows, userId, grade);


        map.put("total", Count);


        map.put("rows", taskList);
        return map;


    }

    //    添加评阅成绩操作
    @RequestMapping(value = "/teacher/set/assessscoreforStudent")
    @ResponseBody
    public String taskteachersetassessscore(HttpServletRequest request, Task task) {


        String id = request.getParameter("id");

//        获取该选题的所有信息，用于查看是否已经存在成绩
//        以及作为update的载体
        Task task1 = taskService.getTaskByIdTrue(id);

        if (task1.getAssessScore() != null) {
            return "falseadd";

        } else if (Integer.parseInt(task.getAssessScore()) < 0 || Integer.parseInt(task.getAssessScore()) > 100) {
            return "illegal";
        }
        task1.setAssessScore(task.getAssessScore());

        taskService.updateTask(task1);

        return "success";


    }

    //修改评阅成绩操作
    @RequestMapping(value = "/teacher/modify/assessScoreforStudent")
    @ResponseBody
    public String taskteachermodifyassessscore(HttpServletRequest request, Task task) {


        String id = request.getParameter("id");

//        获取该选题的所有信息，用于查看是否已经存在成绩
//        以及作为update的载体
        Task task1 = taskService.getTaskByIdTrue(id);

        if (Integer.parseInt(task.getAssessScore()) < 0 || Integer.parseInt(task.getAssessScore()) > 100) {
            return "illegal";
        }
        task1.setAssessScore(task.getAssessScore());

        taskService.updateTask(task1);

        return "success";


    }

    @RequestMapping(value = "/student/judge/chosenpeople")
    @ResponseBody
    public int taskstudentjudgechosenpeople(String taskid) {
//        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
//        String userId = user.getId();
//
//        String majorid = user.getMajorid();
//
//        String grade = user.getGrade();

        int Count = taskService.gettaskstudentjudgechosenpeople(taskid);

        System.out.print("aa:"+Count);

        return Count;


    }


}
