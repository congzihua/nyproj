<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>
<%@page import="java.util.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	TempFlightinfo fi = (TempFlightinfo)request.getAttribute("flightinfo");
	
	HashMap<String, Object> frameMap=(HashMap<String, Object>)request.getAttribute("frameMap");
	int shouPiao=(Integer)frameMap.get("shouPiao");
	int huanPai=(Integer)frameMap.get("huanPai");
	int jinCang=(Integer)frameMap.get("jinCang");
	int jianShu=(Integer)frameMap.get("jianShu");
	int zongZhong=(Integer)frameMap.get("zongZhong");
	int safeCheckSum=(Integer)frameMap.get("safeCheckSum");
	List<TempOrdertickets> pplist=(List<TempOrdertickets>)frameMap.get("pplist");
	TempOrdertickets opo = pplist!=null&&pplist.size()>0?pplist.get(0):null;
	String hbh=fi.getFlightNo();
	String fn=opo.getFlightInfo();
	Date fdate=fi.getFlightDate();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String fd=fdate!=null?sdf.format(fdate):"";
	String ft=opo!=null?fi.getFlyTime():"";
	String act=(String)request.getAttribute("action");
	String action="";
	action = "tfCommandCenter.do?method=toMainPageContain&flightinfoId="+fi.getId()+"&posNum="+act;
  	java.util.Calendar c = java.util.Calendar.getInstance();
  	c.setTime(fdate!=null?fdate:new java.util.Date());
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
    <title>指挥中心-航班信息列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">
	window.name="wode";
		function shouPiao(){
			//parent.document.getElementById("contain${action}").src="<%=request.getContextPath()%>/tfCommandCenter.do?method=toMainPageContain00&flightinfoId=<%=fi.getId() %>";
		}
		
		function huanPai(){
			//parent.document.getElementById("contain${action}").src="<%=request.getContextPath()%>/tfCommandCenter.do?method=toMainPageContain01&flightinfoId=<%=fi.getId() %>";
		}
		
		function jinCang(){
			// parent.document.getElementById("contain${action}").src="<%=request.getContextPath()%>/tfCommandCenter.do?method=toMainPageContain02&flightinfoId=<%=fi.getId() %>";
		}
		</script>
  </head>
  
  <body >
    <%if(fdate!=null){ %>
    <div align="center">
  <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">航班号：</font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=hbh %></FONT>&nbsp; &nbsp;<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">起飞时间：</font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=fd %>&nbsp;<%=ft %> 星期 <%=weeks%></font>
   <br/>
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">已售票：</font><a href="javascript:void(0);" onclick="shouPiao()"> <FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=shouPiao+huanPai+jinCang+safeCheckSum %> </FONT></a><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">张 </font>&nbsp; 
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">已值机：</font><a href="javascript:void(0);" onclick="huanPai()"><FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"> <%=huanPai+jinCang+safeCheckSum %> </FONT></a>
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">位 &nbsp;已安检：</font><a href="javascript:void(0);" onclick="jinCang()"> <FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=jinCang+safeCheckSum %></FONT> </a> 
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">位 &nbsp;已登机：</font><a href="javascript:void(0);" onclick="jinCang()"> <FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=jinCang %></FONT> </a> 
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">位&nbsp; 行李件数：</font><FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=jianShu %> </font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">件&nbsp; 行李总重量：</font><FONT style="font-size:30px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=zongZhong %> </font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">公斤&nbsp;
  </FONT>
  <%} %>
  <form action="<%=request.getContextPath()%>/<%=action %>" method="post" target="wode">
    <table bgcolor="#3366FF" border="0" cellpadding="0" cellspacing="1"  width="1024" align="center">
     <tr bgcolor="#F0F0F0">
    		<th>序号</th>
    		<th>航程</th>
    		<th>姓名</th>
    		<th>VIP</th>
    		<th>联系方式</th>
    		<th>状态</th>
    	</tr>
    <%	if (pplist != null)
    	for(int i=0;i<pplist.size();i++){
	    	TempOrdertickets eo =pplist.get(i);
	    	int vipflag=Integer.parseInt(eo.getVipFlag());
	    	int status=Integer.parseInt(eo.getStatus());
	%>
	    	<tr bgcolor="#FFFFFF">
	    		<td align="center" bordercolor="black"><%=i+1 %></td>
	    		<td align="center" bordercolor="black"><%=eo.getFlightInfo()%></td>
	    		<td align="center" bordercolor="black"><%=eo.getName() %></td>
	    		<td align="center" bordercolor="black"><%=vipflag==1?"VIP":"" %></td>
	    		<td align="center" bordercolor="black"><%=eo.getLinkphone() %></td>
	    		<td align="center" bordercolor="black"><%=(status==2?"已售票":(status==3?"已换登机牌" :(status==4?"已安检":(status==7?"已登机":"已退票"))))%></td>
	    	</tr>
    	<%
  	  } 
    %>
    </table>
    </form>
    </div>
  </body>
  <script type="text/javascript">
	function init(){
		window.setInterval("my()",20000);

	}
	function my(){
		document.forms[0].submit();
	
	}
	init();
</script>
</html>
