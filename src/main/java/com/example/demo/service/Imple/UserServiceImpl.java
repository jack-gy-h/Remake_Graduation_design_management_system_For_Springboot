package com.example.demo.service.Imple;

import com.example.demo.dao.UserMapper;
import com.example.demo.entity.User;
import com.example.demo.entity.UserExample;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByUsername(String username) {

        UserExample example = new UserExample();

        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUsernameEqualTo(username);

        List<User> list = userMapper.selectByExample(example);

        if (list != null && list.size() > 0) {

            return list.get(0);

        } else {

            return null;

        }
    }

//    @Override
//    public List<User> getuserListByPageAndRows(int page, int rows) {
//        page = (page - 1) * rows;
//        return userMapper.getuserListByPageAndRows(page, rows);
//    }

    @Override
    public int getAllCount() {
        return userMapper.getAllCount();
    }

    @Override
    public List<User> getuserListByPageAndRows(int page, int rows, String selectname) {
        page = (page - 1) * rows;
        return userMapper.getuserListByPageAndRows(page, rows, selectname);
    }

    @Override
    public int getAllCountBySelectname(String selectname) {
        return userMapper.getAllCountBySelectname(selectname);
    }

    @Override
    public String getPasswordByid(Integer id) {
        return userMapper.getPasswordByid(id);
    }

    @Override
    public int getUserCountByidentityNumber(String identityNumber) {
        return userMapper.getUserCountByidentityNumber(identityNumber);
    }

    @Override
    public int getUserCountByusername(String username) {
        return userMapper.getUserCountByusername(username);
    }

    @Override
    public int insertUserInfoAll(User user) {
        return userMapper.insertUserInfoAll(user);
    }

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }

    @Override
    public User getUserByUserId(String userid) {
        return userMapper.selectByPrimaryKey(userid);
    }

//    @Override
//    public void deleteUserRoleForm(String delflag, String userid, String identitysid, String grade, String collegeid, String majorid, String roleId) {
//        userMapper.deleteUserRoleForm(delflag, userid, identitysid, grade, collegeid, majorid, roleId);
//    }

    @Override
    public void deleteUserRoleForm(User user1) {
        userMapper.deleteUserRoleForm(user1);
    }

    @Override
    public List<User> getGradeListById(String userid) {
        return userMapper.getGradeListById(userid);
    }

    @Override
    public int updateuserByPrimaryKey(User user1) {
        return userMapper.updateByPrimaryKey(user1);
    }

    @Override
    public String getrolenameByroleid(String roleId) {
        return userMapper.getrolenameByroleid(roleId);
    }

    @Override
    public int getuserRoleCount(String userid, String delflag) {
        return userMapper.getuserRoleCount(userid,delflag);
    }

    @Override
    public User getuiaAllByUiaId(String uiaid) {
        return userMapper.getuiaAllByUiaId(uiaid);
    }

    @Override
    public User getUserAllInfoByUserId(String uiaid,String userid) {
        return userMapper.getUserAllInfoByUserId(uiaid,userid);
    }

    @Override
    public void updateUserAllInfoByPrimaryKey(User user) {
        userMapper.updateUserAllInfoByPrimaryKey(user);
    }

//    @Override
//    public void updateTaskByUserId(User user2) {
//        userMapper.updateTaskByUserId(user2);
//    }


}
