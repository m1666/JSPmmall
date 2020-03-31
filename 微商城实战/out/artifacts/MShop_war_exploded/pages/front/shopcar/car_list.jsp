<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String deleteUrl = basePath + "pages/front/shopcar/ShopcarServletFront/delete?p=p" ;
    String updateUrl = basePath + "pages/front/shopcar/ShopcarServletFront/update" ;
    String ordersUrl = basePath + "pages/front/orders/OrdersServletFront/insert" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    
    <script type="text/javascript" src="js/hello.js"></script>
    <script type="text/javascript" src="js/shopcar.js"></script>
</head>
<body>
    <jsp:include page="/pages/header.jsp"/>
         <div id="mainDiv">
             <h1>购物车</h1>
             <c:if test="${allGoods != null}" var="res">
                 <form action="<%=updateUrl%>">
                 <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td><input type="checkbox" onclick="checboxSelect(this,'gid')"></td>
                         <td>图片</td>
                         <td>名称</td>
                         <td>价格</td>
                         <td>数量</td>
                         <td>总价</td>
                     </tr>
                     <c:forEach items="${allGoods}" var="goods">
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><input type="checkbox" id="gid" name="gid" value="${goods.gid}"></td>
                             <td><img src="upload/goods/${goods.photo}" style="width: 60px; height: 60px"></td>
                             <td>${goods.title}</td>
                             <td><span id="price-${goods.gid}">${goods.price}</span></td>
                             <td>
                                 <input type="button" value="-" onclick="subBut(${goods.gid})">
                                 <input type="text" size="5" value="${allCars[goods.gid]}" name="${goods.gid}" id="${goods.gid}">
                                 <input type="button" value="+" onclick="addBut(${goods.gid})">
                             </td>
                             <td>
                                 <span id="cal-${goods.gid}"></span>
                                 <script type="text/javascript">
                                     calGoods(${goods.gid}) ;
                                 </script>
                             </td>
                         </tr>
                     </c:forEach>
                 </table>
                     <input type="button" value="删除购物车商品" onclick="deleteAll('<%=deleteUrl%>','ids','gid')">
                     <input type="submit" value="确认修改信息">
                     <a href="<%=ordersUrl%>">下单</a>
                     <span id="result"></span>
                 </form>
             </c:if>
        </div>
    <jsp:include page="/pages/footer.jsp"/>
</body>
</html>
