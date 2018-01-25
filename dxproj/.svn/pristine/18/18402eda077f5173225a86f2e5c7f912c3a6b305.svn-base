<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.roc.syspe.entity.BaTicketsalloc"%>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
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
			<script defer language="javascript" charset="gbk" 
	src="<%=request.getContextPath() %>/js/printIframeAutoSize.js"></script>
	
<script defer language="javascript" charset="gbk" 
	src="<%=request.getContextPath() %>/js/suporsub.js"></script>
	<script type="text/javascript">
	var contextPath="";
    var galaxyUserFaceKey="";	
  
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
	<STYLE type="text/css">
<!--
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCCFF; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->
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
function printCertificate(){
		if (confirm('确定打印统计页面吗？')) { 
	　　		//window.print();
			document.getElementById("np").style.display='none';
			document.getElementById("myid1").style.display='none';
			document.getElementById("myid").focus();  
			//PageSetup_Null();	
			window.status ="";
			window.defaultstatus='';	
			//PageSetup_Default()  
			
		
		 	window.print();

							 
	  		
	  		document.getElementById("np").style.display="";
	  		document.getElementById("myid1").style.display='';
	　　}
	}
	function printInfoList(){
		if (confirm('确定打印明细吗？')) { 
	　　		//window.print();
			document.getElementById("np").style.display='none';
			document.getElementById("myid").style.display='none';
			document.getElementById("myid1").focus();  
			//PageSetup_Null();	
			window.status ="";
			window.defaultstatus='';	
			//PageSetup_Default() 
			window.print();
	  		document.getElementById("np").style.display="";
	  		document.getElementById("myid").style.display='';
	　　}
	}
//-->
</script>
<style media=print>    
.Noprint{display:none;}    
.PageNext{page-break-after: always;}    
</style> 
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}">
  <div align="center" > 
 <div id="np" align="center" style="height:31;border:1px solid red"> 
  <div align="left" style="height:30;width: 1024"> 
  <form action="<%=request.getContextPath()%>/clientAction.do?method=seleUserOperLogUnits" method="post">
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1">
	<tr><td>日期：</td><td><table border="0">
						        <td width="70%" >
						        <input id="orderdate" name="orderdate" width="100%" value="<%=request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?"":request.getAttribute("orderdate").toString()%>" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
	</td>
	<td><input type="submit" name="" value="查询"/> <input type="button" value="打印" onclick="printCertificate()"/><input type="button" value="明细打印" onclick="printInfoList()"/></td>
	</tr>
</table>
</form> 
</div>
</div>
<div align="center" style="border:1px solid red;height:720px;overflow-y:auto;width:  96%;top: 0px;margin: 0px">
<div id="myid" align="center" style="overflow-y:auto;width:630px;text-align:center;border:1px solid red" >
<table width="100%" border="2" cellspacing="0" cellpadding="0" align="center">	
<tr>
   
    <td> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" frame="void">

	 <tr bgcolor="#F0F0F0">
	 	<th align="center" colspan="6">
	 	<span style="font-size:15px;text-shadow:Red;font-family:'黑体';"><%=request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?"":request.getAttribute("orderdate").toString() %>售票信息统计</span>
	 	</th>
	 
	 </tr>

  <tr bgcolor="#F0F0F0">
     <th>序号</th>
    <th>目的地</th>
    <th>票价类型</th>
    <th>单价</th>      
    <th>张数</th>
    <th>小计</th>
    
    
  </tr>
  <%int i = 0,nums=0;Double pjxj = 0.0D,total = 0.0D;
  List<OpOrdertickets> list = request.getAttribute("countList")==null?null:(List<OpOrdertickets>)request.getAttribute("countList");
  List<OpOrdertickets> list1 = request.getAttribute("countList1")==null?null:(List<OpOrdertickets>)request.getAttribute("countList1");
   %>
 <%if(list!=null) for(OpOrdertickets ot:list){ %>
 <%
	nums+= ot.getCounts();
	pjxj = Double.valueOf(ot.getCounts()*ot.getRealAmount());
	total+= pjxj;
 %>
	  <tr bgcolor="#F0F0F0">
	  	<td align="center"><%=++i %></td>
	  	<td align="center"><%=ot.getFlight()%></td>
	  	<td align="center"><%=ot.getDiscountType()%></td>
	  	<td align="center"><%=ot.getRealAmount()%></td>
	  	<td align="center"><%=ot.getCounts()%></td>
	  	<td align="center" ><%=pjxj%></td>
	  </tr>
  <%} %>
  <%if(list1!=null) for(OpOrdertickets ot:list1){ %>
 <%
	nums+= ot.getCounts();
	pjxj = Double.valueOf(ot.getCounts()*ot.getRealAmount());
	total-= pjxj;
 %>
	  <tr bgcolor="#F0F0F0">
	  	<td align="center"><%=++i %></td>
	  	<td align="center"><%=ot.getFlight()%></td>
	  	<td align="center"><%=ot.getDiscountType()%></td>
	  	<td align="center"><%=ot.getRealAmount()%></td>
	  	<td align="center"><%=ot.getCounts()%></td>
	  	<td align="center" style="color: red"><%=-pjxj%></td>
	  </tr>
  <%} %>
  <tr  bgcolor="#F0F0F0">
  	
	  	<td align="center">合计：</td>
	  	<td align="center">--</td>
	  	<td align="center">--</td>
	  	<td align="center">--</td>
	  	<td align="center"><%=nums%></td>
	  	<td align="center" <%=total<0?"style='color: red'":""%>><%=total%></td>
	 
  </tr>
  </table>
  </td>
  </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">	
