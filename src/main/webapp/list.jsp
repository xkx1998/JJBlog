<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: XuKexiang
  Date: 2018/11/23
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Welcome: <shiro:principal></shiro:principal>
<shiro:hasRole name="admin" >
    <br>
    <a href="admin.jsp">admin</a>
    <br>
</shiro:hasRole>

<shiro:hasRole name="user">
<br>
<a href="user.jsp">user</a>
<br>
</shiro:hasRole>

<br><br>
<a href="shiro/testShiroAnnotation">Test ShiroAnnotation</a>
<br>

<a href="shiro/logout">Logout</a>
</body>
</html>
