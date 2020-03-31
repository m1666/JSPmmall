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
  <title>微商城 综合实战</title>
  <link type="text/css" rel="stylesheet" href="css/hello.css"/>
  <script type="text/javascript" src="js/hello.js"></script>
</head>
<body>
  <jsp:include page="/pages/header.jsp"/>
    <div id="mainDiv">
      <h1>Welcome From MShop By MM !</h1>
    </div>
  <jsp:include page="/pages/footer.jsp"/>
</body>
</html>
