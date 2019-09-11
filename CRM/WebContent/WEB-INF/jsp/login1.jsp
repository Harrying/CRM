<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>Briup CRM系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<script src="script/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function userlogin() {
		$("#hrlogin").submit();
	}

	var msg = "${msg}";
	if (msg) {
		alert(msg)
	}
</script>

<c:remove var="msg" scope="session" />
</head>
<body>
	<div class="container">
		<div class="loginBox row">
			<h2 class="text-center">Briup CRM系统登录</h2>
			<form action="login" id="hrlogin" name="hrlogin" method="post"
				class="form-horizontal" >
				<div class="form-group ">
					<label for="nick_name" class="col-sm-2 col-md-2 control-label">用户名</label>
					<div class="col-sm-10 col-md-10">
						<input type="text" class="form-control" name="username"
							placeholder="用户名" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="user_password" class="col-sm-2 col-md-2 control-label">密码</label>
					<div class="col-sm-10 col-md-10">
						<input type="password" class="form-control" name="password"
							placeholder="密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-10" style="color: #990033;"></div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-10 col-md-10">
						<!-- <input type="hidden" name="url" value="/admin" /> -->
						<button class="btn btn-info" data-loading-text="正在登录..."
							type="submit" onclick="userlogin()">登 录</button>
						<button class="btn btn-info" type="reset">清 空</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
