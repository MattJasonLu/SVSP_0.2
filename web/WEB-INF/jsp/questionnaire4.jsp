<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/26
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>危险废物数据调查表4</title>
    <style>
        .red{
            color: #CC0000;
        }
    </style>

    <script>
        function jump1(){
            window.location.href="thirdQuestionnaire";
        }
        function jump2(){
            window.location.href="addQuestionnaire";
        }
        function jump3(){
            window.location.href="listQuestionnaire"
        }
    </script>
</head>
<body>
    <div><p style="font-size: 18px">危险废物数据调查表</p></div>
    <div>
        <p class="red">危废中使用的主要原料、辅料和有可能带入的化学物质</p>
        <p>查询单号(问卷编号):xxxxxxxx</p>
    </div>
    <form action="addQuestionnaire" method="post">
    <div>
        <table border="1">
            <tr>
                <th>序号</th>
                <th>危废名称</th>
                <th>特性</th>
                <th>危废处理个人防护</th>
                <th colspan="2">应急对应措施</th>
            </tr>
            <tr>
                <td rowspan="6">${deriveWastes.id}</td>
                <td rowspan="6">${deriveWastes.name}</td>
                <td rowspan="6">
                    <input type="checkbox" name="wasteCharacterList" value="1">毒性
                    <input type="checkbox" name="wasteCharacterList" value="2">易燃<br>
                    <input type="checkbox" name="wasteCharacterList" value="3">酸性
                    <input type="checkbox" name="wasteCharacterList" value="4">碱性<br>
                    <input type="checkbox" name="wasteCharacterList" value="5">易爆性
                    <input type="checkbox" name="wasteCharacterList" value="6">氧化性<br>
                    <input type="checkbox" name="wasteCharacterList" value="7">还原性
                    <input type="checkbox" name="wasteCharacterList" value="8">遇水易燃<br>
                    <input type="checkbox" name="wasteCharacterList" value="9">遇水易释放有毒气<br>
                    <input type="checkbox" name="wasteCharacterList" value="10">接触空气可发生自燃<br>
                </td>
                <td rowspan="6">
                    <input type="checkbox" name="wasteProtectList" value="1">防护眼镜
                    <input type="checkbox" name="wasteProtectList" value="2">防护服<br>
                    <input type="checkbox" name="wasteProtectList" value="3">防护面罩呼吸保护<br>
                    <input type="checkbox" name="wasteProtectList" value="4">半面罩
                    <input type="checkbox" name="wasteProtectList" value="5">全面罩<br>
                    <input type="checkbox" name="wasteProtectList" value="6">正压呼吸器
                    <input type="checkbox" name="wasteProtectList" value="7">防护手套
                </td>
                <td>若不慎入眼</td>
                <td><input type="text" name="eyeMeasures"></td>
            </tr>
            <tr>
                <td>若接触到皮肤</td>
                <td><input type="text" name="skinMeasures"></td>
            </tr>
            <tr>
                <td>若吞食</td>
                <td><input type="text" name="swallowMeasures"></td>
            </tr>
            <tr>
                <td>若吸入</td>
                <td><input type="text" name="suctionMeasures"></td>
            </tr>
            <tr>
                <td>灭火方法</td>
                <td><input type="text" name="putOutFireMeasures"></td>
            </tr>
            <tr>
                <td>泄漏处理方法</td>
                <td><input type="text" name="leakMeasures"></td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="+" onclick="">
                </td>
                <td colspan="5"></td>
            </tr>
        </table>
    </div>
    <div class="div4">
        <input id="input1" type="button" value="上一步" onclick="jump1()">
        <input id="input2" type="submit" value="确认">
        <input id="input3" type="button" value="返回" onclick="jump3()">
    </div>
    </form>
</body>
</html>
