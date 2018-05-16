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
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
        function appointModalBlock() {
            var modal = document.getElementById('appointModal');
            modal.style.display = "block";
        }
        function appointModalNone() {
            var modal = document.getElementById('appointModal');
            modal.style.display = "none";
        }
        function appointModalNoneSubmit() {
            var modal = document.getElementById('appointModal');
            modal.style.display = "none";
            var form = document.getElementById('sampleAppointForm');
            form.submit();
            alert("预约成功");
        }
        var xmlhttp;
        // 显示确认登记单
        function confirmModalBlock() {
            var modal = document.getElementById('confirmModal');
            // 获取勾选的id
            var appointId;
            // 获取项目的状态
            var state;
            var items = document.getElementsByName('appointId');
            for (var i = 0; i < items.length; i++) {
                if (items[i].checked) {
                    appointId = items[i].value;
                    state = items[i].parentElement.nextElementSibling.nextElementSibling
                            .nextElementSibling.nextElementSibling.nextElementSibling.innerHTML;
                    break;
                }
            }
            if (state == "已取样") {
                alert("已确认收样，请勿重复操作！")
            } else if (appointId != undefined) {
                var url = "http://localhost:8080/getSampleAppoint?appointId=" + appointId;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = checkResult;
                xmlhttp.open("GET", url, true);
                xmlhttp.send(null);
                modal.style.display = "block";
            } else {
                alert("请选择预约单!");
            }
        }

        function checkResult() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var result = xmlhttp.responseText;
                var json = eval("(" + result + ")");
                document.getElementById('confirmCheckId').value = json.data.appointId+ "R";
                document.getElementById('confirmCompanyName').value = json.data.companyName;
                document.getElementById('confirmContactName').value = json.data.contactName;
                document.getElementById('confirmTelephone').value = json.data.telephone;
                <fmt:formatDate value="<%=new Date()%>" var="date" pattern="yyyy-MM-dd"/>
            }
        }

        function confirmModalNoneSubmit() {
            var modal = document.getElementById('confirmModal');
            modal.style.display = "none";
            var form = document.getElementById('sampleCheckForm');
            form.submit();
            alert("签收成功");
        }
        function confirmModalNone() {
            var modal = document.getElementById('confirmModal');
            modal.style.display = "none";
        }
    </script>
    <style>
        h4{
            margin-left: 20px;
        }
        p{
            text-align: center;
        }
        .btn{
            width: 100px;
            height: 35px;
            border-radius: 5px;
            font-size: 16px;
            color: white;
            background-color: cornflowerblue;
        }
        .btn:hover, .btn:focus{
            background-color: #95b4ed;
        }
        .modal{
            display: none;
            width: 100%;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1000;
            background-color: rgba(0,0,0,0.5);
        }
        .modal-content{
            display: flex;
            flex-flow: column nowrap;
            justify-content: space-between;
            width: 50%;
            max-width: 900px;
            height: 50%;
            max-height: 600px;
            margin: 100px auto;
            border-radius:10px;
            background-color:#fff;
            -webkit-animation: zoom 0.6s;
            animation: zoom 0.6s;
            resize: both;
            overflow: auto;
        }
        @-webkit-keyframes zoom{
            from {-webkit-transform: scale(0)}
            to {-webkit-transform: scale(1)}
        }
        @keyframes zoom{
            from {transform: scale(0)}
            to {transform: scale(1)}
        }
        .modal-header{
            box-sizing:border-box;
            border-bottom:1px solid #ccc;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .close{
            color: #b7b7b7;
            font-size: 30px;
            font-weight: bold;
            margin-right: 20px;
            transition: all 0.3s;
        }
        .close:hover, .close:focus{
            color: #95b4ed;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-body{
            padding: 10px;
            font-size: 16px;
            box-sizing:border-box;
        }
        .modal-footer{
            box-sizing:border-box;
            border-top:1px solid #ccc;
            display: flex;
            padding: 15px;
            justify-content: flex-end;
            align-items: center;
        }
        .modal-footer button{
            width: 60px;
            height: 35px;
            padding: 5px;
            box-sizing: border-box;
            margin-right: 10px;
            font-size: 16px;
            color: white;
            border-radius: 5px;
            background-color: cornflowerblue;
        }
        .modal-footer button:hover, .modal-footer button:focus{
            background-color: #95b4ed;
            cursor: pointer;
        }
        @media only screen and (max-width: 700px){
            .modal-content {
                width: 80%;
            }
        }
    </style>