<tr valign="top">
	<td width="40%" valign="top">&nbsp;</td>
	<td width="30%" valign="top">收款人：</td>
	<td width="30%" valign="top">售票人：</td>
	
</tr>
</table>
</div>
<div id="myid1" align="center" style="overflow-y:auto;width:630px;text-align:center;border:0px solid red" >
<table width="100%" border="2" cellspacing="0" cellpadding="0" align="center">	
<tr>
   
    <td> 
<table width="100%" border="1" cellspacing="0" cellpadding="0" frame="void">
<tr bgcolor="#F0F0F0">
	<th align="center" colspan="16">
	 	<span style="font-size:15px;text-shadow:Red;font-family:'黑体';">
	 	<%=request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?"":request.getAttribute("orderdate").toString() %>信息明细</span>
	</th>
</tr>
  <tr bgcolor="#F0F0F0">
     <th>序号</th>
    <th>姓名</th>
    <th>证件类型</th>
    <th>证件号码</th>      
    <th>VIP</th>
    <th>联系电话</th>
    <th>票价</th>    
    <th>备注</th>
    
  </tr>
  <%int ii = 0,pageNum = 0; %>
  <c:forEach var="item" items="${userUnitInList}">
  <tr bgcolor="#FFFFFF">
     <td align="center"><%=++ii %></td>
    <td align="center">${item.name}</td>
    <td align="center">${item.certType}</td>
   
    <td align="center">${item.certNo}</td>
   
    <td align="center"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center">${item.linkphone}</td>
    <td align="center">
    ${item.realAmount}    
    </td>
    
    <td align="center">
       ${item.remark} 
    
    </td>
    
  </tr>
  <%if(ii>0 && (ii%20)<1){%>
   <tr bgcolor="#FFFFFF"><td colspan="10">
 <p align="center" style="font-size:14px">第<%=++pageNum %>页</p>
<br style="page-break-after:always">
<!-- define some variables used in js file -->
<script>
	
    var contextPath="";
    var galaxyUserFaceKey="";
</script>

</td>
</tr>					

  <%} %>
  </c:forEach>
  <c:forEach var="item" items="${userUnitInList1}">
  <tr bgcolor="#FFFFFF">
     <td align="center"><%=++ii %></td>
    <td align="center">${item.name}</td>
    <td align="center">${item.certType}</td>
   
    <td align="center">${item.certNo}</td>
   
    <td align="center"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center">${item.linkphone}</td>
    <td align="center" style="color: red">
    -${item.realAmount}    
    </td>
    <td align="center">
     ${item.remark}   
    </td>
    
   
    
    
  </tr>
 
  <%out.println(ii%20); if(ii>0 && (ii%20)<1){%>
   <tr bgcolor="#FFFFFF"><td colspan="10">
 <p align="center" style="font-size:14px">第<%=++pageNum %>页</p>
<br style="page-break-after:always">
<!-- define some variables used in js file -->
<script>
	var contextPath="";
    var galaxyUserFaceKey="";
</script>
</td>
</tr>					

<%}%>
  </c:forEach>
</table>
</td>
</tr>
</table>
</div>
</div>
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