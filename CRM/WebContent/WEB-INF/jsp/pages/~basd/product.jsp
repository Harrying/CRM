<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>产品查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/test1.css"
	rel="stylesheet" type="text/css">
<script src="js/changetrcolor.js"
	type="text/javascript"></script>
</head>
<body>
	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
	<tr>
		<TD class="page_title">产品查询</TD>
		<TD class="page_title_middle">&nbsp;</TD>
		<TD width=3><IMG height=32
			src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
	</tr>
	</table>
	<form
		action="basic/findProductByCon?curpage=1"
		method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<th>名称</th>
				<td><input type="text" name="prod_name" /></td>
				<th>型号</th>
				<td><input type="text" name="prod_type" /></td>
				<th>批次</th>
				<td><input type="text" name="prod_batch" /></td>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button" value="帮助"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="common_button" onClick="reload();">查询</button>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
	<tr>
		<TD class="page_title">检索结果</TD>
		<TD class="page_title_middle">&nbsp;</TD>
		<TD width=3><IMG height=32
			src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
	</tr>
	</table>
	<table id="data_list_table" class="data_list_table" cellSpacing=1
		cellPadding=1>
		<tr>
			<th id="firstth">编号</th>
			<th>名称</th>
			<th>型号</th>
			<th>等级/批次</th>
			<th>单位</th>
			<th>单价（元）</th>
			<th>备注</th>
		</tr>
		<c:forEach items="${sessionScope.products }" var="products"> 
			<tr>
				<td class="list_data_number">${products.prod_id }</td>
				<td class="list_data_text">${products.prod_name }</td>
				<td class="list_data_text">${products.prod_type }</td>
				<td class="list_data_text">${products.prod_batch }</td>
				<td class="list_data_text">${products.prod_unit }</td>
				<td class="list_data_text">${products.prod_price }</td>
				<td class="list_data_text">${products.prod_memo }</td>
			</tr>
		</c:forEach>
		
		
		<tr>
			<th colspan="7" class="pager" align="right"
				style="padding-right: 20px;">
				<div class="pager">
					第${sessionScope.pu.curPage}页
					 <a
						href="basic/findProduct?curpage=1">首页</a>
					<c:choose>
					<c:when test="${sessionScope.pu.curPage-1>0}">
						<a
							href="basic/findProduct?curpage=${sessionScope.pu.curPage-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">上一页</font>
					</c:otherwise>
					</c:choose>

					<c:choose>
					<c:when test="${sessionScope.pu.pages-sessionScope.pu.curPage>0}">
						<a
							href="basic/findProduct?curpage=${sessionScope.pu.curPage+1}">下一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">下一页</font>
					</c:otherwise>
					</c:choose>
					<a
						href="basic/findProduct?curpage=${sessionScope.pu.pages}">尾页</a>
				</div>
			</th>
		</tr>
	</table>
</body>
</html>