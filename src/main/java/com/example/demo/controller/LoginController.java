package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Resource
    private UserService userService;

    private final String SALT = "LOGIN";

//登录请求
    @RequestMapping("/login")
    public String login(User user, HttpSession session){

        Subject subject = SecurityUtils.getSubject();

        String username = user.getUsername();

        String password = user.getPassword();
//        对提交的用户名和密码进行封装
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        try {
            //            核心代码
//            login（）方法对封装的token方法进行验证，正确则返回true,错误则返回false
//            当进行SecurityUtils.getSubject().login()方法时，会调用Myrealm()中的登录验证方法
//            这其中的操作由在shiro的配置中配置好后进行自动调配

            subject.login(token);

            //            这里考虑到由于shiro的安全验证登录就是基于session的增加和置空的，因此在这里
//            当验证成功后直接获取用户的整个列表然后得到身份信息并保留
//基于登录成功后根据用户信息中的identity字段进行身份判别并跳到相应的字段
//            如果identity字段中没有所匹配的身份，则返回错误信息“没有相应权限，请联系管理员”
            User successuser = userService.getUserByUsername(username);

            String identity = successuser.getIdentity();

            if (identity.equals("USER")) {
                System.out.println("执行了第一个if");
                return "redirect:/chooseRolePage";
            }else if (identity.equals("SUPERADMIN")){
                System.out.println("执行了第二个if");
                return "redirect:/superadminPage";
            }
//            TestUtil.Test("1");
//            session.setAttribute("Identity", Identity);
            session.setAttribute("errorInfo", "没有相应权限，请联系管理员");

//            return "index";


        } catch (AuthenticationException e) {
            e.printStackTrace();

            session.setAttribute("errorInfo", "用户名或密码错误");

        }
//        TestUtil.Test("2");
        return "index";




    }
}
