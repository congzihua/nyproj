<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String path = request.getContextPath();
String name = request.getParameter("name")==null||request.getParameter("name").trim().equals("")?"":URLDecoder.decode(request.getParameter("name"),"utf-8");
String telephone = request.getParameter("telephone")==null||request.getParameter("telephone").trim().equals("")?"":URLDecoder.decode(request.getParameter("telephone"),"utf-8");
String id = request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>修改订票点信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=path %>/css/admin.css">
			<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/interface/SysmanagerDWR.js'> </script>
		<script type="text/javascript">
		function check(data)
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
			SysmanagerDWR.editTicketpoint(data,name.value,telephone.value,onHandleM)
			
		}
		function onHandleM(data){
			if(data){
				alert("订票点信息修改成功！");
				fh();
			}else{
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("订票点信息修改失败！");
			}
		}
		function fh(){
			window.location.href ="<%=request.getContextPath()%>/flightAction.do?method=listTicketpoint"
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
									<input type="text" id="name" name="name" value="<%=name%>"/> 
										<font color='red'>*</font>
									</td>
								
								
									<td align="right">
										电话：									
									</td>
									<td  align="left">
									<input type="text" id="telephone" name="telephone" value="<%=telephone%>"/> 
										<font color='red'>*</font>
									
										
									</td>
								</tr>
								
								<tr align="middle">
									<td colspan="4">
										<input type="button"  id="bc" 	value=" 保存" onclick="check('<%=id%>');" />&nbsp; &nbsp; &nbsp; 
										<input type="reset" id="cz" value=" 返回 " onclick="fh();"/>
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
