<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!-- define some taglibs -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>打印预览</title>
<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css"/>
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
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-before:always;}    
</style>  

<style type="text/css">



body{margin:0px; text-align:left; font-size:14px; background-color:#E8E8E8;}
.printDiv{
	text-align:center;
	padding:10px 0px 0px 0px;
	border-bottom:2px solid #999999;
	background-color:#E8E8E8;}
.printBody{
	text-align:center;
	padding:10px 0px 0px 0px;}
</style>
<script language="javascript" charset="UTF-8" src="<%=request.getContextPath()%>/js/prototype.js"></script>
<script language="javascript" defer>
function printCertificate(){
	if (confirm('确定打印统计信息吗？')) { 
　　		//window.print();
		printIframe.document.getElementById("myid").style.display='';
		printIframe.document.getElementById('tnd').style.display='none';
		printIframe.focus();   
  		window.print();
  		printIframe.document.getElementById('tnd').style.display='';
　　}
}

	function printInfoList(){
		if (confirm('确定打印明细吗？')) { 
	　　		//window.print();
			printIframe.document.getElementById('tnd').style.display='';
			printIframe.document.getElementById("myid").style.display='none';
			printIframe.focus();   
  			window.print();	  		
	  		printIframe.document.getElementById("myid").style.display='';
	　　}
	}
</script>
</head>

<body>
<div class="printDiv Noprint">
<div id="np" align="center" style="height:31;border:0px"> 
  <div align="left" style="height:30;width: 1024"> 
  <form action="<%=request.getContextPath()%>/clientAction.do?method=seleUserOperLogUnits" method="post" target="printIframe">
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1">
	<tr><td>日期：</td><td><table border="0">
						        <td width="70%" >
						        <input id="orderdate" name="orderdate" width="100%" value="<%=request.getAttribute("orderdate")==null||request.getAttribute("orderdate").toString().trim().equals("")?"":request.getAttribute("orderdate").toString()%>" readonly="readonly">        </td>
						        <td align="left">
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
							
								</table>
	</td>
	<td><input type="submit" name="" value="查询"/> <input type="button" value="统计表打印" onclick="printCertificate()"/> &nbsp; <input type="button" value="明细打印" onclick="printInfoList()"/><input type="button" name="" value="关闭" onclick="javascript:window.close();"/></td>
	</tr>
</table>
</form> 
</div>
</div>
</div>

<div id="iframeDiv" class="printBody">
	<iframe id="printIframe" name="printIframe" frameborder="0" scrolling="auto"
		src="" style="height:580px;width:100%;border:1px solid #336699; "></iframe>
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
