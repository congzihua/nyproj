<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.User"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
   
   User user = (User)request.getAttribute("userForm");
   

 %>
<html>
	<head>
		<title>修改用户</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript" src="../../js/common.js"></script>
		<script type="text/javascript" src="../../js/md5.js"></script>
		<script type="text/javascript">
		function checkuser()
		{
		  if (jsTrim(document.userForm.account.value) == jsTrim(document.userForm.accountOld.value))
		  {
		        userForm.flag.value = 'yes';
		        return ;
		  }
		  if (!checkaccount())
		     return ;
		  var sUrl = "checkAccount.do?account="+document.userForm.account.value;   
		  new net.ContentLoader(sUrl, doFinish);
		   
		}
		function doFinish()
		{
		  if (this.getReq().responseText == 'yes')
		  {
		      document.getElementById("check_account").innerHTML = '验证合法';
		      userForm.flag.value = 'yes';    
		  }
		  else
		  {
		       document.getElementById("check_account").innerHTML = '登录名重复';
		       userForm.flag.value = 'no';    
		  }
		  
		}
		function checkaccount()
		{
		  var account = document.userForm.account.value;
		  if (jsTrim(account)=="")
		  {
		     alert("用户帐户不能为空");
		     document.userForm.account.focus();
		     return false;
		   }
		   if (account.length > 40)
		   {
		      alert("用户帐户长度超出范围");
		      document.userForm.account.focus();
		      return false;
		   }
		   	for (var i = 0; i < account.length; i++)
			{
				if (account.charCodeAt(i)>0x80)
				{
					alert("用户帐户不能是中文！");
					document.userForm.account.focus();
					return false;
				}
		   }
		   return true;
		}
		function check()
		{
		   var name = document.userForm.name.value;
		   if (jsTrim(name) == "")
		   {
		      alert("用户真实姓名不能为空");
		      document.userForm.name.focus();
		      return false;
		   }
		   if (name.length > 128)
		   {
		       alert("用户真实姓名超出范围");
		       document.userForm.name.focus();
		       return false;
		   }
		  
		   var email = document.userForm.email.value;
		   if (email.length > 40)
		   {
		      alert("email超出范围");
		      document.userForm.email.focus();
		      return false;
		   }
		   if (jsTrim(email) != "")
		   {
		       if (!isValidEMail(email))
			   {
			      alert("email格式不正确");
			      return false;
			   }
		   }
		    var im = document.userForm.im.value;
		   if (im.length > 40)
		   {
		      alert("即时通讯超出范围");
		      document.userForm.im.focus();
		      return false;
		   }
		   var phone = document.userForm.phone.value;
		   if (phone.length > 100)
		   {
		      alert("电话超出范围");
		      document.userForm.phone.focus();
		      return false;
		   }
		   var other = document.userForm.other.value;
		   if (jsTrim(other).length > 1024)
		   {
		      alert("备注超出范围");
		       document.userForm.other.focus();
		      return false;
		   }
		   if (document.userForm.flag.value != 'yes' && (jsTrim(document.userForm.account.value) != document.userForm.accountOld.value))
		   {
		      alert("帐户验证没有通过");
		      document.userForm.account.focus();
		      return false;
		   }
		   var ck = groupfrm.document.getElementsByName("check_name");
		    var tempid = new Array;
		   for (var i = 0; i < ck.length; i++)
		   {
	          if (ck[i].checked)
	          {
	              tempid.push(ck[i].id);
	          }
		   }
		   document.userForm.strUg.value = tempid.toString();    
		   document.userForm.type.value = document.userForm.userType.value;
		   return true;
		}
		</script>
	</head>
	<body style="margin:0"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/user/userAction.do?oper=edit"
			method="post">
			<input type="hidden" name="accountOld" value="<%=user.getAccount() %>"/>
			<input type="hidden" name="dmpid" value="<%=user.getDmpid()%>"/> 
			<html:hidden property="type" name="userForm" />
			<input type="hidden" name="userType" value="0"/>
			<html:hidden property="userid" name="userForm" value="<%=String.valueOf(user.getUserid()) %>"/>
			<input type="hidden" name="strUg"/>
			<input type="hidden" name="flag"/>
			<table style="font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25"><font face="Wingdings" size="2"> l </font>当前位置：用户管理 → 用户管理 →
						新建用户
					</td>
				</tr>

			</table>

			<div style="margin-top:10px;margin-left:10px">

				<table>
					<tr>
						<td valign="top">
							<fieldset>
								<legend style="font-size:14px">
									添写用户信息
								</legend>
								<table style="font-size:14px;color:#568ba4" border="0"
									width="100%" align="center">

									<tr>

										<td width="100px">
											用户帐户:
										</td>
										<td>

										<html:text property="account" name="userForm" onblur="checkuser();" >
						                </html:text>

											<font color='red'>*</font>
											<label style="color:red" id="check_account">
										</td>

									</tr>
									<tr>
										<td width="100px">
											真实姓名:
										</td>
										<td>

											<html:text property="name" name="userForm">
						                </html:text>

											<font color='red'>*</font>
										</td>
									</tr>
									
									<tr>

										<td width="100px">
											E-Mail:
										</td>
										<td width="250px">

											<html:text property="email" name="userForm">
						                    </html:text>
										</td>
									</tr>
									<tr>

										<td width="100px">
											员工编号:
										</td>
										<td width="250px">

											<html:text property="im" name="userForm">
						                    </html:text>
										</td>
									</tr>
									<tr>
										<td width="100px">
											电话:
										</td>
										<td>

											<html:text onkeypress="enterTelephone();" property="phone" name="userForm">
						                    </html:text>

										</td>
									</tr>
									<tr>
										<td width="100px">
											备注:
										</td>
										<td>

											<html:textarea property="other" name="userForm"></html:textarea>

										</td>
									</tr>


								</table>
							</fieldset>
						</td>
						<td valign="top">

							<fieldset>
								<legend style="font-size:14px">
									用户所属组
								</legend>
								<table style="font-size:14px;color:#568ba4">
									<tr>
										<td><iframe id=groupfrm name="groupfrm" frameborder=1 scrolling=yes
												src="group.jsp?dmpid=<%=  user.getDmpid()%>&userid=<%=  user.getUserid()%>" style='height:205px;width:200px'></iframe>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>

				</table>
				<table>
					<tr align="center">
						<td colspan="4">
							<input type="submit" Class="button2" value=" 保存"
								onclick="return check();" />
							<input type="reset" Class="button2" value=" 重置 " />
						</td>
					</tr>

				</table>
			</div>
		</html:form>
	</body>
</html>
