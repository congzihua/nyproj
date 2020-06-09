<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<TempOrdertickets> pplist=(List<TempOrdertickets>)request.getAttribute("list");

String which=request.getAttribute("which")==null?"":request.getAttribute("which").toString().trim();
java.util.Calendar c = java.util.Calendar.getInstance();

String flightDate = request.getAttribute("orderdate")==null?"": request.getAttribute("orderdate").toString().trim();
TempFlightinfo fInfo = (TempFlightinfo)request.getAttribute("flightinfo");
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  	java.util.Date date = fInfo.getFlightDate();
  	if(date!=null)
  		c.setTime(date);
  	int dayOfWeek = c.get(java.util.Calendar.DAY_OF_WEEK);
	String weeks = null;
	if(dayOfWeek==2){
	  weeks = "一";
	}else if(dayOfWeek==3){
	   weeks = "二";
	}else if(dayOfWeek==4){
	   weeks = "三";
	}else if(dayOfWeek==5){
	   weeks = "四";
	}else if(dayOfWeek==6){
		weeks = "五";
	}else if(dayOfWeek==7){
	    weeks = "六";
	}else if(dayOfWeek==1){
	    weeks = "日";
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登机扫描系统数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	table td{ text-align:center; vertical-align:middle;}
	</style>
  </head>
  
  <body>
	<div align="center"> 
 		 <div align="left" style="width: 1024"> 
 		 		<%if("up"==which||which.equals("up")){%>
				<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 航班号： </FONT>
				<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222">${flightinfo.flightNo}</font>
				&nbsp;&nbsp;<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">起飞时间：</font>
				<font style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#b22222">${offLandTime} 星期 <%=weeks%></font> 
				<br><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 已售票：</font>&nbsp;<font style="font-weight:5;font-family:'黑体';size: 18" color="#B22222">${shouPiao+dengJi+huanPai+safeCheck}</font>&nbsp;  &nbsp;
				<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 已值机：</font>&nbsp;<font style="font-weight:5;font-family:'黑体';color: #b22222" >${huanPai+dengJi+safeCheck}</font>&nbsp;  &nbsp;
				<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 已安检：</font>&nbsp; <font style="font-size:20px;font-weight:15;font-family:'黑体';color: #b22222" >${dengJi+safeCheck}</font>
				<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 已登机：</font>&nbsp; <font style="font-size:20px;font-weight:15;font-family:'黑体';color: #b22222" >${dengJi}</font>
				<script type="text/javascript">
					try{
						parent.frames[1].document.getElementById("info").innerHTML='已登机：${dengJi}';
						parent.frames[1].document.getElementById("txmv").focus();
					}catch(e){
						
					}
					
				</script>
				<%} %> 
		</div>
	</div>  
  	
  		
  	
    <form action="<%=request.getContextPath()%>/tfClientAction?method=toMainPage" method="post" target="wode">
    <table bgcolor="#3366FF" border="0" cellpadding="0" cellspacing="1"  width="1024" align="center">
    <tr bgcolor="#F0F0F0">
    		<th>序号</th>
    		<th>航程</th>
    		<th>姓名</th>
    		<th>座位号</th>
    		<th>联系电话</th>
    		<th>证件类型</th>
    		<th>证件号码</th>
    		<th>状态</th>
    	</tr>
    	<% 
    	TempOrdertickets tick =  request.getAttribute("smInfo")==null?null:(TempOrdertickets)request.getAttribute("smInfo");
    	 	if(tick!=null){
    	 		int sta=Integer.parseInt(tick.getStatus());
    	 %>
    	
    	<tr bgcolor="#FFFFFF">
    		<td align="right" bordercolor="black">0</td>
    		<td align="right" bordercolor="black"><%=tick.getFlightInfo() %></td>
    		<td align="right" bordercolor="black"><%=tick.getName() %></td>
    		<td align="right" bordercolor="black"><%=tick.getSeatNum()==null?"":tick.getSeatNum() %></td>
    		<td align="right" bordercolor="black"><%=tick.getLinkphone() %></td>
    		<td align="right" bordercolor="black"><%=tick.getCertType()%></td>
    		<td align="right" bordercolor="black"><%=tick.getCertNo()%></td>
    		<td align="right" bordercolor="black"><%=sta==4?"已安检":sta==5?"已登机":""%></td>
    	</tr>
    	<%} %>
    <%for(int i=0;i<pplist.size();i++){
    	TempOrdertickets eo =pplist.get(i);
    	int sta=Integer.parseInt(eo.getStatus());
    	%>
    	<tr bgcolor="#FFFFFF">
    		<td align="right" bordercolor="black"><%=i+1 %></td>
    		<td align="right" bordercolor="black"><%=eo.getFlightInfo()%></td>
    		<td align="right" bordercolor="black"><%=eo.getName() %></td>
    		<td align="right" bordercolor="black"><%=eo.getSeatNum()==null?"":eo.getSeatNum() %></td>
    		<td align="right" bordercolor="black"><%=eo.getLinkphone() %></td>
    		<td align="right" bordercolor="black"><%=eo.getCertType()%></td>
    		<td align="right" bordercolor="black"><%=eo.getCertNo()%></td>
    		<td align="right" bordercolor="black"><%=sta==4?"已安检":sta==5?"已登机":""%></td>
    	</tr>
    	<%
  	  } 
    %>
    </table>
    </form>
  </body>
</html>
