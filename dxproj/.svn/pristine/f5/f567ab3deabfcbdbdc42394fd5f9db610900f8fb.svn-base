<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.roc.syspe.entity.OpOrdertickets" />
<jsp:directive.page import="java.text.SimpleDateFormat;"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String flightDate=(String)request.getAttribute("odate");
HashMap<String, Object> frameMap=(HashMap<String, Object>)request.getAttribute("frameMap");
int shouPiao=(Integer)frameMap.get("shouPiao");
int huanPai=(Integer)frameMap.get("huanPai");
int jinCang=(Integer)frameMap.get("jinCang");
int jianShu=(Integer)frameMap.get("jianShu");
int zongZhong=(Integer)frameMap.get("zongZhong");
int safeCheckSum=(Integer)frameMap.get("safeCheckSum");
List<OpOrdertickets> pplist=(List<OpOrdertickets>)frameMap.get("pplist");
OpOrdertickets opo = pplist!=null&&pplist.size()>0?pplist.get(0):null;
String hbh=opo!=null?opo.getFlightNo():"";
String fn=opo!=null?opo.getFlight():"";
Date fdate=opo!=null?opo.getFlightDate():null;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String fd=fdate!=null?sdf.format(fdate):"";
String ft=opo!=null?opo.getFlyTime():"";
String act=(String)request.getAttribute("action");
String action="";
 if("2".equals(act)){
	action = "commandCenter.do?method=toMainPageContain2&orderdate="+flightDate;
}else if("3".equals(act)){
	action = "commandCenter.do?method=toMainPageContain02&orderdate="+flightDate;
}else if("1".equals(act)){
	action = "commandCenter.do?method=toMainPageContain1&orderdate="+flightDate;
}else{
	action = "commandCenter.do?method=toMainPageContain0&orderdate="+flightDate;
}


	
	
  	
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
    
    <title>My JSP 'CCContainPage.jsp' starting page</title>
    
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
			parent.document.getElementById("contain0").src="<%=request.getContextPath()%>/commandCenter.do?method=toMainPageContain00&orderdate=<%=flightDate %>";
		}
		
		function huanPai(){
			parent.document.getElementById("contain0").src="<%=request.getContextPath()%>/commandCenter.do?method=toMainPageContain01&orderdate=<%=flightDate %>";
		}
		
		function jinCang(){
			parent.document.getElementById("contain0").src="<%=request.getContextPath()%>/commandCenter.do?method=toMainPageContain02&orderdate=<%=flightDate %>";
		}
	
		function check()
		{	
			//FlightInfoDWR.batchAddFlightInfo(flight,flightName,flydate1,weeks,flydate2,flytime,onHandleM);
		}
		function onHandleM(data){
			if(data){
				alert("航班信息增加成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else{
				alert("航班信息增加失败！(请确认是否重复添加！)");
			}
		}

		
		</script>
  </head>
  
  <body background="<%=request.getContextPath()%>/image/bg.jpg">
    <%if(fdate!=null){ %>
    <div align="center">
   <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">目的地：</font> <FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222"> <%=fn %></font>&nbsp; &nbsp;<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">航班号：</font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=hbh %></FONT>&nbsp; &nbsp;<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">起飞时间：</font><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color: #b22222"><%=fd %>&nbsp;<%=ft %> 星期 <%=weeks%></font>
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
    		<th>姓名</th>
    		<th>VIP</th>
    		<th>联系方式</th>
    		<th>状态</th>
    	</tr>
    <%for(int i=0;i<pplist.size();i++){
    	OpOrdertickets eo =pplist.get(i);
    	int vipflag=Integer.parseInt(eo.getVipFlag());
    	int status=Integer.parseInt(eo.getStatus());
    	%>
    	<tr bgcolor="#FFFFFF">
    		<td align="center" bordercolor="black"><%=i+1 %></td>
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
