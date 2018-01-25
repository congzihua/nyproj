<%@page import="java.text.SimpleDateFormat"%>
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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
	
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

  </head>
  <%
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String currDate = format.format(new java.util.Date());
  %>
  <body oncontextmenu="if (!event.ctrlKey){return false;}">
 
	  <div id="np" align="center"> 
		  <div align="left" style="width: 1024"> 
				<form action="<%=request.getContextPath() %>/unitsDataAction.do?method=exceptionUnits"  method="post">
				<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1">
					<tr>				
					<td>日期从：</td><td><table border="0">
										        <td width="70%" >
										        <input id="startdate" name="startdate" width="100%" value="<%=request.getAttribute("startdate")==null||request.getAttribute("startdate").toString().trim().equals("")?currDate:request.getAttribute("startdate").toString() %>" readonly="readonly">        </td>
										        <td align="left">
										        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
										        	
										        	   </td> 
											
												</table>
					</td>
					<td>至：</td><td><table border="0">
										        <td width="70%" >
										        <input id="enddate" name="enddate" width="100%" value="<%=request.getAttribute("enddate")==null||request.getAttribute("enddate").toString().trim().equals("")?currDate:request.getAttribute("enddate").toString() %>" readonly="readonly">        </td>
										        <td align="left">
										        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar2" /> </span>	 
										        	
										        	   </td> 
											
												</table>
					</td>
					<td><input id="buttonId" type="submit" name="" value="查询" /></td>
					</tr>
				</table>
				</form>
		</div>
	</div>
  <div id="targetDiv" style="width: 100%">
  <div align="left">*以下为已售票没有打印登机牌或没有登机的乘客信息*</div>
  	<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr align="middle">
				<td valign="top" align="center">

					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="100%">
						<tr align="middle">
							<td background="<%=request.getContextPath()%>/images/bg_board.gif" height=25 width=10%>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=20% background="<%=request.getContextPath()%>/images/bg_board.gif">
								乘客姓名
							</td>
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
							航程
							</td>
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								电话
							</td>						
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								订票日期
							</td>
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								航班日期
							</td>
							
						</tr>
						
						<c:forEach var="item" items="${list}">
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox"
									 name="check_box" value="${item.id}"/>
                               
							</td>
							
							<td style="cursor:hand" width=20%>
								${item.name}
							</td>
							<td 
								style="cursor:hand" width="15%">
								${item.flight}
							</td>
							<td 
								style="cursor:hand" width="15%">
								${item.linkphone}
							</td>
							<td 
								style="cursor:hand" width="15%">
								<fmt:formatDate value="${item.flightDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td 
								style="cursor:hand" width="15%">
								<fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd"/>
							</td>
							
						</tr>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan='6' style="height:1"></TD>
						</TR>
						</c:forEach>
						
						
					</table>

				</td>
			</tr>
		</table>
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