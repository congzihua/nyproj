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
			<title>批量增加票额信息</title>
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
		window.name="mypage";
			function check()
			{
				var flight = document.getElementById("flight");
				var orderdate = document.getElementById("orderdate");
				var orderdate1 = document.getElementById("orderdate1");
				var amount = document.getElementsByName("amount");
				
					
					if(flight.value==null||flight.value==''){
						alert('航程不能为空，请选择！');
						flight.focus();
						return;
						
					}
					
					
					
					if(orderdate.value==null||orderdate.value==''){
						alert('日期不能为空，请填写！');
						orderdate.focus();
						return;				
					}
					if(orderdate1.value==null||orderdate1.value==''){
						alert('日期不能为空，请填写！');
						orderdate1.focus();
						return;				
					}
					if(orderdate1.value<orderdate.value){
						alert('起始日期应小于最终日期！请重新填写！');
						orderdate1.focus();
						return;	
					}
					var len  = amount.length;
					
					var i=0;
					var re = /^[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/ 
					for(i;i<len;i++){var t = amount[i].value;
						if (t!=null&&t!='')
					    {			  
						     if (!re.test(amount[i].value))
						    {
						        alert("票额请输入数字！");
						        amount[i].focus();
						        return false;
						     }
					   }
					}
					if(window.confirm('批量增加需要几分钟，确定填写好要增加信息吗？')){
						document.getElementById("bc").disabled="disabled";
						document.getElementById("cz").disabled="disabled";
						document.forms[0].submit();
					}
			}	
			
		
		</script>
	</head>
	<body>
	<div align="left" style="width: 85%">
		<form  
			action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=bentchAddInfo"
			method="post" target="mypage">			
			<table  cellspacing="0" cellpadding="0" width="85%"
				border="0">
				<tr>
					<td valign="top" width="80%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr align="middle">
								
									<td width="20%">
										航程:										
									</td>
									<td  align="left" width="28%">
									<select id="flight" name="flight" style="width: 158px">
										<%for(BaFlight bf:list){ %>
											<option value="<%=bf.getId()%>"><%=bf.getFlight()%></option>
										<%}%>
									</select>
										<font color='red'>*</font>
									</td>
								
									<td align="left" width="20%">
										起飞时间:	
									</td>
									<td  align="left" nowrap="nowrap" width="20%">
							<select name="hour">
		    				
		    				<option value="08">08</option>
		    				<option value="09">09</option>
		    				<option value="10">10</option>
		    				<option value="11">11</option>
		    				<option value="12">12</option>
		    				<option value="13">13</option>
		    				<option value="14"  selected="selected">14</option>
		    				<option value="15">15</option>
		    				<option value="16">16</option>
		    				<option value="17">17</option>
		    				<option value="18">18</option>
		    				<option value="19">19</option>
		    				<option value="20">20</option>
		    				
		    			</select>
		    			:
		    			<select name="minute">
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
								<td >
										日期:										
									</td>
									<td colspan="3" align="left" nowrap="nowrap">
										<table border="0">
						        <td width="30%" >
						        <input id='orderdate' value="" name="orderdate" width="100%" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	<font color='red'>*</font> &nbsp; &nbsp;至
						        	   </td> 
						        <td width="30%" >
						        <input id='orderdate1' value="" name="orderdate1" width="100%" readonly="readonly">        </td>
						       	 <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar2" /> </span>	 
						        	<font color='red'>*</font> 
						        	   </td> 
							
								</table>
										
									</td>
								</tr>
								
								<tr align="middle">
									<td>
									 星期过滤:
									</td>
									<td align="left" colspan="3">
									<input type="checkbox" value="2"
									id="mon" name="week" />周一
									<input type="checkbox" value="3"
									id="tue" name="week" />周二
									<input type="checkbox" value="4"
									id="wed" name="week" />周三
									<input type="checkbox" value="5"
									id="thu" name="week" />周四
									<input type="checkbox" value="6"
									id="fri" name="week" />周五
									<input type="checkbox" value="7"
									id="sat" name="week" />周六
									<input type="checkbox" value="1"
									id="sun" name="week" />周日
									</td>
								</tr>
								<tr>
									
										<%for(BaTicketpoint bf:tpList){ %>
										<tr align="middle">
										<td >
										<input type="hidden" id="ticketpointId" name="ticketpointId" value="<%=bf.getId()%>"><%=bf.getName()%>:										
									</td>
									<td colspan="3" align="left">									
											
										<input type="text" id="amount" name="amount" value="" />张						
										
									</td>
									</tr>
									<%}%>
								
								
							
								</table>
										
									</td>
								</tr>
								
								<tr valign="bottom">
									<td colspan="4" align="center">
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
    Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "orderdate1",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  
  //-->
</SCRIPT>
