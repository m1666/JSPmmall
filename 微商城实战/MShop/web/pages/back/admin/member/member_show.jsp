<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String updateUrl = basePath + "pages/back/admin/member/MemberServletBack/updateStatus" ;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>微商城综合实战</title>
    <link type="text/css" rel="stylesheet" href="css/hello.css"/>
    <script type="text/javascript" src="js/hello.js"></script>
</head>
<body>
<jsp:include page="/pages/back/admin/header.jsp"/>
    <div id="mainDiv">
        <c:if test="${member != null}">
            <form action="<%=updateUrl%>" method="post">
                <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td colspan="3">用户完整信息</td>
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td><strong>用户名</strong></td>
                        <td>${member.mid}</td>
                        <td rowspan="6"><img src="upload/member/${member.photo}" style="width:50px; height: 50px;"></td>
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td><strong>姓&nbsp;&nbsp;名</strong></td>
                        <td>${member.name}</td>
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td><strong>电&nbsp;&nbsp;话</strong></td>
                        <td>${member.phone}</td>
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td><strong>地&nbsp;&nbsp;址</strong></td>
                        <td>${member.address}</td> 
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td><strong>注册日期</strong></td>
                        <td>${member.regdate}</td>
                    </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                    <td><strong>用户状态</strong></td>
                    <td>
                        <select name="type" id="type">
                            <option value="lock" ${member.status == 0 ? "selected" : ""}>锁定</option>
                            <option value="active" ${member.status == 1 ? "selected" : ""}>激活</option>
                        </select>
                    </td>
                </tr>
                    <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                        <td colspan="3">
                            <input type="hidden" name="ids" id="ids" value="${member.mid}">
                            <input type="submit" value="修改用户状态">
                        </td>
                    </tr>
                </table>
            </form>
       </c:if>
    </div>
<jsp:include page="/pages/back/admin/footer.jsp"/>
</body>
</html>
