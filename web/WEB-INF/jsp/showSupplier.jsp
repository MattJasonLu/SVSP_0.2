<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>供应商信息</title>
</head>
<body>
    <div>
        <form method="post">
            <h3>基本信息</h3>
            企业名称 <input type="text" name="companyName" value="${supplier.companyName}">
            供应商编码 <input type="text" name="supplierId" value="${supplier.supplierId}"><br>
            组织机构代码 <input type="text" name="organizationCode" value="${supplier.organizationCode}">
            营业执照注册号 <input type="text" name="licenseCode" value="${supplier.licenseCode}"><br>
            法人代表 <input type="text" name="representative" value="${supplier.representative}">
            工商注册地邮编 <input type="text" name="postCode" value="${supplier.postCode}"><br>
            企业类型 <select name="enterpriseType" id="enterpriseType">
                <option value="0">--请选择--</option>
                <c:forEach items="${enterpriseTypeStrList}" var="enterpriseTypeStr" varStatus="id">
                    <option value="${id.index+1}">${enterpriseTypeStr}</option>
                </c:forEach>
            </select>
            经营方式 <select name="operationMode" id="operationMode">
                <option value="0">--请选择--</option>
                <c:forEach items="${operationModeStrList}" var="operationModeStr" varStatus="id">
                    <option value="${id.index+1}">${operationModeStr}</option>
                </c:forEach>
            </select><br>
            经营单位类别 <select name="operationType" id="operationType">
                <option value="0">--请选择--</option>
                <c:forEach items="${operationTypeStrList}" var="operationTypeStr" varStatus="id">
                    <option value="${id.index+1}">${operationTypeStr}</option>
                </c:forEach>
            </select>
            事故防范和应急预案 <select name="contingencyPlan" id="contingencyPlan">
                <option value="0">--请选择--</option>
                <c:forEach items="${contingencyPlanStrList}" var="contingencyPlanStr" varStatus="id">
                    <option value="${id.index+1}">${contingencyPlanStr}</option>
                </c:forEach>
            </select><br>
            建立危废经营记录情况 <select name="operationRecord" id="operationRecord">
                <option value="0">--请选择--</option>
                <c:forEach items="${operationRecordStrList}" var="operationRecordStr" varStatus="id">
                    <option value="${id.index+1}">${operationRecordStr}</option>
                </c:forEach>
            </select>
            工商注册地址 <input type="text" name="location" value="${supplier.location}"><br>
            所属街道 <input type="text" name="street" value="${supplier.street}">
            申报状态 <select name="applicationStatus" id="applicationStatus">
            <option value="0">--请选择--</option>
            <c:forEach items="${applicationStatusStrList}" var="applicationStatusStr" varStatus="id">
                <option value="${id.index+1}">${applicationStatusStr}</option>
            </c:forEach>
            </select><br>
            供应商类型 <select name="supplierType" id="supplierType">
            <option value="0">--请选择--</option>
            <c:forEach items="${supplierTypeStrList}" var="supplierTypeStr" varStatus="id">
                <option value="${id.index+1}">${supplierTypeStr}</option>
            </c:forEach>
            </select>

            <h3>联系信息</h3>
            联系人 <input type="text" name="contactName" value="${supplier.contactName}">
            联系电话 <input type="text" name="phone" value="${supplier.phone}"><br>
            手机号 <input type="text" name="mobile" value="${supplier.mobile}">
            邮箱 <input type="text" name="email" value="${supplier.email}"><br>
            <input type="button" value="保存">
            <input id="addSupplierButton" type="submit" value="提交" formaction="addSupplier">
            <input id="updateSupplierButton" type="submit" value="修改" formaction="updateSupplier">
            <a href="listSupplier"><input type="button" value="返回"></a>
        </form>
    </div>
</body>
<script>
    if (${empty supplier}) {
        document.getElementById('updateSupplierButton').style.visibility = "hidden";
    } else {
        document.getElementById('addSupplierButton').style.visibility = "hidden";
        document.getElementById('enterpriseType').selectedIndex = ${supplier.enterpriseType.index};
        document.getElementById('operationMode').selectedIndex = ${supplier.operationMode.index};
        document.getElementById('operationType').selectedIndex = ${supplier.operationType.index};
        document.getElementById('contingencyPlan').selectedIndex = ${supplier.contingencyPlan.index};
        document.getElementById('operationRecord').selectedIndex = ${supplier.operationRecord.index};
        document.getElementById('applicationStatus').selectedIndex = ${supplier.applicationStatus.index};
        document.getElementById('supplierType').selectedIndex = ${supplier.supplierType.index};
    }
</script>
</html>
