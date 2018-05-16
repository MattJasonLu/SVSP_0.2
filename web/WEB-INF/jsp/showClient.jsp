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
    <title>客户信息修改</title>

</head>
<body>
    <div>
        <form action="updateClient" method="post" enctype="multipart/form-data">
            <h3>基本信息</h3>
            企业名称 <input type="text" name="companyName" value="${client.companyName}">
            客户编码 <input type="text" name="clientId" value="${client.clientId}" readonly><br>
            组织机构代码 <input type="text" name="organizationCode" value="${client.organizationCode}">
            营业执照注册号 <input type="text" name="licenseCode" value="${client.licenseCode}"><br>
            法人代表 <input type="text" name="representative" value="${client.representative}">
            工商注册地邮编 <input type="text" name="postCode" value="${client.postCode}"><br>
            所属行业 <input type="text" name="industry" value="${client.industry}">
            主要产品 <input type="text" name="product" value="${client.product}"><br>
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
            工商注册地址 <input type="text" name="location" value="${client.location}"><br>
            所属街道 <input type="text" name="street" value="${client.street}">
            申报状态 <select name="applicationStatus" id="applicationStatus">
            <option value="0">--请选择--</option>
            <c:forEach items="${applicationStatusStrList}" var="applicationStatusStr" varStatus="id">
                <option value="${id.index+1}">${applicationStatusStr}</option>
            </c:forEach>
            </select>

            <h3>环评信息</h3>
            原辅材料 <input type="file" name="materialAttachment" value="${client.materialAttachment}">
            工艺流程图 <input type="file" name="processAttachment" value="${client.processAttachment}"><br>
            工艺描述 <textarea name="processDesp">${client.processDesp}</textarea>

            <h3>联系信息</h3>
            联系人 <input type="text" name="contactName" value="${client.contactName}">
            联系电话 <input type="text" name="phone" value="${client.phone}"><br>
            手机号 <input type="text" name="mobile" value="${client.mobile}">
            邮箱 <input type="text" name="email" value="${client.email}"><br>
            <input type="button" value="保存">
            <input type="submit" value="修改">
            <a href="listClient"><input type="button" value="返回"></a>
        </form>
    </div>
</body>
<script>
    document.getElementById('enterpriseType').selectedIndex = ${client.enterpriseType.index};
    document.getElementById('operationMode').selectedIndex = ${client.operationMode.index};
    document.getElementById('operationType').selectedIndex = ${client.operationType.index};
    document.getElementById('contingencyPlan').selectedIndex = ${client.contingencyPlan.index};
    document.getElementById('operationRecord').selectedIndex = ${client.operationRecord.index};
    document.getElementById('applicationStatus').selectedIndex = ${client.applicationStatus.index};
</script>
</html>
