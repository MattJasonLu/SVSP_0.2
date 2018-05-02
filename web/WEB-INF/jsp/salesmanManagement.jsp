<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/24
  Time: 下午3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>业务员管理</title>
    <script>
        function state(value) {
            var selectedOption=value.options[value.selectedIndex];
            if(selectedOption.value=="enable"){
                var a = <%=request.getParameter("state")%>
            }else if(selectedOption.value=="unable"){
                var b = <%=request.getParameter("state")%>
            }
        }
    </script>
</head>
<body>
    <div>
        <a href="../../salesmanInfo.jsp"><button name="add" type="button" style="background-color: #333333;color: #CCCCCC">+ 新增</button></a>
        <form action="getSalesman" method="post">
            <select name="type">
                <option value="clientId">客户编号</option>
                <option value="salesmanId">业务员编号</option>
            </select>
            <input type="text" name="keyword">
            <button name="search" type="submit" style="background-color: #4254ac;color: #CCCCCC">🔎 查询</button>
        </form>
    </div>

    <div>
        <table border="1">
            <tr>
                <th>操作</th>
                <th>序号</th>
                <th>业务员编号</th>
                <th>姓名</th>
                <th>客户编号</th>
                <th>客户名称</th>
                <th>登记时间</th>
            </tr>
            <c:forEach items="${salesmanList}" var="salesman" varStatus="id">
            <tr>
                <td>
                    <form action="" method="post">
                        <%--<select name="operation">--%>
                        <%--<select name="operation" onchange="window.open(this.options[this.selectedIndex].value,target='_self')">   //onclick="state(this)"--%>
                            <%--<option selected>操作</option>--%>
                            <%--<option value="bindClient">分配</option>--%>
                            <%--<option value="deleteSalesman">注销</option>--%>
                            <input type="submit" value="分配" formaction="bindClient"><br>
                            <input type="submit" value="注销" formaction="deleteSalesman">
                        <%--</select>--%>
                            <input type="hidden" name="salesmanId" value="${salesman.salesmanId}">
                            <input type="hidden" name="name" value="${salesman.name}">
                            <input type="hidden" name="clientId" value="${salesman.clientId}">
                            <input type="hidden" name="time" value="${salesman.getCommonTime()}">
                    </form>
                </td>
                <td>${id.index}</td>
                <td>${salesman.salesmanId}</td>
                <td>${salesman.name}</td>
                <td>${salesman.clientId}</td>
                <td></td>
                <td>${salesman.getCommonTime()}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
