<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>微商城综合实战</title>
    <base href="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <link type="text/css" rel="stylesheet" href="css/errors.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
</head>
<body>
    <div class="box5">
        <table border="0" cellspacing="" cellpadding="">
            <tr height="45%">
                <th>404</th>
            </tr>
            <tr height="15%">
                <td>Oops! 页面走丢了... (๑ó﹏ò๑)...</td>
            </tr>
            <tr height="25%">
                <td style="font-size: 24px; position: relative; padding-bottom: 10%;">
                    Seems like you got lost...
                </td>
            </tr>
            <tr height="15%">
                <td><a href="/index.jsp">返回首页</a></td>
            </tr>
        </table>
    </div>
</body>
</html>
