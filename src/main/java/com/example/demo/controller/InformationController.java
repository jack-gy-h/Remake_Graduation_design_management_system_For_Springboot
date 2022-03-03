package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.OfficeService;
import com.example.demo.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/information")
public class InformationController {

    private final String SALT = "LOGIN";

    @Autowired
    private UserService userService;

    @Autowired
    private OfficeService officeService;




    @RequestMapping("")
    public String information(Model model){

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String collegeid = user.getCollegeid();

        String majorid = user.getMajorid();

        String collegeCnName = officeService.getOfficeCnNameById(collegeid);

        String majorCnName = officeService.getOfficeCnNameById(majorid);

        user.setCollegeCnName(collegeCnName);

        user.setMajorCnName(majorCnName);

        model.addAttribute("user1",user);










        return "information";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String saveinformation(String email,String gender){

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String id = user.getId();

        User user1 = userService.getUserByUserId(id);

        user1.setEmail(email);

        user1.setGrade(gender);

        userService.updateuserByPrimaryKey(user1);












        return "success";






    }

    @RequestMapping("modifyPassword")
    public String modifyPassword(){

        return "modifyPassword";
    }

    @RequestMapping(value = "/updatePassword")
    @ResponseBody
    public String updatePassword(String oldpassword,  String newpassword1,  String newpassword2, HttpSession session) {
        System.out.println(oldpassword);
        System.out.println(newpassword1);
        System.out.println(newpassword2);
//        System.out.println(((User) session.getAttribute("user")).getPassword());

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//        String oldpasswordformd5 = CryptographyUtil.md5(oldpassword, SALT);
        System.out.println(((User) session.getAttribute("user")).getPassword());
//        如果两个新密码不一样的话，就报错
        if (newpassword1.equals(newpassword2) == false) {
            System.out.println("newpasswordsame:1");
            return "newpasswordsame";
        } else if (oldpassword.equals(newpassword1)) {
            System.out.println("different:1");
            return "different";
        } else if (oldpassword.equals(user.getPassword())) {
            User user1 = userService.getUserByUserId(user.getId());
            user1.setPassword(newpassword1);
            userService.updateuserByPrimaryKey(user1);
            SecurityUtils.getSubject().getSession().setAttribute("user",user1);
            User user2 = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

            System.out.print("user2.getName():"+user2.getName());

            return "success";

        }
//        User user = userService.getUserById(id5);

//        user.setPassword(CryptographyUtil.md5(password, SALT));
//        userService.updateUser(user);
        return "false";
    }








}
