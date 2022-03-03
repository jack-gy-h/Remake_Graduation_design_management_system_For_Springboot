package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private OfficeService officeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private LogServiceI logServiceI;


//师生双选进入添加/修改界面

    @RequestMapping(value = "/task/form")
    public String releasetopic(Model model, HttpServletRequest request, Task task, MultipartHttpServletRequest multipartHttpServletRequest){
//        multipartHttpServletRequest.getf

        String id = request.getParameter("id");
        String taskid = task.getId();


        if (taskid != null) {
            task = taskService.getTaskByIdTrue(id);


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
            model.addAttribute("task",task);
        }
//        有id肯定是修改操作
        else if(id != null){
//            这里并不会提交表单，因此也不会有task传过来

            task = taskService.getTaskByIdTrue(id);


            model.addAttribute("task", task);
//            System.out.println("id:"+id);
            System.out.println("task.getCreateDate():" + task.getCreateDate());

            System.out.print("task.getOfficeIdList():" + task.getOfficeIdList());

            System.out.print("task.getOfficeIds()" + task.getOfficeIds());
        }
//        传了一个taskid过来那么就是有


//        获取所有学院的名字
        List<Office> officeList = officeService.getOfficeParentListById("1");
        for (int i = 0; i < officeList.size(); i++) {
            System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
        }

        model.addAttribute("UserParentOffice", officeList);



//        获取所有专业节点
        List<Office> list = Lists.newArrayList();

        List<Office> sourcelist = officeService.findAllOffice();

        Office.sortList(list, sourcelist, Office.getRootId(), true);

//        task.setCanbechosencollegeid("2");


        model.addAttribute("officeList", list);




//        model.addAttribute("task",task);



        return "releasetopic";
    }

//    老师查看题目列表功能
    @RequestMapping(value = "/tasklist")

    public String tasklist(Model model, Task task, Log log, HttpServletRequest request){

        List<Office> officeList = officeService.getOfficeParentListById("1");
        for (int i = 0; i < officeList.size(); i++) {
            System.out.println("officeList.get(" + i + ").getName():" + officeList.get(i).getName());
        }

        model.addAttribute("UserParentOffice", officeList);

        String id = UUID.randomUUID().toString().replace("-", "");

        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = loginUser.getId();

        String roleid = loginUser.getRoleId();



        log.setLid(id);

        log.setLaction("查看");

        log.setLcreator(userId);

        log.setIurl(requestUri);

        log.setLremark("双选题目");

        log.setLcreatorrole(roleid);

        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);

//        model.addAttribute("task",task);

        return "teacherTaskList";






    }

//    老师查看题目所加载的数据
    @RequestMapping(value = "/doubletaskListData")
    @ResponseBody
    public Map<String, Object> taskListData(int page, int rows, String office, String topic, String teacher, String teacheridentitynumber, String type, String source) {
//        List<Task> taskList = Lists.newArrayList();
        int Count = 0;
//        System.out.println("selectname:" + selectname);


        Map<String, Object> map = Maps.newHashMap();
//        if (selectname == null) {
//            taskList = taskService.gettaskListByPageAndRows(page, rows);
//            Count = taskService.getAllCount();
//        }
        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId() ;

//        String officet = office;

        String grade = user1.getGrade();

        System.out.println("page:" + page);
        System.out.println("rows:" + rows);
        System.out.println("grade:" + grade);
        System.out.println("userId:" + userId);
        System.out.println("office:" + office);
        System.out.println("topic:" + topic);
        System.out.println("teacher:" + teacher);
        System.out.println("teacheridentitynumber:" + teacheridentitynumber);
        System.out.println("type:" + type);
        System.out.println("source:" + source);

        List<Task> taskList = taskService.getdoubletaskListByPageAndRows(page, rows, grade,userId,office, topic, teacher, teacheridentitynumber, type, source);



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

        Count = taskService.getdoubletaskListCountByPageAndRows(page, rows, grade, userId, office, topic, teacher, teacheridentitynumber, type, source);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;

    }

    //    老师查看单个题目功能
//    有修改和返回按钮
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

        return "viewtopic";


    }

//    教师删除题目

    @RequestMapping(value = "/task/delete")

    public String taskdelete(HttpServletRequest request) {

        String id = request.getParameter("id");

        System.out.print("taskdeleteid:"+id);

        Task task = taskService.getTaskById(id);

        task.setDelFlag("1");

        taskService.deleteTask(task);




        return "redirect:/teacher/tasklist";


    }

    @RequestMapping(value = "/task/doublechoosestudent")
    public String teachertaskdoublechoosestudent(){


        return "teacherchoosedouble";
    }

//    审核选题学生
    @RequestMapping(value = "/task/chosenstudent")
    public String teachertaskchosenstudent(HttpServletRequest request,Log log){
        String taskid = request.getParameter("taskid");

        String choosestatusId = request.getParameter("choosestatusId");

        String studentId = request.getParameter("studentId");

        String status = request.getParameter("status");

//        studentrelease=1

        String studentrelease = request.getParameter("studentrelease");

        String auditstatus = request.getParameter("auditstatus");


        System.out.print("taskid:"+taskid);

        System.out.print("choosestatusId:" + choosestatusId);

        System.out.print("studentId:" + studentId);

        System.out.print("status:" + status);

        taskService.updateTaskChosenStatus(taskid,choosestatusId,studentId,status);

//        如果审核学生申请的题目的话。

        if (studentrelease !=null){
            if (studentrelease.equals("1")) {

                Task task = taskService.getTaskById(taskid);

                task.setAuditStatus(auditstatus);

                taskService.updateTask(task);


//            Task task = taskService.getTaskById(taskid);


                return "redirect:/task/teacher/audit/studentrelese";
            }
        }


        String logid = UUID.randomUUID().toString().replace("-", "");

        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = loginUser.getId();

        String roleid = loginUser.getRoleId();


        log.setLid(logid);

        if (status.equals("2")) {

            log.setLaction("确认通过");

        } else if (status.equals("3")) {

            log.setLaction("确认不通过");
        }


        log.setLcreator(userId);

        log.setIurl(requestUri);

        log.setLremark("双选课题选择");

        log.setLtask(taskid);

        log.setLcreatorrole(roleid);

        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);

        return "redirect:/teacher/task/doublechoosestudent";
    }







}
