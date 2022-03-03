package com.example.demo.controller;

import com.hankcs.hanlp.summary.TextRankKeyword;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/taskanalysis")
public class analysisController {

    @RequestMapping(value = "")
    public String analysis() {

//        String content = "基于数据挖掘的人工智能算法";
//        System.out.println("关键词提取："+new TextRankKeyword().getKeyword(content).get(0));

        return "analysis";


    }

    @RequestMapping(value = "/getKeyWord")
    @ResponseBody
    public List<String> getKeyWord(String word) {

//        System.out.print("word:" + word);
//
//        System.out.println("关键词提取：" + new TextRankKeyword().getKeyword(word).get(0));

        List<String> data = new TextRankKeyword().getKeyword(word);

        return data;


    }


}
