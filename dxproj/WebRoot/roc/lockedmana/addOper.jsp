<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String parentid = request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>新建配额信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		function check()
		{
				
		}

		
		</script>
	</head>
	<body>
	<div align="center">
		<html:form  
			action="/gwlzadmin/department/departMentsAction.do?oper=add"
			method="post">
			<html:hidden property="parentID" name="departMentsForm" />
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr align="middle">
								
									<td >
										订票点:

										
									</td>
									<td colspan="3" align="left">
									<html:text property="name" name="departMentsForm">
										</html:text>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										日期:

										
									</td>
									<td colspan="3" align="left">
									<html:text property="name" name="departMentsForm">
										</html:text>
										<font color='red'>*</font>
									--
									<html:text property="name" name="departMentsForm">
										</html:text>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										票额:

										
									</td>
									<td colspan="3" align="left">
									<html:text property="name" name="departMentsForm">
										</html:text>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
									<td colspan="2">
										<html:submit property="submit" styleClass="button2"
											value=" 保存" onclick="return check();" />
										<html:reset styleClass="button2" value=" 重置 " />
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
		</html:form>
		</div>
	</body>
</html>
