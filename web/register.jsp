<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 上午10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>危废服务平台</title>
    <link href="css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="align-center">
    <h2>新用户注册</h2>
    <form action="addUser" method="post">
        账号：<input type="text" name="username"><br>
        密码：<input type="password" name="password"><br>
        重复密码：<input type="password" name="secondPassword"><br>
        <input type="submit" value="注册">
    </form>
</div>
</body>
</html>
