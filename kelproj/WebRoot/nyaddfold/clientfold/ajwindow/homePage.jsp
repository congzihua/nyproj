<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%

BaFlightKeyWord keyword = new BaFlightKeyWord();
FlightService service = new FlightService();
java.util.List<BaFlight> list = service.queryBaFlight(keyword);	
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登机牌核对首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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

  </head>
  
  <body background="<%=request.getContextPath()%>/image/bg.jpg">
  <div align="center">
  <form action="<%=request.getContextPath()%>/clientAction.do?method=toFlyMainPage" method="post">
    <table border="0" width="1024" align="center">
    	<tr>
    		<td>目的地：</td>
    		<td nowrap="nowrap">
    			<% int i = 0;for(BaFlight bf:list){ %>
    									
											<input type="radio" name="flightId" value="<%=bf.getId()+"c"+bf.getFlight()%>" checked="<%=i==0?"checked":""%>"><%=bf.getFlight()%>
										<%i++;}%>
    		</td>
    		<td align="right">日期：</td>
    		<td width="20%">
    		<table border="0">
						        <td width="70%" >
						        <input value="" name="orderdate" width="100%" readonly="readonly" id="orderdate">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
    		</td>
    		<td>起飞时间：</td>
    		<td>
    			<select name="hour">
    				
    				<option value="07">07</option>
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
    			<select name="minue">
    				<option value="00">00</option>    				
    				<option value="10">10</option>    				
    				<option value="20">20</option>    				
    				<option value="30"  selected="selected">30</option>    				
    				<option value="40">40</option>    				
    				<option value="50">50</option>    				   				
    			</select>
    		</td>
    		<td><input type='submit' name="" value="查询"/></td>
    		
    	</tr>
    
    </table>
    <font color="red"><%=request.getAttribute("message")!=null&& request.getAttribute("message").toString().trim().equals("1")?"你选择的航程和日期没有航班！":""%></font>
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
