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

<title>服务管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/test1.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/script/common.js"></script>
<script src="${pageContext.request.contextPath}/js/ChenkNull.js"></script>
</head>
<body>
	<form
		action="service/addServiceController"
		name="frm" method="post" onsubmit="return CheckNull()">
		<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
			<tr>
				<td class="page_title">客户服务管理</td>
				<td class="page_title_middle">&nbsp;</td>
				<td width=3><img height=32
					src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
				</td>
			</tr>
		</table>
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<td width=100% height=30 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"
					colspan="4"><strong>&nbsp;服务创建</strong></td>
			</tr>
			<tr>
				<th>服务类型</th>
				<td colspan="3"><select name="svr_type" id="cs.svr_type">
						<option value="" selected="selected">--请选择--</option>
						<option value="咨询">咨询</option>
						<option value="投诉">投诉</option>
						<option value="建议">建议</option>
				</select> <span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>概要</th>
				<td colspan="3"><input type="text" name="svr_title" size="53"
					id="cs.svr_title" /> <span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>客户</th>
				<td><select name="svr_cust_name" id="cs.svr_cust_name">
				      <c:forEach items="${sessionScope.customers }" var="customer">
							<option value="${customer.cust_name }">${customer.cust_name }
							</option>
					 </c:forEach>
				</select> <span class="red_star">*</span></td>
				<th>状态</th>
				<td><input type="text" name="svr_status" value="新创建" size="11"
					id="cs.svr_status" /></td>
			</tr>
			<tr>
				<th>服务请求</th>
				<td colspan="3"><textarea rows="6" cols="50" name="svr_request"
						id="cs.svr_request"></textarea> <span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>创建人</th>
				<td colspan="3"><input type="text" name="svr_create_by"
					id="cs.svr_create_by" value="${sessionScope.user.usr_name }"
					size="20" /> <span class="red_star">*</span></td>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=4 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button"
						value="帮助"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="submit" name="Submit" value="保存" />
				</td>
			</tr>
		</table>
		<br />

	</form>

</body>
</html>