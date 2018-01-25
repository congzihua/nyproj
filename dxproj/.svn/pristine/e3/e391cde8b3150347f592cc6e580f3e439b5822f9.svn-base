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
//BaTicketpointKeyword kw = new BaTicketpointKeyword();
//java.util.List<BaTicketpoint> tpList = service.queryBaTicketpoint(kw);	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>票额分配</title>
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
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/SysmanagerDWR.js'> </script>
		<script type="text/javascript">
		window.name="mypage";
		
			function okay(){
			
				var amount = document.getElementsByName("amount");
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
					document.getElementById("cx").disabled="disabled";
					document.getElementById("bc").disabled="disabled";
					document.forms[0].submit();
			}
			
			function check()
			{
				var flight = document.getElementById("flight");
				var orderdate = document.getElementById("orderdate");
				var hour = document.getElementById("hour").value;
				var minute = document.getElementById("minute").value;
				var time= hour+":"+minute;
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
					
					SysmanagerDWR.searchForFenPei(flight.value,orderdate.value,time,onHandleM);
						
					
			}	
			function onHandleM(data){
				if(data=="nodata"){
					document.getElementById("disDiv").innerHTML="<tr><font color='red'>您所选择的时间和班次还未录入票额！</font></tr>";
				}else{
					document.getElementById("disDiv").innerHTML="";
					var sums = 0;
					var each=data.split("-");
					var sums = 0;
					var datas = '<table style="font-size:14px;color:#568ba4" border="0" width="100%">';
					for(var i=0;i < each.length ; i++){
							var nAnda=each[i].split(",");
							sums = parseInt(sums)+parseInt(nAnda[1]);
						datas   +="<tr align='middle' align='center'>"  + 
											"<td align='left'>"  + 
											nAnda[0]+":"  + 										
										"</td>"  +
										"<td colspan='3' align='left'>"  + 									
											"<input type='hidden' name='id' value='"+	nAnda[2]+"'/>"+
											"<input type='text' name='amount' value='"+nAnda[1]+"' />张"  +						
											
										"</td>" + 
										"</tr><br/>";
					}
					datas += "<tr align='middle' align='center'>"  + 
											"<td align='left'>"  + 
											"合计:"  + 										
										"</td>"  +
										"<td colspan='3' align='left'>"  + sums+								
											
										"</td></tr>"
										
					datas+="<tr align='center'> "  +
										"<td colspan='4' align='center'>"  +
											"<input type='button'  id='bc' 	value='保存' onclick='okay();' /> " +
										"</td>"	+
									"</tr></table>";
				   // datas +=				  
				 document.getElementById("disDiv").innerHTML=datas;
			}
		}
		</script>
	</head>
	<body>
	<div align="center">
		<form  
			action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=ticketAllocUpdate"
			method="post" target="mypage">			
			<table cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="80%" >
						
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
										日期:										
									</td>
									<td colspan="3" align="left" nowrap="nowrap">
										<table border="0">
						        <td width="35%" >
						        <input id='orderdate' value="" name="orderdate" width="100%" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	<font color='red'>*</font>
						        	   </td> 
								</table>
										<tr align="middle">
									<td>
										时间:	
									</td>
									<td colspan="3" align="left" nowrap="nowrap">
							<select name="hour">		    				
		    				<option value="07">07</option>
		    				<option value="08">08</option>
		    				<option value="09" selected="selected">09</option>
		    				<option value="10">10</option>
		    				<option value="11">11</option>
		    				<option value="12">12</option>
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
		    			<select name="minute">
		    				<option value="00">00</option>		    				
		    				<option value="10">10</option>		    				
		    				<option value="20">20</option>		    				
		    				<option value="30">30</option>		    				
		    				<option value="40">40</option>		    				
		    				<option value="50">50</option>		    				
		    			</select>
		    			<font color='red'>*</font>
									</td>
								</tr>
									
								<tr>
								<td colspan="4" align="center">
									<input id="cx"  type="button"  id="search" 	value="查询" onclick="check();" />&nbsp; &nbsp; &nbsp; 
								</td>
								</tr>
								</table>
								
					</td>
				</tr>
			</table>
			<div id="disDiv" style="border-top: 50px" align="center"></div>
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
