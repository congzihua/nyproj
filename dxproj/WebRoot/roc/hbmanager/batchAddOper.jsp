<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page import="com.roc.sysmanager.base.service.FlightService" />
<jsp:directive.page import="com.roc.enp.entity.BaFlightKeyWord" />
<jsp:directive.page import="com.roc.enp.entity.BaFlight" />
<jsp:directive.page import="java.util.*" />
<%
String parentid = request.getParameter("id");
String path = request.getContextPath();
BaFlightKeyWord bfkw=new BaFlightKeyWord();
List<BaFlight> list=new FlightService().queryBaFlight(bfkw);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
			<title>批量新建航班信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
		<script type='text/javascript' src='<%=path %>/dwr/interface/FlightInfoDWR.js'> </script>
		<script type="text/javascript">
		function check()
		{	
			var weeks="";
			var flight = document.getElementById("flight").value;
			var flightName =document.getElementById("flight").options[window.document.getElementById("flight").selectedIndex].text;
			
			var flydate1 = document.getElementById("flydate1").value;
			var weekfilter=document.getElementsByName("week");
			var flydate2 = document.getElementById("flydate2").value;
			if(flydate1==null||flydate1==""){
				alert('请填写开始日期！');
				return;
			}
			var num=0;
			for(var i=0;i<weekfilter.length;i++){
				if(weekfilter[i].checked){
					num++;
				}
			}
			if(weekfilter==null||num==0){
				alert('请您正确的选择星期！(在开始日期到结束日期之间根据具体星期过滤)');
				return;
			}
			if(flydate2==null||flydate2==""){
				alert('请填写结束日期！');
				return;
			}
			for(var i=0;i<weekfilter.length;i++){
				if(weekfilter[i].checked){
					weeks+=weekfilter[i].value+";";
				}
			}
			var flyhour=document.getElementById("flyhour").value;
			var flyminute=document.getElementById("flyminute").value;
			var flytime=flyhour+":"+flyminute;
			FlightInfoDWR.batchAddFlightInfo(flight,flightName,flydate1,weeks,flydate2,flytime,onHandleM);
		}
		function onHandleM(data){
			if(data){
				alert("航班信息增加成功！");
				window.location.href ="<%=request.getContextPath()%>/flightInfoAction.do?method=list";
			}else{
				alert("航班信息增加失败！(请确认是否重复添加！)");
			}
		}

		
		</script>
	</head>
	<body>
	<div align="center">
			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr>
								
									<td >
										航程信息:

										
									</td>
									<td colspan="3" align="left">
									<select name="flight" id="flight">
											<c:forEach var="f" items="<%=list%>">
													<option value="${f.id}">${f.flight}
											</c:forEach>
									</select>
										<font color='red'>*</font>
									</td>
								</tr>
								
								<tr>
								
									<td>
										起飞时间:

										
									</td>
									<td colspan="3" align="left">
										<select name="flyhour" id ="flyhour">
							    				<option value="07">07</option>
							    				<option value="08">08</option>
							    				<option value="09">09</option>
							    				<option value="10">10</option>
							    				<option value="11">11</option>
							    				<option value="12"  selected="selected">12</option>
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
										<select name="flyminute" id="flyminute">
							    				<option value="00">00</option>    				
							    				<option value="10">10</option>    				
							    				<option value="20">20</option>    				
							    				<option value="30"  selected="selected">30</option>    				
							    				<option value="40">40</option>    				
							    				<option value="50">50</option> 
										</select>
										<font color='red'>*</font>
									</td>
								</tr>
								
								<tr>
									<td>
										开始日期:
									</td>
									<td align="left">
									<table border="0">
									<tr>
						        <td>
						        <input value="" name="flydate" id="flydate1" width="100%" readonly="readonly">        </td>
						        <td>
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	<font color='red'>*</font> 
						        	   </td> 
									</tr>
								</table>
									</td>
								</tr>
								<tr>
									<td>
									 星期过滤
									</td>
									<td>
									<input type="checkbox" value="2"
									id="mon" name="week" />周一
									<input type="checkbox" value="3"
									id="tue" name="week" />周二
									<input type="checkbox" value="4"
									id="wed" name="week" />周三
									<input type="checkbox" value="5"
									id="thu" name="week" />周四
									<input type="checkbox" value="6"
									id="fri" name="week" />周五
									<input type="checkbox" value="7"
									id="sat" name="week" />周六
									<input type="checkbox" value="1"
									id="sun" name="week" />周日
									</td>
								</tr>
								<tr>
									<td>
										结束日期:
									</td>
									<td align="left">
									<table border="0">
									<tr>
						        <td>
						        <input value="" name="flydate" id="flydate2" width="100%" readonly="readonly">        </td>
						        <td>
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar2" /> </span>	 
						        	<font color='red'>*</font> 
						        	   </td> 
									</tr>
								</table>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<html:submit property="submit" styleClass="button2"
											value=" 保存" onclick="return check();" />
										<html:reset styleClass="button2" value=" 重置 " />
									</td>
								</tr>
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
    inputField        : "flydate1",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "flydate2",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  
  //-->
</SCRIPT>
