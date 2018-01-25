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
	<script type="text/javascript">
		
  
  	function check(){
  	    var im = document.getElementById("im");
  	    var orderdate = document.getElementById("orderdate");
		if(im.value==null || im.value==''){
			alert('请填写员工号！');
			im.focus();
			return;
		}
		if(orderdate.value==null || orderdate.value==''){
			alert('请选择日期！');
			orderdate.focus();
			return;
		}
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

	function check(){
		var startdate = document.getElementById("startdate").value;
		var enddate = document.getElementById("enddate").value;
		if(startdate == null || startdate ==''){
			alert("请输入起始时间！");
			return;
		}
		if(enddate==null || enddate == ''){
			alert("请输入结束日期！");
			return;
		}
		if(enddate<startdate){
			alert("您选择的日期开始时间应小于结束时间！");
			return;
		}
		if(window.confirm("导出统计数据需要几分钟您确定要导出吗？")){
			//document.getElementById("buttonId").disabled="disabled";
			var url = "<%=request.getContextPath()%>/unitsDataAction.do?method=exportUnitsData&startdate="+startdate+"&enddate="+enddate;
			window.open(url,"targetDiv");
		}
		return;
	}
//-->
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}">
 
	  <div id="np" align="center"> 
		  <div align="left" style="width: 1024"> 
				<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1">
					<tr>				
					<td>日期从：</td><td><table border="0">
										        <td width="70%" >
										        <input id="startdate" name="startdate" width="100%" value="<%=request.getAttribute("startdate")==null||request.getAttribute("startdate").toString().trim().equals("")?"":request.getAttribute("startdate").toString() %>" readonly="readonly">        </td>
										        <td align="left">
										        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
										        	
										        	   </td> 
											
												</table>
					</td>
					<td>至：</td><td><table border="0">
										        <td width="70%" >
										        <input id="enddate" name="enddate" width="100%" value="${enddate}" readonly="readonly">        </td>
										        <td align="left">
										        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar2" /> </span>	 
										        	
										        	   </td> 
											
												</table>
					</td>
					<td><input id="buttonId" type="button" name="" value="导出统计文件" onclick="check();"/></td>
					</tr>
				</table>
		</div>
	</div>
  <div id="targetDiv" style="width: 100%;height: 20%">
  
  </div>
</body>
</html>
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "startdate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "enddate",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  
  //-->
</SCRIPT>