<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/10/13
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        //页面加载完成后，直接去发送一个ajax请求,要到分页数据
        $(document).ready(function () {
            var currentPage;
            //跳到第一页
            to_page(1);

            //要跳转的页码
            function to_page(pn) {
                $.ajax({
                    url: "${App_Path}/empList",
                    data: "pn=" + pn
                    , type: "get"
                    , success: function (result) {
                        //console.log(result);
                        //1.解析并显示员工数据
                        build_emps_table(result);
                        //2.解析并显示分页信息
                        build_page_info(result);
                        //3.显示分页条
                        build_page_nav(result);

                    }
                });
            }

            //显示列表信息
            function build_emps_table(result) {
                //清空table表格
                $("#emps_table tbody").empty();
                var empList = result.extend.pageInfo.list;
                $.each(empList, function (i, item) {
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender);
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.department.deptName);
                    <!--编辑按钮-->
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                        .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");

                    //为编辑按钮添加一个自定义的属性值来表示员工当前的id
                    editBtn.attr("edit-id",item.empId);

                    <!--删除按钮-->
                    var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                        .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");

                    //为删除按钮添加一个自定义的属性值来表示员工当前的id
                    deleteBtn.attr("del-id",item.empId);
                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
                    $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd)
                        .append(emailTd).append(emailTd).append(deptNameTd).append(btnTd)
                        .appendTo("#emps_table tbody");

                })
            }

            //显示分页信息
            function build_page_info(result) {
                currentPage = result.extend.pageInfo.pageNum;
                //清空数据W
                $("#page_info_area").empty();

                $("#page_info_area").append("当前第" + result.extend.pageInfo.pageNum + "页,总共有"
                    + result.extend.pageInfo.pages
                    + "页,总共有" + result.extend.pageInfo.total
                    + "条记录");
            }

            //解析显示分页条
            function build_page_nav(result) {
                $("#page_nav_area").empty();
                var ul = $("<ul></ul>").addClass("pagination");
                //首页
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
                //前一页
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
                if (result.extend.pageInfo.hasPreviousPage == false) {
                    firstPageLi.addClass("disabled");
                    prePageLi.addClass("disabled");
                } else {
                    //给元素添加点击事件

                    firstPageLi.click(function () {
                        to_page(1);
                    });

                    prePageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum - 1);
                    });
                }

                //后一页
                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
                //尾页
                var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

                if (result.extend.pageInfo.hasNextPage == false) {
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                } else {
                    //添加点击事件
                    nextPageLi.click(function () {
                        to_page(result.extend.pageInfo.pageNum + 1);
                    });

                    //添加点击事件
                    lastPageLi.click(function () {
                        to_page(result.extend.pageInfo.pages);
                    });
                }

                //添加前一页和后一页显示
                ul.append(firstPageLi).append(prePageLi);

                $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                    var numLi = $("<li></li>").append($("<a></a>").append(item));
                    if (result.extend.pageInfo.pageNum == item) {
                        numLi.addClass("active");
                    }
                    numLi.click(function () {
                        to_page(item);
                    });
                    ul.append(numLi);
                });
                //添加下一页和最后一页
                ul.append(nextPageLi).append(lastPageLi);

                var nav = $("<nav></nav>").append(ul);
                nav.appendTo("#page_nav_area");
            }

            //表单重置
            function reset_form(ele) {
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-error has-success");
                $(ele).find(".help-block").text("");

            }

            //点击新增按钮弹出模态框
            $("#emp_add_modal_btn").click(function () {
                //表单重置
                reset_form("#empAddModal form");
                //发送ajax请求，查出部门信息，显示在下拉列表
                getDepts("#empAddModal select");
                //弹出模态框
                $("#empAddModal").modal({
                    backdrop: "static"
                });
            });

            //获得部门信息
            function getDepts(ele) {
                //清空之前下拉列表的值
                $(ele).empty();
                $.ajax({
                    url: "${App_Path}/depts",
                    type: "GET",
                    success: function (result) {
                        //console.log(result);
                        //显示部门信息在下拉列表中
                        $.each(result.extend.depts, function () {
                            var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                            optionEle.appendTo(ele);
                        });

                    }

                });
            }

            //校验表单数据
            function validate_add_form() {
                //1.拿到要校验的数据,使用正则表达式进行校验
                var empName = $("#empName_add_input").val();
                var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
                if (!regName.test(empName)) {
                    //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
                    return false;
                } else {
                    show_validate_msg("#empName_add_input", "success", "")
                }

                //2.校验邮箱信息
                var email = $("#email_add_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    //alert("邮箱的格式不正确");
                    show_validate_msg("#email_add_input", "error", "邮箱的格式不正确");
                    return false;
                } else {
                    show_validate_msg("#email_add_input", "success", "");
                }
                return true;
            }

            //校验显示错误信息
            function show_validate_msg(ele, status, msg) {
                //应该清空这个元素之前的样式
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if ("success" == status) {
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                } else if ("error" == status) {
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            //绑定点击事件给保存按钮
            $("#emp_save_btn").click(function () {
                if ($(this).attr("ajax_va") == "error") {
                    return false;
                }
                //1.模态框中填写的表单数据交给服务器进行保存
                //对要提交给服务器的数据进行校验
                /*if (!validate_add_form()) {
                    return false;
                }*/
                // 2.发送ajax请求保存员工
                $.ajax({
                    url: "${App_Path}/emp",
                    type: "POST",
                    data: $("#empAddModal form").serialize(),
                    success: function (result) {
                        if (result.code == 100) {
                            //console.log(result);
                            //alert(result.message)
                            //员工保存成功
                            //1.关闭模态框
                            $("#empAddModal").modal("hide");
                            //2.显示刚才保存的数据
                            //发送ajax请求显示最后一页的数据
                            to_page(99999);
                        } else {
                            //显示失败信息
                            //console.log(result);
                            if (undefined != result.extend.errorFields.email) {
                                //显示邮箱的错误信息
                                show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                                return false;
                            }

                            if (undefined != result.extend.errorFields.empName) {
                                //显示员工名的错误信息
                                show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                            }
                        }
                    }
                });
            });

            //校验用户名是否可用
            $("#empName_add_input").change(function () {
                //发送ajax请求校验用户名是否可用
                var empName = this.value;
                $.ajax({
                    url: "${App_Path}/checkEmpName",
                    data: "empName=" + empName,
                    type: "POST",
                    success: function (result) {
                        console.log(result);
                        if (result.code == 100) {
                            show_validate_msg("#empName_add_input", "success", "用户名可用");
                            $("#emp_save_btn").attr("ajax_va", "success");
                        } else {
                            show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                            $("#emp_save_btn").attr("ajax_va", "error");
                        }
                    }
                });
            });

            //对于JQUERY事件新添加的元素，要用onclick
            //用on绑定
            $(document).on("click", ".edit_btn", function () {
                //查询部门信息，显示部门列表
                getDepts("#empUpdateModal select");

                //查询员工信息，显示员工信息
                getEmp($(this).attr("edit-id"));

                //把员工id传给更新按钮
                $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
                $("#empUpdateModal").modal({
                    backdrop: "static"
                });
            });

            function getEmp(id) {
                $.ajax({
                    url:"${App_Path}/emp/"+id,
                    type:"GET",
                    success: function(result) {
                       // console.log(result);
                        var empData = result.extend.emp;
                        $("#empName_update_static").text(empData.empName);
                        $("#email_update_input").val(empData.email);
                        $("#empUpdateModal input[name=gender]").val([empData.gender]);
                        $("#empUpdateModal select").val([empData.dId]);
                    }
                });
            }

            //点击更新，更新员工信息
            $("#emp_update_btn").click(function(){
                //1.校验邮箱信息
                var email = $("#email_update_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)) {
                    //alert("邮箱的格式不正确");
                    show_validate_msg("#email_update_input", "error", "邮箱的格式不正确");
                    return false;
                } else {
                    show_validate_msg("#email_update_input", "success", "");
                }
                //2.发送ajax请求保存更新员工的数据
                $.ajax({
                    url:"${App_Path}/emp/"+$(this).attr("edit-id"),
                    type:"PUT",
                    data:$("#empUpdateModal form").serialize(), //获取表单序列化后的结果,改方法为put
                    success:function(result){
                        $("#empUpdateModal").modal("hide");
                        to_page(currentPage);
                    }
                });
            });

            //对于JQUERY事件新添加的元素，要用onclick
            //用on绑定
            $(document).on("click", ".delete_btn", function () {
                var empName = $(this).parents("tr").find("td:eq(1)").text();
                var empId = $(this).attr("del-id");
                if(confirm("确认删除["+empName+"]吗？")){
                    $.ajax({
                       url:"${App_Path}/emp/"+empId,
                        type:"DELETE",
                        success: function(result) {
                           alert(result.message);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>
                SSM-CURD
            </h1>
        </div>
    </div>

    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!--分页条-->
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
</body>
</html>
