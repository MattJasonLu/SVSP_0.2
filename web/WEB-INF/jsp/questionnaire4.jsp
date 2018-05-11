<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/26
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        // 改变值
        function changeValue() {
            if (${!empty deriveWastesList} && ${fn:length(deriveWastesList) > 0}) {
                <c:forEach items="${deriveWastesList}" var="deriveWastes" varStatus="id">
                    <c:forEach items="${deriveWastes.wasteCharacterList}" var="wasteCharacter">
                        <c:if test="${wasteCharacter.index-1 >= 0}">
                            // 组份
                            var item1 = document.getElementsByName("deriveWastesList[" + ${id.index} + "].wasteCharacterList[" + ${wasteCharacter.index-1} + "]")[0];
                            item1.checked = true;
                        </c:if>
                    </c:forEach>
                    <c:forEach items="${deriveWastes.wasteProtectList}" var="wasteProtect">
                        <c:if test="${wasteProtect.index-1 >= 0}">
                            // 组份
                            var item2 = document.getElementsByName("deriveWastesList[" + ${id.index} + "].wasteProtectList[" + ${wasteProtect.index-1} + "]")[0];
                            item2.checked = true;
                        </c:if>
                    </c:forEach>
                </c:forEach>

            }
        }
    </script>
</head>
<body onload="changeValue()">
    <div><p style="font-size: 18px">危险废物数据调查表</p></div>
    <div>
        <p class="red">危废中使用的主要原料、辅料和有可能带入的化学物质</p>
        <p>查询单号(问卷编号):${questionnaire.questionnaireId}</p>
    </div>
    <form method="post">
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
                <td rowspan="6">1</td>
                <td rowspan="6">${deriveWastesList[0].name}</td>
                <td rowspan="6">
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[0]" value="1">毒性
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[1]" value="2">易燃<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[2]" value="3">酸性
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[3]" value="4">碱性<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[4]" value="5">易爆性
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[5]" value="6">氧化性<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[6]" value="7">还原性
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[7]" value="8">遇水易燃<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[8]" value="9">遇水易释放有毒气<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteCharacterList[9]" value="10">接触空气可发生自燃<br>
                </td>
                <td rowspan="6">
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[0]" value="1">防护眼镜
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[1]" value="2">防护服<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[2]" value="3">防护面罩呼吸保护<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[3]" value="4">半面罩
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[4]" value="5">全面罩<br>
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[5]" value="6">正压呼吸器
                    <input type="checkbox" name="deriveWastesList[0].wasteProtectList[6]" value="7">防护手套
                </td>
                <td>不慎入眼</td>
                <td><input type="text" name="deriveWastesList[0].eyeMeasures" value="${deriveWastesList[0].eyeMeasures}"></td>
            </tr>
            <tr>
            <td>若接触到皮肤</td>
                <td><input type="text" name="deriveWastesList[0].skinMeasures" value="${deriveWastesList[0].skinMeasures}"></td>
            </tr>
            <tr>
                <td>若吞食</td>
                <td><input type="text" name="deriveWastesList[0].swallowMeasures" value="${deriveWastesList[0].swallowMeasures}"></td>
            </tr>
            <tr>
                <td>若吸入</td>
                <td><input type="text" name="deriveWastesList[0].suctionMeasures" value="${deriveWastesList[0].suctionMeasures}"></td>
            </tr>
            <tr>
                <td>灭火方法</td>
                <td><input type="text" name="deriveWastesList[0].putOutFireMeasures" value="${deriveWastesList[0].putOutFireMeasures}"></td>
            </tr>
            <tr>
                <td>泄漏处理方法</td>
                <td><input type="text" name="deriveWastesList[0].leakMeasures" value="${deriveWastesList[0].leakMeasures}"></td>
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
        <input id="input1" type="submit" value="上一步" formaction="thirdQuestionnaire">
        <input id="input2" type="submit" value="确认" formaction="addQuestionnaire">
        <input id="input3" type="button" value="返回" onclick="jump3()">
    </div>
    </form>
</body>
</html>
