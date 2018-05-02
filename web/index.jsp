<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 上午9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>危废服务平台</title>
  <link href="WEB-INF/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="align-center">
  <h2>危废服务平台</h2>
  <form action="getUser" method="post">
    账号：<input type="text" name="username"><br>
    密码：<input type="password" name="password"><br>
    <input type="submit" value="登录">
    <a href="register.jsp"><input type="button" value="注册"></a>
  </form>
</div>
</body>
</html>
