package com.example.demo.service.Imple;

import com.example.demo.dao.MenuMapper;
import com.example.demo.entity.Menu;
import com.example.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImp implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> findAllMenu() {
        return menuMapper.findAllMenu();
    }

    @Override
    public Menu getMenu(String id) {
        return menuMapper.get(id);
    }

    @Override
    public int insertmenu(Menu menu) {
        return menuMapper.insert(menu);

    }

    @Override
    public int updatemenu(Menu menu) {
       return menuMapper.updateByPrimaryKey(menu);
    }

    @Override
    public Menu selectByPrimaryKey(String id) {
        return menuMapper.get(id);
    }

    @Override
    public List<Menu> getMenuParentListById(String id) {
        return menuMapper.get1(id);
    }

    @Override
    public List<Menu> getAllMenuById(String userid) {
        return menuMapper.getAllMenuById(userid);
    }

    @Override
    public List<Menu> getAllMenuByRole(String roleid) {
        return menuMapper.getAllMenuByRole(roleid);
    }

//    @Override
//    public Menu selectById(String i) {
//        return menuMapper.selectByPrimaryKey(i);
//    }
}
