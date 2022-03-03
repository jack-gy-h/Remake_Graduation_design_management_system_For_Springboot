package com.example.demo.dao;

import com.example.demo.entity.User;
import com.example.demo.entity.UserExample;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int countByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int deleteByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    List<User> selectByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    User selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(User record);

//    List<User> getuserListByPageAndRows(@Param("page") int page,@Param("rows") int rows);

    int getAllCount();

    List<User> getuserListByPageAndRows(@Param("page")int page, @Param("rows")int rows, @Param("selectname")String selectname);

    int getAllCountBySelectname(String selectname);

    String getPasswordByid(Integer id);

    int getUserCountByidentityNumber(String identityNumber);

    int getUserCountByusername(String username);

    int insertUserInfoAll(User user);

//    void deleteUserRoleForm(String delflag, String userid, String identitysid, String grade, String collegeid, String majorid, String roleId);

    void deleteUserRoleForm(User user1);

    List<User> getGradeListById(String userid);

    String getrolenameByroleid(@Param("roleId")String roleId);

    int getuserRoleCount(@Param("userid")String userid, @Param("delflag") String delflag);

    User getuiaAllByUiaId(@Param("uiaid")String uiaid);

    User getUserAllInfoByUserId(@Param("uiaid") String uiaid,@Param("userid")String userid);

    void updateUserAllInfoByPrimaryKey(User user);

//    void updateTaskByUserId(User user2);

//    User getUserByUserId(String userid);
}