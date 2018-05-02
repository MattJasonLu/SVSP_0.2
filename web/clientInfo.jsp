<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 下午3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>clientInfo</title>
</head>
<body>
    <div>
        <form action="addClient" method="post" enctype="multipart/form-data">
            <h3>基本信息</h3>
            企业名称 <input type="text" name="companyName">
            客户编码 <input type="text" name="clientId"><br>
            组织机构代码 <input type="text" name="organizationCode">
            营业执照注册号 <input type="text" name="licenseCode"><br>
            法人代表 <input type="text" name="representative">
            工商注册地邮编 <input type="text" name="postCode"><br>
            所属行业 <input type="text" name="industry">
            主要产品 <input type="text" name="product"><br>
            企业类型 <select name="enterpriseType">
                <option value="0">--请选择--</option>
                <option value="1">国有企业</option>
                <option value="2">集体企业</option>
                <option value="3">国有企业改组的股份合作企业</option>
                <option value="4">集体企业改组的股份合作企业</option>
            </select>
            经营方式 <select name="operationMode">
                <option value="0">--请选择--</option>
                <option value="1">综合</option>
                <option value="2">收集</option>
            </select><br>
            经营单位类别 <select name="operationType">
                <option value="0">--请选择--</option>
                <option value="1">利用处置危险废物及医疗废物</option>
                <option value="2">只从事收集活动</option>
                <option value="3">只利用处置危险废物</option>
                <option value="4">只处置医疗废物</option>
            </select>
            事故防范和应急预案 <select name="contingencyPlan">
                <option value="0">--请选择--</option>
                <option value="1">制定并确定了应急协调人</option>
                <option value="2">已制定</option>
                <option value="3">未制定</option>
            </select><br>
            建立危废经营记录情况 <select name="operationRecord">
                <option value="0">--请选择--</option>
                <option value="1">已建立</option>
                <option value="2">未建立</option>
            </select>
            工商注册地址 <input type="text" name="location"><br>
            所属街道 <input type="text" name="street">
            申报状态 <select name="applicationStatus">
                <option value="0">--请选择--</option>
                <option value="1">已申报</option>
                <option value="2">未申报</option>
            </select>

            <h3>环评信息</h3>
            原辅材料 <input type="file" name="materialAttachment">
            工艺流程图 <input type="file" name="processAttachment"><br>
            工艺描述 <textarea name="processDesp"></textarea>

            <h3>联系信息</h3>
            联系人 <input type="text" name="contactName">
            联系电话 <input type="text" name="phone"><br>
            手机号 <input type="text" name="mobile">
            邮箱 <input type="text" name="email"><br>
            <input type="button" value="保存">
            <input type="submit" value="提交">
            <a href="listClient"><input type="button" value="返回"></a>
        </form>
    </div>
</body>
</html>
