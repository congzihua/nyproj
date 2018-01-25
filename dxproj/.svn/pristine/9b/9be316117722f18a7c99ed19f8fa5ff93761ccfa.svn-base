<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>用户登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" href="js/md5.js"></script>
		<script language="JavaScript" type="text/javascript">
		function check()
		{
		    if (userForm.account.value == "")
		    {
		        alert('登录名称不能为空');
		        userForm.account.focus();
		        return false;
		    }
		   
		    return true;
		}
		</script>
	</head>

	<body>
		<html:form action="/loginAction.do" method="post" target="_top">
			<%@include file="md5.html"%>
			
			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
				bgcolor="#ffffff">
			
				<tr>
					<td align="center">
						<table width="150">
						
							<tr>
								<td height="30" align="center">
									用户名：
								</td>
								<td>
									<html:text property="account" name="userForm"
										style="width:150px;" />
								</td>
							</tr>
							<tr>
								<td height="30" align="center">
									密&nbsp;&nbsp;码：
								</td>
								<td>
									<html:password property="password" name="userForm"
										style="width:150px;" />
								</td>
							</tr>
							<tr>
							<td>系      统：</td>
								<td height="30" align="left">
								<select id="admin" name="admin">
									<option value="2">订售票系统</option>
									<option value="3">值登机系统</option>
									<option value="4">指挥中心系统</option>
									<option value="5">登机安检系统</option>
									<option value="1">系统管理员</option>
								</select>
								</td>
								
							</tr>
							<tr>
								<td height="30" >
									<html:submit onclick="return check();" value=" 登 录 "></html:submit>
								</td>
								<td height="30">
									<html:reset value=" 重 置 " />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<logic:notEmpty name="msg">
					<tr>
						<td style="color:red" align="center" colspan="5">
				<bean:write name="msg" />
						</td>
					</tr>
				</logic:notEmpty>


			</table>
		</html:form>
	</body>
</html>
