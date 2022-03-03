package com.example.demo.service.Imple;

import com.example.demo.dao.RoleMapper;
import com.example.demo.entity.Role;
import com.example.demo.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImp implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public int getRoleCountByName(String name) {
        return roleMapper.getRoleCountByName(name);
    }

    @Override
    public int getRoleCountByEnName(String enname) {
        return roleMapper.getRoleCountByEnName(enname);
    }

    @Override
    public int insertrole(Role role) {
        return roleMapper.insert(role);
    }

    @Override
    public void insertRoleMenu(Role role) {
        roleMapper.insertRoleMenu(role);

    }

    @Override
    public List<Role> findAllRole() {
        return roleMapper.findAllRole();
    }

    @Override
    public Role getRoleById(String id) {
        return roleMapper.getRoleById(id);
    }

    @Override
    public void updateRole(Role role) {
        roleMapper.updateByPrimaryKey(role);

    }

    @Override
    public void deleteRoleMenu(Role role) {
        roleMapper.deleteRoleMenu(role);
    }

    @Override
    public void deleteRoleById(String id) {
        roleMapper.deleteRoleById(id);
    }

    @Override
    public int deleteRole(Role role) {
        return roleMapper.updateByPrimaryKey(role);

    }
}
