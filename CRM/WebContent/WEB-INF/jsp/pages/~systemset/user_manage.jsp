<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'user_manage.jsp' starting page</title>

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
	<p style="font-size: 11px;">角色等级说明: 1-系统管理员 2-高管 3-销售主管 4-客户经理</p>
	<table class="query_form_table" cellSpacing=1 cellPadding=1
		style="text-align: center;">
		<tr>
			<td width=100% height=30 align=left
				background="${pageContext.request.contextPath}/images/m_table_top.jpg"
				colspan="6"><strong>&nbsp;用户管理</strong> 
				<c:if test="${sessionScope.user.usr_role_id==1 }"> 
					<a href="add.jsp"><input class="common_button" type="button" value="新增"></a>
				</c:if> 
				</td>
		</tr>
		<tr>
			<th id="firstth">编号</th>
			<th>用户名</th>
			<th>角色等级</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
	
		
        <c:forEach items="${sessionScope.users}" var="users">
			<tr>
				<td class="list_data_number">${users.usr_id }</td>
				<td class="list_data_ltext" >${users.usr_name }</td>
				<td class="list_data_ltext" >${users.usr_role_id}</td>
				<td class="list_data_text">
				<c:choose>
						<c:when test="${users.usr_flag==1}">
			                                  正常
		                </c:when>
						<c:otherwise>
			                                   不正常
		                </c:otherwise>
			    </c:choose>
			    </td>
			    
				<td class="list_data_op">
							<img
								onClick="to('user/useredit?usr_id=${users.usr_id}');" 
								title="编辑"
								src="${pageContext.request.contextPath}/images/bt_edit.gif"
								class="op_button" />
							<img
								onClick="to('user/userdelete?usr_id=${users.usr_id}');" 
								title="删除"
								src="${pageContext.request.contextPath}/images/bt_del.gif"
								class="op_button" />
				</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5">共${sessionScope.pu.rows}条记录 每页 5 条 第${sessionScope.pu.curPage}页 <a
				href="user/userall?curpage=1">首页</a>
				<c:choose>
				<c:when test="${sessionScope.pu.curPage-1>0}">
					<a href="user/userall?curpage=${sessionScope.pu.curPage-1}">上一页</a>
				</c:when> 
				<c:otherwise>
					<font color="#ABA8AB">上一页</font>
				</c:otherwise> 
				</c:choose>
				
				<c:choose>
				<c:when test="${sessionScope.pu.pages-sessionScope.pu.curPage>0}">
					<a href="user/userall?curpage=${sessionScope.pu.curPage+1}">下一页</a>
				</c:when> 
				
				<c:otherwise>
					<font color="#ABA8AB">下一页</font>
				</c:otherwise> 
				
				</c:choose>
				<a href="user/userall?curpage=${sessionScope.pu.pages}">尾页</a>
			</td>
		</tr>
		
	</table>
	<br />
</body>
</html>
