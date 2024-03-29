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

<title>新增客户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/script/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/jquery-1.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/edit.js"></script>
</head>

<body>
	<div class="page_title">客户信息管理 &gt; 新增客户</div>
	<form action="cust/addCustomer" method="post"
		onsubmit="return editcheck()">
		<div class="button_bar">
			<a href="help.jsp"><input class="common_button" type="button"
				value="帮助"></a> <input class="common_button" type="submit"
				value="保存/返回" />
		</div>

		<input type="hidden" name="cust_status" value="1" />

		<table class="query_form_table">
			<tr>
				<th>客户编号</th>
				<td><input name="cust_no" value="" /></td>
				<th>名称</th>
				<td><input name="cust_name" value="" id="cust_name" /><span
					class="red_star" id="cust_namespan">*</span></td>
			</tr>
			<tr>
				<th>地区</th>
				<td><select name="cust_region">
						<option value="0">请选择...</option>
						<option selected="selected" value="北京">北京</option>
						<option value="华北">华北</option>
						<option value="中南">中南</option>
						<option value="东北">东北</option>
						<option value="西部">西部</option>
				</select> <span class="red_star">*</span></td>


				<th>客户经理</th>
				<td>
					<input name="cust_manager_name" id="cust_manager_name" value="${sessionScope.user.usr_name }"/>
			        <span class="red_star">*</span>  
				</td>
			</tr>
			<tr>
				<th>客户等级</th>
				<td><select name="cust_level_label">
						<option value="0">请选择...</option>
						<option selected="selected" value="普通客户">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴">合作伙伴</option>
						<option value="战略合作伙伴">战略合作伙伴</option>
				</select><span class="red_star">*</span></td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>客户满意度</th>
				<td><select name="cust_satisfy">
						<option value="0">未指定</option>
						<option value="5">☆☆☆☆☆</option>
						<option value="4">☆☆☆☆</option>
						<option value="3" selected="selected">☆☆☆</option>
						<option value="2">☆☆</option>
						<option value="1">☆</option>
				</select><span class="red_star">*</span></td>
				<th>客户信用度</th>
				<td><select name="cust_credit">
						<option value="0">未指定</option>
						<option value="5">☆☆☆☆☆</option>
						<option value="4">☆☆☆☆</option>
						<option value="3" selected="selected">☆☆☆</option>
						<option value="2">☆☆</option>
						<option value="1">☆</option>
				</select><span class="red_star">*</span></td>
			</tr>
		</table>
		<br />
		<table class="query_form_table" id="table1">
			<tr>
				<th>地址</th>
				<td><input name="cust_addr" id="cust_addr" value="" /><span
					class="red_star" id="cust_addrspan">*</span></td>
				<th>邮政编码</th>
				<td><input name="cust_zip" size="20" id="cust_zip" value="" /><span
					class="red_star" id="cust_zipspan">*</span></td>
			</tr>
			<tr>
				<th>电话</th>
				<td><input name="cust_tel" size="20" id="cust_tel" value="" /><span
					class="red_star" id="cust_telspan">*</span></td>
				<th>传真</th>
				<td><input name="cust_fax" size="20" id="cust_fax" value="" /><span
					class="red_star" id="cust_faxspan">*</span></td>
			</tr>
			<tr>
				<th>网址</th>
				<td><input name="cust_website" size="20" id="cust_website"
					value="" /><span class="red_star" id="cust_websitespan">*</span></td>
				<th></th>
				<td></td>
			</tr>
		</table>
		<br />
		<table class="query_form_table" id="table2">
			<tr>
				<th>营业执照注册号</th>
				<td><input name="cust_licence_no" size="20" value="" /></td>
				<th>法人</th>
				<td><input name="cust_chieftain" size="20" id="cust_chieftain"
					value="" /><span class="red_star" id="cust_chieftainspan">*</span>
				</td>
			</tr>
			<tr>
				<th>注册资金（万元）</th>
				<td><input name="cust_bankroll" size="20" value="" /></td>
				<th>年营业额</th>
				<td><input name="cust_turnover" size="20" value="" /></td>
			</tr>
			<tr>
				<th>开户银行</th>
				<td><input name="cust_bank" size="20" id="cust_bank" value="" /><span
					class="red_star" id="cust_bankspan">*</span></td>
				<th>银行帐号</th>
				<td><input name="cust_bank_account" size="20"
					id="cust_bank_account" value="" /><span class="red_star"
					id="cust_bank_accountspan">*</span></td>
			</tr>
			<tr>
				<th>地税登记号</th>
				<td><input name="cust_local_tax_no" size="20" value="" /></td>
				<th>国税登记号</th>
				<td><input name="cust_national_tax_no" size="20" value="" /></td>

			</tr>

		</table>
	</form>

</body>
</html>
