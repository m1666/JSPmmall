<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String loginUrl = basePath + "pages/MemberServletFront/login" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
    <script type="text/javascript" src="js/member.js"></script>
</head>
<body>
    <jsp:include page="/pages/header.jsp"/>
         <div id="mainDiv">
             <form action="<%=loginUrl%>" method="post" onsubmit="return validateLogin()">
                 <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td colspan="3">用户登陆</td>
                     </tr>
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td width="15%">用户ID：</td>
                         <td width="40%"><input type="text" name="mid" id="mid" class="init" onblur="validateMid()"></td>
                         <td width="45%"><span id="midMsg"></span></td>
                     </tr>
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td>密&nbsp;&nbsp;码：</td>
                         <td><input type="password" name="password" id="password" class="init" onblur="validatePassword()"></td>
                         <td><span id="passwordMsg"></span></td>
                     </tr>
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td>验证码</td>
                         <td>
                             <input type="text" name="code" id="code" maxlength="4" size="4" class="init" onblur="validateCode()">
                             <img src="pages/image.jsp" style="width: 60px;height: 20px;">
                         </td>
                         <td><span id="codeMsg"></span></td>
                     </tr>
                     <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                         <td >
                             <input type="checkbox" name="reme" id="reme" value="604800">七天内免登录
                         </td>
                         <td colspan="2">
                             <input type="submit" value="登录">
                             <input type="reset" value="重置">
                             <a href="/pages/back/login.jsp">管理员登陆</a>
                         </td>
                     </tr>
                 </table>
             </form>
        </div>
    <jsp:include page="/pages/footer.jsp"/>
</body>
</html>
