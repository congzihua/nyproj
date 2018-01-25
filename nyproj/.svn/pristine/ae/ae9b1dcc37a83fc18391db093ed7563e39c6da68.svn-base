<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>增加订票点</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=path %>/css/admin.css">
			<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/interface/SysmanagerDWR.js'> </script>
		<script type="text/javascript">
		function check()
		{	
			var name = document.getElementById("name");
			var telephone = document.getElementById("telephone");
			
			if(name.value==null||name.value==''){
				alert('订票点名称不能为空，请重新填写！');
				name.focus();
				return;
				
			}
			if(name.value.length>50){
				alert('订票点名称长度超出范围！');
				name.focus();
				return;
				
			}
			if(telephone.value==null||telephone.value==''){
				alert('电话不能为空，请重新填写！');
				telephone.focus();
				return;				
			}
			if(telephone.value.length>30){
				alert('电话长度超出范围！');
				telephone.focus();
				return;				
			}
			
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cz").disabled="disabled";
			SysmanagerDWR.addTicketpoint(name.value,telephone.value,onHandleM)
			
		}
		function onHandleM(data){
			if(data){
				alert("订票点信息增加成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else{
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("订票点信息增加失败！");
			}
		}
		
		</script>
	</head>
	<body>
	<div align="center">
		<form  	action=""	method="post">
			
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr align="middle">
								
									<td align="right">
										订票点名称：										
									</td>
									<td  align="left">
									<input type="text" id="name" name="name" value=""/> 
										<font color='red'>*</font>
									</td>
								
								
									<td align="right">
										电话：									
									</td>
									<td  align="left">
									<input type="text" id="telephone" name="telephone" value=""/> 
										<font color='red'>*</font>
									
										
									</td>
								</tr>
								
								<tr align="middle">
									<td colspan="4">
										<input type="button"  id="bc" 	value=" 保存" onclick="check();" />&nbsp; &nbsp; &nbsp; 
										<input type="reset" id="cz" value=" 重置 " />
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</body>
</html>
