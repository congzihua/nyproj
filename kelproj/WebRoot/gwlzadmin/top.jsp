<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="../jsp-header.jsp"></jsp:include>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />

<%
	Authorization authorization = (Authorization) session.getAttribute("authorization");
 %>
<html>
	<head>
		<title>My JSP 'top.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<LINK href="../css/sglobal.css" type=text/css rel=stylesheet>
		<script type="text/javascript">
		function Select()
		{
		   var select = document.all("select").value;
		   if (select == 1)
		   {
		      top.location.href="../loginAction.do?account=<%=authorization.getAccount()%>&admin=0&password=<%=authorization.getPassword()%>";
		   }
		}
		function exist()
		{
		   if (confirm("确认退出系统吗?"))
		   {
		      document.forms[0].submit();
		   }
		}
		
		function about()
		{
		  	alert("\n后台管理系统 \n\n版本号 : V1.0\n","关于")

		}
		function uppassword(){
			var url = "<%=request.getContextPath()%>/updatePassWord.jsp"
			window.showModalDialog(url,window,"dialogWidth: 512px; dialogHeight: 400px; help: no; scroll: no; status: no");
		}
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		bottommargin="0" leftmargin="0" marginheight="0" marginwidth="100%"
		rightmargin="0" topmargin="0" style="background:url(<%=request.getContextPath()%>/image/top.jpg)">
		 <form action="<%=request.getContextPath()%>/clientAction.do?method=tc" method="post"></form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="200px">
								
							</td>
							<td width="100%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="100%">
											<table width="98%" border="0" style="color:yellow"
												cellspacing="0" cellpadding="2" align="center">
												<tr>
													<td align="left" valign="middle">
													<font  style="font-family:'华文行楷';font-size:50px;font-weight:1000; color:#FFFF00" >空军值班机后台管理系统</font>&nbsp;
													</td>
												</tr>
												<tr>
													<td align="right" valign="bottom">
														
														
														<a href="#" onclick="javascript:about();" style="color:yellow">关于</a> |
														<a href="#" onclick="javascript:uppassword();" style="color:yellow">修改密码</a> |
														<a href="#" onclick="javascript:exist();" style="color:yellow">退出系统</a>
													</td>
												</tr>
											</table>
									</td>
									</tr>
									<!--  <tr>
										<td height="30">
											<table width="98%" border="0" cellspacing="0" cellpadding="0"
												align="center">
												<tr>
													<td align="right" style="color:yellow">
														
														<span style="color:yellow">转至其它应用系统：</span>
														<select onChange="Select()" id="select" size=1
															name="select">
															
															<option value="0">
																公文管理后台管理系统
															</option>
	<option value="1">
																公文管理系统
															</option>
														</select>
													</td>
												</tr>
											</table>
										</td>
									</tr>-->
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
