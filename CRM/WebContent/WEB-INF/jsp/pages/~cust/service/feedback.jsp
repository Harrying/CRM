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

<title>服务反馈</title>
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
	<c:choose>
		<c:when test="${sessionScope.user.usr_role_id<=3}">
			<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
				<tr>
					<TD class="page_title">客户服务管理</TD>
					<TD class="page_title_middle">&nbsp;</TD>
					<TD width=3><IMG height=32
						src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
					</TD>
				</tr>
			</table>
			<form
				action="?curpage=1"
				name="frm" method="post">
				<table class="query_form_table" cellSpacing=1 cellPadding=1>
					<tr>
						<td width=100% height=30 align=left
							background="${pageContext.request.contextPath}/images/m_table_top.jpg"
							colspan="6"><strong>&nbsp;服务反馈</strong></td>
					</tr>
					<tr>
						<th height="28">客户</th>
						<td><input type="text" name="svr_cust_name"/></td>
						<th height="28">概要</th>
						<td><input type="text" name="svr_title" /></td>
					</tr>
					<tr>
						<th height="28">服务类型</th>
						<td><select name="svr_type" id="svr_type">
								<option value="">全部</option>
								<option value="咨询">咨询</option>
								<option value="投诉">投诉</option>
								<option value="建议">建议</option>
						</select></td>
						<th height="22">状态</th>
						<td><input type="text" name="svr_status" value="已处理" /></td>
					</tr>
					<tr>
						<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
							<a href="help.jsp"><input class="common_button" type="button"
								value="帮助"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="common_button">查询</button>
						</td>
					</tr>
				</table>
			</form>
			<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
				<tr>
					<TD class="page_title">检索结果</TD>
					<TD class="page_title_middle">&nbsp;</TD>
					<TD width=3><IMG height=32
						src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
					</TD>
				</tr>
			</table>
			<table id="data_list_table" class="data_list_table" cellSpacing=1
				cellPadding=1>
				<tr>
					<th id="firstth">编号</th>
					<th>客户</th>
					<th>概要</th>
					<th>服务类型</th>
					<th>创建人</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${sessionScope.services}" var="cs">
					<tr>
						<td class="list_data_number">${cs.svr_id}</td>
						<td class="list_data_text">${cs.svr_cust_name }</td>
						<td class="list_data_ltext">${cs.svr_title}</td>
						<td class="list_data_text">${cs.svr_type }</td>
						<td class="list_data_text">${cs.svr_create_by }</td>
						<td><a
							href="service/queryOne?svr_id=${cs.svr_id}">
								<img
								src="${pageContext.request.contextPath}/images/bt_feedback.gif"
								class="op_button" />
						</a></td>
					</tr>
				</c:forEach>
	         <tr>
			<td colspan="8" align="center">共${sessionScope.pu.rows}条记录 每页 6
				条 第${sessionScope.pu.curPage}页 <a
				href="service/findFeedback?curpage=1">首页</a> <c:choose>
					<c:when test="${sessionScope.pu.curPage-1>0}">
						<a
							href="service/findFeedback?curpage=${sessionScope.pu.curPage-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">上一页</font>
					</c:otherwise>
				</c:choose> <c:choose>
					<c:when test="${sessionScope.pu.pages-sessionScope.pu.curPage>0}">
						<a
							href="service/findFeedback?curpage=${sessionScope.pu.curPage+1}">下一页</a>
					</c:when>

					<c:otherwise>
						<font color="#ABA8AB">下一页</font>
					</c:otherwise>

				</c:choose> <a
				href="service/findFeedback?curpage=${sessionScope.pu.pages}">尾页</a>
			</td>
		</tr>
			</table>
		</c:when>
		<c:otherwise>
			<p align="center"
				style="color: red; margin-top: 200px; font-size: 20px">
				很抱歉,您没有权利进行服务反馈！！</p>
		</c:otherwise>
	</c:choose>
</body>
</html>