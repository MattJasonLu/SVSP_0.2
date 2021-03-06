<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/26
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
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
    <script>
        function over() {
            window.event.srcElement.className = "current";
        }
        function out() {
            window.event.srcElement.className = window.event.srcElement.className.replace("current", "");
        }
        /**
         * 打开文件对话框
         */
        function openFileDialog() {
            var fileItem = document.getElementsByName("attachment")[0];
            fileItem.click();
        }
        /**
         * 文件提交
         */
        function onFileChange() {
            document.getElementById("fileForm").submit();
        }
    </script>
</head>
<body onload="changeStyle()">
    <div id="leftButton" class="dd">
        <a href="showQuestionnaire"><input type="button" class="fm" value="+ 填报"></a>
        <input type="button" class="fm" value="√ 提交">
        <input type="button" class="fm" value="⇋ 批量导入">
        <input type="button" class="fm" value="⇋ 批量导出">
    </div>
    <div id="rightButton" class="dd">
        <form action="getQuestionnaire" method="post">
            <input type="text" name="questionnaireId">
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
                    <td>
                        <div class="menu">
                        <ul>
                            <li class="" onmouseover="over()" onmouseleave="out()">操作
                                <ul>
                                    <li><a href="showQuestionnaire?questionnaireId=${questionnaire.questionnaireId}">修改</a></li>
                                    <li><a href="#" onclick="alert('提交成功')">提交</a></li>
                                    <li>
                                        <form id="fileForm" action="addQuestionnaireFiles" method="post" enctype="multipart/form-data">
                                            <input name="questionnaireId" value="${questionnaire.questionnaireId}" hidden>
                                            <input type="file" name="attachment" value="" hidden onchange="onFileChange()">
                                            <a href="#" onclick="openFileDialog()">上传文件</a>
                                        </form>
                                    </li>
                                    <li><a href="deleteQuestionnaire?questionnaireId=${questionnaire.questionnaireId}">删除</a></li>
                                </ul>
                            </li>
                        </ul>
                        </div>
                    </td>
                    <td>${questionnaire.questionnaireId}</td>
                    <td>${client.companyName}</td>
                    <td>${client.industry}</td>
                    <td>${client.product}</td>
                    <td>${client.contactName}</td>
                    <td>${questionnaire.getTimeStr()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
