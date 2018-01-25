<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>新建部门</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		function check()
		{
			 
			 var name =  document.all.name.value;
			 if (name=="")
			 {
			 	 alert("部门名称不能为空!");
			     return false;
			 }
			 if (name.length > 20)
			 {
			     alert("部门名称超出范围!");
			     return false;
			 }
		}
		</script>
	</head>
	<body>
		<html:form  
			action="/gwlzadmin/department/departMentsAction.do?oper=edit"
			method="post">
			<html:hidden property="id" name="departMentsForm" />
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="50%" align="center">
						<div align="center">
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								<tr>
								<td>
								&nbsp;
								</td>
								</tr>
					
								</tr>
								<tr align="middle">
								
									<td>
										部门名称:

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
						</div>
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
