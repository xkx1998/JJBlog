<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${App_Path}/static/css/reset.css"/>
    <link rel="stylesheet" href="${App_Path}/static/css/common2.css"/>
    <script type="text/javascript" src="${App_Path}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${App_Path}/static/js/common.js"></script>
    <link href="${App_Path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="${App_Path}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#login").click(function(){
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
                    登录
                </div>
                <h4 align="center"><small style="color: #aa1111">${log_msg}</small></h4>
                <form action="${App_Path}/user/login" method="post" id="myForm">
                    <div class="form-group" align="center">
                        <input style="width: 85%;height: 7%" id="username_input" class="form-control"
                               name="username" type="text" placeholder="用户名">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group" align="center">
                        <input style="width: 85%;height: 7%" id="password_input" class="form-control"
                               name="password" type="password" placeholder="密码">
                        <span class="help-block"></span>
                    </div>
                    <%--<div class="form_check_ipt">
                        <div class="left check_left">
                            <label><input name="" type="checkbox"> 下次自动登录</label>
                        </div>
                        <div class="right check_right">
                            <a href="#">忘记密码</a>
                        </div>
                    </div>--%>
                    <div class="form_btn">
                        <button type="button" id="login">登录</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>还没有帐号？</span><a href="${App_Path}/jsps/user/register.jsp">马上注册</a>
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
