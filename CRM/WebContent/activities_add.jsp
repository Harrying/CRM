<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加交互记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/script/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery-1.4.1.js"></script>
  </head>
  
  <body>
  <div class="page_title">客户信息管理 &gt; 客户信息 &gt; 交往记录 &gt; 新建交往记录</div>
  
<form action="cust/saveNewActivity?cust_no=${sessionScope.customer.cust_no}" method="post" >
<div class="button_bar">
	<a href="help.jsp">
	<input class="common_button"  type="button" value="帮助"></a>
	<button class="common_button" type="submit">保存/返回</button>  
</div>

<table class="query_form_table">
	<tr>
		<th>地点</th>
		<td>
			<input type="text" name="atv_place" size="20" id="atv_place"/><span class="red_star" id="atv_placespan">*</span></td>
	</tr>
	<tr>
		<th>概要</th>
		<td><input type="text" name="atv_title" id="atv_title"/><span class="red_star" id="atv_titlespan">*</span></td>
		<th>备注</th>
		<td><input type="text" name="atv_desc" /></td>
	</tr>	
</table>  
</form>
  </body>
</html>
