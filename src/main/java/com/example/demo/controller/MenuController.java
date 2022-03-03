package com.example.demo.controller;

import com.example.demo.Util.UUIDUtil;
import com.example.demo.entity.Log;
import com.example.demo.entity.Menu;
import com.example.demo.entity.User;
import com.example.demo.service.LogServiceI;
import com.example.demo.service.MenuService;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value = "/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private LogServiceI logServiceI;

    @RequestMapping(value = {""})
//    @ControllerLog(Module = "日志管理", Remark = "查看菜单列表")
    public String list(Model model, Log log,HttpServletRequest request) {
        List<Menu> list = Lists.newArrayList();
        List<Menu> sourcelist = menuService.findAllMenu();
//        Menu menu = menuService.selectById("61");
//        System.out.println("menu.getDelFlag():" + menu.getDelFlag());
//        System.out.println("sourcelist.get(0):" + sourcelist.get(0).getSort());
//        System.out.println("sourcelist.get(1):" + sourcelist.get(1).getSort());
//        System.out.println("sourcelist.get(2):" + sourcelist.get(2).getSort());
//        System.out.println("sourcelist.get(3):" + sourcelist.get(3).getSort());
//        System.out.println("sourcelist.get(4):" + sourcelist.get(4).getSort());
        System.out.println("sourcelist.get(4).getIsShow():" + sourcelist.get(4).getIsShow());
        System.out.println("sourcelist.get(4).getCreateBy():" + sourcelist.get(4).getCreateBy());
        System.out.println("sourcelist.get(4).getDelFlag():" + sourcelist.get(4).getDelFlag());
        System.out.println("sourcelist.get(4).getHref():" + sourcelist.get(4).getHref());
        System.out.println("sourcelist.get(4).getIcon():" + sourcelist.get(4).getIcon());
        System.out.println("sourcelist.get(4).getId():" + sourcelist.get(4).getId());
        System.out.println("sourcelist.get(4).getName():" + sourcelist.get(4).getName());
        System.out.println("sourcelist.get(4).getParentId():" + sourcelist.get(4).getParentId());
        System.out.println("sourcelist.get(4).getParent():" + sourcelist.get(4).getParent());
        System.out.println("sourcelist.get(4).getParentIds():" + sourcelist.get(4).getParentIds());
        System.out.println("sourcelist.get(4).getPermission():" + sourcelist.get(4).getPermission());
        System.out.println("sourcelist.get(4).getRemarks():" + sourcelist.get(4).getRemarks());
        System.out.println("sourcelist.get(4).getTarget():" + sourcelist.get(4).getTarget());
        System.out.println("sourcelist.get(4).getUpdateBy():" + sourcelist.get(4).getUpdateBy());
        System.out.println("sourcelist.get(4).getCreateDate():" + sourcelist.get(4).getCreateDate());
        System.out.println("sourcelist.get(4).getSort():" + sourcelist.get(4).getSort());
        System.out.println("sourcelist.get(4).getUpdateDate():" + sourcelist.get(4).getUpdateDate());


        Menu.sortList(list, sourcelist, Menu.getRootId(), true);
//        for (int i = 0; i < sourcelist.size(); i++) {
//            System.out.println("sourcelist.get(" + i + ").getName():" + sourcelist.get(i).getName());
//
//        }
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println("list.get(" + i + ").getName():" + list.get(i).getName());
//
//        }

//        System.out.println("list.get(0):" + list.get(0).getIsShow());
//        System.out.println("list.get(1):" + list.get(1).getIsShow());
//        System.out.println("list.get(2):" + list.get(2).getIsShow());
//        System.out.println("list.get(3):" + list.get(3).getIsShow());
//        System.out.println("list.get(4):" + list.get(4).getIsShow());
//        System.out.println("list.get(61):" + list.get(61).getSort());
//        System.out.println("list.get(61).getIsShow():" + list.get(61).getIsShow());
//        System.out.println("list.get(61).getCreateBy():" + list.get(61).getCreateBy());
//        System.out.println("list.get(61).getDelFlag():" + list.get(61).getDelFlag());
//        System.out.println("list.get(61).getHref():" + list.get(61).getHref());
//        System.out.println("list.get(61).getIcon():" + list.get(61).getIcon());
//        System.out.println("list.get(61).getId():" + list.get(61).getId());
//        System.out.println("list.get(61).getName():" + list.get(61).getName());
//        System.out.println("list.get(61).getParentId():" + list.get(61).getParentId());
//        System.out.println("list.get(61).getParent():" + list.get(61).getParent());
//        System.out.println("list.get(61).getParentIds():" + list.get(61).getParentIds());
//        System.out.println("list.get(61).getPermission():" + list.get(61).getPermission());
//        System.out.println("list.get(61).getRemarks():" + list.get(61).getRemarks());
//        System.out.println("list.get(61).getTarget():" + list.get(61).getTarget());
//        System.out.println("list.get(61).getUpdateBy():" + list.get(61).getUpdateBy());
//        System.out.println("list.get(61).getCreateDate():" + list.get(61).getCreateDate());
//        System.out.println("list.get(61).getSort():" + list.get(61).getSort());
//        System.out.println("list.get(61).getUpdateDate():" + list.get(61).getUpdateDate());
//        System.out.println("UUIDUtil.getUUID():"+UUIDUtil.getUUID());

        String id = UUID.randomUUID().toString().replace("-", "");



        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = loginUser.getId();

        String roleid = loginUser.getRoleId();



        log.setLid(id);

        log.setLaction("查看");

        log.setLcreator(userId);

        log.setIurl(requestUri);


//        log.setLip(remoteAddr);
//        log.setLmodule(controllerMethodDescription.get("module"));
        log.setLremark("菜单");

        log.setLcreatorrole(roleid);
//        System.out.print("controllerMethodDescription.get(\"module\"):"+controllerMethodDescription.get("module"));
//        System.out.print("controllerMethodDescription.get(\"remark\"):"+controllerMethodDescription.get("remark"));
//        Date operateDate = beginTimeThreadLocal.get();
        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);

        model.addAttribute("list", list);

        return "menuList";
    }

    //  上级菜单选择跳转
    @RequestMapping("/form/parentMenuSelect")
    public String parentMenuSelect(Model model, HttpServletRequest request) {
        List<Menu> list = Lists.newArrayList();

        List<Menu> sourcelist = menuService.findAllMenu();

        Menu.sortList(list, sourcelist, "0", true);

        String a = request.getParameter("url");

        System.out.println("a:" + a);

        model.addAttribute("list", list);


        return "parentMenuSelect";
    }

    //菜单操作功能
    @RequestMapping(value = "form")
    public String form(Menu menu, Model model, HttpServletRequest request) {
        if (menu.getParent() == null || menu.getParent().getId() == null) {

//                        if (request.getParameter("pid") != null){
////                menu.setParent(new Menu(Menu.getRootId()));
//                menu.setParent(new Menu(request.getParameter("pid")));
//            }else if(request.getParameter("id") != null){
//                menu.setParent(new Menu(Menu.getRootId()));
//            }else{
//                menu.setParent(new Menu(Menu.getRootId()));
            if (request.getParameter("pid") != null) {
                if (request.getParameter("id") != null) {
//                   同时具有pid和id则只能返回添加菜单
                    menu.setParent(new Menu(Menu.getRootId()));
                    menu.setParent(menuService.getMenu(menu.getParent().getId()));
//                menu.setParent(new Menu(request.getParameter("pid")));
                } else {
//                只有pid没有id则是选择菜单后的跳转
                    menu.setParent(new Menu(request.getParameter("pid")));
                    menu.setParent(menuService.getMenu(menu.getParent().getId()));

                }
            } else {

                if (request.getParameter("id") != null) {
//                没有pid但是有id的话，则说明是修改菜单
                    String id = request.getParameter("id");
                    menu = menuService.getMenu(id);
                    model.addAttribute("menu", menu);
                    return "menuFormModify";

                } else {
//                没有pid也没有id的话，只能返回添加菜单
                    menu.setParent(new Menu(Menu.getRootId()));
                    menu.setParent(menuService.getMenu(menu.getParent().getId()));
                }
            }
//            System.out.println("menu.getSort():"+menu.getSort());
//            System.out.println("menu.getIsShow():" + menu.getIsShow());
//            System.out.println("menu.getDelFlag():" + menu.getDelFlag());

//      Menu.getRootId()获取到的是数值1
//      new Menu(Menu.getRootId())指的是构造了一个id为1的Menu
//
//            System.out.println("11111111111111111111111111111111111111");

//            System.out.println("22222222222222222222222222222222222222");
        }
//        System.out.println("333333333333333333333333333333333333333");
        System.out.println(menuService.getMenu(menu.getParent().getId()));
//        System.out.println("444444444444444444444444444444444444444");
//        这一步主要根据parent的id在数据库中获取到整个完整的、实际的Menu parent
//        为后面显示menu.parent.id or menu.parent.name做准备


//        menu.setParent(menuService.getMenu(menu.getParent().getId()));


//        System.out.println("55555555555555555555555555555555");


//        System.out.println("menuService.getMenu(menu.getParent().getId()):"+ menuService.getMenu(menu.getParent().getId()));
        // 获取排序号，最末节点排序号+30
        if (StringUtils.isBlank(menu.getId())) {
            List<Menu> list = Lists.newArrayList();
            List<Menu> sourcelist = menuService.findAllMenu();
            Menu.sortList(list, sourcelist, menu.getParentId(), false);
            if (list.size() > 0) {
                menu.setSort(list.get(list.size() - 1).getSort() + 30);
            }
        }
        model.addAttribute("menu", menu);
        return "menuFormAdd";
    }


    //    保存菜单
    @RequestMapping(value = "/form/save")
    public String form(Menu menu, HttpServletRequest request,Log log) {
//        主要有两种形式的提交：
//         一种是只获取到了menu的parent,相当于新插入一个menu到数据库中(insert操作)
//        另外一种是获取到了整个menu，相当于update menu
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        Date date = new Date();

        String oldIds = menuService.getMenu(menu.getParent().getId()).getParentIds();

        System.out.println("oldIds:" + oldIds);

        String newIds = oldIds + menu.getParent().getId() + ",";

        System.out.println(newIds);

        menu.setParentIds(newIds);

        System.out.println("menu.getId():" + menu.getId());


//        如果id是空的，说明是一个新插入操作(insert操作)
        if (menu.getId().equals("")) {
            String Id = UUIDUtil.getUUID();

            menu.setId(Id);

            menu.setUpdateBy(userId);

            menu.setCreateBy(userId);

            menu.setUpdateDate(date);

            menu.setCreateDate(date);

            menuService.insertmenu(menu);

            String id = UUID.randomUUID().toString().replace("-", "");


            String requestUri = request.getRequestURI();//请求的Uri

            User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

            String roleid = loginUser.getRoleId();



//            String userId = loginUser.getId();

            log.setLid(id);

            log.setLaction("添加");

            log.setLcreator(userId);

            log.setIurl(requestUri);


//        log.setLip(remoteAddr);
//        log.setLmodule(controllerMethodDescription.get("module"));
            log.setLremark("菜单");

            log.setLcreatorrole(roleid);
//        System.out.print("controllerMethodDescription.get(\"module\"):"+controllerMethodDescription.get("module"));
//        System.out.print("controllerMethodDescription.get(\"remark\"):"+controllerMethodDescription.get("remark"));
//        Date operateDate = beginTimeThreadLocal.get();
            log.setLcreatetime(new Date());

            logServiceI.insertSelective(log);


        } else {
//            如果不是空，则说明是修改操作
            menu.setUpdateBy(userId);

            System.out.println("1111111111111111111111");

            menu.setUpdateDate(date);

            System.out.println("2222222222222222222222222");

            if (menu.getCreateBy() == null) {

                System.out.println("33333333333333333333333");

                menu.setCreateBy(userId);

            }
            if (menu.getCreateDate() == null) {

                System.out.println("44444444444444444444444");

                menu.setCreateDate(date);

            }

            menuService.updatemenu(menu);

            String id = UUID.randomUUID().toString().replace("-", "");


            String requestUri = request.getRequestURI();//请求的Uri

            User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//            String userId = loginUser.getId();

            String roleid = loginUser.getRoleId();



            log.setLid(id);

            log.setLaction("修改");

            log.setLcreator(userId);

            log.setIurl(requestUri);


//        log.setLip(remoteAddr);
//        log.setLmodule(controllerMethodDescription.get("module"));
            log.setLremark("菜单");

            log.setLcreatorrole(roleid);

//        System.out.print("controllerMethodDescription.get(\"module\"):"+controllerMethodDescription.get("module"));
//        System.out.print("controllerMethodDescription.get(\"remark\"):"+controllerMethodDescription.get("remark"));
//        Date operateDate = beginTimeThreadLocal.get();
            log.setLcreatetime(new Date());

            logServiceI.insertSelective(log);

            System.out.println("5555555555555555555555555555");

        }

        String UUID = UUIDUtil.getUUID();
        System.out.println("UUID:" + UUID);
        return "redirect:/menu";


    }

    //获取菜单数据实现动态加载
