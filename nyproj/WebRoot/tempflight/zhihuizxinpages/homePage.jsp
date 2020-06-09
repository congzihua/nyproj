<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String date = request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?format.format(new Date()):request.getAttribute("orderdate").toString().trim();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>指挥中心系统首页</title>
    <meta http-equiv="content-type" content="text/xml; charset=utf-8" />
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
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>

  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}" style="background: transparent;background-image: url(<%=request.getContextPath() %>/tempflight/img/bg.png);background-size: 100% 100%;background-repeat: no-repeat">
  <div align="center">
  <form action="<%=request.getContextPath()%>/tfCommandCenter.do?method=toMainPage" method="post">
    <table border="0" width="1024" align="center">
    	<tr>
    		<td align="right" style="color: #ffffff">日期：</td>
    		<td width="20%">
    		<table border="0">
						        <td width="70%" >
						        <input value="<%=date %>" id='orderdate' name="orderdate" width="100%" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
    		</td>
    		<td><input type='submit' name="" value="查询"/></td>
    		
    	</tr>
    
    </table>
    <font color="red"><%=request.getAttribute("message")!=null&& request.getAttribute("message").toString().trim().equals("1")?"您选择的"+request.getAttribute("odate")+"没有航班！":""%></font>
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
