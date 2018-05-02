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

        /**
         * 操作按钮点击事件，用于处理启用、禁用
         * @constructor
         */

        function changeStatus() {
            var items = document.getElementsByName("IP");

            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                //判断是否是按钮
                //window.event.srcElement触发当前事件的元素
                //用来判断是否是当前单击的按钮
                if (item == window.event.srcElement) {
                    var row = document.getElementById("myTable").rows[i+1].cells;//取得除表头外的行
                    if(row[5].innerHTML == "T"){//若每行的第五个单元格中为"T"
                        row[5].innerHTML = "F";
                    }else if(row[5].innerHTML == "F"){
                        row[5].innerHTML = "T";
                    }
                    //用来判断客户状态
                    if(item.value == "已启用"){
                        item.value = "已停用";
                    }else {
                        item.value = "已启用";
                    }
                }
            }
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
                <th>客户状态</th>
                <th>联系人</th>
                <th>联系电话</th>
            </tr>
            <c:forEach items="${clientList}" var="client" varStatus="id">
                <tr>
                    <td><input type="checkbox" /></td>
                    <td><input type="button" value="已启用" name="IP" onclick="changeStatus()"></td>
                    <td>${client.clientId}</td>
                    <td>${client.companyName}</td>
                    <td>${client.applicationStatus}</td>
                    <td class="clientStatus">${client.status}</td>
                    <td>${client.contactName}</td>
                    <td>${client.mobile}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
