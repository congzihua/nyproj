<%@page import="com.tempflight.service.TempClienService"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	String id = request.getParameter("id") == null?"":request.getParameter("id");
 	String startAddress = "北京南郊";
 	String gate = "1";
	TempFlightinfo flightinfo = new TempFlightinfo();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String date = format.format(new Date());
 	if (!id.equals("")) {
 		TempClienService service = new TempClienService();
 		flightinfo = service.tempFlightInfoById(Integer.valueOf(id));
 		if (flightinfo != null) {
 			startAddress = flightinfo.getOrigin();
 			gate = flightinfo.getGateNo();
 			date = format.format(flightinfo.getFlightDate());
 		}
 	}
	String[] hourandmin = flightinfo.getFlyTime()==null||flightinfo.getFlyTime().equals("")?null:flightinfo.getFlyTime().split(":");
 	String hour = hourandmin==null||hourandmin.length<2?"09":hourandmin[0];
 	String minute = hourandmin==null||hourandmin.length<2?"00":hourandmin[1]; 	
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 	
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
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/TfSysmanagerDWR.js'> </script>
	<script type="text/javascript">
		function save() {
			var id = document.getElementById("id").value;
			var origin = document.getElementById("origin").value;
			var flightInfo = document.getElementById("flightInfo").value;
			var flightNo = document.getElementById("flightNo").value;
			
			var gateNo = document.getElementById("gateNo").value;
			var flightDate = document.getElementById("flightDate").value;
			var flyhour = document.getElementById("flyhour").value;
			var flyminute = document.getElementById("flyminute").value;
			var flyTime = flyhour+":"+flyminute;
			if (origin == null || origin == "") {
				alert("请填写起飞地点");
				return;
			}
			if (flightInfo == null || flightInfo == "") {
				alert("请填写航程");
				return;
			}
			
			if (flightNo == null || flightNo == "") {
				alert("请填写航班号");
				return;
			}
			if (gateNo == null || gateNo == "") {
				alert("请填写登机口");
				return;
			}
			TfSysmanagerDWR.updateOrAddTempFlightinfo(id,origin,flightInfo,flightNo,gateNo,flightDate,flyTime,saveHandle)
		}
		function saveHandle(id) {
			if (id > 0) {
				alert("保存成功");
				window.close();
			}else if (id == -2 || id == -3) {
				alert("航班日期重复，请核对航班");
			}else {
				alert("保存失败");
			}
		}
		
	</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
		详细信息
		</FONT>
		</div>
	<form action="" method="post" >&nbsp;  
	<input id="id" name="id" type="hidden" value="<%=id%>"/>
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  
  <tr bgcolor="#FFFFFF">.
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">起飞地点</FONT></td>
    <td  nowrap="nowrap">
    	<input id="origin" name="origin" type="text" value="<%=startAddress%>"/>
    </td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">航程</FONT></td>
    <td ><input id="flightInfo" name="flightInfo" type="text" value="<%=flightinfo.getFlightInfo() == null?"":flightinfo.getFlightInfo()%>"/></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">航班号</FONT></td>
    <td  nowrap="nowrap">
    	<input id="flightNo" name="flightNo" type="text" value="<%=flightinfo.getFlightNo() == null?"":flightinfo.getFlightNo()%>"/>
    </td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机口</FONT></td>
    <td ><input id="gateNo" name="gateNo" type="text" value="<%=gate%>"/></td>
  </tr>
    <tr bgcolor="#FFFFFF">
   <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">起飞日期</FONT></td>
    <td  nowrap="nowrap">
    	<table border="0">
			 <td width="70%" >
				<input id="flightDate" name="flightDate" type="text" value="<%=date %>" readonly="readonly"/>        </td>
			<td align="left">
				<span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
			 </td> 
		</table>
    	
    </td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机时间</FONT></td>
    <td >
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
</table>
</form>
<div align="center">
	<input type="button" id="bc" name="bc" value="保存" onclick="save();"/>
	<input type="button" id="cl" name="cl" value="关 闭" onclick="window.close();"/>
</div>
  </body>
</html>
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "flightDate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   
  
  //-->
</SCRIPT>
