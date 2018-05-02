<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 2018/4/23
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Home</title>
</head>
<frameset cols="14%,86%" border="6px" solid="#ccc"><!--FRAMEspacing=0 border=1-->

    <frame noresize="noresize" src="Fmenu.jsp">

    <frameset rows="16%,84%">
        <frame noresize="noresize" src="Smenu.jsp" name="mainframe">
        <frame noresize="noresize" src="Tmenu.jsp" name="mainframe2">
    </frameset>

</frameset>
<body>
    <div class="align-center">
        <h1>欢迎您，${username}</h1>

    </div>
</body>
</html>