//    需要返回json数据时，记得加上@ResponseBody
    @RequestMapping(value = "/listData")
    @ResponseBody
    public List<Menu> listData() {

        List<Menu> list = Lists.newArrayList();

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String identity = user.getIdentity();

//        String userid = user.getId();

        String roleid = user.getRoleId();

//        System.out.print("userId:" + userId);

        if (identity.equals("SUPERADMIN")) {
            list = Lists.newArrayList();

//          获取到管理员相应的菜单数据
            List<Menu> sourcelist = menuService.findAllMenu();

            sourcelist.size();



//          将获取到的菜单数据进行分类化处理达到排列的要求

            Menu.sortList(list, sourcelist, Menu.getRootId(), true);

            list.size();

            System.out.println("list.get(0).getId():" + list.get(0).getId());
        } else {
            List<Menu> sourcelist = menuService.getAllMenuByRole(roleid);

            System.out.print("sourcelist.get(0).getName():"+sourcelist.get(0).getName());

            System.out.print("sourcelist.get(0).getName():" + sourcelist.get(0).getParent().getName());

            Menu.sortList(list, sourcelist, Menu.getRootId(), true);
        }



        return list;

    }


    @RequestMapping(value = "delete")

    public String delete(HttpServletRequest request,Log log) {

        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = user.getId().toString();

        Date date = new Date();

        System.out.println();

        String id = request.getParameter("id");

        System.out.println("menuService.selectByPrimaryKey(id).getParentId():" + menuService.selectByPrimaryKey(id).getParentId());

        Menu menu = menuService.getMenu(id);

        menu.setDelFlag("1");

//        System.out.println("menu.getDelFlag():" + menu.getDelFlag());
//        System.out.println("menu.getIsShow():" + menu.getIsShow());
//        System.out.println("menu.getCreateBy():" + menu.getCreateBy());
//        System.out.println("menu.getDelFlag():" + menu.getDelFlag());
//        System.out.println("menu.getHref():" + menu.getHref());
//        System.out.println("menu.getIcon():" + menu.getIcon());
//        System.out.println("menu.getId():" + menu.getId());
//        System.out.println("menu.getName():" + menu.getName());
//        System.out.println("menu.getParentId():" + menu.getParentId());
//        System.out.println("menu.getParent():" + menu.getParent());
//        System.out.println("menu.getParentIds():" + menu.getParentIds());
//        System.out.println("menu.getPermission():" + menu.getPermission());
//        System.out.println("menu.getRemarks():" + menu.getRemarks());
//        System.out.println("menu.getTarget():" + menu.getTarget());
//        System.out.println("menu.getUpdateBy():" + menu.getUpdateBy());
//        System.out.println("menu.getCreateDate():" + menu.getCreateDate());
//        System.out.println("menu.getSort():" + menu.getSort());
//        System.out.println("menu.getUpdateDate():" + menu.getUpdateDate());
//        if(menu.getCreateDate() == null){
//
//            menu.setCreateDate();
//
//        }

        menuService.updatemenu(menu);

        String id1 = UUID.randomUUID().toString().replace("-", "");


        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

//        String userId = loginUser.getId();

        String roleid = loginUser.getRoleId();



        log.setLid(id1);

        log.setLaction("删除");

        log.setLcreator(userId);

        log.setIurl(requestUri);


//        log.setLip(remoteAddr);
//        log.setLmodule(controllerMethodDescription.get("module"));

        log.setLremark("菜单");

        log.setLcreatorrole(roleid);

//        System.out.print("controllerMethodDescription.get(\"module\"):"+controllerMethodDescription.get("module"));
//        System.out.print("controllerMethodDescription.get(\"remark\"):"+controllerMethodDescription.get("remark"));
//        Date operateDate = beginTimeThreadLocal.get();
        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);

        return "redirect:/menu";

    }

    @RequestMapping(value = "updateSort")
    public String updateSort(String[] ids, Integer[] sorts,HttpServletRequest request,Log log) {

        System.out.println("ids[0]:" + ids[0]);

        for (int i = 0; i < ids.length; i++) {
            Menu menu = menuService.getMenu(ids[i]);
            menu.setSort(sorts[i]);
            menuService.updatemenu(menu);
        }

        String id = UUID.randomUUID().toString().replace("-", "");

        String requestUri = request.getRequestURI();//请求的Uri

        User loginUser = (User) SecurityUtils.getSubject().getSession().getAttribute("user");

        String userId = loginUser.getId();

        String roleid = loginUser.getRoleId();


        log.setLid(id);

        log.setLaction("修改");

        log.setLcreator(userId);

        log.setIurl(requestUri);

        log.setLremark("菜单排序");

        log.setLcreatorrole(roleid);


        log.setLcreatetime(new Date());

        logServiceI.insertSelective(log);

        return "redirect:/menu";
    }


}
