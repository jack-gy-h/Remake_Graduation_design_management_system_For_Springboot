package com.example.demo.Util;

import com.example.demo.entity.Log;
import com.example.demo.entity.User;
import com.example.demo.service.LogServiceI;
import org.apache.shiro.SecurityUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

public class LogUtil {

    private static Log log;

    private static HttpServletRequest request;

    private static LogServiceI logServiceI;


    public static void Log(String action,String remark){

        String id = UUID.randomUUID().toString().replace("-", "");


        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userName = loginUser.getName();

        log.setLid(id);

        log.setLaction(action);

        log.setLcreator(userName);

        log.setIurl(requestUri);


//        log.setLip(remoteAddr);
//        log.setLmodule(controllerMethodDescription.get("module"));
        log.setLremark(remark);
//        System.out.print("controllerMethodDescription.get(\"module\"):"+controllerMethodDescription.get("module"));
//        System.out.print("controllerMethodDescription.get(\"remark\"):"+controllerMethodDescription.get("remark"));
//        Date operateDate = beginTimeThreadLocal.get();
        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);
    }

}
