<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/25
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>业务员信息</title>
</head>
<body>
    <div>
        <form action="addSalesman" method="post">
            <h3>基本信息</h3>
            业务员编号 <input type="text" name="salesmanId">
            姓名 <input type="text" name="name"><br>
            客户编号 <input type="text" name="clientId">
            登记时间 <input type="datetime" name="time"><br>


            <input type="button" value="保存">
            <input type="submit" value="提交">
            <a href="WEB-INF/jsp/salesmanManagement.jsp"><input type="button" value="返回"></a>
        </form>
    </div>
</body>
</html>
