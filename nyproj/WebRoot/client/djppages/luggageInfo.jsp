<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.roc.syspe.entity.BaTicketsalloc"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.roc.enp.entity.BaFlightKeyWord"%>
<%@page import="com.roc.sysmanager.base.service.FlightService"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
	<script type="text/javascript">
		
  
  	
	function dgpage(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgpageHandle);	
		
	}
	function xxInfo(data){
			var url = "<%=request.getContextPath()%>/clientAction.do?method=toXxinfoPage&id="+data+"&fid="+document.getElementById("fid").value;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 650px; help: no; scroll: no; status: no");
			
			
		
	}
	function dgpageHandle1(data){
		if(data){
			var url = "<%=request.getContextPath()%>/dJPAction.do?method=toDJPPage1&id="+idValue;
			//window.open(url);
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 550px; help: no; scroll: no; status: no");
			
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function dgpage1(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgpageHandle1);	
		
	}
	function sx(){
		document.forms[0].submit();
	}
	</script>
	<STYLE type="text/css">
<!--
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCCFF; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}

 .clearfix{zoom:1;}
.clearfix:after{content:'.';display:block;visibility:none;height:0;clear:both;}
#bd{background-color:#DDD}
#bd .right{background-color:red;float:right;width:100%;margin-left:-25em;}
#bd .right .content{margin-left:270px;background-color:blue;color:#FFF;}
#bd .left{background-color:green;color:#FFF;width:260px;float:left;}

body,html{
margin:0px;
}

-->
</STYLE>
<SCRIPT type="text/javascript">
function Show(divid) {
document.getElementById(divid).style.display="block";
} 
function Hide(divid) {
	document.getElementById(divid).style.display="none";
}
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}" background="<%=request.getContextPath()%>/image/bg.jpg">
 
 
  

  
 <div align="center" >
 
  <div align="left" style="width: 1024">  
 <form action="<%=request.getContextPath()%>/clientAction.do?method=toLuggInfo" method="post">
   <input id="fid" type="hidden" name="fid" value="<%=request.getAttribute("flightId")==null?"":Integer.valueOf(request.getAttribute("flightId").toString()) %>"/>
    <table border="0" width="1024" align="center">
    	<tr>
    		<th>目的地：</th>
    		<td nowrap="nowrap">
    		<select id="flightId" name="flightId">
    			<%for(BaFlight bf:list){ %>
    				<option value="<%=bf.getId()%>" <%=request.getAttribute("flightId")!=null&&request.getAttribute("flightId").toString().trim().equals(String.valueOf(bf.getId()))?"selected=\'selected\'":""%>><%=bf.getFlight()%></option>
    			<%}%>
    			</select>
    			
    			
										
										
    		</td>
    		<th align="right">日期：</th>
    		<td>
    		<table border="0">
						        <td width="70%" >
						        <input value="<%=date %>" id="orderdate" name="orderdate" width="100%" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
    		</td>
    		<th>起飞时间：</th>
    		<td>
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
    			<select name="minue">
    				<option value="00">00</option>
    				<option value="10">10</option>
    				<option value="20">20</option>
    				<option value="30">30</option>
    				<option value="40">40</option>
    				<option value="50">50</option>
    			</select>
    		</td>
    		<td><input type="submit" name="" value="查询"/></td>    		
    	</tr>
    
    </table>
    
    </form>
</div>
</div>
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">

	

  <tr bgcolor="#F0F0F0">
     <th>序号</th>
    <th>姓名</th>
    <th>证件类型</th>
    <th>证件号码</th> 
    <th>座位</th>    
    <th>VIP</th>
    <th>联系电话</th>
    <th>状态</th>  
    <th>团队名称</th>  
     <th>行李数</th>  
    
  </tr>
  <%int i = 0; %>
  <c:forEach var="item" items="${list}">
  <tr onclick="xxInfo(${item.id})" bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'">
     <td align="center"><%=++i %></td>
    <td align="center">${item.name}</td>
    <td align="center">${item.certType}</td>
   
    <td align="center">${item.certNo}</td>
    <td align="center">${item.seatNum}</td>
    <td align="center"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center">${item.linkphone}</td>
    <td align="center">
   <c:if test="${item.status==0}">订 &nbsp; 票</c:if>
    <c:if test="${item.status==1}">确认订票</c:if>
    <c:if test="${item.status==2}">已售票</c:if>
    <c:if test="${item.status==3}">换登机牌</c:if>
    <c:if test="${item.status==4}">已安检</c:if>
     <c:if test="${item.status==7}">已登机</c:if>
   	<c:if test="${item.status==8}">已退订</c:if>
    <c:if test="${item.status==9}">已退票</c:if> 
    </td>
    <td align="center">
    <c:if test="${item.teamflag==1}">${item.teamName}</c:if>
    <c:if test="${item.teamflag==0}">&nbsp;</c:if>
    </td>
    <td align="center">
    	${item.luggSum}
    </td>
  </tr>
  
  </c:forEach>
</table>
</form>  
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