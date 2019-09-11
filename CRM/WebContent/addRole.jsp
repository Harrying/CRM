<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link href="${pageContext.request.contextPath}/css/test1.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/script/common.js" >

</script>

</head>
<script type="text/javascript">
   function check(){
   var aaa = document.getElementById("role_id").value ;
   var bbb = document.getElementById("txt").value;
   if(aaa==""||bbb==""){
	   alert("角色编号和姓名不能为空");
	   return false;
   }
   return true;
   }
  </script>
<body>

<table width="100%" cellSpacing=0 cellPadding=0 border="0px">
<tr>
   <TD class="page_title">系统设置</TD>
   <TD class="page_title_middle">&nbsp;</TD>
   <TD width=3><IMG height=32 src="${pageContext.request.contextPath}/images/m_mpr.gif" width=3></TD>
</tr>
</table>

<form action="role/roleadd" method="post" onsubmit="return check()">
<table class="query_form_table" cellSpacing=1 cellPadding=1>
	<tr>
			<td  width=100% height=30 align=left background = "${pageContext.request.contextPath}/images/m_table_top.jpg" colspan="6"><strong>&nbsp;新建角色</strong></td>
    </tr>
	<tr>
		<th>角色编号</th>
		<td><input  type="text" name="role_id" id="role_id"/><span class="red_star">*</span></td>
		
		<th>角色名称</th>
		<td>
			<input type="text" name="role_name" size="20" id="txt"/><span class="red_star">*</span>
		</td>
	</tr>
	<tr>
		<th>描述</th>
		<td><input type="text" name="role_desc"  /></td>
		<th>角色状态</th>
		<td><input type="text" name="role_flag" value="1"/><span class="red_star">*</span></td>
	</tr>	
	<tr>
		<th>创建人</th>
		<td><input  value="${sessionScope.user.usr_name}" readonly /><span class="red_star">*</span></td>
		<th></th>
		<td></td>
	</tr>
	<tr>
    	<td width=100% height=32 align=center colspan=6 bgcolor=#ffffff>
        	<a href="help.jsp"><input class="common_button"  type="button" value="帮助"></a>
        	&nbsp;&nbsp;&nbsp;
			<a href="role_manage.jsp"><input class="common_button"  type="button" value="返回"></a>
&nbsp;&nbsp;
			<input type="submit" value="保存">  
        </td>
    </tr>
</table>
</form>
<br />
</body>
</html>