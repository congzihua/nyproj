<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String f = request.getParameter("flightName")==null||request.getParameter("flightName").trim().equals("")?"":URLDecoder.decode(request.getParameter("flightName"),"utf-8");
String discountType = request.getParameter("discountType")==null||request.getParameter("discountType").trim().equals("")?"":URLDecoder.decode(request.getParameter("discountType"),"utf-8");
String realAmount = request.getParameter("realAmount")==null||request.getParameter("realAmount").trim().equals("")?"":URLDecoder.decode(request.getParameter("realAmount"),"utf-8");
String id = request.getParameter("id");
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>新增</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/interface/SysmanagerDWR.js'> </script>
		<script type="text/javascript">
		function check(data)
		{	
			
			var discountType = document.getElementById("discountType");
			var realAmount = document.getElementById("realAmount");
			if(discountType.value==null||discountType.value==''){
				alert('折扣类型不能为空，请填写！');
				discountType.focus();
				return;				
			}
			if(discountType.value.length>30){
				alert('折扣类型长度超出范围！');
				discountType.focus();
				return;				
			}
			if(realAmount.value==null||realAmount.value==''){
				alert('实际金额不能为空，请填写！');
				realAmount.focus();
				return;				
			}
			var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
		     if (!re.test(realAmount.value))
		    {
		        alert("实际金额请输入数字！");
		        realAmount.focus();
		        return false;
		     }
			
			
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cz").disabled="disabled";
			SysmanagerDWR.editTicketprice(data,discountType.value,realAmount.value,onHandleM)
			
		}
		function onHandleM(data){
			if(data){
				alert("票价信息修改成功！");
				 fh();
			}else{
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("票价信息修改失败！");
			}
		}
		function fh(){
			var url = "<%=request.getContextPath()%>/ticketpriceAction.do?method=ticketpriceList";
			window.location.href = url;
		}
		
		</script>
	</head>
	<body>
	<div align="center">
		<html:form  
			action="/gwlzadmin/department/departMentsAction.do?oper=add"
			method="post">
			
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr align="middle">
								
									<td >
										航程:

										
									</td>
									<td colspan="3" align="left">
									<%=f%>
									</td>
								</tr>
								
								<tr align="middle">
								
									<td>
										类型:

										
									</td>
									<td colspan="3" align="left">
									<input type="text" name="discountType" id="discountType" value="<%=discountType %>"/>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
									<td>
										实际金额:

										
									</td>
									<td colspan="3" align="left">
									<input type="text" name="realAmount" id='realAmount' value="<%=realAmount %>"/>元
										<font color='red'>*</font>
									</td>
								</tr>
								
								<tr align="middle">
									<td colspan="4">
										<input type="button"  id="bc" 	value=" 保存" onclick="check(<%=id%>);" />&nbsp; &nbsp; &nbsp; 
										<input type="button" id="cz" value=" 返回 " onclick="fh();"/>
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
