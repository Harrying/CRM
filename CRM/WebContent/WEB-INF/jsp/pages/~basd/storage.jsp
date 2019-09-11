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

<title>库存查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/test1.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/changetrcolor.js"
	type="text/javascript"></script>
</head>
<body>
	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
		<tr>
			<TD class="page_title">库存查询</TD>
			<TD class="page_title_middle">&nbsp;</TD>
			<TD width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
		</tr>
	</table>
	<form
		action="basic/findStorageByCon?curpage=1"
		method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<th>产品</th>
				<td><input type="text" name="stk_name" /></td>
				<th>仓库</th>
				<td><input type="text" name="stk_warehourse" /></td>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input
						class="common_button" type="button" value="帮助"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<th id="firstth">序号</th>
			<th>产品</th>
			<th>仓库</th>
			<th>货位</th>
			<th>件数</th>
			<th>备注</th>
		</tr>
		<c:forEach items="${sessionScope.storages }" var="storages">
			<tr>
				<td class="list_data_number">${storages.stk_id }</td>
				<td class="list_data_text">${storages.stk_name }</td>
				<td class="list_data_text">${storages.stk_warehourse }</td>
				<td class="list_data_text">${storages.stk_ware }</td>
				<td class="list_data_text">${storages.stk_count }</td>
				<td class="list_data_text">${storages.stk_memo }</td>
			</tr>
		</c:forEach>
	
		<tr>
			<th colspan="6" class="pager" align="right"
				style="padding-right: 20px;">
				<div class="pager">
					第${sessionScope.pu1.curPage}页
					 <a
						href="basic/findProduct?curpage=1">首页</a>
					<c:choose>
					<c:when test="${sessionScope.pu1.curPage-1>0}">
						<a
							href="basic/findProduct?curpage=${sessionScope.pu1.curPage-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">上一页</font>
					</c:otherwise>
					</c:choose>

					<c:choose>
					<c:when test="${sessionScope.pu1.pages-sessionScope.pu1.curPage>0}">
						<a
							href="basic/findProduct?curpage=${sessionScope.pu1.curPage+1}">下一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">下一页</font>
					</c:otherwise>
					</c:choose>
					<a
						href="basic/findProduct?curpage=${sessionScope.pu1.pages}">尾页</a>
				</div>
			</th>
		</tr>
	</table>
</body>
</html>