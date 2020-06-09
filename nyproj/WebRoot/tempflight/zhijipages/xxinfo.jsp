<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	TempOrdertickets orderInfo = (TempOrdertickets)request.getAttribute("orderInfo");
 	TempFlightinfo flightinfo = (TempFlightinfo)request.getAttribute("flightinfo");
	String[] hourandmin = flightinfo.getFlyTime()==null||flightinfo.getFlyTime().equals("")?null:flightinfo.getFlyTime().split(":");
 	String hour = hourandmin==null||hourandmin.length<2?"09":hourandmin[0];
 	String minute = hourandmin==null||hourandmin.length<2?"00":hourandmin[1]; 	
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 	Integer status = Integer.valueOf(orderInfo.getStatus()); 	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<STYLE type="text/css">
<!--
.tearea{overflow-y:auto;padding:0;width:99%;height:70px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->
</STYLE>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
		详细信息
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/clientAction.do?method=editOrderInfo" method="post" target="dspBottom">&nbsp;  
	
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  
  <tr bgcolor="#FFFFFF">
    
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">座位：</FONT></td>
    <td width="18%" nowrap="nowrap">${orderInfo.seatNum}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机口：</FONT></td>
    <td width="18%">${orderInfo.gate}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机时间：</FONT></td>
    <td width="18%">
    <select id="flyhour" name="flyhour">
		   
		<option value="06" <%if("06".equals(hour)){ %>selected="selected"<%} %>>06</option>     
		<option value="07" <%if("07".equals(hour)){ %>selected="selected"<%} %>>07</option>     
		<option value="08" <%if("08".equals(hour)){ %>selected="selected"<%} %>>08</option>     
		<option value="09" <%if("09".equals(hour)){ %>selected="selected"<%} %>>09</option>     
		<option value="10" <%if("10".equals(hour)){ %>selected="selected"<%} %>>10</option>     
		<option value="11" <%if("11".equals(hour)){ %>selected="selected"<%} %>>11</option>     
		<option value="12" <%if("12".equals(hour)){ %>selected="selected"<%} %>>12</option>     
		<option value="13" <%if("13".equals(hour)){ %>selected="selected"<%} %>>13</option>     
		<option value="14" <%if("14".equals(hour)){ %>selected="selected"<%} %>>14</option>     
		<option value="15" <%if("15".equals(hour)){ %>selected="selected"<%} %>>15</option>     
		<option value="16" <%if("16".equals(hour)){ %>selected="selected"<%} %>>16</option>     
		<option value="17" <%if("17".equals(hour)){ %>selected="selected"<%} %>>17</option>     
		<option value="18" <%if("18".equals(hour)){ %>selected="selected"<%} %>>18</option>     
		<option value="19" <%if("19".equals(hour)){ %>selected="selected"<%} %>>19</option>     
		<option value="20" <%if("20".equals(hour)){ %>selected="selected"<%} %>>20</option>     
		   
</select>                                                                                   
:                                                                                           
<select id="flyminute" name="flyminute">                                                                   
		<option value="00" <%if("00".equals(minute)){ %>selected="selected"<%} %>>00</option>   
		   
		<option value="10" <%if("10".equals(minute)){ %>selected="selected"<%} %>>10</option>   
		   
		<option value="20" <%if("20".equals(minute)){ %>selected="selected"<%} %>>20</option>   
		
		<option value="30" <%if("30".equals(minute)){ %>selected="selected"<%} %>>30</option>   
		
		<option value="40" <%if("40".equals(minute)){ %>selected="selected"<%} %>>40</option>   
		   
		<option value="50" <%if("50".equals(minute)){ %>selected="selected"<%} %>>50</option>   
		</select></td>
  </tr>
    <tr bgcolor="#FFFFFF">
   <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李数：</FONT></td>
    <td width="18%">${orderInfo.luggSum}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李重量：</FONT></td>
    <td width="18%">${orderInfo.weightSum}</td>
    <td align="center"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李编号：</FONT></td>
    <td align="center" style="size: 16pt"><textarea class="tearea" readonly="readonly">${orderInfo.bagNum}</textarea></td>
   </tr> 
  
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">目的地：</FONT></td>
    <td width="18%"><input type="text" id="flightTo" name="flightTo" value="${orderInfo.flightInfo}" readonly="readonly"/></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">乘机日期：</FONT></td>
    <td width="18%"><table border="0">
									<tr>
						        <td>
						        <input value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>" name="flydate" id="flydate" width="100%" readonly="readonly"/>        </td>
						       
									</tr>
								</table></td>
     <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">起飞时间：</FONT></td>
    
	<td width="18%">
		${flightinfo.flyTime}
	</td>
	
    
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">姓名：</FONT></td>
    <td width="18%"><input type="text" id="name" name="name" value="${orderInfo.name}" readonly="readonly"/></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件类型：</FONT></td>
    <td width="18%">${orderInfo.certType}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件号码：</FONT></td>
    <td width="18%"><input type="text" id="certNo" name="certNo" value="${orderInfo.certNo}"/></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
  <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">航班号：</FONT>
    </td>
	<td width="18%">${flightinfo.flightNo}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">联系电话：</FONT></td>
    <td width="18%">${orderInfo.linkphone}</td>
   <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">VIP：</FONT></td>
    <td width="18%"><select name="vipFlag" id="vipFlag" style="width: 96%" disabled="disabled">
			<option value="0"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
  </tr> 
   
   
  <tr bgcolor="#FFFFFF">
    <td height="70" align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">备注：</FONT></td>
    <td colspan="5"><textarea id="remark" name="remark" class="tearea" readonly="readonly">${orderInfo.remark}</textarea></td>
  </tr>
</table>
</form>
<div align="center">
	
	<input type="button" id="cl" name="cl" value="关 闭" onclick="window.close();"/>
</div>
  </body>
</html>
