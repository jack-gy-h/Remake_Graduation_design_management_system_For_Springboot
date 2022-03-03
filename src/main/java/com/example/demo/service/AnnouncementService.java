package com.example.demo.service;

import com.example.demo.entity.Announcement;

import java.util.List;

public interface AnnouncementService {


    List<Announcement> getannouncementListByPageAndRows(int page, int rows);

    int insertannouncement(Announcement announcement);

    Announcement getannouncementById(String id);

    void updateannouncement(Announcement announcement);

    List<Announcement> getAllList();
}
