package com.example.demo.controller;

import com.example.demo.entity.Office;
import com.example.demo.service.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/data")
public class DataController {
    @Autowired
    private OfficeService officeService;

    @RequestMapping(value = "/UserParentOffice")
    @ResponseBody
    public List<Office> dataUserParentOffice() {

        List<Office> userparentofficeList = officeService.getOfficeParentListById("1");

        for (int i = 0; i < userparentofficeList.size(); i++) {
            System.out.println("userparentofficeList.get(" + i + ").getName():" + userparentofficeList.get(i).getName());
        }

        return userparentofficeList;


    }

    @RequestMapping(value = "/user")
    @ResponseBody
    public List<Office> datauser(String majorId,String identitys,String usergrade) {

        System.out.print("usergrade:"+usergrade);

        List<Office> userList = officeService.getUserBymajorIdAndIdentitys(majorId,identitys,usergrade);

        for (int i = 0; i < userList.size(); i++) {
            System.out.println("userList.get(" + i + ").getName():" + userList.get(i).getName());
        }

        return userList;


    }




}
