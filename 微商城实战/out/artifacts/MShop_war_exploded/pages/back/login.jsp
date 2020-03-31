<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String loginUrl = basePath + "pages/back/AdminLoginServletBack/login" ;
	
%>
<html>
<head>
	<base href="<%=basePath%>">
	<title>微商城综合实战</title>
	<link type="text/css" rel="stylesheet" href="css/hello.css"/>
	<link type="text/css" rel="stylesheet" href="css/adminLogin.css"/>
	<script type="text/javascript" src="js/hello.js"></script>
	<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
    <div class="box">
        <p>管理员用户登录：</p>
        <div class="box1">
            <form action="<%=loginUrl%>" method="post">
                <div class="box2">用户名：
                    <input type="text" name="aid">
                </div>
                <div class="box3">密&nbsp;&nbsp;&nbsp;码：
                    <input type="password" name="password">
                </div>
                <div class="box4">验证码：
                    <input type="text" size="4" maxlength="4" name="code">
                    <img src="/pages/image.jsp" style="width: 60px; height: 25px;">
                </div>
                <div >
                    <input type="submit" value="登陆" class="box5">
                </div>
                <div>
                    <input type="reset" value="重置" class="box6">
                </div>
            </form>
        </div>
    </div>
</body>
