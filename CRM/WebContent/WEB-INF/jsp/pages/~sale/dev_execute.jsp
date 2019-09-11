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
<script src="${pageContext.request.contextPath}/script/common.js"></script>
</head>
<body>

	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
		<tr>
			<TD class="page_title">客户开发计划</TD>
			<TD class="page_title_middle">&nbsp;</TD>
			<TD width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
		</tr>
	</table>


	<form action="" method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<td width=100% height=30 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"
					colspan="6"><strong>&nbsp;执行计划</strong></td>
			</tr>

			<tr>
				<th>编号</th>
				<td><input type="hidden" name="chc_id" value="${sc.chc_id}">${sc.chc_id}</td>
				<th>机会来源</th>
				<td>${sc.chc_source}</td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td><input type="hidden" name="chc_cust_name"
					value="${sc.chc_cust_name}">${sc.chc_cust_name}</td>
				<th>成功机率（%）</th>
				<td>&nbsp;${sc.chc_rate}</td>
			</tr>
			<tr>
				<th>概要</th>
				<td>${sc.chc_title}</td>
				<th>联系地址</th>
				<td>${sc.chc_addr}</td>
			</tr>
			<tr>
				<th>联系人</th>
				<td>${sc.chc_linkman}</td>
				<th>联系人电话</th>
				<td>${sc.chc_tel}</td>
			</tr>
			<tr>
				<th>机会描述</th>
				<td colspan="3">${sc.chc_desc}</td>
			</tr>
			<tr>
				<th>创建人</th>
				<td>${sc.chc_create_by}</td>
				<th>指派给</th>
				<td><input type="hidden" name="chc_due_to"
					value="${sc.chc_due_to}">${sc.chc_due_to}</td>
			</tr>

			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button"
						value="帮助"></a>&nbsp;&nbsp;&nbsp; <a
					href="sal/deleteplan?chc_id=${sc.chc_id}"><input
						class="common_button" size="70" type="button" value="终止开发"></a>&nbsp;&nbsp;&nbsp;
					<a href="sal/updateplan2?chc_id=${sc.chc_id}"><input
						class="common_button" size="70" type="button" value="开发成功"></a>&nbsp;&nbsp;&nbsp;
					<a href="sal/chanceall2?curpage=1"><input class="common_button"
						type="button" value="返回"></a>
				</td>
			</tr>
		</table>
	</form>
	<br />

	<form action="sal/saveplan" method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<th width=100% height=20 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"><strong>&nbsp;制定计划</strong></th>
			</tr>
			<tr>
				<td><input type="hidden" name="pla_chc_id" value="${sc.chc_id}"></td>
			</tr>
			<tr>
				<th align="left">计划内容</th>
			</tr>
			<tr>
						<td><textarea name="pla_todo" id="ttt" rows="6" cols="50"></textarea><span
							class="red_star">*</span></td>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<input type="submit" class="common_button" value="保存"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>