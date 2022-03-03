package com.example.demo.service.Imple;

import com.example.demo.dao.AnnouncementMapper;
import com.example.demo.entity.Announcement;
import com.example.demo.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementServiceImp implements AnnouncementService {

    @Autowired
    private AnnouncementMapper announcementMapper;


    @Override
    public List<Announcement> getannouncementListByPageAndRows(int page, int rows) {
        page = (page - 1) * rows;
        return announcementMapper.getannouncementListByPageAndRows(page, rows);

    }

    @Override
    public int insertannouncement(Announcement announcement) {
        return announcementMapper.insert(announcement);
    }

    @Override
    public Announcement getannouncementById(String id) {
        return announcementMapper.getannouncementById(id);
    }

    @Override
    public void updateannouncement(Announcement announcement) {
        announcementMapper.updateByPrimaryKey(announcement);
    }

    @Override
    public List<Announcement> getAllList() {
        return announcementMapper.getAllList();
    }
}
