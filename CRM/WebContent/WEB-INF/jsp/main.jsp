<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>客户关系管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<LINK href="css/style_cn.css" type=text/css rel=stylesheet>
</head>
<FRAMESET border=0 frameSpacing=0 rows=98,* frameBorder=NO cols=*>
	<FRAME name=topFrame src="top.jsp " noResize scrolling=no>
	<FRAMESET id=switchkey border=0 frameSpacing=0 frameBorder=NO
		cols=175,8,*>
		<FRAME id=left name=leftFrame src="left.jsp" noResize scrolling=yes>
		<FRAME name=switchFrame src="switch.jsp" noResize scrolling=no>
		<FRAME id=main name=mainFrame
			src="${pageContext.request.contextPath}/images/welcome.jpg">
	</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
</html>
