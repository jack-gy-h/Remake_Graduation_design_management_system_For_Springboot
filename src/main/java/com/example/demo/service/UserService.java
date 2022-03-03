package com.example.demo.service;

import com.example.demo.entity.User;

import java.util.List;

public interface UserService {
    User getUserByUsername(String username);

//    List<User> getuserListByPageAndRows(int page, int rows);

    int getAllCount();

    List<User> getuserListByPageAndRows(int page, int rows, String selectname);

    int getAllCountBySelectname(String selectname);

    String getPasswordByid(Integer id);

    int getUserCountByidentityNumber(String identityNumber);

    int getUserCountByusername(String username);

    int insertUserInfoAll(User user);

    int insert(User user);

    User getUserByUserId(String userid);

//    void deleteUserRoleForm(String delflag,String userid,String identitysid,String grade,String collegeid,String majorid,String roleId);

    void deleteUserRoleForm(User user1);

    List<User> getGradeListById(String userid);

    int updateuserByPrimaryKey(User user1);

    String getrolenameByroleid(String roleId);

//
    int getuserRoleCount(String userid, String delflag);

    User getuiaAllByUiaId(String uiaid);

    User getUserAllInfoByUserId(String uiaid,String userid);

    void updateUserAllInfoByPrimaryKey(User user);

//    void updateTaskByUserId(User user2);

//    String getofficenameById(String collegeid);

//    Object getGradeById(User user);
//}}
}
