<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<LINK href="css/style_cn.css" type=text/css rel=stylesheet>
<LINK href="css/leftPage.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript>
	//点击跳转
	function forward(url) {
		parent.frames["mainFrame"].location.href = url;
	}

	//展示
	function show(num, state, msize) {
		if (state == 1) {
			document.getElementById("tr0_" + num).state = "0";
			document.getElementById("tr1_" + num).style.display = "";
		} else {
			document.getElementById("tr0_" + num).state = "1";
			//此元素不会被显示
			document.getElementById("tr1_" + num).style.display = "none";
		}
		hide(num, msize);
	}

	//隐藏
	function hide(num, msize) {
		for (var i = 0; i < msize; i++) {
			if (i != num) {
				var state = document.getElementById("tr0_" + i).state;
				if (state != 1) {
					document.getElementById("tr0_" + i).state = "1";
					document.getElementById("tr1_" + i).style.display = "none";
					var src = document.getElementById("img_" + i).src;
					document.getElementById("img_" + i).src = src.substr(0, src
							.lastIndexOf("/"))
							+ "/zhankai.png";
				}
			}
		}
	}
</SCRIPT>

</head>

<body>
	<TABLE class=bigtable cellSpacing=0 cellPadding=0 width=156 border=0>
		<!-- title -->
		<TBODY>
			<TR>
				<TD class=buttom_lr_line width="100%" background=images/zcdbtbj.png
					height=30>
					<DIV class=divfont align=center>操作菜单</DIV>
				</TD>
			</TR>
			<TR>
				<!--  内容及下环线开始   -->
				<TD width="100%">
					<!--  循环主menu开始   --> 
					<c:choose>
						<c:when test="${sessionScope.user.usr_role_id>1}">
							<TABLE cellSpacing=0 cellPadding=0 width=156 bgColor=#d3dae1
								border=0>
								<TBODY>
									<TR id=tr0_0 onClick="show('0',this.state,'9');" state="1">
										<TD class=buttom_lr_line
											onMouseOver="this.style.cursor='hand';"
											onmouseout="this.style.cursor='auto';"
											background=images/zlmbtbj.png height=22>
											<TABLE cellSpacing=0 cellPadding=0 width="149" align=center
												border=0 height="24" style="">
												<TBODY>
													<TR>
														<TD width=23 height=22>
															<DIV align=center>
																<IMG height=17 src="images/khgl.png" width=17>
															</DIV>
														</TD>
														<TD class=fBlack onClick="">营销管理</TD>
														<TD width=25>
															<DIV align=center>
																<IMG id=img_0 src="images/zhankai.png">
															</DIV>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>

									<TR id=tr1_0 style="DISPLAY: none">
										<TD class=buttom_lr_line style="BACKGROUND-COLOR: #fafcff">
											<c:choose>
												<c:when test="${sessionScope.user.usr_role_id<=3}">
													<TABLE class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<TBODY>
															<TR>
																<TD onMouseOver="this.className='bgstyle1';"
																	onclick="forward('sal/chanceall?curpage=1')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<TABLE cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=23>
																					<DIV align=center>
																						<IMG height=17 src="images/khbf.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=unnamed1>销售机会管理</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> <c:choose>
												<c:when
													test="${sessionScope.user.usr_role_id==4||sessionScope.user.usr_role_id<=2}">
													<table class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<tbody>
															<tr>
																<td onMouseOver="this.className='bgstyle1';"
																	onclick="forward('sal/chanceall2?curpage=1')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<table cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<tbody>
																			<tr>
																				<td width=23 height=23>
																					<div align=center>
																						<img height=17 src="images/khbf.png" width=17>
																					</div>
																				</TD>
																				<TD class=unnamed1>客户开发计划</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</c:when>
					</c:choose> 
					<c:choose>
						<c:when test="${sessionScope.user.usr_role_id>=1}">
							<TABLE cellSpacing=0 cellPadding=0 width=156 bgColor=#d3dae1
								border=0>
								<TBODY>
									<TR id=tr0_1 onClick="show('1',this.state,'9');" state="1">
										<TD class=buttom_lr_line
											onMouseOver="this.style.cursor='hand';"
											onmouseout="this.style.cursor='auto';"
											background=images/zlmbtbj.png height=22>
											<TABLE cellSpacing=0 cellPadding=0 width="152" align=center
												border=0 height="24">
												<TBODY>
													<TR>
														<TD width=23 height=22>
															<DIV align=center>
																<IMG height=17 src="images/khgl.png" width=17>
															</DIV>
														</TD>
														<TD class=fBlack onClick="">客户管理</TD>
														<TD width=25>
															<DIV align=center>
																<IMG id=img_1 src="images/zhankai.png">
															</DIV>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR id=tr1_1 style="DISPLAY: none">
										<TD class=buttom_lr_line style="BACKGROUND-COLOR: #fafcff">

											<TABLE class=buttom_line
												onMouseOver="this.style.cursor='hand';"
												onmouseout="this.style.cursor='auto';" cellSpacing=0
												cellPadding=0 width=152 align=center border=0>
												<TBODY>
													<TR>
														<TD onMouseOver="this.className='bgstyle1';"
															onclick="forward('cust/findAllCustomer?curpage=1')"
															onmouseout="this.className='bgstyle';"
															background=images/zcdbj.png height=23>
															<TABLE cellSpacing=0 cellPadding=0 width="90%"
																align=center border=0>
																<TBODY>
																	<TR>
																		<TD width=23 height=23>
																			<DIV align=center>
																				<IMG height=17 src="images/khbf.png" width=17>
																			</DIV>
																		</TD>
																		<TD class=unnamed1>客户信息管理</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
								</TBODY>
							</TABLE>
						</c:when>
					</c:choose> 
					<c:choose>
						<c:when test="${sessionScope.user.usr_role_id>1}">
							<TABLE cellSpacing=0 cellPadding=0 width=156 bgColor=#d3dae1
								border=0>
								<TBODY>
									<TR id=tr0_2 onClick="show('2',this.state,'9');" state="1">
										<TD class=buttom_lr_line
											onMouseOver="this.style.cursor='hand';"
											onmouseout="this.style.cursor='auto';"
											background=images/zlmbtbj.png height=22>
											<TABLE cellSpacing=0 cellPadding=0 width="97%" align=center
												border=0>
												<TBODY>
													<TR>
														<TD width=23 height=22>
															<DIV align=center>
																<IMG height=17 src="images/xsgl.png" width=17>
															</DIV>
														</TD>
														<TD class=fBlack onClick="">服务管理</TD>
														<TD width=25>
															<DIV align=center>
																<IMG id=img_2 src="images/zhankai.png">
															</DIV>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR id=tr1_2 style="DISPLAY: none">
										<TD class=buttom_lr_line style="BACKGROUND-COLOR: #fafcff">
											<c:choose>
												<c:when
													test="${sessionScope.user.usr_role_id==4||sessionScope.user.usr_role_id==2}">
													<TABLE class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<TBODY>
															<TR>
																<TD onMouseOver="this.className='bgstyle1';"
																	onclick="forward('cust/findAllCustomer2')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<TABLE cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=23>
																					<DIV align=center>
																						<IMG height=17 src="images/wdzx.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=unnamed1>服务创建</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> 
											<c:choose>
												<c:when
													test="${sessionScope.user.usr_role_id==3||sessionScope.user.usr_role_id==2}">
													<TABLE class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<TBODY>
															<TR>
																<TD onMouseOver="this.className='bgstyle1';"
																	onclick="forward('service/findAll?curpage=1')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<TABLE cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=23>
																					<DIV align=center>
																						<IMG height=17 src="images/khjlxrdr.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=unnamed1>服务分配</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> 
											<c:choose>
												<c:when
													test="${sessionScope.user.usr_role_id==4||sessionScope.user.usr_role_id==2}">
													<TABLE class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<TBODY>
															<TR>
																<TD onMouseOver="this.className='bgstyle1';"
																	onclick="forward('service/findAllFp?curpage=1')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<TABLE cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=23>
																					<DIV align=center>
																						<IMG height=17 src="images/khjlxrdr.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=unnamed1>服务处理</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> 
											<c:choose>
												<c:when
													test="${sessionScope.user.usr_role_id==3||sessionScope.user.usr_role_id==2}">
													<TABLE class=buttom_line
														onMouseOver="this.style.cursor='hand';"
														onmouseout="this.style.cursor='auto';" cellSpacing=0
														cellPadding=0 width=152 align=center border=0>
														<TBODY>
															<TR>
																<TD onMouseOver="this.className='bgstyle1';"
																	onclick="forward('service/findFeedback?curpage=1')"
																	onmouseout="this.className='bgstyle';"
																	background=images/zcdbj.png height=23>
																	<TABLE cellSpacing=0 cellPadding=0 width="90%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=23>
																					<DIV align=center>
																						<IMG height=17 src="images/khjlxrdr.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=unnamed1>服务反馈</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> 
											</TD>
											</TR>
											</TBODY>
											</TABLE>
											</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${sessionScope.user.usr_role_id<=3}">
													<TABLE cellSpacing=0 cellPadding=0 width=156
														bgColor=#d3dae1 border=0>
														<TBODY>
															<TR id=tr0_3 onClick="show('3',this.state,'9');"
																state="1">
																<TD class=buttom_lr_line
																	onMouseOver="this.style.cursor='hand';"
																	onmouseout="this.style.cursor='auto';"
																	background=images/zlmbtbj.png height=22>
																	<TABLE cellSpacing=0 cellPadding=0 width="97%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=22>
																					<DIV align=center>
																						<IMG height=17 src="images/xsgl.png" width=17>
																					</DIV>
																				</TD>
																				<TD class=fBlack onClick="">统计报表</TD>
																				<TD width=25>
																					<DIV align=center>
																						<IMG id=img_3 src="images/zhankai.png">
																					</DIV>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
															<TR id=tr1_3 style="DISPLAY: none">
																<TD class=buttom_lr_line
																	style="BACKGROUND-COLOR: #fafcff">
																	<TABLE class=buttom_line
																		onMouseOver="this.style.cursor='hand';"
																		onmouseout="this.style.cursor='auto';" cellSpacing=0
																		cellPadding=0 width=152 align=center border=0>
																		<TBODY>
																			<TR>
																				<TD onMouseOver="this.className='bgstyle1';"
																					onclick="forward('contr.jsp')"
																					onmouseout="this.className='bgstyle';"
																					background=images/zcdbj.png height=23>
																					<TABLE cellSpacing=0 cellPadding=0 width="90%"
																						align=center border=0>
																						<TBODY>
																							<TR>
																								<TD width=23 height=23>
																									<DIV align=center>
																										<IMG height=17 src="images/wdzx.png" width=17>
																									</DIV>
																								</TD>
																								<TD class=unnamed1>客户贡献分析</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																	<TABLE class=buttom_line
																		onMouseOver="this.style.cursor='hand';"
																		onmouseout="this.style.cursor='auto';" cellSpacing=0
																		cellPadding=0 width=152 align=center border=0>
																		<TBODY>
																			<TR>
																				<TD onMouseOver="this.className='bgstyle1';"
																					onclick="forward('cons.jsp')"
																					onmouseout="this.className='bgstyle';"
																					background=images/zcdbj.png height=23>
																					<TABLE cellSpacing=0 cellPadding=0 width="90%"
																						align=center border=0>
																						<TBODY>
																							<TR>
																								<TD width=23 height=23>
																									<DIV align=center>
																										<IMG height=17 src="images/khjlxrdr.png"
																											width=17>
																									</DIV>
																								</TD>
																								<TD class=unnamed1>客户构成分析</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose>

											<TABLE cellSpacing=0 cellPadding=0 width=156 bgColor=#d3dae1
												border=0>
												<TBODY>
													<TR id=tr0_4 onClick="show('4',this.state,'9');" state="1">
														<TD class=buttom_lr_line
															onMouseOver="this.style.cursor='hand';"
															onmouseout="this.style.cursor='auto';"
															background=images/zlmbtbj.png height=22>
															<TABLE cellSpacing=0 cellPadding=0 width="97%"
																align=center border=0>
																<TBODY>
																	<TR>
																		<TD width=23 height=22>
																			<DIV align=center>
																				<IMG height=17 src="images/htgl.png" width=17>
																			</DIV>
																		</TD>


																		<TD class=fBlack onClick="">基础数据</TD>

																		<TD width=25>
																			<DIV align=center>
																				<IMG id=img_4 src="images/zhankai.png">
																			</DIV>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
														</TD>
													</TR>
													<TR id=tr1_4 style="DISPLAY: none">
														<TD class=buttom_lr_line style="BACKGROUND-COLOR: #fafcff">
															<TABLE class=buttom_line
																onMouseOver="this.style.cursor='hand';"
																onmouseout="this.style.cursor='auto';" cellSpacing=0
																cellPadding=0 width=152 align=center border=0>
																<TBODY>
																	<TR>
																		<TD onMouseOver="this.className='bgstyle1';"
																			onclick="forward('basic/findProduct?curpage=1')"
																			onmouseout="this.className='bgstyle';"
																			background=images/zcdbj.png height=23>
																			<TABLE cellSpacing=0 cellPadding=0 width="90%"
																				align=center border=0>
																				<TBODY>
																					<TR>
																						<TD width=23 height=23>
																							<DIV align=center>
																								<IMG height=17 src="images/htlb.png" width=17>
																							</DIV>
																						</TD>
																						<TD class=unnamed1>查询产品信息</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
															<TABLE class=buttom_line
																onMouseOver="this.style.cursor='hand';"
																onmouseout="this.style.cursor='auto';" cellSpacing=0
																cellPadding=0 width=152 align=center border=0>
																<TBODY>
																	<TR>
																		<TD onMouseOver="this.className='bgstyle1';"
																			onclick="forward('basic/findStorage?curpage=1')"
																			onmouseout="this.className='bgstyle';"
																			background=images/zcdbj.png height=23>
																			<TABLE cellSpacing=0 cellPadding=0 width="90%"
																				align=center border=0>
																				<TBODY>
																					<TR>
																						<TD width=23 height=23>
																							<DIV align=center>
																								<IMG height=17 src="images/htfl.png" width=17>
																							</DIV>
																						</TD>
																						<TD class=unnamed1>查询库存</TD>
																					</TR>
																				</TBODY>
																			</TABLE>
																		</TD>
																	</TR>
																</TBODY>
															</TABLE>
												</TBODY>
											</TABLE> <c:choose>
												<c:when test="${sessionScope.user.usr_role_id<=2}">
													<TABLE cellSpacing=0 cellPadding=0 width=156
														bgColor=#d3dae1 border=0>
														<TBODY>
															<TR id=tr0_5 onClick="show('5',this.state,'9');"
																state="1">
																<TD class=buttom_lr_line
																	onMouseOver="this.style.cursor='hand';"
																	onmouseout="this.style.cursor='auto';"
																	background=images/zlmbtbj.png height=22>
																	<TABLE cellSpacing=0 cellPadding=0 width="97%"
																		align=center border=0>
																		<TBODY>
																			<TR>
																				<TD width=23 height=22>
																					<DIV align=center>
																						<IMG height=17 src="images/htgl.png" width=17>
																					</DIV>
																				</TD>


																				<TD class=fBlack onClick="">系统设置</TD>

																				<TD width=25>
																					<DIV align=center>
																						<IMG id=img_4 src="images/zhankai.png">
																					</DIV>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
															<TR id=tr1_5 style="DISPLAY: none">
																<TD class=buttom_lr_line
																	style="BACKGROUND-COLOR: #fafcff">

																	<TABLE class=buttom_line
																		onMouseOver="this.style.cursor='hand';"
																		onmouseout="this.style.cursor='auto';" cellSpacing=0
																		cellPadding=0 width=152 align=center border=0>
																		<TBODY>
																			<TR>
																				<TD onMouseOver="this.className='bgstyle1';"
																					onclick="forward('role/roleall')"
																					onmouseout="this.className='bgstyle';"
																					background=images/zcdbj.png height=23>
																					<TABLE cellSpacing=0 cellPadding=0 width="90%"
																						align=center border=0>
																						<TBODY>
																							<TR>
																								<TD width=23 height=23>
																									<DIV align=center>
																										<IMG height=17 src="images/tjht.png" width=17>
																									</DIV>
																								</TD>
																								<TD class=unnamed1>角色管理</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																	<TABLE class=buttom_line
																		onMouseOver="this.style.cursor='hand';"
																		onmouseout="this.style.cursor='auto';" cellSpacing=0
																		cellPadding=0 width=152 align=center border=0>
																		<TBODY>
																			<TR>
																				<TD onMouseOver="this.className='bgstyle1';"
																					onclick="forward('user/userall?curpage=1')"
																					onmouseout="this.className='bgstyle';"
																					background=images/zcdbj.png height=23>
																					<TABLE cellSpacing=0 cellPadding=0 width="90%"
																						align=center border=0>
																						<TBODY>
																							<TR>
																								<TD width=23 height=23>
																									<DIV align=center>
																										<IMG height=17 src="images/htlb.png" width=17>
																									</DIV>
																								</TD>
																								<TD class=unnamed1>用户管理</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																	<TABLE class=buttom_line
																		onMouseOver="this.style.cursor='hand';"
																		onmouseout="this.style.cursor='auto';" cellSpacing=0
																		cellPadding=0 width=152 align=center border=0>
																		<TBODY>
																			<TR>
																				<TD onMouseOver="this.className='bgstyle1';"
																					onclick="forward('log/logall?curpage=1')"
																					onmouseout="this.className='bgstyle';"
																					background=images/zcdbj.png height=23>
																					<TABLE cellSpacing=0 cellPadding=0 width="90%"
																						align=center border=0>
																						<TBODY>
																							<TR>
																								<TD width=23 height=23>
																									<DIV align=center>
																										<IMG height=17 src="images/htfl.png" width=17>
																									</DIV>
																								</TD>
																								<TD class=unnamed1>日志查看</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
														</TBODY>
													</TABLE>
												</c:when>
											</c:choose> <!--  循环主menu结束	 -->
										</TD>
										<!-- 内容及下环线开始   -->
									</TR>
								</TBODY>
							</TABLE>
</body>
</html>
