package com.example.demo.service;

import com.example.demo.entity.Role;

import java.util.List;

public interface RoleService {
    int getRoleCountByName(String name);

    int getRoleCountByEnName(String enname);

    int insertrole(Role role);

    void insertRoleMenu(Role role);

    List<Role> findAllRole();

    Role getRoleById(String id);

    void updateRole(Role role);

    void deleteRoleMenu(Role role);

    void deleteRoleById(String id);

    int deleteRole(Role role);
}
