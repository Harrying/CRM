<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="${pageContext.request.contextPath}/css/test1.css" rel="stylesheet" type="text/css">
<script src="../script/common.js" >

</script>

</head>
<script type="text/javascript">
   function check(){
   var aaa=document.getElementById("txt").value ;
   if(aaa==""){
   alert("客户名不能为空");
   return false;
     }
     return true;
   } 
</script>
<body>

<%
	HttpSession s = request.getSession();
	
	String msg = (String)s.getAttribute("msg");
%>

<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
<tr>
   <TD class="page_title">销售机会管理</TD>
   <TD class="page_title_middle">&nbsp;</TD>
   <TD width=3><IMG height=32 src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
</tr>
</table>

<form action="sal/chancesave" method="post" onsubmit="return check()">
<table class="query_form_table" cellSpacing=1 cellPadding=1>
	<tr>
			<td width=100% height=30 align=left background = "${pageContext.request.contextPath}/images/m_table_top.jpg" colspan="6"><strong>&nbsp;新建销售机会</strong></td>
    </tr>
	<tr>
		<th>编号</th>
		<td><input type="text" name="chc_id"/></td>
		<th>机会来源</th>
		<td>
			<input type="text" name="chc_source" size="20" /></td>
	</tr>
	<tr>
		<th>客户名称</th>
		<td><input type="text" name="chc_cust_name" id="txt" /><span class="red_star">*</span></td>
		<th>成功机率</th>
		<td><input type="text" name="chc_rate"/><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>概要</th>
		<td><input type="text" name="chc_title" /><span class="red_star">*</span></td>
		<th>联系地址</th>
		<td ><select name="chc_addr">
						<option value="">请选择</option>
						<option value="北京">北京</option>
						<option value="华北">华北</option>
						<option value="中南">中南</option>
						<option value="东北">东北</option>
						<option value="西部">西部</option>
				</select><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>联系人</th>
		<td><input type="text" name="chc_linkman" size="20" /></td>
		<th>联系人电话</th>
		<td><input type="text" name="chc_tel" size="20" /></td>
	</tr>
	<tr>
		<th>机会描述</th>
		<td colspan="3"><textarea rows="6" cols="50" name="chc_desc"></textarea><span class="red_star">*</span></td>
	</tr>
	<tr>
		<th>创建人</th>
		<td><input name="chc_create_by" value="${sessionScope.user.usr_name }" readonly size="20" /><span class="red_star">*</span>
		</td>
		<td></td>
	</tr>
	<tr>
    	<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
        	<a href="help.jsp"><input class="common_button"  type="button" value="帮助"></a>
        	&nbsp;&nbsp;&nbsp;
			<input type="submit" value="保存/返回" >  
        </td>
    </tr>
</table>
</form>
<br />
</body>
</html>