</head>
<body>
    <div id="leftButton" class="dd">
        <a href="#" onclick="appointModalBlock()"><input type="button" class="fm" value="+ 预约登记"></a>
        <a href="#" onclick="confirmModalBlock()"><input type="button" class="fm" value="√ 确认收样"></a>
        <input type="button" class="fm" value="⇋ 导出清单">
    </div>
    <div id="rightButton" class="dd">
        <form action="searchSampleAppoint" method="post">
            <input type="text" name="keyword">
            <input type="submit" class="em" name="search" value="🔎 检索">
        </form>
    </div>
    <div>
        <table border="1px">
            <tr>
                <th></th>
                <th>操作</th>
                <th>公司名称</th>
                <th>联系人</th>
                <th>联系方式</th>
                <th>状态</th>
                <th>样品名称</th>
                <th>代码</th>
            </tr>
            <c:forEach items="${sampleAppointList}" var="sampleAppoint" varStatus="id">
                <tr>
                    <td><input type="checkbox" name="appointId" value="${sampleAppoint.appointId}"/></td>
                    <td>
                        <div class="menu">
                        <ul>
                            <li class="" onmouseover="over()" onmouseleave="out()">操作
                                <ul>
                                    <li><a href="#" onclick="">查看</a></li>
                                    <li><a href="#" onclick="confirmModalBlock()">登记收样</a></li>
                                </ul>
                            </li>
                        </ul>
                        </div>
                    </td>
                    <td>${sampleAppoint.companyName}</td>
                    <td>${sampleAppoint.contactName}</td>
                    <td>${sampleAppoint.telephone}</td>
                    <td>${sampleAppoint.state.name}</td>
                    <td>${sampleAppoint.productName}</td>
                    <td>${sampleAppoint.code}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="appointModal" class="modal">
        <div class="modal-content">
            <header class="modal-header">
                <h4>预约取/送样</h4>
                <span class="close" onclick="appointModalNone()">×</span>
            </header>
            <div class="modal-body">
                <form method="post" id="sampleAppointForm" action="addSampleAppoint">
                预约号：<b id="appointId"></b>
                公司名称：<input type="text" name="companyName"><br>
                联系人：<input type="text" name="contactName">
                联系电话：<input type="text" name="telephone"><br>
                预约取样时间：<input type="datetime" name="appointTime"><br>
                备注：<textarea name="comment"></textarea>
                </form>
            </div>
            <footer class="modal-footer">
                <button onclick="appointModalNone()">取消</button>
                <button onclick="appointModalNoneSubmit()">预约</button>
            </footer>
        </div>
    </div>
    <%--样品信息登记窗口--%>
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <header class="modal-header">
                <h4>样品信息登记</h4>
                <span class="close" onclick="confirmModalNone()">×</span>
            </header>
            <div class="modal-body">
                <form method="post" id="sampleCheckForm" action="addSampleCheck">
                取样号：<input type="text" name="checkId" id="confirmCheckId" readonly/><br>
                公司名称：<input type="text" name="companyName" id="confirmCompanyName">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;制单日期：${date}<br>
                联系人：<input type="text" name="contactName" id="confirmContactName">
                联系电话：<input type="text" name="telephone" id="confirmTelephone"><br>
                样品接收人：<input type="text" name="recipient">
                样品名称：<input type="text" name="productName"><br>
                代码：<input type="text" name="code">
                状态：<select name="formType">
                    <option value="0">--请选择--</option>
                    <c:forEach items="${formTypeStrList}" var="formTypeStr" varStatus="id">
                        <option value="${id.index+1}">${formTypeStr}</option>
                    </c:forEach>
                </select><br>
                颜色：<input type="text" name="color">
                拟处置量（吨）：<input type="text" name="quantity"><br>
                拟用包装：<select name="packageType">
                <option value="0">--请选择--</option>
                    <c:forEach items="${packageTypeStrList}" var="packageTypeStr" varStatus="id">
                        <option value="${id.index+1}">${packageTypeStr}</option>
                    </c:forEach>
                </select><br>
                主要成分：<textarea name="comment"></textarea>
                </form>
            </div>
            <footer class="modal-footer">
                <button onclick="confirmModalNone()">取消</button>
                <button onclick="confirmModalNoneSubmit()">签收</button>
            </footer>
        </div>
    </div>
</body>
</html>
