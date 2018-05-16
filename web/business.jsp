<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/4/24
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>商务模块</title>
    <SCRIPT type=text/javascript>
        function menuFix() {
            var sfEls = document.getElementById("fm").getElementsByTagName("li");
            for (var i=0; i<sfEls.length; i++) {
                sfEls[i].onmouseover=function() {
                    this.className+=(this.className.length>0? " ": "") + "sfhover";
                }
                sfEls[i].onMouseDown=function() {
                    this.className+=(this.className.length>0? " ": "") + "sfhover";
                }
                sfEls[i].onMouseUp=function() {
                    this.className+=(this.className.length>0? " ": "") + "sfhover";
                }
                sfEls[i].onmouseout=function() {
                    this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),
                        "");
                }
            }
        }
        window.onload=menuFix;
    </SCRIPT>
    <STYLE type=text/css>
        *{margin:0;padding:0;border:0;}
        #fm { line-height: 40px; list-style-type: none; background:#666; }/*设置盒子的行高，去掉标记，设置背景颜色*/
        #fm a { display: block; width: 100px; text-align:center; }/*设置A标签为块元素不显示，宽度，居中*/
        #fm a:link { color:#666; text-decoration:none; } /* 设置未访问的链接样式*/
        #fm a:visited { color:#666;text-decoration:none; } /* 设置已访问的链接样式 */
        #fm a:hover { color:#FFF;text-decoration:none;font-weight:bold; }  /* 当有鼠标悬停在链接上的颜色 */
        #fm li { float: left; width: 150px; background:#CCC; }/* 盒子背景色 */
        #fm li a:hover{ background:#999; }
        #fm li ul { line-height: 27px; list-style-type: none;text-align:left; left: -999em; width: 80px; position: absolute; }
        #fm li ul li{ float: left; width: 150px; background: #F6F6F6; }
        #fm li ul a{ display: block; width: 150px;text-align:left;padding-left:5px; }
        #fm li ul a:link { color:#666; text-decoration:none; }
        #fm li ul a:visited { color:#666;text-decoration:none; }
        #fm li ul a:hover { color:#F3F3F3;text-decoration:none;font-weight:normal; background:#C00; }
        #fm li:hover ul { left: auto; }
        #fm li.sfhover ul { left: auto; }
        #content { clear: left; }
    </STYLE>
</head>
<body>
<UL id=fm>
    <LI><A href="#">客户管理</A>
        <UL>
            <LI><A href="listClient" target="mainframe2">客户备案</A></LI>
            <LI><A href="listSalesman" target="mainframe2">业务员分配管理</A></LI>
            <LI><A href="listQuestionnaire" target="mainframe2">危险废物数据填报(生产单位)</A></LI>
            <LI><A href="listAllQuestionnaire"  target="mainframe2">危险废物数据评估(处置单位)</A></LI>
            <LI><A href="listSample"  target="mainframe2">客户样品管理</A></LI>
            <LI><A href="#"  target="mainframe2">客户档案</A></LI>
        </UL>
    </LI>
    <LI><A href="#">供应商管理</A>
        <UL>
            <LI><A href="#"  target="mainframe2">供应商新增</A></LI>
            <LI><A href="#"  target="mainframe2">供应商信息修改</A></LI>
            <LI><A href="#"  target="mainframe2">查看目录</A></LI>
        </UL>
    </LI>
    <LI><A href="#">合同管理</A>
        <UL>
            <LI><A href="#"  target="mainframe2">合同列表</A></LI>
            <LI><A href="#"  target="mainframe2">合同管理列表</A></LI>
        </UL>
    </LI>
    <LI><A href="#">一企一档</A>
        <UL>
            <LI><A href="#"  target="mainframe2">一企一档</A></LI>
        </UL>
    </LI>
</UL>
</body>
</html>
