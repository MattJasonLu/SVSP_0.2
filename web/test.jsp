<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/24
  Time: 上午9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="addClient">
        经营方式 <select name="operationMode">
        <option value="0">--请选择--</option>
        <option value="1">综合</option>
        <option value="2">收集</option>
        </select><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>
