<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Fail</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="align-center">
        操作失败，错误信息：${message}<br>
        <input type="button" name="Submit" onclick="javascript:history.back(-1);" value="返回">
    </div>
</body>
</html>
