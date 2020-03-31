<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String insertUrl = basePath + "pages/back/admin/item/ItemServletBack/insert" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
    <script type="text/javascript" src="js/item.js"></script>
</head>
<body>
<jsp:include page="/pages/back/admin/header.jsp"/>
<div id="mainDiv">
    <form action="<%=insertUrl%>" method="post" onsubmit="return validateInsert()">
        <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="3">增加商品分类</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td width="15%">标题：</td>
                <td width="40%"><input type="text" name="title" id="title" class="init" onblur="validateTitle()"></td>
                <td width="45%"><span id="titleMsg"></span></td>
            </tr>
           
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="3">
                    <input type="submit" value="增加">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="/pages/back/admin/footer.jsp"/>
</body>
</html>
