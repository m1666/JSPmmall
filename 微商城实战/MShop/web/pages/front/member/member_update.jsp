<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://www.mshop.cn/c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String updateUrl = basePath + "/pages/front/member/MemberInfoServletFront/update" ;
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
             <c:if test="${member != null}">
                 <form action="<%=updateUrl%>" method="post" onsubmit="return validateUpdate()" enctype="multipart/form-data">
                     <table border="1" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2" width="100%">
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td colspan="4">用户个人信息</td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><strong>用户ＩＤ</strong></td>
                             <td colspan="2">${member.mid}</td>
                             <td rowspan="5"><div id="preview"><img src="upload/member/${member.photo}" style="width: 100px;height: 100px;"></div></td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><strong>姓&nbsp;&nbsp;名</strong></td>
                             <td><input type="text" name="name" id="name" value="${member.name}" onblur="validateName()"></td>
                             <td><span id="nameMsg"></span></td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><strong>电&nbsp;&nbsp;话</strong></td>
                             <td><input type="text" name="phone" id="phone" value="${member.phone}" onblur="validatePhone()"></td>
                             <td><span id="phoneMsg"></span></td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><strong>地&nbsp;&nbsp;址</strong></td>
                             <td><input type="text" name="address" id="address" value="${member.address}" onblur="validateAddress()"></td>
                             <td><span id="addressMsg"></span></td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td><strong>个人头像</strong></td>
                             <td><input type="file" name="photo" id="photo" onchange="preview(this)"></td>
                             <td><span id="photoMsg"></span></td>
                         </tr>
                         <tr onmouseover="changeColor(this,'#FFFFFF')"onmouseout="changeColor(this,'#F2F2F2')">
                             <td colspan="4">
                                 <input type="hidden" name="oldpic" id="oldpic" value="${member.photo}">
                                 <input type="submit" value="更新">
                                 <input type="reset" value="重置">
                             </td>
                         </tr>
                     </table>
                 </form>
             </c:if>
        </div>
    <jsp:include page="/pages/footer.jsp"/>
</body>
</html>
