package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

//@RestController
@SpringBootApplication
@Controller
//@MapperScan("com.example.demo.dao.*")
public class DemoApplication {


//    @RequestMapping("/")
//    @ResponseBody
//    public String index(){
//        return "欢迎光临我的论坛！";
//    }

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
