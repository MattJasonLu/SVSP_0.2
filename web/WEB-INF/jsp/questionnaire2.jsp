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
    <title>危险废物数据调查表2</title>
    <style>
        #p1{
            font-size: 18px;
        }
        #p3{
            color: #CC0000;
        }
        #p4{
            color: #CC0000;
        }
        #p5{
            color: #CC0000;
        }
        .text-center td{
            text-align:center;
        }
        th{
            text-align:center;
        }
    </style>
    <script>
        function jump1(){
            window.location.href="showQuestionnaire";
        }
        function jump2(){
            window.location.href="thirdQuestionnaire";
        }
        function jump3(){
            window.location.href="listQuestionnaire"
        }
        // 界面加载时更新特别关注物质的选中与否
        function checkedWasteInclusion() {
            <c:forEach var="i" begin="${0}" end="${15}">
                var item = document.getElementsByName("wasteInclusionTypeList[" + ${i} + "]")[0];
                if (${questionnaire.wasteInclusionTypeList[i]!=null}) {
                    item.setAttribute("checked", "checked");
                } else {
                    if (item.hasAttribute("checked"))
                        item.removeAttribute("checked");
                }
            </c:forEach>
        }
    </script>
</head>
<body onload="checkedWasteInclusion()">
    <div>
        <p id="p1"><b>危险废物数据调查表</b></p>
        <p>查询单号:<%=request.getParameter("queryId")%></p>
    </div>
    <form action="thirdQuestionnaire" method="post">
    <div style="width: 100%" class="text-center">
        <p id="p3">危废中使用的主要原料、辅料和有可能带入的化学物质</p><br>
        <table border="1px" width="80%">
            <tr>
                <th>序号</th>
                <th>含化学物质主要原料</th>
                <th>含化学物质辅料</th>
                <th>可能带入的化学物质</th>
            </tr>
            <tr>
                <td>1</td>
                <td><input type="text" name="mainMaterial" value="${questionnaire.rawWastesList[0].mainMaterial}"></td>
                <td><input type="text" name="auxMaterial" value="${questionnaire.rawWastesList[0].auxMaterial}"></td>
                <td><input type="text" name="draginMaterial" value="${questionnaire.rawWastesList[0].draginMaterial}"></td>
            </tr>
            <tr>
                <td><input type="button" value="+" onclick=""></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
    <div style="width: 100%">
        <table width="80%" style="text-align: left">
            <tr>
                <td colspan="4"><p id="p4">特别关注的物质</p>&nbsp;<p>请确认原料、辅料、废料、工艺是否含有以下物质：</p></td>
            </tr>
            <tr>
                <td><input type="checkbox" name="wasteInclusionTypeList[0]" value="1">过氯化物${questionnaire.wasteInclusionTypeList[0]!=null}</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[1]" value="2">过氧化物${questionnaire.wasteInclusionTypeList[1]!=null}</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[2]" value="3">有机氰</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[3]" value="4">爆炸物</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="wasteInclusionTypeList[4]" value="5">有机氮</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[5]" value="6">放射性物质</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[6]" value="7">酸酐</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[7]" value="8">生化废料</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="wasteInclusionTypeList[8]" value="9">乙醚</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[9]" value="10">催泪物质</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[10]" value="11">硒化物</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[11]" value="12">苯酚</td>
            </tr>
            <tr>
                <td><input type="checkbox" name="wasteInclusionTypeList[12]" value="13">苯</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[13]" value="14">多氯联苯-聚氯三联苯</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[14]" value="15">氧化剂</td>
                <td><input type="checkbox" name="wasteInclusionTypeList[15]" value="16">还原剂</td>
            </tr>
        </table>
    </div>
    <div style="width: 100%" class="text-center">
        <table width="80%" border="1px">
            <p id="p5">产废生产工艺流程描述</p>
            <tr>
                <th>序号</th>
                <th>危废编码</th>
                <th>生产流程描述</th>
                <th>现有量(吨)</th>
                <th>上次处理时间</th>
                <th>年预计量(吨)</th>
                <th>包装现状</th>
            </tr>
            <tr>
                <td>1</td>
                <td><input type="text" name="code" value="${questionnaire.wasteProcessList[0].code}"></td>
                <td><input type="text" name="description" value="${questionnaire.wasteProcessList[0].description}"></td>
                <td><input type="text" name="quantity" value="${questionnaire.wasteProcessList[0].quantity}"></td>
                <td><input type="text" name="lastProcessTime" value="${questionnaire.wasteProcessList[0].lastProcessTime}"></td>
                <td><input type="text" name="yearQuantity" value="${questionnaire.wasteProcessList[0].yearQuantity}"></td>
                <td><input type="text" name="packageSituation" value="${questionnaire.wasteProcessList[0].packageSituation}"></td>
            </tr>
            <tr>
                <td><input type="button" value="+" onclick=""></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="div4">
        <input id="input1" type="button" value="上一个" onclick="jump1()">
        <input id="input2" type="submit" value="下一个">
        <input id="input3" type="button" value="返回" onclick="jump3()">
    </div>
    </form>
</body>
</html>
