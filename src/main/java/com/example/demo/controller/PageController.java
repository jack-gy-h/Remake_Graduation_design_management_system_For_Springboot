package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @Autowired
    private UserService userService;


    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/adminloginPage")
    public String adminloginPage() {
        return "adminloginPage";
    }

    @RequestMapping("/teacherloginPage")
    public String teacherloginPage() {
        return "teacherloginPage";
    }

    @RequestMapping("/UserloginPage")
    public String UserloginPage() {
        System.out.print("((User) SecurityUtils.getSubject().getSession().getAttribute(\"user\")).getName():" + ((User) SecurityUtils.getSubject().getSession().getAttribute("user")).getName());

        return "UserloginPage";
    }

    @RequestMapping("/superadminPage")
    public String superadminPage() {


        return "superadminPage";
    }

    @RequestMapping("/chooseRolePage")
    public String chooseRolePage(Model model) {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//        String username = user.getUsername();

        String userid = user.getId();


        model.addAttribute("GradeList",userService.getGradeListById(userid));

        model.addAttribute("user", user);
        return "chooseRolePage";
    }
}
