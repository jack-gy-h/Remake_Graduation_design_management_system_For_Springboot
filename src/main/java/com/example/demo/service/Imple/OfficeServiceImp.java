package com.example.demo.service.Imple;

import com.example.demo.dao.OfficeMapper;
import com.example.demo.entity.Office;
import com.example.demo.service.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfficeServiceImp implements OfficeService {

    @Autowired
    private OfficeMapper officeMapper;

    @Override
    public List<Office> findAllOffice() {
        return officeMapper.findAllOffice();
    }

    @Override
    public Office getOffice(String id) {
        return officeMapper.get(id);
    }

    @Override
    public int insertoffice(Office office) {
        return officeMapper.insert(office);

    }

    @Override
    public int updateoffice(Office office) {
       return officeMapper.updateByPrimaryKey(office);
    }

    @Override
    public Office selectByPrimaryKey(String id) {
        return officeMapper.get(id);
    }

    @Override
    public List<Office> getOfficeParentListById(String id) {
        return officeMapper.get1(id);
    }

    @Override
    public List<Office> getMajorById(String code) {
        return officeMapper.get1(code);
    }

    @Override
    public List<Office> getCollegeByUserIdAndGradeId(String userid, String gradeid) {
        return officeMapper.getCollegeByUserIdAndGradeId(userid,gradeid);
    }

    @Override
    public List<Office> getMajorByUserIdAndGradeIdAndCollegeid(String userid, String gradeid, String collegeid) {
        return officeMapper.getMajorByUserIdAndGradeIdAndCollegeid(userid,gradeid,collegeid);
    }

    @Override
    public List<Office> getMajorByUserIdAndGradeIdAndCollegeidAndMajorId(String userid, String gradeid, String collegeid, String majorid) {
        return officeMapper.getMajorByUserIdAndGradeIdAndCollegeidAndMajorId(userid,gradeid,collegeid,majorid);
    }

    @Override
    public List<Office> getUserBymajorIdAndIdentitys(String majorId, String identitys,String usergrade) {
        return officeMapper.getUserBymajorIdAndIdentitys(majorId,identitys, usergrade);
    }

    @Override
    public String getOfficeCnNameById(String Id) {
        return officeMapper.getOfficeCnNameById(Id);
    }


    @Override
    public List<Office> getOfficeParentListById1(String id) {
        return officeMapper.get2(id);
    }
//    @Override
//    public Office selectById(String i) {
//        return officeMapper.selectByPrimaryKey(i);
//    }
}
