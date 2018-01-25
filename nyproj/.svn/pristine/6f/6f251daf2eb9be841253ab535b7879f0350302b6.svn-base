<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:include flush="true" page="jsp-header.jsp"></jsp:include>
<%
	Authorization authorization = (Authorization) session.getAttribute("authorization");
	Integer type = authorization.getType();
 %>
<html>
	<head>
		<title>My JSP 'top.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<LINK href="css/sglobal.css" type=text/css rel=stylesheet>
		<script type="text/javascript">
		function Select()
		{
		  
		   var select = document.all("select").value;
		   if (select == 1)
		   {
		      <%if (type != 1)
		      {%>
		        alert("您没有权限访问后台管理系统");
		         document.all("select").options[0].selected=true;
		        return ;
		      <%}%>
		      
		      top.location.href="../gwlzadmin/index.jsp";
		   }
		}
		function userpage()
		{
		   	window.open("gwlzclient/userpage.jsp","个人设置",'top='+(screen.height/2-300)+',left='+(screen.width/2-400)+',width=800,height=600,scrollbars=no,resizable=yes,center:yes'); 
	
		}
		function about()
		{
		  	alert("\n管理系统 \n\n版本号 : V1.0\n","关于")

		}
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		bottommargin="0" leftmargin="0" marginheight="0" marginwidth="100%"
		rightmargin="0" topmargin="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						bgcolor="#2863d7">
						<tr>
							<td width="200px">
								
							</td>
							<td width="100%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="80">
											<table width="98%" border="0" style="color:yellow"
												cellspacing="0" cellpadding="2" align="center">
												<tr>
													<td align="right">
														&nbsp;			</td>
												</tr>
												<tr>
													<td align="right">
														
														<a href="#" onclick="javascript:userpage();" style="color:yellow">个人设置</a> |
														<a href="" style="color:yellow" target="_blank">使用说明</a> |
														<a href="#" onclick="javascript:about();" style="color:yellow">关于</a> |
														<a href="#" onclick="javascript:window.top.close();;" style="color:yellow">退出系统</a>
													</td>
												</tr>
												<!--<tr>
												<td align="right">
												  <a href="./bin/ITxiazai_Office2003SP3-KB923618-FullFile-CHS.exe" target="_blank" style="color:yellow">office2003(sp3补丁)</a>
												</td>
												</tr>-->
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
																公文管理系统
															</option>
															<option value="1">
																公文管理后台管理系统
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
