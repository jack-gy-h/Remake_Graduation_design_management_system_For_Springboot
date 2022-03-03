package com.example.demo.service.Imple;

import com.example.demo.dao.LogMapper;
import com.example.demo.entity.Log;
import com.example.demo.service.LogServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServicelImp implements LogServiceI {

    @Autowired
    private LogMapper logMapper;

    @Override
    public int insertSelective(Log log) {
        return logMapper.insertSelective(log);
    }
}
