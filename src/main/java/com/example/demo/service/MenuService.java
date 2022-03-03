package com.example.demo.service;

import com.example.demo.entity.Menu;

import java.util.List;

public interface MenuService {

    List<Menu> findAllMenu();

    Menu getMenu(String id);

    int insertmenu(Menu menu);

    int updatemenu(Menu menu);

    Menu selectByPrimaryKey(String id);

    List<Menu> getMenuParentListById(String id);

    List<Menu> getAllMenuById(String userid);

    List<Menu> getAllMenuByRole(String roleid);

//    Menu selectById(String i);
}
