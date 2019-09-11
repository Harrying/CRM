<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>交往记录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/script/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/jquery-1.4.1.js"></script>
</head>

<body>
	<div class="page_title">客户信息管理 &gt; 客户信息 &gt; 交往记录</div>
	<div class="button_bar">
		<a href="help.jsp"><input
			class="common_button" type="button" value="帮助"></a>
		<a href="activities_add.jsp"><button class="common_button">新建</button></a>
		<a href="cust/findAllCustomer?curpage=1"><input
			class="common_button" type="button" value="返回"></a>
	</div>

	<br />

	<table class="data_list_table">
		<tr>
			<th>地点</th>
			<th>概要</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${sessionScope.acvs }" var="acvs">
			<tr>
				<td class="list_data_text">${acvs.atv_place }</td>
				<td class="list_data_ltext">${acvs.atv_title}</td>
				<td class="list_data_ltext">${acvs.atv_desc }</td>
				<td class="list_data_op"><img
					onclick="to('cust/findOneActivity?atv_id=${acvs.atv_id}');"
					title="编辑"
					src="${pageContext.request.contextPath}/images/bt_edit.gif"
					class="op_button" /> <img
					onclick="to('cust/deleteOneActivity?atv_id=${acvs.atv_id}&cust_no=${acvs.atv_cust_no }');"
					title="删除"
					src="${pageContext.request.contextPath}/images/bt_del.gif"
					class="op_button" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
