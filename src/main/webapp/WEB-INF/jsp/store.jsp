// var isEnd = false;
//
// $.ajaxSettings.async = true;

$.post("/menu/listData", {},
function (data) {
var menus = data;
// alert(data[0].parent.id);
var length = menus.length;
var result = '';
var parentid = '';
var num = 1;
// alert("menu.name:"+menu[0].name)

for (var i = 0; i < length; i++) {
// result += '<div class="card">';
var menu = menus[i];
// alert("menu.id:"+menu.id);
//获取父节点，parentid为1的都是父节点
if (menu.parent.id == 1) {
result += '<div class="card">\n' +
'
<div class="card-header" id="heading' + num + '">\n' +
    '
    <h2 class="mb-0">\n' +
        '
        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" \n
        ' +
        ' data-target="#collapse' + num + '" aria-expanded="false" aria-controls="collapse' + num + '">\n' +
        ' ' + menu.name + '\n' +
        '                                </button>\n' +
        '
    </h2>
    \n' +
    '
</div>
' +
'
<div id="collapse' + num + '" class="collapse" aria-labelledby="heading' + num + '" \n
' +
' data-parent="#accordionExample">\n' +
'
<div class="card-body">\n' +
    '
    <div style="width:100%">'
        ;
        parentid = menu.id;
        // alert("parentname::" + menu.name);
        for (var j = 0; j < length; j++) {
        var menuchild = menus[j];
        // alert("menuchild.parent.id:" + menuchild.parent.id);
        // alert("parentid:" + parentid);
        if (menuchild.parent.id == parentid) {
        // alert("menuchild.parent.id:" + menuchild.parent.id);
        // alert("parentid:" + parentid);
        // alert("menuchild.name:" + menuchild.name);
        result += '
        <button type="button" class="btn btn-light button-style-for-light" \n
        ' +
        ' onclick="opentable(\'' + menuchild.href + '\')">\n' +
        ' ' + menuchild.name + '\n' +
        '                                    </button>\n' +
        ' <br>'
        ;

        }

        }
        result += '
    </div>
    \n' +
    '
</div>
\n' +
' </div>\n' +
' </div>'
;
// alert(result);

num = num + 1;

}


}
$('.accordion').append(result);


}
, "json");

[{"parent":{"parent":null,"id":"1","parentIds":null,"name":"功能菜单","sort":30,"href":null,"target":null,"icon":null,"isShow":"1","permission":null,"createBy":null,"createDate":null,"updateBy":null,"updateDate":null,"remarks":null,"delFlag":"0","parentId":"0"},
"id":"27","parentIds":"0,1,","name":"我的面板","sort":100,"href":null,"target":null,"icon":null,"isShow":"1","permission":null,"createBy":"1","createDate":1369612800000,"updateBy":"1","updateDate":1369612800000,"remarks":null,"delFlag":"0","parentId":"1"},
{"parent":{"parent":null,"id":"27","parentIds":null,"name":"我的面板","sort":30,"href":null,"target":null,"icon":null,"isShow":"1","permission":null,"createBy":null,"createDate":null,"updateBy":null,"updateDate":null,"remarks":null,"delFlag":"0","parentId":"0"},
"id":"28","parentIds":"0,1,27,","name":"菜单管理","sort":40,"href":"/menu","target":"","icon":"","isShow":"1","permission":"","createBy":"5","createDate":1617452661000,"updateBy":"5","updateDate":1617452661000,"remarks":"","delFlag":"0","parentId":"27"}]


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


private String oldName; // 原角色名称

private String oldEnname; // 原英文名称

private List<Menu> menuList = Lists.newArrayList();