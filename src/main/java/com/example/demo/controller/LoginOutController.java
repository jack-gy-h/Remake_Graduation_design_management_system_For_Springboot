package com.example.demo.controller;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
public class LoginOutController {
    @RequestMapping("/user/logout")
    public String logout(HttpServletRequest request, HttpSession session) {
//        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//        System.out.println("当前session为："+ user.getIdentity());
//      通过源码可知shiro是通过置空session来达到退出用户的功能
//        Test test = new Test();
        SecurityUtils.getSubject().logout();
//        test.SessionTest(request,session);
//        User task = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
//        System.out.println("退出后session为："+user1.getIdentity());
        return "redirect:/index";
    }
}
