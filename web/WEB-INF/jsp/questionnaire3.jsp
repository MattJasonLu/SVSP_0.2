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
    <title>危险废物数据调查表3</title>
    <style>
        .red{
            color: #CC0000;
        }
    </style>

    <script>
        function jump1(){
            window.location.href="secondQuestionnaire";
        }
        function jump2(){
            window.location.href="forthQuestionnaire";
        }
        function jump3(){
            window.location.href="listQuestionnaire"
        }
        /**
         * 点击后激活右侧输入框
         */
        function enableText() {
            var nameItem = window.event.srcElement;
            if (nameItem.hasAttribute("readonly")) {
                nameItem.attributes.removeNamedItem("readonly");
            }
            nameItem.parentElement.nextElementSibling.firstElementChild.attributes.removeNamedItem("disabled");
            nameItem.parentElement.nextElementSibling.nextElementSibling.firstElementChild.attributes.removeNamedItem("disabled");
            nameItem.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.attributes.removeNamedItem("disabled");
        }
        /**
         * 检查输入框是否有值
         */
        function checkText() {
            var nameItem = window.event.srcElement;
            if (nameItem.value == "") {
                nameItem.parentElement.nextElementSibling.firstElementChild.setAttribute("disabled", "disabled");
                nameItem.parentElement.nextElementSibling.nextElementSibling.firstElementChild.setAttribute("disabled", "disabled");
                nameItem.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.setAttribute("disabled", "disabled");
            }
        }
    </script>
</head>
<body>
    <div><p style="font-size: 18px">危险废物数据调查表</p></div>
    <form action="forthQuestionnaire" method="post">
    <div>
        <p class="red">危废中使用的主要原料、辅料和有可能带入的化学物质</p>
        <p>查询单号(问卷编号):xxxxxxxx</p>
    </div>
    <div>
        <table border="1">
            <tr>
                <th>序号</th>
                <th>危废名称</th>
                <th>废物代码</th>
                <th colspan="2">物理形态</th>
                <th colspan="4">均质与混合多项物</th>
                <th colspan="3">敏感酸性组份</th>
            </tr>
            <tr>
                <td rowspan="12">1</td>
                <td rowspan="12"><input type="text" name="name"></td>
                <td rowspan="12">
                    <input type="search" name="code" value="查询">
                </td>
                <td rowspan="2">物质形态</td>
                <td>
                    <select name="formType">
                        <option value="0">--请选择--</option>
                        <c:forEach items="${formTypeStrList}" var="formTypeStr" varStatus="id">
                            <option value="${id.index+1}">${formTypeStr}</option>
                        </c:forEach>
                    </select>
                </td>
                <td colspan="4">
                    <input type="radio" name="isMixture" value="false" checked>均质
                    <input type="radio" name="isMixture" value="true">混合多项物
                </td>
                <td>组份</td>
                <td>有机</td>
                <td>无机</td>
            </tr>
            <tr>
                <td>说明<input type="text" name="formTypeDetail"></td>
                <td rowspan="2">混合多项物混合成分</td>
                <td colspan="3">预估含量(%)</td>
                <td><input type="checkbox" name="sensitiveElementList[0].ChemicalType" value="1">氯</td>
                <td><input type="radio" name="sensitiveElementList[0].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[0].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td rowspan="2">物质气味</td>
                <td>
                    <select name="smellType">
                        <option value="0">--请选择--</option>
                        <c:forEach items="${smellTypeStrList}" var="smellTypeStr" varStatus="id">
                            <option value="${id.index+1}">${smellTypeStr}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>最低</td>
                <td>平均</td>
                <td>最高</td>
                <td><input type="checkbox" name="sensitiveElementList[1].ChemicalType" value="2">氟</td>
                <td><input type="radio" name="sensitiveElementList[1].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[1].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td>说明<input type="text" name="smellTypeDetail"></td>
                <td><input type="text" name="mixingElementList[0].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[0].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[0].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[0].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="checkbox" name="sensitiveElementList[2].ChemicalType" value="3">溴</td>
                <td><input type="radio" name="sensitiveElementList[2].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[2].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td rowspan="2">可溶性</td>
                <td>
                    <select name="solubility">
                        <option value="0">--请选择--</option>
                        <c:forEach items="${solubilityStrList}" var="solubilityStr" varStatus="id">
                            <option value="${id.index+1}">${solubilityStr}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input type="text" name="mixingElementList[1].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[1].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[1].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[1].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="checkbox" name="sensitiveElementList[3].ChemicalType" value="4">碘</td>
                <td><input type="radio" name="sensitiveElementList[3].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[3].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td>说明<input type="text" name="solubilityDetail"></td>
                <td><input type="text" name="mixingElementList[2].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[2].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[2].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[2].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="checkbox" name="sensitiveElementList[4].ChemicalType" value="5">硫</td>
                <td><input type="radio" name="sensitiveElementList[4].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[4].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td rowspan="2">储存温度</td>
                <td>
                    <input type="radio" name="isLowTemp" value="false" checked>常温
                </td>
                <td><input type="text" name="mixingElementList[3].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[3].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[3].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[3].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="checkbox" name="sensitiveElementList[5].ChemicalType" value="6">磷</td>
                <td><input type="radio" name="sensitiveElementList[5].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[5].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="isLowTemp" value="true">低温<input type="text" size="3" name="lowTemp" disabled>˚C
                </td>
                <td><input type="text" name="mixingElementList[4].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[4].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[4].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[4].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="checkbox" name="sensitiveElementList[6].ChemicalType" value="7">氮</td>
                <td><input type="radio" name="sensitiveElementList[6].isOrganic" value="true"></td>
                <td><input type="radio" name="sensitiveElementList[6].isOrganic" value="false"></td>
            </tr>
            <tr>
                <td rowspan="4">其他</td>
                <td rowspan="4">
                    如为精馏残渣<br>其可溶温度：<input type="text" size="3" name="solubleTemp" disabled>˚C
                </td>
                <td><input type="text" name="mixingElementList[5].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[5].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[5].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[5].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td class="red" colspan="3" rowspan="4">
                    备注：主要成分避免<br>使用溶废剂、废油等<br>笼统描述，尽可能详<br>尽算出含量
                </td>
            </tr>
            <tr>
                <td><input type="text" name="mixingElementList[6].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[6].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[6].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[6].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
            </tr>
            <tr>
                <td><input type="text" name="mixingElementList[7].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[7].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[7].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[7].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
            </tr>
            <tr>
                <td><input type="text" name="mixingElementList[8].name" readonly onclick="enableText()" onblur="checkText()"></td>
                <td><input type="number" name="mixingElementList[8].minimum" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[8].average" min="0.00" max="100.00" step="0.01" disabled></td>
                <td><input type="number" name="mixingElementList[8].maximum" min="0.00" max="100.00" step="0.01" disabled></td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="+" onclick="">
                </td>
                <td colspan="11"></td>
            </tr>
        </table>
    </div>
    <div class="div4">
        <input id="input1" type="button" value="上一步" onclick="jump1()">
        <input id="input2" type="submit" value="下一步">
        <input id="input3" type="button" value="返回" onclick="jump3()">
    </div>
    </form>
</body>
</html>
