<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Integer pages = (Integer) request.getAttribute("pages");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>服务分配</title>
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

	<br>

	<form action="service/findByCon?curpage=1" method="post" name="frm">
		<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
			<tr>
				<td class="page_title">客户服务管理</td>
				<td class="page_title_middle">&nbsp;</td>
				<td width=3><IMG height=32
					src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
				</td>
			</tr>
		</table>
		<table class="query_form_table" cellSpacing=1 cellPadding=1>
			<tr>
				<td width=100% height=30 align=left
					background="${pageContext.request.contextPath}/images/m_table_top.jpg"
					colspan="6"><strong>&nbsp;服务分配</strong></td>
			</tr>
			<tr>
				<th height="28">客户</th>
				<td><input type="text" name="svr_cust_name"/></td>
				<th height="28">概要</th>
				<td><input type="text" name="svr_title"/></td>
			</tr>
			<tr>
				<th height="28">服务类型</th>
				<td><select name="svr_type" >
						<option value="" selected='selected'>全部</option>
						<option value="咨询">咨询</option>
						<option value="建议">建议</option>
						<option value="投诉">投诉</option>
				</select></td>
				<th height="22">状态</th>
				<td><input type="text" name="svr_status" value="新创建" /></td>
			</tr>
			<tr>
				<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
					<a href="help.jsp"><input class="common_button" type="button"
						value="帮助"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="common_button" >查询</button>
				</td>
			</tr>
		</table>
	</form>
	<br />

	<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
		<tr>
			<td class="page_title">检索结果</td>
			<td class="page_title_middle">&nbsp;</td>
			<td width=3><IMG height=32
				src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3>
			</td>
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
			<th>分配给</th>
			<th>操作</th>
		</tr>
		<c:if test="${sessionScope.user.usr_role_id==3||sessionScope.user.usr_role_id==2}">
			<c:forEach items="${sessionScope.services}" var="cs">
				<tr>
					<td class="list_data_number">${cs.svr_id}</td>
					<td class="list_data_text">${cs.svr_cust_name }</td>
					<td class="list_data_ltext">${cs.svr_title}</td>
					<td class="list_data_text">${cs.svr_type }</td>
					<td class="list_data_text">${cs.svr_create_by }</td>
					<td class="list_data_text"><c:choose>
							<c:when test="${sessionScope.user.usr_role_id<=3}">
								<form action="service/updateService" method="post" name="frm">
									<input type="hidden" value="${cs.svr_id }" name="svr_id">
									<select name="svr_due_to" id="cs.svr_due_to">
										<option value="">请选择..</option>
										<c:forEach items="${sessionScope.mns }" var="mns">
											<option>${mns.usr_name}</option>
										</c:forEach>
									</select> <input type="hidden" name="svr_status" id="cs.svr_status" />
									<input type="submit" value="分配" name="" onclick="fenpei()">
								</form>
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${cs.svr_id }" name="cs.svr_id">
								<select name="svr_due_to" id="cs.svr_due_to" disabled="disabled">
									<option value="">请选择..</option>
								</select>
							</c:otherwise>
						</c:choose></td>
					<td class="list_data_op"><a
						href="service/deleteOneService?svr_id=${cs.svr_id}"><img
							title="删除"
							src="${pageContext.request.contextPath}/images/bt_del.gif"
							class="op_button" onclick="del()" /> </a></td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="8" align="center">共${sessionScope.pu.rows}条记录 每页 6
				条 第${sessionScope.pu.curPage}页 <a
				href="service/findAllServiceController?curpage=1">首页</a> <c:choose>
					<c:when test="${sessionScope.pu.curPage-1>0}">
						<a
							href="service/findAllServiceController?curpage=${sessionScope.pu.curPage-1}">上一页</a>
					</c:when>
					<c:otherwise>
						<font color="#ABA8AB">上一页</font>
					</c:otherwise>
				</c:choose> <c:choose>
					<c:when test="${sessionScope.pu.pages-sessionScope.pu.curPage>0}">
						<a
							href="service/findAllServiceController?curpage=${sessionScope.pu.curPage+1}">下一页</a>
					</c:when>

					<c:otherwise>
						<font color="#ABA8AB">下一页</font>
					</c:otherwise>

				</c:choose> <a
				href="service/findAllServiceController?curpage=${sessionScope.pu.pages}">尾页</a>
			</td>
		</tr>
	</table>

</body>

</html>