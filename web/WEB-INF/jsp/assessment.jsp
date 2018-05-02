<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/26
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>危险废物数据评估</title>
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
    </style>
</head>
<body>
    <div id="leftButton" class="dd">
        <a href="showQuestionnaire"><input type="button" class="fm" value="+ 填报"></a>
        <input type="button" class="fm" value="√ 提交">
        <input type="button" class="fm" value="⇋ 批量导入">
        <input type="button" class="fm" value="⇋ 批量导出">
    </div>
    <div id="rightButton" class="dd">
        <form action="#" method="post">
            <input type="text" name="keyword">
            <input type="submit" class="em" name="search" value="🔎 搜索">
        </form>
    </div>
    <div>
        <table border="1px">
            <tr>
                <th></th>
                <th>操作</th>
                <th>查询号</th>
                <th>企业名称</th>
                <th>所属行业</th>
                <th>主要产品</th>
                <th>填报人</th>
                <th>填报日期</th>
            </tr>
            <c:forEach items="${questionnaireList}" var="questionnaire" varStatus="id">
                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="button" value="操作" name="IP" onclick=""></td>
                    <td>${questionnaire.questionnaireId}</td>
                    <td>${client.companyName}</td>
                    <td>${client.industry}</td>
                    <td>${client.product}</td>
                    <td>${client.contactName}</td>
                    <td>2018-1-1</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
