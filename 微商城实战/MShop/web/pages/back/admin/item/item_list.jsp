<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String updateUrl = basePath + "pages/back/admin/item/ItemServletBack/update" ;
    String deleteUrl = basePath + "pages/back/admin/item/ItemServletBack/delete?p=p" ;
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
        <c:if test="${allItems != null}">
            <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                    <td colspan="3"><span class="title">商品类型列表</span></td>
                </tr>
                <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                    <td width="10%"><input type="checkbox" onclick="checboxSelect(this,'tiid')"></td>
                    <td width="80%">类型</td>
                    <td width="10%">操作</td>
                </tr>
            <c:forEach items="${allItems}" var="item">
                <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                    <td><input type="checkbox" name="tiid" id="tiid" value="${item.iid}"></td>
                    <td>
                        <input type="text" name="title-${item.iid}" id="title-${item.iid}" value="${item.title}">
                        <span id="title-${item.iid}Msg"></span>
                    </td>
                    <td><input type="button" value="修改" onclick="goUpdate(${item.iid})"></td>
                </tr>
            </c:forEach>
            </table>
                <input type="button" value="删除商品分类信息" onclick="deleteAll('<%=deleteUrl%>','ids','tiid')">
        </c:if>
</div>
<form id="itemForm" method="post" action="<%=updateUrl%>">
    <input type="hidden" name="iid" id="iid">
    <input type="hidden" name="title" id="title">
</form>
<jsp:include page="/pages/back/admin/footer.jsp"/>
</body>
</html>
