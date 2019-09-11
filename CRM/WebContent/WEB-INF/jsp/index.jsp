<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/jquery-1.4.1.js"></script>
<script type="text/javascript">
	function userlogin() {
		$("#loginform").submit();
	}

    var msg="${msg}";
    if(msg){
 	   alert(msg)
    } 
</script>
 
<c:remove var="msg" scope="session"/>
 

<style>
th {
	font-size: 12px;
	text-align: right;
	font-weight: normal;
}

td {
	font-size: 12px;
	text-align: left;
}

input {
	width: 100px;
	font-size: 12px;
	border: solid 1px lightblue;
}
</style>
</head>

<body>
	<center>
		<div style="width: 1000; height: 100%; position: relative;">
			<img
				style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-Index: -1; border: 1px solid blue"
				src="${pageContext.request.contextPath}/images/login/background1.png" />
			<TABLE WIDTH=100% height="100%">
				<tr>
					<td COLSPAN=2 ROWSPAN=2>
						<form action="login" method="post" id="loginform">
							<table width="100%" height="100%">
								<tr>
									<td width="376" height="250"></td>
									<td width="305"></td>
									<td width="272"></td>
								</tr>
								<tr>
									<td></td>
									<td><table width="79%">
											<tr>
												<th>用户名</th>
												<td><input size="10" name="username" maxlength="20" src="${pageContext.request.contextPath}/images/login/name.png"/></td>
											</tr>
											<tr>
												<th>密码</th>
												<td><input type="password" name="password" size="10"
													maxlength="20"  src="${pageContext.request.contextPath}/images/login/password.png"/></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td><img  onclick="userlogin()" 
													src="${pageContext.request.contextPath}/images/login/login.png"
													width="100" height="25"></td>
											</tr>
											<tr>
												<td height="36">&nbsp;</td>
												<td><font color="red" size="2"></font></td>
											</tr>
										</table></td>
									<td></td>
								</tr>
								<tr>
									<td height="158"></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</form>
					</td>
					<td COLSPAN=3 rowspan="2">&nbsp;</td>
					<td></td>
				</tr>
			</TABLE>
		</div>
	</center>
</body>
</html>
