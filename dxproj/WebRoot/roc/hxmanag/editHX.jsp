<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String path = request.getContextPath();
String f = request.getParameter("f")==null||request.getParameter("f").trim().equals("")?"":URLDecoder.decode(request.getParameter("f"),"utf-8");
String ename = request.getParameter("ename")==null||request.getParameter("ename").trim().equals("")?"":URLDecoder.decode(request.getParameter("ename"),"utf-8");
String id = request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>修改航程</title>
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
			var flight = document.getElementById("flight");
			var englishname = document.getElementById("englishname");
			var pattern=/[^\x00-\xff]/g;
			if(flight.value==null||flight.value==''){
				alert('航程信息不能为空，请重新填写！');
				flight.focus();
				return;
				
			}
			if(flight.value.length>50){
				alert('航程信息长度超出范围！');
				flight.focus();
				return;
				
			}
			if(englishname.value==null||englishname.value==''){
				alert('英文名不能为空，请重新填写！');
				englishname.focus();
				return;				
			}
			if(englishname.value.length>30){
				alert('英文名长度超出范围！');
				englishname.focus();
				return;				
			}
			if(pattern.test(englishname.value)){
   				//包含中文
   				alert('英文名不能包含中文！');
				englishname.focus();
   				return ;
			}	
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cz").disabled="disabled";
			SysmanagerDWR.editFlight(data,flight.value,englishname.value,onHandleM)
			
		}
		function onHandleM(data){
			if(data){
				alert("航程信息修改成功！");
				fh();
			}else{
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("航程信息修改失败！");
			}
		}
		function fh(){
			var url = "<%=request.getContextPath()%>/flightAction.do?method=list";
			window.location.href = url;
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
										航程：										
									</td>
									<td  align="left">
									<input type="text" id="flight" name="flight" value="<%=f%>"/> 
										<font color='red'>*</font>
									</td>
								
								
									<td align="right">
										英文名：									
									</td>
									<td  align="left">
									<input type="text" id="englishname" name="englishname" value="<%=ename %>"/> 
										<font color='red'>*</font>
									
										
									</td>
								</tr>
								
								<tr align="middle">
									<td colspan="4">
										<input type="button"  id="bc" 	value=" 保存" onclick="check('<%=id%>');" />&nbsp; &nbsp; &nbsp; 
										<input type="button" id="cz" value="  返回" onclick="fh();"/>
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
