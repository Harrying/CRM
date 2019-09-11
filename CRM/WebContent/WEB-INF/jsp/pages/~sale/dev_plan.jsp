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

<title>jb-aptech毕业设计项目</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/test1.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/common.js">
	
</script>
</head>
<body>

	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
		<tr>
			<td class="page_title">销售机会管理</td>
			<td class="page_title_middle">&nbsp;</td>
			<td width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></td>
		</tr>
	</table>
	<table class="query_form_table" cellSpacing=1 cellPadding=1>
		<tr>
			<td width=100% height=30 align=left
				background="${pageContext.request.contextPath}/images/m_table_top.jpg"
				colspan="6"><strong>&nbsp;制定计划</strong></td>
		</tr>
		<tr>
			<th>编号</th>
			<td>${onech.chc_id}</td>
			<th>机会来源</th>
			<td>${onech.chc_source }</td>
		</tr>
		<tr>
			<th>客户名称</th>
			<td>${onech.chc_cust_name }</td>
			<th>成功机率（%）</th>
			<td>&nbsp;${onech.chc_rate }</td>
		</tr>
		<tr>
			<th>概要</th>
			<td colspan="3">${onech.chc_title }</td>
		</tr>
		<tr>
			<th>联系人</th>
			<td>${onech.chc_linkman }</td>
			<th>联系人电话</th>
			<td>${onech.chc_tel }</td>
		</tr>
		<tr>
			<th>机会描述</th>
			<td colspan="3">${onech.chc_desc }</td>
		</tr>
		<tr>
			<th>创建人</th>
			<td>${onech.chc_create_by}</td>
			<th>指派给</th>
			<td>${onech.chc_due_to }</td>
		</tr>
		<tr>
			<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
				<a href="help.jsp"><input class="common_button" type="button"
					value="帮助"></a>&nbsp;&nbsp;&nbsp; <c:choose>
					<c:when
						test="${onech.chc_due_to == sessionScope.user.usr_name || onech.chc_create_by == sessionScope.user.usr_name}">
						<a href="sal/todoplan?chc_id=${onech.chc_id}"><button
								class="common_button">执行</button></a> &nbsp;&nbsp;&nbsp; 
						</c:when>
					<c:otherwise>
						<font color="#ABA8AB">执行</font>
					</c:otherwise>
				</c:choose> <a href="sal/chanceall2?curpage=1"><input class="common_button"
					type="button" value="返回"></a>
			</td>
		</tr>
	</table>
	<br />

</body>
</html>