<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑联系人</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath }/script/common.js"></script>
	<script src="${pageContext.request.contextPath }/script/jquery-1.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/linkman_edit.js"></script>
  </head>
  
  <body>
<div class="page_title">客户信息管理 &gt; 客户信息 &gt; 联系人 &gt; 编辑联系人</div>

<form action="cust/updateLinkman" method="post" id="updatelkmform">
<div class="button_bar">
	<a href="help.jsp"><input class="common_button"  type="button" value="帮助"></a>
	<button class="common_button" onclick="return linkman_editcheck()">保存/返回</button>
</div>
<input type="hidden" name="lkm_id" value="${linkman.lkm_id}"/>
<input type="hidden" name="lkm_cust_id" value="${linkman.lkm_cust_id}" />
<input type="hidden" name="lkm_cust_no" value="${linkman.lkm_cust_no}"/>
<input type="hidden" name="lkm_cust_name" value="${linkman.lkm_cust_name}"/>
<table class="query_form_table" id="table1">
	<tr>
		<th>姓名</th>
		<td><input  name="lkm_name" value="${linkman.lkm_name}" size="20" id="lkm_nameinp"/><span class="red_star" id="lkm_nameinpspan">*</span></td>
		<th>性别</th>
		<td>
			<input type="radio" name="lkm_sex" value="男" checked />男
			<input type="radio" name="lkm_sex" value="女" />女
		</td>
	</tr>
	<tr>
		<th>职位</th>
		<td><input name="lkm_postion" value="${linkman.lkm_postion}" size="20" id="lkm_postion"/><span class="red_star" id="lkm_postionspan">*</span></td>
		<th>办公电话</th>
		<td><input name="lkm_tel" value="${linkman.lkm_tel}" size="20" id="lkm_tel"/><span class="red_star" id="lkm_telspan">*</span></td>
	</tr>	
	<tr>
		<th>手机</th>
		<td><input name="lkm_mobile" value="${linkman.lkm_mobile}" size="20" /></td>
		<th>备注</th>
		<td><input name="lkm_memo" value="${linkman.lkm_memo}" size="20" /></td>
	</tr>
</table>
</form>
  </body>
</html>
