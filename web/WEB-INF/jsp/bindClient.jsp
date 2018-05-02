<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/26
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>绑定客户</title>
</head>
<body>
    <div>
        <form action="updateSalesman" method="post">
            <h3>绑定客户</h3>
            业务员编号 <input type="text" name="salesmanId" value="${salesman.salesmanId}" readonly>
            业务员姓名 <input type="text" name="name" value="${salesman.name}" readonly><br>
            绑定客户
            <select name="clientId">
                <option>--未选择--</option>
                <c:forEach items="${clientList}" var="client" varStatus="id">
                    <option value=${client.clientId}>${client.companyName}</option>
                </c:forEach>
            </select>
            <br>
            <input type="button" value="保存">
            <input type="submit" value="提交">
            <a href="listSalesman"><input type="button" value="返回"></a>
        </form>
    </div>
</body>
</html>
