//package com.example.demo.controller;
//
////import com.example.demo.Util.RandSort;
//import com.example.demo.Util.RandSorts;
//import com.example.demo.entity.Office;
//import com.example.demo.service.OfficeService;
//import com.google.common.collect.Maps;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.util.Collections;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//public class TestController {
//
//    @Autowired
//    private OfficeService officeService;
//
//    @RequestMapping(value = "/test")
//    @ResponseBody
//    public Map<String, Object> dataUserParentOffice() {
//
//        List<Office> userparentofficeList = officeService.getOfficeParentListById1("1");
//        System.out.println("---------------------打乱前顺序----------------------------");
//        for (int i = 0; i < userparentofficeList.size(); i++) {
//
//            System.out.println("userparentofficeList.get(" + i + ").getName():" + userparentofficeList.get(i).getName());
//        }
//
//        Map<String, Object> map = Maps.newHashMap();
//        map.put("before",userparentofficeList);
//
//        RandSorts randSorts = new RandSorts();
//
//
//        System.out.println("---------------------打乱后顺序----------------------------");
//        for (int i = 0; i < userparentofficeList.size(); i++) {
//
//            System.out.println("userparentofficeList.get(" + i + ").getName():" + randSorts.randSort(Collections.singletonList(userparentofficeList)));
//        }
//
//        map.put("after", randSorts.randSort(Collections.singletonList(userparentofficeList)));
//
////        randSorts.randSort(userparentofficeList);
//
//        return map;
//
//
//    }
//}
