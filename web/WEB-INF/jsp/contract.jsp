<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/5/18
  Time: 09:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>合同管理</title>
    <script>
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
        <a href="showContract"><input type="button" class="fm" value="+ 新增"></a>
        <a href="submitContract"><input type="button" class="fm" value="√ 提交"></a>
        <input type="button" class="fm" value="⇋ 导入">
        <input type="button" class="fm" value="⇋ 导出">
    </div>
    <div id="rightButton" class="dd">
        <form action="getContract" method="post">
            <input type="text" name="keyword">
            <input type="submit" class="em" name="search" value="🔎 搜索">
        </form>
    </div>
    <div id="table">
        <table border="1px" id="myTable">
            <tr>
                <th></th>
                <th>操作</th>
                <th>公司名称</th>
                <th>所属区域</th>
                <th>状态</th>
                <th>签订日期</th>
                <th>合约量</th>
                <th>联系人</th>
                <th>联系电话</th>
            </tr>
            <c:forEach items="${contractList}" var="contract" varStatus="id">
                <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                        <div class="menu">
                            <ul>
                                <li class="" onmouseover="over()" onmouseleave="out()">操作
                                    <ul>
                                        <li><a href="viewContract">查看</a></li>
                                        <li><a href="#">提交</a></li>
                                        <li><a href="showContract?contractId=${contract.contractId}">修改</a></li>
                                        <li><a href="#">审批轨迹</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </td>
                    <td>${contract.companyName}</td>
                    <td>${contract.area}</td>
                    <td>${contract.checkState.name}</td>
                    <td>${contract.beginTime}</td>
                    <td>${contract.agreedQuantity}</td>
                    <td>${contract.contactName}</td>
                    <td>${contract.telephone}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
