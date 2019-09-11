<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'role_manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/test1.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/script/common.js"></script>
<script src="${pageContext.request.contextPath}/js/changetrcolor.js" type="text/javascript"></script>
  </head>
  
  <body>
    <table width="100%" cellSpacing=0 cellPadding=0 border="0px">
   <tr>
   <td class="page_title">系统设置</td>
   <td class="page_title_middle">&nbsp;</td>
   <td width=3><img height=32 src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></td>
	</tr>
</table>
<table class="query_form_table" cellSpacing=1 cellPadding=1>
	<tr>
    	<td  width=100% height=30 align=left background = "${pageContext.request.contextPath}/images/m_table_top.jpg" colspan="6">
    		<strong>&nbsp;角色管理</strong>
    		<c:if test="${sessionScope.user.usr_role_id==1 }">
				<a href="addRole.jsp"><input class="common_button" type="button" value="新增"></a>
			</c:if>
    	</td>
    </tr>
	<tr>
		
</table>
<br />

<table id="data_list_table" class="data_list_table" cellSpacing=1 cellPadding=1>
	<tr>
		<th id="firstth">编号</th>
		<th>角色名</th>
		<th>描述</th>
		<th>状态</th>
		<th>操作</th>
	</tr>
	
	<c:forEach items="${sessionScope.roles}" var="roles">	
	<tr>
		<td class="list_data_number">${roles.role_id}</td>
		<td class="list_data_ltext" >${roles.role_name}</td>
		<td class="list_data_ltext" >${roles.role_desc}</td>
		<td class="list_data_text">
		<c:choose>
		<c:when test="${roles.role_flag==1}">
			有效
		</c:when>
		<c:otherwise>
			无效
		</c:otherwise>
		</c:choose>
		</td>
		
		<td class="list_data_op">
			<img onClick="to('role/roleedit?role_id=${roles.role_id}');" 
			                  title="编辑" 
			                  src="${pageContext.request.contextPath}/images/bt_edit.gif" 
			                  class="op_button" />
			<img onClick="to('role/roledelete?role_id=${roles.role_id}');"
							  title="删除" 
							  src="${pageContext.request.contextPath}/images/bt_del.gif" 
							  class="op_button" />
		</td>
	</tr>
	</c:forEach>	
</table>
  </body>
  
</html>
