<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String date = request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?format.format(new Date()):request.getAttribute("orderdate").toString().trim();
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
    
    <title>票额调配</title>
    
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
		<script type="text/javascript">
			function sb(){
				var flightId = document.getElementById("flightId");
				var orderdate = document.getElementById("orderdate");				
				var url = "<%=request.getContextPath()%>/clientAction.do?method=toBeanchInfo&flightId="+flightId.value+"&orderdate="+orderdate.value;
				document.getElementById("ifr").src=url;
			}
		</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}"  background="<%=request.getContextPath()%>/image/bg.jpg">
  <div align="center">
  <form action="<%=request.getContextPath()%>/clientAction.do?method=toBeanchInfo" method="post" target="ifr">
    <table border="0" width="1024" align="center">
    	<tr>
    		<td>航程：</td>
    		<td nowrap="nowrap">
    			<select id="flightId" name="flightId">
    			<%for(BaFlight bf:list){ %>
    				<option value="<%=bf.getId()%>" <%=request.getAttribute("flightId")!=null&&request.getAttribute("flightId").toString().trim().equals(String.valueOf(bf.getId()))?"selected=\'selected\'":""%>><%=bf.getFlight()%></option>
    			<%}%>
    			</select>
    		</td>
    		<td align="right">日期：</td>
    		<td width="20%">
    		<table border="0">
						        <td width="70%" >
						        <input value="<%=date %>" id="orderdate" name="orderdate" width="100%" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
    		</td>    		
    		<td><input type='button' name="" value="查询" onclick="sb();"/></td>
    		
    	</tr>
    
    </table>
   
    </form>
    </div>
    <iframe id="ifr" name="ifr" scrolling="auto" src="" width="100%"></iframe>
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
