<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/12/2
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="${App_Path}/static/css/reset.css"/>
    <link rel="stylesheet" href="${App_Path}/static/css/common2.css"/>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${App_Path}/static/js/common.js"></script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

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

            $("#username_add_input").change(function () {
                //发送ajax请求校验用户名是否可用
                var username = this.value;
                $.ajax({
                    url: "${App_Path}/user/checkUsername",
                    data: "username=" + username,
                    type: "POST",
                    success: function (result) {
                        console.log(result);
                        if (result.code == 100) {
                            show_validate_msg("#username_add_input", "success", "用户名可用");
                            $("#register_btn").attr("ajax_va1", "success");
                        } else {
                            show_validate_msg("#username_add_input", "error", result.extend.va_msg);
                            $("#register_btn").attr("ajax_va1", "error");
                        }
                    }
                });
            });

            $("#password_add_input").change(function () {
                //发送ajax请求校验用户名是否可用
                var password = this.value;
                $.ajax({
                    url: "${App_Path}/user/checkPassword",
                    data: "password=" + password,
                    type: "POST",
                    success: function (result) {
                        console.log(result);
                        if (result.code == 100) {
                            show_validate_msg("#password_add_input", "success", "密码可用");
                            $("#register_btn").attr("ajax_va2", "success");
                        } else {
                            show_validate_msg("#password_add_input", "error", result.extend.va_msg);
                            $("#register_btn").attr("ajax_va2", "error");
                        }
                    }
                });
            });

            //表单提交
            $("#register_btn").click(function () {
                //若表单项有错，阻止提交
                if ($(this).attr("ajax_va1") == "error" || $(this).attr("ajax_va2") == "error") {
                    return false;
                } else
                    $("#myForm").submit();
            });
        });
    </script>
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">

        <div class="logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    注册
                </div>
                <form id="myForm" action="${App_Path}/user/register" method="post">
                    <div class="form-group" align="center">
                        <input style="width: 85%;height: 7%" id="username_add_input" class="form-control"
                               name="username" type="text" placeholder="用户名">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group" align="center">
                        <input style="width: 85%;height: 7%" id="password_add_input" class="form-control"
                               name="password" type="password" placeholder="密码">
                        <span class="help-block"></span>
                    </div>
                    <%-- <div class="form_text_ipt">
                         <input name="repassword" type="password" placeholder="重复密码">
                     </div>--%>
                    <%--<div class="form_text_ipt">
                        <input name="code" type="text" placeholder="验证码">
                    </div>--%>
                    <div class="form_btn">
                        <button class="button" id="register_btn">注册</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span><a href="${App_Path}/jsps/user/login.jsp">马上登录</a>
                    </div>
                </form>
                <div class="other_login">
                    <div class="left other_left">
                        <span>其它登录方式</span>
                    </div>
                    <div class="right other_right">
                        <a href="#">QQ登录</a>
                        <a href="#">微信登录</a>
                        <a href="#">微博登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
