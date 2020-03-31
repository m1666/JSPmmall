<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        .box{
            width: 1366px;
            height: 150px;
            background: url(../../../images/bjt1.jpg);
            background-size: 100% 100%;
            font: 30px "幼圆";
            font-weight: bold;
            color: #FFFFFF;
            position: relative;
            margin: 0 auto;
        }
        p{
            display: inline-block;
            position: absolute;
            top: 30px;
        }
        .one{
            width: 1366px;
            height: 50px;
            background: #0266A3;
            margin: 0 auto;
            border-bottom: 2px solid #0a205a;
        }
        ul,li{
            list-style: none;
        }
        ul{
            margin: 0 auto;
        }
        .one a{
            display: inline-block;
            width: 136px;
            height: 50px;
            text-decoration: none;
            color: #fff;
            float: left;
            text-align: center;
            line-height: 50px;
        }
        .one a:hover{
            background: whitesmoke;
            color: #000000;
            border: 1px solid #11777C;
        }
        .two input{
            margin-top: 1px;
            margin-left: 3px;
            float: right;
            right: 5px;
            border: 1px solid #0266A3;
            width: 80px;
            height: 30px;
            background: #0266A3;
            outline: none;
            border-radius: 8px;
            color: #FFFFFF;
        }
        .two input:hover{
            background: white;
            color: #0266A3;
        }
    </style>
</head>
<body>
<div id="headerDiv">
    <div class="box"> <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;微商城实战</p></div>
    <c:if test="${aid != null}">

        <div class="one">
            <ul>
                <li><a href="pages/back/admin/member/MemberServletBack/list">用户列表</a></li>
                <li><a href="pages/back/admin/member/MemberServletBack/listStatus?status=0">锁定用户</a></li>
                <li><a href="pages/back/admin/member/MemberServletBack/listStatus?status=1">激活用户</a></li>
                <li><a href="pages/back/admin/member/MemberServletBack/listStatus?status=2">未激活用户</a></li>
                <li><a href="/pages/back/admin/item/item_insert.jsp">增加商品分类</a></li>
                <li><a href="pages/back/admin/item/ItemServletBack/list">商品分类列表</a></li>
                <li><a href="pages/back/admin/goods/GoodsServletBack/insertPre">商品增加</a></li>
                <li><a href="pages/back/admin/goods/GoodsServletBack/list">商品列表</a></li>
                <li><a href="pages/back/admin/goods/GoodsServletBack/listStatus?status=1">上架商品</a></li>
                <li><a href="pages/back/admin/goods/GoodsServletBack/listStatus?status=0">下架商品</a></li>
            </ul>
        </div>

        <input class="two" type="button"value="商品回收站" onclick="location.href='pages/back/admin/goods/GoodsServletBack/listStatus?status=2'"/>
        <input class="two" type="button"value="安全退出" onclick="location.href='/pages/MemberServletFront/logout'"/><br>
        <input class="two" type="button"value="订单管理" onclick="location.href='pages/back/admin/orders/OrdersServletBack/list'"/><br>
    </c:if>
</div>
</body>
</html>