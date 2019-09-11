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

<title>编辑</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/script/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery-1.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/edit.js"></script>
</head>

<body>
	<div class="page_title">客户信息管理 &gt; 客户信息</div>
	<!--将表单提交给controller进行顾客信息修改保存 存入数据库  -->
	<form action="cust/custchange" method="post" >
		<div class="button_bar">
			<a href="help.jsp"> <input class="common_button" type="button"
				value="帮助"></a>
			<input class="common_button" type="submit" value="保存/返回"  />
		</div>
		<input type="hidden" name="cust_id" value="${customer.cust_id }" />

		<table class="query_form_table">
			<tr>
				<th>客户编号</th>
				<td>${customer.cust_no }<input type="hidden" name="cust_no"
					value="${customer.cust_no }" /></td>
				<th>名称</th>
				<td><input name="cust_name" value="${customer.cust_name }"
					id="cust_name" /><span class="red_star" id="cust_namespan">*</span></td>
			</tr>
			<tr>
				<th>地区</th>
				<td><select name="cust_region">
						<c:choose>
						<c:when test="${customer.cust_region=='北京'}">
						<option value="北京" selected="selected">北京</option>
						<option value="华北" >华北</option>
						<option value="中南" >中南</option>
						<option value="东北" >东北</option>
						<option value="西部" >西部</option>
						</c:when>
						<c:when test="${customer.cust_region=='华北'}">
						<option value="北京" >北京</option>
						<option value="华北" selected="selected">华北</option>
						<option value="中南" >中南</option>
						<option value="东北" >东北</option>
						<option value="西部" >西部</option>
						</c:when>
						<c:when test="${customer.cust_region=='中南'}">
						<option value="北京" >北京</option>
						<option value="华北" >华北</option>
						<option value="中南" selected="selected">中南</option>
						<option value="东北" >东北</option>
						<option value="西部" >西部</option>
						</c:when>
						<c:when test="${customer.cust_region=='东北'}">
						<option value="北京" >北京</option>
						<option value="华北" >华北</option>
						<option value="中南" >中南</option>
						<option value="东北" selected="selected">东北</option>
						<option value="西部" >西部</option>
						</c:when>
						<c:when test="${customer.cust_region=='西部'}">
						<option value="北京" >北京</option>
						<option value="华北" >华北</option>
						<option value="中南" >中南</option>
						<option value="东北" >东北</option>
						<option value="西部" selected="selected">西部</option>
					    </c:when>
					    <c:otherwise>
					     <option value="0" selected="selected">请选择...</option>
					     <option value="北京" >北京</option>
						 <option value="华北" >华北</option>
						 <option value="中南" >中南</option>
						 <option value="东北" >东北</option>
						 <option value="西部" >西部</option>
					    </c:otherwise>
					    </c:choose>
				</select> <span class="red_star">*</span></td>
				<th>客户经理</th>
				<td><select name="cust_manager_name">
						<option selected="selected"
							value="${customer.cust_manager_id},${customer.cust_manager_name}">${customer.cust_manager_name }</option>
				</select> <span class="red_star">*</span></td>
			</tr>
			<tr>
				<th>客户等级</th>
				<td><select name="cust_level_label">
				       <c:choose>
						<c:when test="${customer.cust_level_label=='普通客户'}">
						<option value="普通客户" selected="selected">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴" >合作伙伴</option>
						<option value="战略合作伙伴" >战略合作伙伴</option>
						</c:when>
						<c:when test="${customer.cust_level_label=='重点开发客户'}">
						<option value="普通客户">普通客户</option>
						<option value="重点开发客户" selected="selected">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴" >合作伙伴</option>
						<option value="战略合作伙伴" >战略合作伙伴</option>
						</c:when>
						<c:when test="${customer.cust_level_label=='大客户'}">
						<option value="普通客户">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户" selected="selected">大客户</option>
						<option value="合作伙伴" >合作伙伴</option>
						<option value="战略合作伙伴" >战略合作伙伴</option>
						</c:when>
						<c:when test="${customer.cust_level_label=='合作伙伴'}">
						<option value="普通客户">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴" selected="selected">合作伙伴</option>
						<option value="战略合作伙伴" >战略合作伙伴</option>
						</c:when>
						<c:when test="${customer.cust_level_label=='战略合作伙伴'}">
						<option value="普通客户">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴">合作伙伴</option>
						<option value="战略合作伙伴" selected="selected">战略合作伙伴</option>
					    </c:when>
					    <c:otherwise>
					    <option value="请选择" selected="selected">请选择...</option>
					    <option value="普通客户">普通客户</option>
						<option value="重点开发客户">重点开发客户</option>
						<option value="大客户">大客户</option>
						<option value="合作伙伴">合作伙伴</option>
						<option value="战略合作伙伴">战略合作伙伴</option>
					    </c:otherwise>
					    </c:choose>
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
				<td><input name="cust_addr" id="cust_addr"
					value="${customer.cust_addr }" /><span id="cust_addrspan">*</span></td>
				<th>邮政编码</th>
				<td><input name="cust_zip" size="20" id="cust_zip"
					value="${customer.cust_zip }" /><span class="red_star"
					id="cust_zipspan">*</span></td>
			</tr>
			<tr>
				<th>电话</th>
				<td><input name="cust_tel" size="20" id="cust_tel"
					value="${customer.cust_tel }" /><span class="red_star"
					id="cust_telspan">*</span></td>
				<th>传真</th>
				<td><input name="cust_fax" size="20" id="cust_fax"
					value="${customer.cust_fax }" /><span class="red_star"
					id="cust_faxspan">*</span></td>
			</tr>
			<tr>
				<th>网址</th>
				<td><input name="cust_website" size="20" id="cust_website"
					value="${customer.cust_website }" /><span class="red_star"
					id="cust_websitespan">*</span></td>
				<th></th>
				<td></td>
			</tr>
		</table>
		<br />
		<table class="query_form_table" id="table2">
			<tr>
				<th>营业执照注册号</th>
				<td><input name="cust_licence_no" size="20"
					value="${customer.cust_licence_no }" /></td>
				<th>法人</th>
				<td><input name="cust_chieftain" size="20" id="cust_chieftain"
					value="${customer.cust_chieftain }" /><span class="red_star"
					id="cust_chieftainspan">*</span></td>
			</tr>
			<tr>
				<th>注册资金（万元）</th>
				<td><input name="cust_bankroll" size="20"
					value="${customer.cust_bankroll }" /></td>
				<th>年营业额</th>
				<td><input name="cust_turnover" size="20"
					value="${customer.cust_turnover }" /></td>
			</tr>
			<tr>
				<th>开户银行</th>
				<td><input name="cust_bank" size="20" id="cust_bank"
					value="${customer.cust_bank }" /><span class="red_star"
					id="cust_bankspan">*</span></td>
				<th>银行帐号</th>
				<td><input name="cust_bank_account" size="20"
					id="cust_bank_account" value="${customer.cust_bank_account }" /><span
					class="red_star" id="cust_bank_accountspan">*</span></td>
			</tr>
			<tr>
				<th>地税登记号</th>
				<td><input name="cust_local_tax_no" size="20"
					value="${customer.cust_local_tax_no }" /></td>
				<th>国税登记号</th>
				<td><input name="cust_national_tax_no" size="20"
					value="${customer.cust_national_tax_no }" /></td>
			</tr>
			<tr>
				<th>客户状态</th>
				<td><select name="cust_status">
						<option value="0">流失</option>
						<option selected="selected" value="${customer.cust_status }">正常</option>
				</select>
			</tr>
		</table>
	</form>

</body>
</html>
