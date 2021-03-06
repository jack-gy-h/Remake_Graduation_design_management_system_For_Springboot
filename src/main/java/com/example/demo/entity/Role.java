package com.example.demo.entity;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;

import java.util.Date;
import java.util.List;

public class Role {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.id
     *
     * @mbggenerated
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.enname
     *
     * @mbggenerated
     */
    private String enname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.create_by
     *
     * @mbggenerated
     */
    private String createBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.create_date
     *
     * @mbggenerated
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.update_by
     *
     * @mbggenerated
     */
    private String updateBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.update_date
     *
     * @mbggenerated
     */
    private Date updateDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.remarks
     *
     * @mbggenerated
     */
    private String remarks;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column role.del_flag
     *
     * @mbggenerated
     */
    private String delFlag;

    private String oldName; // 原角色名称

    private String oldEnname; // 原英文名称

    private List<Menu> menuList = Lists.newArrayList();

    public Role(){

        this.delFlag = "0";
    }

    public Role(String id){

        this.id = id;
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }


    public String getOldEnname() {
        return oldEnname;
    }

    public void setOldEnname(String oldEnname) {
        this.oldEnname = oldEnname;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }



    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.id
     *
     * @return the value of role.id
     *
     * @mbggenerated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.id
     *
     * @param id the value for role.id
     *
     * @mbggenerated
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.name
     *
     * @return the value of role.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.name
     *
     * @param name the value for role.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.enname
     *
     * @return the value of role.enname
     *
     * @mbggenerated
     */
    public String getEnname() {
        return enname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.enname
     *
     * @param enname the value for role.enname
     *
     * @mbggenerated
     */
    public void setEnname(String enname) {
        this.enname = enname == null ? null : enname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.create_by
     *
     * @return the value of role.create_by
     *
     * @mbggenerated
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.create_by
     *
     * @param createBy the value for role.create_by
     *
     * @mbggenerated
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.create_date
     *
     * @return the value of role.create_date
     *
     * @mbggenerated
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.create_date
     *
     * @param createDate the value for role.create_date
     *
     * @mbggenerated
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.update_by
     *
     * @return the value of role.update_by
     *
     * @mbggenerated
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.update_by
     *
     * @param updateBy the value for role.update_by
     *
     * @mbggenerated
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.update_date
     *
     * @return the value of role.update_date
     *
     * @mbggenerated
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.update_date
     *
     * @param updateDate the value for role.update_date
     *
     * @mbggenerated
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.remarks
     *
     * @return the value of role.remarks
     *
     * @mbggenerated
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.remarks
     *
     * @param remarks the value for role.remarks
     *
     * @mbggenerated
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column role.del_flag
     *
     * @return the value of role.del_flag
     *
     * @mbggenerated
     */
    public String getDelFlag() {
        return delFlag;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column role.del_flag
     *
     * @param delFlag the value for role.del_flag
     *
     * @mbggenerated
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public List<String> getMenuIdList() {
        List<String> menuIdList = Lists.newArrayList();
        for (Menu menu : menuList) {
            menuIdList.add(menu.getId());
        }
        return menuIdList;
    }

    public void setMenuIdList(List<String> menuIdList) {
        menuList = Lists.newArrayList();
        for (String menuId : menuIdList) {

            Menu menu = new Menu();

            menu.setId(menuId);

            menuList.add(menu);

        }
    }


    public String getMenuIds() {
        return StringUtils.join(getMenuIdList(), ",");
    }

    public void setMenuIds(String menuIds) {
        menuList = Lists.newArrayList();
        if (menuIds != null) {
            String[] ids = StringUtils.split(menuIds, ",");
            setMenuIdList(Lists.newArrayList(ids));
        }
    }
}