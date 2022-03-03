package com.example.demo.controller;


import com.example.demo.Util.UUIDUtil;
import com.example.demo.entity.Announcement;
import com.example.demo.entity.User;
import com.example.demo.service.AnnouncementService;
import com.google.common.collect.Maps;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/announcement")
public class announcementController {

    @Autowired
    private AnnouncementService announcementService;
//@ControllerLog(Action = "查看",Remark = "公告列表")
//    查看公告列表
    @RequestMapping(value = "")
    public String announcement(Model model, Announcement announcement) {

//        model.addAttribute("announcement", announcement);

        return "announcementList";


    }


//获取所有公告信息
    @RequestMapping(value = "/announcementListData")
    @ResponseBody
    public Map<String, Object> announcementListData(int page, int rows) {

        int Count = 0;


        Map<String, Object> map = Maps.newHashMap();

        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user1.getId();

        String grade = user1.getGrade();

        String majorid = user1.getMajorid();


        List<Announcement> taskList = announcementService.getannouncementListByPageAndRows(page, rows);


//        Count = taskService.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);

        map.put("total", Count);


//        System.out.println("college_id_CN:" + college_id_CN);
        map.put("rows", taskList);
        return map;


    }


//    @RequestMapping(value = "/release")
//    public String announcementrelease(Model model, Announcement announcement){
//
//        model.addAttribute("announcement", announcement);
//
//        return "announcementrelease";
//
//
//    }


//进入公告添加修改页面
    @RequestMapping(value = "form")
    public String form(HttpServletRequest request,Model model,Announcement announcement){

        String id = request.getParameter("id");

        if (id !=null){

            announcement = announcementService.getannouncementById(id);








        }



        model.addAttribute("announcement", announcement);

        return "announcementrelease";






    }


//    公告保存、修改操作
    @RequestMapping(value = "/form/save")
    public String formsave(HttpServletRequest request, Model model, Announcement announcement) {


        String id = request.getParameter("id");

        Date date = new Date();

        if(announcement.getId().equals("")){

            String Id = UUIDUtil.getUUID();

            announcement.setId(Id);

            announcement.setCreateDate(date);

            announcement.setDelFlag("0");

            announcementService.insertannouncement(announcement);








        }else{

            announcementService.updateannouncement(announcement);





        }


        return "redirect:/announcement";


    }

//    viewuserList

//    用户查看的公告页面
    @RequestMapping(value = "/viewuserList")
    public String viewuserList(HttpServletRequest request, Model model, Announcement announcement) {

        return "announcementUserList";


    }

//    获取用户查看的公告的所有列表的信息
    @RequestMapping(value = "/getAllList")
    @ResponseBody
    public List<Announcement> getAllList() {
//        int Count = 0;
//
//
//        Map<String, Object> map = Maps.newHashMap();
//
//        User user1 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//
//        String userId = user1.getId();
//
//        String grade = user1.getGrade();
//
//        String majorid = user1.getMajorid();


        List<Announcement> taskList = announcementService.getAllList();


//        Count = taskService.getdoubletaskListCountByPageAndRowsForAuditDouble(page, rows, grade, majorid);

//        map.put("total", Count);
//
//
////        System.out.println("college_id_CN:" + college_id_CN);
//        map.put("rows", taskList);
        return taskList;

    }

//    用户点击后正式查看公告的页面
    @RequestMapping(value = "/showannounceforUser")
    public String showannounceforUser(Model model, Announcement announcement, HttpServletRequest request) {

        String id = request.getParameter("id");

        announcement = announcementService.getannouncementById(id);

        model.addAttribute("announcement",announcement);







        return "showannounceforUser";


    }

//    删除公告
    @RequestMapping(value = "/delete")
    public String delete(Model model, Announcement announcement, HttpServletRequest request) {

        String id = request.getParameter("id");

        announcement = announcementService.getannouncementById(id);

        announcement.setDelFlag("1");

        announcementService.updateannouncement(announcement);

        return "redirect:/announcement";

    }





}
