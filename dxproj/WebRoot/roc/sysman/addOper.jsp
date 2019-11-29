<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketpointKeyword"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
String parentid = request.getParameter("id");

BaFlightKeyWord keyword = new BaFlightKeyWord();
FlightService service = new FlightService();
java.util.List<BaFlight> list = service.queryBaFlight(keyword);	
BaTicketpointKeyword kw = new BaTicketpointKeyword();
java.util.List<BaTicketpoint> tpList = service.queryBaTicketpoint(kw);	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>新建票额信息</title>
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
			function check()
			{
				var flight = document.getElementById("flight");
					var ticketpointId = document.getElementById("ticketpointId");
					var orderdate = document.getElementById("orderdate");
					var orderhour = document.getElementById("hour").value;
					var orderminute = document.getElementById("minute").value;
					var ordertime = orderhour+":"+orderminute;
					var amount = document.getElementById("amount");
					
					if(flight.value==null||flight.value==''){
						alert('航程不能为空，请选择！');
						flight.focus();
						return;
						
					}
					
					if(ticketpointId.value==null||ticketpointId.value==''){
						alert('订票点不能为空，请选择！');
						ticketpointId.focus();
						return;				
					}
					
					if(orderdate.value==null||orderdate.value==''){
						alert('日期不能为空，请填写！');
						orderdate.focus();
						return;				
					}
					if (amount.value==null||amount.value=='')
				    {
				        alert("票额不能为空，请填写！");
				        amount.focus();
				        return false;
				     }
					var re = /^[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/   
				     if (!re.test(amount.value))
				    {
				        alert("票额请输入数字！");
				        amount.focus();
				        return false;
				     }
					
					
					document.getElementById("bc").disabled="disabled";
					document.getElementById("cz").disabled="disabled";
					SysmanagerDWR.addTicketsalloc(flight.value,ticketpointId.value,orderdate.value,ordertime,amount.value,onHandleM)	
			}	
			function onHandleM(data){
			if(data==1){
				alert("票额信息增加成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else if(data==2){
			document.getElementById("bc").disabled="";
			document.getElementById("cz").disabled="";
				alert("票额信息增加失败！");
			}else{
				document.getElementById("bc").disabled="";
				document.getElementById("cz").disabled="";
				alert("票额信息已经存在无法添加，请重新填写！");
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
									<td colspan="3" align="left">
									<select id="flight" name="flight" style="width: 158px">
										<%for(BaFlight bf:list){ %>
											<option value="<%=bf.getId()%>"><%=bf.getFlight()%></option>
										<%}%>
									</select>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
								
									<td >
										订票点:										
									</td>
									<td colspan="3" align="left">
									<select id="ticketpointId" name="ticketpointId" style="width: 158px">
										<%for(BaTicketpoint bf:tpList){ %>
											<option value="<%=bf.getId()%>"><%=bf.getName()%></option>
										<%}%>
									</select>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										日期:										
									</td>
									<td colspan="3" align="left">
									
									<table border="0">
						        <td width="70%" >
						        <input value="" name="orderdate" width="100%" id="orderdate" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	<font color='red'>*</font> 
						        	   </td> 
							
								</table>
										
									</td>
								</tr>
								
								<tr align="middle">
								
									<td>
										时间:										
									</td>
									<td colspan="3" align="left">
										<select id="hour" name="hour">
		    				
		    				<option value="07">07</option>
		    				<option value="08">08</option>
		    				<option value="09">09</option>
		    				<option value="10">10</option>
		    				<option value="11">11</option>
		    				<option value="12"  selected="selected">12</option>
		    				<option value="13">13</option>
		    				<option value="14">14</option>
		    				<option value="15">15</option>
		    				<option value="16">16</option>
		    				<option value="17">17</option>
		    				<option value="18">18</option>
		    				<option value="19">19</option>
		    				<option value="20">20</option>
		    				
		    			</select>
		    			:
		    			<select name="minute" id="minute">
		    				<option value="00">00</option>
		    				
		    				<option value="10">10</option>
		    				
		    				<option value="20">20</option>
		    				
		    				<option value="30"  selected="selected">30</option>
		    				
		    				<option value="40">40</option>
		    				
		    				<option value="50">50</option>
		    				
		    				
		    			</select>
									</td>
								</tr>
								
								<tr align="middle">
								
									<td>
										票额:									
									</td>
									<td colspan="3" align="left">
									<input type="text" name="amount"  id="amount" value="" />
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

<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "orderdate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   
  
  //-->
</SCRIPT>
