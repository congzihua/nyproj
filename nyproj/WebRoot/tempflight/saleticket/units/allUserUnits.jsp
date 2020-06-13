<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@page import="com.roc.enp.entity.BaFlight"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
String orderdate = request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?"":request.getAttribute("orderdate").toString();
String orderdate1 = request.getAttribute("orderdate1")==null||request.getAttribute("orderdate1").toString().trim().equals("")?"":request.getAttribute("orderdate1").toString();
String dur = orderdate+"-"+orderdate1;
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
		
  
  	function sp(data){
		var url = "<%=request.getContextPath()%>/clientAction.do?method=editSp&id="+data;
		window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
		document.forms[0].submit();
	}
	function dgpage(data){
		var url = "<%=request.getContextPath()%>/dJPAction.do?method=toDJPPage&id="+data;
		window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
		document.forms[0].submit();
	}
		var   HKEY_Root,HKEY_Path,HKEY_Key;  
	  HKEY_Root="HKEY_CURRENT_USER";  
	  HKEY_Path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";  
	  //设置网页打印的页眉页脚为空  
	  function   PageSetup_Null()  
	  {  var   Wsh=new   ActiveXObject("WScript.Shell");
			  try  
			  {  
			                  var   Wsh=new   ActiveXObject("WScript.Shell");  
				  HKEY_Key="header";  
				  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");  
				  HKEY_Key="footer";  
				  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"");  
			  }  
			  catch(e){}  
		  }  
  //设置网页打印的页眉页脚为默认值  
  function     PageSetup_Default()  
  {      
  try  
  {  
  var   Wsh=new   ActiveXObject("WScript.Shell");  
  HKEY_Key="header";  
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&w&b页码,&p/&P");  
  HKEY_Key="footer";  
  Wsh.RegWrite(HKEY_Root+HKEY_Path+HKEY_Key,"&u&b&d");  
  }  
  catch(e){}  
  }  

	
	function printCertificate(){
		if (confirm('确定打印吗？')) {
			document.getElementById("np").style.display='none';
			document.getElementById("myid").focus();  
			window.status ="";
			window.defaultstatus='';	
	  		window.print();
	  		document.getElementById("np").style.display="";
	　　}
	}
	</script>

<style>
table{
	border-collapse:collapse; border-color:#333333;
	font-size:14px;
}

td{height:30px; border-color:#333333; text-align:left; vertical-align:middle;	word-break:break-all;overflow:auto;}
th{height:30px; border-color:#333333; font-weight:normal;font-size:14px; text-align:center; vertical-align:middle;}
._span{
width:200px;margin-bottom:2px;border-bottom:1px solid black;
}
.FenLeiInfo{width:30px;background-color:#CCCCCC;text-align:center;}
.FenLeiInfo div{width:25px;}
.title{font-size:20px; font-family:黑体; text-align:center; letter-spacing:1px; line-height:25px;margin-top:30px}
.InputTd{ border-color:#333333;padding:8px;line-height:20px; font-size:13px;}
.flowno{border-color:gray;}
.zhuzquanren{height:40px; line-height:40px; font:12px; text-align:center;}
.zzqtitle{height:25px; line-height:25px; font:14px; text-align:center;}


.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCCFF; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
.printDiv{
	text-align:center;
	padding:10px 0px 0px 0px;
	border-bottom:2px solid #999999;
	background-color:#E8E8E8;}
	.Noprint{display:none;}
	.printBody{
	text-align:center;
	padding:10px 0px 0px 0px;}

</STYLE>
<SCRIPT language=JavaScript1.2>
<!--
function Show(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "visible";
divid.filters.revealTrans.play();
} 
function Hide(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "hidden";
divid.filters.revealTrans.play();
}
//-->
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}" style="text-align:center;">
 
  <form action="<%=request.getContextPath()%>/tfClientAction.do?method=ticketInfoUnits" method="post">
  
  
  
 <div id="np" align="center" class=""> 
  <div align="left" style="width: 1024"> 
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1">
	<tr><td>日期：</td><td><table border="0">
						        <td width="70%" >
						        <input id="orderdate" name="orderdate" width="100%" value="<%=orderdate %>" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	   </td> 
								</table>
	</td>
	<td align="center">至</td>
	<td nowrap="nowrap"> <table border="0">
						        <td width="70%" >
						        <input id="orderdate1" name="orderdate1" width="100%" value="<%=orderdate1 %>" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar2" /> </span>	 
						        	
						        	   </td> 
							
								</table>
	</td>
	<td><input type="submit" name="cx" value="查询"/> <input type="button" value="打印" onclick="printCertificate()"/></td>
	</tr>
</table>
</div>
</div>
<div id="myid"  style="margin:0 auto;width:630px;text-align:center;border:0px solid red">
<table width="100%" border="2" cellspacing="0" cellpadding="0" align="center">	
<tr>
   
    <td> 
    <table width="100%" border="1" cellspacing="0" cellpadding="0" frame="void">

 <tr bgcolor="#F0F0F0">
	 	<th  colspan="6">
	 	<span style="font-size:15px;text-shadow:Red;font-family:'黑体';"><%=dur %>信息统计</span>
	 	</th>
	 
	 </tr>
  <tr bgcolor="#F0F0F0">
     <th>序号</th>
     <th>日期</th>
    <th>航程</th>
    <th>张数</th>
  </tr>
  <%
  int totalNums = 0,i = 0;
  List<TempFlightinfo> opList  = request.getAttribute("list")==null?null:(List)request.getAttribute("list"); %>
 <%if(opList!=null) for(TempFlightinfo ot:opList){ %>
	  <tr bgcolor="#F0F0F0">
	  	<th><%=++i %></th>
	  	<th><%=format.format(ot.getFlightDate()) %></th>
	  	<th><%=ot.getFlightInfo()%></th>
	  	<th><%=ot.getOrderNum()%></th>
	  </tr>
  <% 
  	totalNums += ot.getOrderNum();
 	}
 %>
  <tr  bgcolor="#F0F0F0">
  	
	  	<th>合计：</th>
	  	<th>--</th>
	  	<th>--</th>
	  	<th><%=totalNums %></th>
  </tr>
 
  </table>
  </td>
  </tr>
  </table>

</div>
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