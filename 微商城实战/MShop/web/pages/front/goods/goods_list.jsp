<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String showUrl = basePath + "pages/front/goods/GoodsServletFront/show" ;
    String listUrl = basePath + "pages/front/goods/GoodsServletFront/list" ;
    String addCarUrl = basePath + "pages/front/shopcar/ShopcarServletFront/insert" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
</head>
<body>
    <jsp:include page="/pages/header.jsp"/>
         <div id="mainDiv">
             <h1>商品列表</h1>
             <select onchange="goList('<%=listUrl%>',this.value)">
                 <option value="0">====== 查看全部商品 ======</option>
                 <c:forEach items="${allItems}" var="item">
                     <option value="${item.iid}" ${item.iid == paramValue ? "selected" :""}>${item.title}</option>
                 </c:forEach>
             </select>
             <br>
             <c:if test="${allGoods != null}" var="res">
                 <div>
                     <jsp:include page="/pages/split_page_plugin_search.jsp"/>
                     <br>
                 </div>
                     <c:forEach items="${allGoods}" var="goods">
                         <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                             <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                               <td rowspan="4">
                                   <a href="<%=showUrl%>?gid=${goods.gid}">
                                   <img src="upload/goods/${goods.photo}" style="width: 90px; height: 90px">
                                   </a>
                               </td>
                             </tr>
                             <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                                 <td>
                                     <Strong>商品名称：</Strong>
                                 </td>
                                 <td>
                                     <a href="<%=showUrl%>?gid=${goods.gid}">
                                         ${goods.title}
                                     </a>
                                 </td>
                                 <td><Strong>上架日期：</Strong></td>
                                 <td><Strong>${goods.pubdate}</Strong></td>
                             </tr>
                             <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                                 <td><Strong>商品价格：</Strong></td>
                                 <td>${goods.price}</td>
                                 <td><Strong>浏览次数：</Strong></td>
                                 <td><Strong>${goods.bow}</Strong></td>
                             </tr>
                             <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                                 <td colspan="3">
                                     ${goods.note}
                                 </td>
                                 <td>
                                     <a href="<%=addCarUrl%>?gid=${goods.gid}">加入购物车</a>
                                 </td>
                             </tr>
                         </table>
                         <br>
                     </c:forEach>
                </c:if>
             <div id="splitBarDiv" style="float: right;">
                 <jsp:include page="/pages/split_page_plugin_bars.jsp"/>
             </div>
        </div>
    <jsp:include page="/pages/footer.jsp"/>
    <script type="text/javascript" src="js/hello.js">
        
    </script>
</body>
</html>
