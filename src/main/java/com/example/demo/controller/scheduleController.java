package com.example.demo.controller;

import com.example.demo.entity.AssignmentBook;
import com.example.demo.entity.Task;
import com.example.demo.entity.User;
import com.example.demo.service.AssignmentBookService;
import com.example.demo.service.TaskService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/review")
public class scheduleController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private AssignmentBookService assignmentBookService;


//    系主任进入设置专业答辩时间界面
    @RequestMapping(value = "/schedule")
    public String schedule(Task task, Model model){

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();


        Task task1 = taskService.getreplytimeBymajorid(majorid);

        try{

            String starttime = task1.getStarttime();

            String endtime= task1.getEndtime();

            model.addAttribute("starttime",starttime);

            model.addAttribute("endtime", endtime);

        }catch (NullPointerException e){

            char starttime1 = ' ';

            char endtime1 = ' ';




            model.addAttribute("starttime", starttime1);

            model.addAttribute("endtime", endtime1);


        }

        model.addAttribute("task",task);

        return "reviewschedule";



    }

//    学生查看答辩时间
//    学生的答辩时间由课题所属专业的系主任决定
//   因此，限制条件是：
//            WHERE ab.audit_status = 2
//          AND tc.chosen_student = #{userId}
//          AND tc.teacher_choose_status = 2、
//    通过的任务书
//    以及选题学生是自己的
//    而且通过审核的
//    代表是自己被选上的而且是任务书的课题的所属专业
    @RequestMapping(value = "/task/schedule")
    public String reviewtaskschedule(Model model){

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

//        String grade = user1.getGrade();
//
//        String majorid = user1.getMajorid();

        List<AssignmentBook> assignmentBookList = assignmentBookService.getAssignmentBookByUser(userId);

        String majorid = "";
        try{
            majorid = assignmentBookList.get(0).getMajorId();

        }catch (IndexOutOfBoundsException e){

            majorid = "";
        }




        System.out.print("majoeid11:"+majorid);



        try {

            Task task1 = taskService.getreplytimeBymajorid(majorid);

            model.addAttribute("starttime", task1.getStarttime());

            model.addAttribute("endtime", task1.getEndtime());
        }catch (NullPointerException e){

            String starttime = "1";

            String endtime = "1";


            model.addAttribute("starttime", starttime);

            model.addAttribute("endtime", endtime);


        }



        return "viewschedule";






    }
}
