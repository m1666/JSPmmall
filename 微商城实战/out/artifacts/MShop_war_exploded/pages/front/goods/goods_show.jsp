<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String addCarUrl = basePath + "pages/front/shopcar/ShopcarServletFront/insert" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
    <script type="text/javascript" src="js/goods.js"></script>
</head>
<body>
<jsp:include page="/pages/header.jsp"/>
<div id="mainDiv">
    <c:if test="${goods != null}">
        <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td width="40%" rowspan="8"><div id="preview"><img src="/upload/goods/${goods.photo}"></div></td>
                <td width="15%">商品名称：</td>
                <td width="30%">${goods.title}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td width="15%">所属分类：</td>
                <td>${goods.item.title}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td>商品价格：</td>
                <td>${goods.price}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td>上架日期：</td>
                <td>${goods.pubdate}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td>库存数量：</td>
                <td>${goods.amount}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td>浏览次数：</td>
                <td>${goods.bow}</td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="3">
                    ${goods.note}
                </td>
            </tr>
            <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                <td colspan="3">
                        <a href="<%=addCarUrl%>?gid=${goods.gid}">加入购物车</a>
                </td>
            </tr>
        </table>
    </c:if>
</div>
<jsp:include page="/pages/footer.jsp"/>
</body>
</html>
