<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.roc.sysmanager.base.service.FlightService" />
<jsp:directive.page import="com.roc.enp.entity.BaFlightKeyWord" />
<jsp:directive.page import="com.roc.enp.entity.BaFlight" />
<jsp:directive.page import="com.roc.enp.entity.FlightInfo" />
<jsp:directive.page import="com.roc.sysmanager.base.service.FlightInfoService" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="java.util.*" />
<%
//String parentid = request.getParameter("id");
BaFlightKeyWord bfkw=new BaFlightKeyWord();
List<BaFlight> list=new FlightService().queryBaFlight(bfkw);
int id=Integer.parseInt(request.getParameter("id"));
FlightInfo flightinfo=new FlightInfoService().queryFlightInfoById(id);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String flydate=sdf.format(flightinfo.getFlight_date());
String flytime=flightinfo.getFly_time();
String[] hourAndMinute=flytime.split(":");
String hour=hourAndMinute[0];
String minute=hourAndMinute[1];
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>新建配额信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/FlightInfoDWR.js'> </script>
		<script type="text/javascript">
		function check()
		{
			var id=document.getElementById("id").value;
			var flight = document.getElementById("flight").value;
			var flightName =document.getElementById("flight").options[window.document.getElementById("flight").selectedIndex].text;
			
			var flydate = document.getElementById("flydate").value;
			if(flydate==null||flydate==""){
				alert('请填写起飞日期！');
				return;
			}
			var flyhour=document.getElementById("flyhour").value;
			var flyminute=document.getElementById("flyminute").value;
			var flytime=flyhour+":"+flyminute;
			FlightInfoDWR.updateFlightInfo(id,flight,flightName,flydate,flytime,onHandleM);
		}
		function onHandleM(data){
		if(data){
				alert("航班信息修改成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else{
				alert("航班信息修改失败！(请确认是否修改过的航班信息已存在！)");
			}
		}
		</script>
	</head>
	<body><div align="center">
			<input type="hidden" name="id" value="<%=id %>"/>
			<!--  html:hidden property="parentID" name="departMentsForm" />-->
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0" align="center">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%" align="center">
								
								<tr align="middle">
								
									<td >
										航程信息:

										
									</td>
									<td colspan="3" align="left">
									<select name="flight">
											<%for(int i=0;i<list.size();i++){ 
												BaFlight baflight=list.get(i);
												int bfid=baflight.getId();
												String bfname=baflight.getFlight();
											%>
											<option value="<%=bfid %>" <%if(bfid==flightinfo.getFlight_id()){%>selected<%} %>><%= bfname%>
											<%} %>
									</select>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="middle">
								
									<td >
										起飞日期:
										
									</td>
									<td align="left">
									<table border="0">
									<tr>
						        <td>
						        <input value="<%=flydate %>" name="flydate" id="flydate" width="100%" readonly="readonly">        </td>
						        <td>
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	<font color='red'>*</font> 
						        	   </td> 
									</tr>
								</table>
									</td>
								</tr>
								<tr align="middle">
								
									<td>
										起飞时间:
										
									</td>
									<td colspan="3" align="left">
										<select name="flyhour">
												<option value="07" <%if("07".equals(hour)){ %>selected<%} %>>07
												<option value="08" <%if("08".equals(hour)){ %>selected<%} %>>08
												<option value="09" <%if("09".equals(hour)){ %>selected<%} %>>09
												<option value="10" <%if("10".equals(hour)){ %>selected<%} %>>10
												<option value="11" <%if("11".equals(hour)){ %>selected<%} %>>11
												<option value="12" <%if("12".equals(hour)){ %>selected<%} %>>12
												<option value="13" <%if("13".equals(hour)){ %>selected<%} %>>13
												<option value="14" <%if("14".equals(hour)){ %>selected<%} %>>14
												<option value="15" <%if("15".equals(hour)){ %>selected<%} %>>15
												<option value="16" <%if("16".equals(hour)){ %>selected<%} %>>16
												<option value="17" <%if("17".equals(hour)){ %>selected<%} %>>17
												<option value="18" <%if("18".equals(hour)){ %>selected<%} %>>18
												<option value="19" <%if("19".equals(hour)){ %>selected<%} %>>19
												<option value="20" <%if("20".equals(hour)){ %>selected<%} %>>20
										</select>
										:
										<select name="flyminute">
												<option value="00" <%if("00".equals(minute)){ %>selected<%} %>>00
												<option value="10" <%if("10".equals(minute)){ %>selected<%} %>>10
												<option value="20" <%if("20".equals(minute)){ %>selected<%} %>>20
												<option value="30" <%if("30".equals(minute)){ %>selected<%} %>>30
												<option value="40" <%if("40".equals(minute)){ %>selected<%} %>>40
												<option value="50" <%if("50".equals(minute)){ %>selected<%} %>>50
										</select>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr align="center">
									<td colspan="2">
										<html:submit property="submit" styleClass="button2"
											value=" 保存" onclick="return check();" />
										<html:reset styleClass="button2" value=" 重置 " />
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>

<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "flydate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   
  
  //-->
</SCRIPT>