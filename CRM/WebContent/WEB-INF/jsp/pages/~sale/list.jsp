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

<title>jb-aptech毕业设计项目</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/test1.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/changetrcolor.js" type="text/javascript"></script>
</head>

<body>
	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
		<tr>
			<TD class="page_title">销售机会管理</TD>
			<TD class="page_title_middle">&nbsp;</TD>
			<TD width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
		</tr>
	</table>
	<form
		action="sal/findByCon?curpage=1"
		method="post">
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<th>客户名称</th>
				<td><input type="text" name="chc_cust_name" /></td>
				<th>概要</th>
				<td><input type="text" name="chc_title" /></td>
				<th>联系人</th>
				<td><input type="text" name="chc_linkman" size="20" /></td>
			</tr>

			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button"
						value="帮助"></a>&nbsp;&nbsp;&nbsp; <c:if
						test="${sessionScope.user.usr_role_id<=3}">
						<a href="add_salchance.jsp"><input class="common_button"
							type="button" value="新建"></a>
					</c:if> &nbsp;&nbsp; <input class="common_button" type="submit" value="查询">
				</td>
			</tr>
		</table>
	</form>
	<br />
	<table width="100%" cellSpacing=0 cellPadding=0>
		<tr>
			<TD width="247" class="page_title">检索结果</TD>
			<TD width="718" class="page_title_middle">&nbsp;</TD>
			<TD width=25><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
		</tr>
	</table>
	<table id="data_list_table" class="data_list_table" cellSpacing=1
		cellPadding=1>
		<tr>
			<th id="firstth">编号</th>
			<th>客户名称</th>
			<th>概要</th>
			<th>联系人</th>
			<th>联系人电话</th>
			<th>操作</th>
		</tr>

		<c:forEach items="${sessionScope.chances }" var="chances">
			<tr>
				<td class="list_data_number">${chances.chc_id }</td>
				<td class="list_data_text">${chances.chc_cust_name}</td>
				<td class="list_data_ltext">${chances.chc_desc }</td>
				<td class="list_data_text">${chances.chc_linkman }</td>
				<td class="list_data_text">${chances.chc_tel }</td>
				<td class="list_data_op">
				  <c:choose>
						<c:when test="${sessionScope.user.usr_role_id<=3}">
							<a
								href="sal/chancedispatch?chc_id=${chances.chc_id }">
								<img title="指派"
								src="${pageContext.request.contextPath}/images/bt_linkman.gif"
								class="op_button" />
							</a>
						</c:when>
					</c:choose> 
					
					<c:choose>
						 <c:when test="${sessionScope.user.usr_role_id<=3}"> 
							<a
								href="sal/editchance?chc_id=${chances.chc_id }">
								<img title="编辑"
								src="${pageContext.request.contextPath}/images/bt_edit.gif"
								class="op_button" />
							</a>

							<a
								href="sal/deletechance?chc_id=${chances.chc_id }">
								<img title="删除"
								src="${pageContext.request.contextPath}/images/bt_del.gif"
								class="op_button" />
							</a>
						</c:when>
						
						<c:otherwise>
							<img title="指派"
								src="${pageContext.request.contextPath}/images/bt_linkman.png"
								class="op_button" />
							<img title="编辑"
								src="${pageContext.request.contextPath}/images/bt_edit.png"
								class="op_button" />
							<img title="删除"
								src="${pageContext.request.contextPath}/images/bt_del.png"
								class="op_button" />
						</c:otherwise>
					</c:choose>
			   </td>
			</tr>
		</c:forEach>


		<tr>
			<th colspan="7" class="pager">
				<div class="pager">
					每页 8 条 第${sessionScope.pu.curPage}页 <a
						href="sal/chanceall?curpage=1">首页</a>
					<c:choose>
						<c:when test="${sessionScope.pu.curPage-1>0}">
							<a href="sal/chanceall?curpage=${sessionScope.pu.curPage-1}">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${sessionScope.pu.pages-sessionScope.pu.curPage>0}">
							<a href="sal/chanceall?curpage=${sessionScope.pu.curPage+1}">下一页</a>
						</c:when>

						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>

					</c:choose>
					<a href="sal/chanceall?curpage=${sessionScope.pu.pages}">尾页</a>
				</div>
			</th>
		</tr>
	</table>
</body>
	
</html>