<%@ page  pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String columnData = null ;
	String keyWord = null ;
	String column = null ;
	int currentPage = 1 ;
	int lineSize = 5 ;
	int allRecorders = 0 ;
	int pageSize = 0 ;
%>
<%
	columnData = (String) request.getAttribute("columnData");
	keyWord = (String) request.getAttribute("keyWord") ;
	column = (String) request.getAttribute("column") ;
	try {
		currentPage =(Integer) request.getAttribute("currentPage");
	} catch(Exception e){}
	try {
		allRecorders = (Integer) request.getAttribute("allRecorders") ;
	} catch(Exception e){}
	try {
		lineSize = (Integer) request.getAttribute("lineSize");
	} catch(Exception e){}
%>
<% // 对数据进行处理
    if (currentPage <= 0) {
        currentPage = 1;
    }
    if (allRecorders > 0) {
        pageSize = (allRecorders + lineSize - 1) / lineSize;
    } else {
        pageSize = 1;
    }
%>
请输入查询关键字：
<%
	if(columnData != null) {
%>
    <select id="colSel">
    	<%
    		String result [] = columnData.split("\\|");
    		for(int x = 0 ; x < result.length ; x ++) {
    			String temp[] = result[x].split(":");
    	%> 
		<option value="<%=temp[1]%>"<%=column.equals(temp[1]) ? "selected" : "" %>><%=temp[0]%></option>
		<%
			}
		%>
	</select>
<%	
	}
%>
    <input type="text" name="kw" id="kw" value="<%=keyWord%>">
    <input type="button" value="搜索" onclick="goSplit(1)">
    <span>一共搜索到：<%=allRecorders%>条记录，一共有<%=pageSize%>页。</span><br>