<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketpointKeyword"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
	String name = request.getParameter("name")==null||request.getParameter("name").trim().equals("")?"":URLDecoder.decode(request.getParameter("name"),"utf-8");
	String flight = request.getParameter("flight")==null||request.getParameter("flight").trim().equals("")?"":URLDecoder.decode(request.getParameter("flight"),"utf-8");
	String orderdate = request.getParameter("orderdate")==null||request.getParameter("orderdate").trim().equals("")?"":URLDecoder.decode(request.getParameter("orderdate"),"utf-8");
	String amount = request.getParameter("amount")==null||request.getParameter("amount").trim().equals("")?"":URLDecoder.decode(request.getParameter("amount"),"utf-8");
		String lockednum = request.getParameter("lockednum")==null||request.getParameter("lockednum").trim().equals("")?"":URLDecoder.decode(request.getParameter("lockednum"),"utf-8");
	String id = request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>锁定票额信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/SysmanagerDWR.js'> </script>
		<script type="text/javascript">
			function check(data)
			{
				var lockednum = document.getElementById("lockednum");
					
					if (lockednum.value==null||lockednum.value=='')
				    {
				        alert("锁定数量不能为空，请填写！");
				        lockednum.focus();
				        return false;
				     }
					var re = /^[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
				     if (!re.test(lockednum.value))
				    {
				        alert("锁定数量请输入数字！");
				        lockednum.focus();
				        return false;
				     }				
					document.getElementById("bc").disabled="disabled";
					document.getElementById("cz").disabled="disabled";
					SysmanagerDWR.ticketsallocLocket(data,lockednum.value,onHandleM)	
			}	
			function onHandleM(data){
			if(data){
				alert("信息保存成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else{
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("信息保存失败！");
			}
		}	
		</script>
	</head>
	<body>
	<div align="center">
		<form  
			action=""
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
									<td  align="left">
									<%=flight%>
									</td>
																
									<td >
										订票点:										
									</td>
									<td align="left">
									<%=name%>
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										日期:										
									</td>
									<td colspan="1" align="left">
									
									<%=orderdate%>
										
									</td>
								
								
									<td>
										票额:									
									</td>
									<td colspan="1" align="left">
									<%=amount%>
									
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										锁定数量:									
									</td>
									<td colspan="3" align="left">
									<input type="text" id="lockednum" name="lockednum" value="<%=lockednum%>" />
									<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
									<td colspan="4">
										<input type="button"  id="bc" 	value=" 保存" onclick="check('<%=id%>');" />&nbsp; &nbsp; &nbsp; 
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


