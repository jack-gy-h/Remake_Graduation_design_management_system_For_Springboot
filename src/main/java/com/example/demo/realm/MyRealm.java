package com.example.demo.realm;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Set;
@Configuration
public class MyRealm extends AuthorizingRealm {
    @Resource
    private UserService userService;

    @Override
    public void setName(String name){super.setName("myRealm");}
//    授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        Session session = SecurityUtils.getSubject().getSession();
        User user = (User) session.getAttribute("user");
        Set<String> identity = Collections.singleton(user.getIdentity());
        AuthorizationInfo authcInfo = new SimpleAuthorizationInfo(identity);

        return authcInfo;
    }

//    登录认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String) token.getPrincipal();

        //        通过由用户名来获取用户信息的方法来获得数据库中的个人信息再进行比对
        User user = userService.getUserByUsername(username);
        System.out.println("获得了user的内容");
        if (user != null) {
//            在这里用请求获取了当前的Session然后通过setAttribute的方法对
            SecurityUtils.getSubject().getSession().setAttribute("user", user);

            System.out.print("username:"+ user.getUsername());

            System.out.print("password:" + user.getPassword());

            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), this.getName());
            return authcInfo;
        }
        return null;
    }
}
