<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
			<TD class="page_title">销售机会管理</TD>
			<TD class="page_title_middle">&nbsp;</TD>
			<TD width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
	</table>
	<form
		action="sal/editupdateandsave"
		method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<td width=100% height=30 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"
					colspan="6"><strong>&nbsp;销售机会编辑</strong></td>
			</tr>

			<tr>
				<th>编号</th>
				<td><input readonly name="chc_id"
					value="${onech1.chc_id }" /></td>
				<th>机会来源</th>
				<td><input type="text" name="chc_source"
					value="${onech1.chc_source }" size="20" /></td>
			</tr>
			<tr>
				<th>客户名称</th>
				<td><input type="text" name="chc_cust_name"
					value="${ onech1.chc_cust_name}" /><span
					class="red_star">*</span></td>
				<th>成功机率（%）</th>
				<td><input type="text" name="chc_rate"
					value="${onech1.chc_rate }" /><span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>概要</th>
				<td colspan="3"><input type="text" name="chc_title"
					value="${onech1.chc_title }" size="52" /><span
					class="red_star">*</span></td>
			</tr>
			<tr>
				<th>联系人</th>
				<td><input type="text" name="chc_linkman"
					value="${onech1.chc_linkman }" size="20" /></td>
				<th>联系人电话</th>
				<td><input type="text" name="chc_tel"
					value="${onech1.chc_tel }"  size="20" /></td>
			</tr>
			<tr>
				<th>机会描述</th>
				<td colspan="3"><textarea rows="6" cols="50" type="text"
						name="chc_desc">${onech1.chc_desc }</textarea><span
					class="red_star">*</span></td>
			</tr>
			<tr>
				<th>创建人</th>
				<td colspan="3"><input name="chc_create_by"
					value="${onech1.chc_create_by }" readonly size="20" /><span
					class="red_star">*</span></td>
			</tr>

			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp">
					<input class="common_button" type="button" value="帮助"></a>&nbsp;&nbsp;&nbsp;
					<input type="submit" value="保存/返回">
				</td>
			</tr>
		</table>
	</form>
	<br />
</body>
</html>