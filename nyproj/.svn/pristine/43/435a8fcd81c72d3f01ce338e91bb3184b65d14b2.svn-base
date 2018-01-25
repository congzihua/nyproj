<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String dmpid = request.getParameter("dmpid");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新建用户组</title>
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
			     alert("名称不能为空!");
			     return false;
			 }
			 if (name.length > 20)
			 {
			     alert("名称超出范围!");
			     return false;
			 }
			 var mem = document.all.mem.value;
			 if (mem.length > 40)
			 {
			     alert("备注超出范围");
			     return false;
			 }
			 document.userGroupForm.dpmid.value=<%=dmpid%>;
		}

		
		</script>
	</head>
	<body>
		<html:form action="/gwlzadmin/usergroup/userGroupAction.do?oper=add"
			method="post">
			<html:hidden property="dpmid" name="userGroupForm" />

			<table style="font-size: 14px; color: rgb(86, 139, 164);"  align="center">
				<tr>
				
				</tr>
				<tr>
					<td>
					组别名称：
					</td>
					<td>
						<html:text property="name" name="userGroupForm">
						</html:text>
						<font color='red'>*</font>

					</td>
				</tr>
				<tr>
					<td>备注：
 
					</td>
					<td>
						<html:textarea cols="18"   rows="3" property="mem" name="userGroupForm">
						</html:textarea>
					</td>
				</tr>
				<tr align="middle">

					<td  colspan=2>
						<html:submit property="submit" styleClass="button2" value=" 保存"
							onclick="return check();" />
						<html:reset styleClass="button2" value=" 重置 " />
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
