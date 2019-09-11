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

<title>服务管理-操作</title>
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
	&nbsp;
	<c:choose>
		<c:when test="${sessionScope.user.usr_role_id==4}">

			<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
				<tr>
					<TD class="page_title">客户服务管理</TD>
					<TD class="page_title_middle">&nbsp;</TD>
					<TD width=3><IMG height=32
						src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
					</TD>
				</tr>
			</table>

			<table class="query_form_table" cellSpacing=1 cellPadding=1>
				<tr>
					<td width=100% height=30 align=left
						background="${pageContext.request.contextPath}/images/m_table_top.jpg"
						colspan="6"><strong>&nbsp;服务处理</strong></td>
				</tr>
				<tr>
					<th>编号</th>
					<td><input type="text" name="svr_id" id="cs.svr_id"
						value="${service.svr_id }" /></td>
					<th>服务类型</th>
					<td><input type="text" name="svr_type" id="cs.svr_type"
						value="${service.svr_type }" /></td>
				</tr>
				<tr>
					<th>概要</th>
					<td colspan="3"><input type="text" name="svr_title"
						id="cst.svr_title" value="${service.svr_title }" /></td>
				</tr>
				<tr>
					<th>客户</th>
					<td><input type="text" name="svr_cust_name"
						id="cst.svr_cust_name" value="${service.svr_cust_name }" /></td>
					<th>状态</th>
					<td><input type="text" name="svr_status"
						id="cst.svr_status" value="已分配"></td>
				</tr>
				<tr>
					<th>服务请求</th>
					<td colspan="3"><input type="text" name="svr_request"
						id="cst.svr_request" value="${service.svr_request }" /> <br></td>
				</tr>
				<tr>
					<th>创建人</th>
					<td><input type="text" name="svr_create_by"
						id="cst.svr_create_by" value="${service.svr_create_by }" /></td>
					<th>分配给</th>
					<td><input type="text" name="svr_due_to"
						id="cst.svr_due_to" value="${service.svr_due_to}" /></td>
				</tr>
			</table>
			
			<br />
			
			<form
				action="service/updatedeal?svr_id=${service.svr_id }"
				name="frm" method="post">
				<input type="hidden" name="svr_status" id="svr_status" /> <input
					type="hidden" name="svr_id" value="${service.svr_id }" />
				<table class="query_form_table" id="table1" cellSpacing=1
					cellPadding=1>
					<tr>
						<th>服务处理</th>
						<td colspan="5"><input type="text" name="svr_deal"
							id="cs.svr_deal" value="${service.svr_deal }" size="53" /> <span
							class="red_star">*</span></td>
					</tr>
					<tr>
						<th>处理人</th>
						<td><input name="text" value="${sessionScope.user.usr_name }"
							name="" id="" size="20" /> <span class="red_star">*</span></td>
					</tr>

					<tr>
						<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
							<a href="${pageContext.request.contextPath}/pages/help.jsp"><input
								class="common_button" type="button" value="帮助"></a>
							&nbsp;&nbsp;&nbsp;
							<button class="common_button">保存</button>
						</td>
					</tr>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<p align="center"
				style="color: red; margin-top: 200px; font-size: 20px">
				很抱歉,您没有权利进行服务处理！！</p>
		</c:otherwise>
	</c:choose>
	<br />

</body>
</html>