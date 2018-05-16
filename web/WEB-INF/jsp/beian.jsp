<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/24
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script>
        function insRow() {
            var x=document.getElementById('myTable').insertRow(0);
            var x0=x.insertCell(0);
            var x1=x.insertCell(1);
            var x2=x.insertCell(2);
            var x3=x.insertCell(3);
            var x4=x.insertCell(4);
            var x5=x.insertCell(5);
            var x6=x.insertCell(6);
            var x7=x.insertCell(7);
            x0.innerHTML="<input type=\"checkbox\" />";
            x1.innerHTML="NEW CELL2";
            x2.innerHTML="NEW CELL1";
            x3.innerHTML="NEW CELL2";
            x4.innerHTML="NEW CELL1";
            x5.innerHTML="NEW CELL2";
            x6.innerHTML="NEW CELL1";
            x7.innerHTML="NEW CELL2";
        }
        function over() {
            window.event.srcElement.className = "current";
        }
        function out() {
            window.event.srcElement.className = window.event.srcElement.className.replace("current", "");
        }
    </script>
    <style>
        #leftButton{
            margin-right:30px;
            width: 45%;
        }
        #rightButton{
            margin-right:30px;
            width: 45%;
        }
        .fm{
            background-color: #333333;
            color: #CCCCCC;
        }
        .em{
            background-color: #4254ac;
            color: #CCCCCC;
        }
        .dd{
            /*float: left;!* 前两个div显示为同一行 *!*/
        }
        .menu ul {
            margin: 0;
            padding: 0;
            list-style: none;
            width: 50px;
        }
        .menu ul li{
            /*background-color: #eee;*/
            position: relative;
        }
        .menu ul li a {
            color: #000;
            text-decoration: none;
        }
        .menu ul li a:hover {
            color: #ff0000;
        }
        .menu ul li ul {
            display: none;
            position: absolute;
            background-color: #eee;
            left:45px;
            top:0px;
            width: 100px;
        }
        .menu ul li.current ul {
            display: block;
        }
    </style>
</head>
<body>
    <div id="leftButton" class="dd">
        <a href="../../clientInfo.jsp"><input type="button" class="fm" value="+ 新增"></a>
        <input type="button" class="fm" value="√ 提交">
        <input type="button" class="fm" value="⇋ 批量导入">
        <input type="button" class="fm" value="⇋ 批量导出">
    </div>
    <div id="rightButton" class="dd">
        <form action="getClient" method="post">
            <input type="text" name="keyword">
            <input type="submit" class="em" name="search" value="🔎 搜索">
        </form>
    </div>
    <div id="table">
        <table border="1px" id="myTable">
            <tr>
                <th></th>
                <th>操作</th>
                <th>客户编号</th>
                <th>客户名称</th>
                <th>申报状态</th>
                <th>审核状态</th>
                <th>账号状态</th>
                <th>联系人</th>
                <th>联系电话</th>
            </tr>
            <c:forEach items="${clientList}" var="client" varStatus="id">
                <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                        <div class="menu">
                            <ul>
                                <li class="" onmouseover="over()" onmouseleave="out()">操作
                                    <ul>
                                        <li><a href="../../clientInfo.jsp">新增</a></li>
                                        <li><a href="showClient?clientId=${client.clientId}">修改</a></li>
                                        <li><a href="#">导出</a></li>
                                        <li><a href="disableClient?clientId=${client.clientId}">停用</a></li>
                                        <li><a href="enableClient?clientId=${client.clientId}">启用</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td>${client.clientId}</td>
                    <td>${client.companyName}</td>
                    <td>${client.applicationStatus.name}</td>
                    <td>${client.checkState.name}</td>
                    <td class="clientStatus">${client.clientState.name}</td>
                    <td>${client.contactName}</td>
                    <td>${client.mobile}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
