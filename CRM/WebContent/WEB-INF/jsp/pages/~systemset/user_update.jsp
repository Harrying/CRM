<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'role_update.jsp' starting page</title>

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
			<td class="page_title">系统设置</td>
			<td class="page_title_middle">&nbsp;</td>
			<td width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></td>
		</tr>
	</table>
	<form action="user/userupdate" method="post">
		<input type="hidden" name="curpage" value="${sessionScope.pu.curPage}">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<td width=100% height=30 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"
					colspan="6"><strong>&nbsp;修改用户</strong></td>
			</tr>
			<tr>
				<th>编号</th>
				<td><input readonly="readonly" name="usr_id" type="text"
					value="${usr.usr_id }" /> 
					<input style="display: none"
					type="text" name="usr_role_id" 
					value="${usr.usr_role_id }">
				</td>
			</tr>
			<tr>
				<th>用户名</th>
				<td><input type="text" name="usr_name"
					value="${usr.usr_name }" /><span class="red_star">*</span></td>

			</tr>
			<tr>
				<th>密码</th>
				<td><input type="text" name="usr_password"
					value="${usr.usr_password }"><span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>状态</th>
				<td colspan="3">
				 <c:choose>
				<c:when test="${sessionScope.usr.usr_flag==1 }"> 
				 <input name="usr_flag" type="radio"
					value="1" checked="checked" />正常<input
					name="usr_flag" type="radio" value="0" />不正常
				</c:when>
				
				<c:otherwise >
				<input name="usr_flag" type="radio"
					value="1" />正常 <input
					name="usr_flag" type="radio" value="0"  checked="checked"/>不正常
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button"
						value="帮助"></a>&nbsp;&nbsp;&nbsp;
					<button class="common_button" onClick="back()">返回</button> &nbsp;&nbsp; 
					<input class="common_button" type="submit" value="保存 " />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>
