<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/26
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>危险废物数据调查表1</title>
    <style>
        .p1{
            font-size: 18px;
        }
        .div1{
            float: left;
        }
        .myTable tr td{
            text-align: right;
        }
        .div4{
            float: right;
        }
    </style>
    <script>
        function jump1(){
            window.location.href="secondQuestionnaire";
        }
        function jump2(){
            window.location.href="listQuestionnaire"
        }
    </script>
</head>
<body>
    <div class="div1" style="width: 100%;height: 15%">
        <p class="p1"><b>危险废物数据调查表</b></p>
    </div>
    <br>
    <div class="div2" style="width: 100%;height: 10%">
        <p class="p2">基本信息</p>
        <p class="p3">查询单号(问卷编号):xxxxxxxx</p>
    </div>
    <br>
    <br>
    <br>
    <br>
    <form action="secondQuestionnaire" method="post">
    <div class="div3" style="width: 100%">
        <table class="myTable" width="800px">
            <tr>
                <td>企业名称:  <input type="text" name="companyName" value="${client.companyName}" readonly></td>
                <td>地址:  <input type="text" name="location" value="${client.location}" readonly></td>
            </tr>
            <tr>
                <td>联系人:  <input type="text" name="contactName" value="${client.contactName}" readonly></td>
                <td>联系电话:  <input type="text" name="phone" value="${client.phone}" readonly></td>
            </tr>
            <tr>
                <td>所属行业:  <input type="text" name="industry" value="${client.industry}" readonly></td>
                <td>主要产品:  <input type="text" name="product" value="${client.product}" readonly></td>
            </tr>
            <tr>
                <td>填报人:  <input type="text" name="author" value="${questionnaire.author}"></td>
                <td>填报日期:  <input type="text" name="time" value="${time}" readonly></td>
            </tr>

        </table>
    </div>
    <div class="div4">
        <input id="input1" type="submit" value="下一个">
        <input id="input2" type="button" value="返回" onclick="jump2()">
    </div>
    </form>
</body>
</html>
