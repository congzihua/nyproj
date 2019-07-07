<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	OpOrdertickets flightinfo = (OpOrdertickets)request.getAttribute("flightinfo");
	java.util.List<BaTicketpoint> tpList = (java.util.List<BaTicketpoint>)request.getAttribute("tpList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
 	String[] hourandmin = flightinfo.getFlyTime().split(":");
 	String hour = hourandmin[0];
 	String minute = hourandmin[1];
 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 	String currentDate = format.format(new Date());
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 	Integer status = Integer.valueOf(flightinfo.getStatus());
 	if(status > 1){
 		status = 9;
 	}else{
 		status = 8;
 	}
 	
  	java.util.Date date = flightinfo.getFlightDate();
  	java.util.Calendar c = java.util.Calendar.getInstance();
  	c.setTime(date);
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
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
	
	
	

		<STYLE type="text/css">
<!--
.tearea{overflow-y:auto;padding:0;width:120px;height:30px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
.btn2 {padding: 2 4 0 4;font-size:12px;height:23;background-color:#ece9d8;border-width:1;}


-->
</STYLE>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
<SCRIPT language=JavaScript1.2>
<!--
function selectAll1(data){
	var isSele = document.getElementById("checkId");
	var cAll = document.getElementsByName(check_name);
	
	if(isSele.checked){
		for(var i = 0;i<data;i++){
			cAll[i].checked='checked';
		}
	}else{
		for(var i = 0;i<data;i++){
			cAll[i].checked='';
		}
	}
   
}

function check(data)
		{	   
			var flydate = document.getElementById("flydate");	
			var ids = "",ticketsPoint="";		
			if(flydate.value < '<%=currentDate%>'){
				if(window.confirm("您选择的日期小于当前日期，您确定要改签到此日期吗？")){
					
				}else{
					flydate.focus();										
					return;
				}
			}	
			var tpd = document.getElementsByName("ticketpointId");
			var nodes = document.getElementsByName(check_name);
		     var len=0;
			 for (var i = 0; i < data; i++)
		     {
		        if (nodes[i].checked)
		        {
		        	len++;
		        	ids+=nodes[i].value+";";
		        	ticketsPoint+=tpd[i].value+";";
		        }
		     }		
			document.getElementById("bt1").disabled="disabled";
			document.getElementById("bt2").disabled="disabled";
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			if(len==0){
				alert("请选择要改签的记录！");
				document.getElementById("bt1").disabled="";
				document.getElementById("bt2").disabled="";
				return;
			}
			
			
			return
			SysmanagerDWR.teamDateUpdate(ids,document.getElementById("flightId").value,ticketsPoint,'<%=auth.getUserid()%>',flydate.value,flyhour.value+":"+flyminute.value,document.getElementById("status").value,onHandleM);		
		}
		

//-->
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	
	
	<form action="<%=request.getContextPath()%>/clientAction.do?method=saltTeamsTicket" method="post" target="_self">&nbsp;  
	<table id="listtable" width="99%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
 
 <%List<OpOrdertickets> list = (List<OpOrdertickets>)request.getAttribute("list");
		int size = list.size(); %>
		&nbsp; <input type="button" id="bt1" name="bt1" onclick="check(<%=size%>);" class="btn2" value="改 签" />
  	
  	</font>
  	 <tr bgcolor="#DFFFDF" style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
    <input type="hidden" id="flightId" name="flightId" value="${flightinfo.flightId}"/>
    <input type="hidden" id="status"  name="status" value="${flightinfo.status}"/>
    <td colspan="3">航程：${flightinfo.flight}</td>
         <td colspan="1">乘机日期：</td> 
         <td colspan="2"><table border="0">
									<tr>
						        <td>
						        <input value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>" name="flydate" id="flydate" width="100%" readonly="readonly"/>        </td>
						        <td>
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
									</tr>
								</table>
	</td>
	<td>起飞时间：</td>
	<td colspan="2">
		<select id="flyhour" name="flyhour">
		    
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
		   

										</select>
	</td>
	
    
  </tr>
  <tr bgcolor="#F0F0F0">
     <th width="80px" nowrap="nowrap"><input id="checkId" type="checkbox" onclick="selectAll1(<%=size%>);" />全选</th>
	 <th width="10%">姓名</th>
     <th width="10%">证件类型</th>
    <th width="12%">证件号码</th>
    
    <th width="11%">联系电话</th>
    <th width="8%">VIP</th>    
    <th width="10%">订票点</th>
    
   
	<th width="15%">团队名称</th>
	<th width="15%">备注</th> 
  </tr>
	<%
		int k = 0;
		for(OpOrdertickets opt :list){
	 %>
	
	
  <tr bgcolor="#DFFFDF" onmouseout="this.bgColor='#DFFFDF'" onmouseover="this.bgColor='ffcccc'">
   <td width="80px" align="center">
<input type="checkbox"  id="check<%=opt.getId()%>" name="check_box" value="<%=opt.getId()%>"/>

	</td>
    <td width="10%"><%=opt.getName()%></td>
    
    <td width="10%"><select  name="certType" style="width: 90px" disabled="disabled">
		
		<option value="身份证" <%=opt.getCertType()!=null && opt.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=opt.getCertType()!=null && opt.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=opt.getCertType()!=null && opt.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=opt.getCertType()!=null && opt.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=opt.getCertType()!=null && opt.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>    
    <td width="12%"><%=opt.getCertNo()%></td>   
    <td width="11%"><%=opt.getLinkphone()%></td>   
    <td width="10%"><select name="vipFlag" style="width:50px" disabled="disabled">
			<option value="0"  <%=opt.getVipFlag()!=null && opt.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=opt.getVipFlag()!=null && opt.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    
    <td width="15%">
    <input type="hidden" name="ticketpointId" value="<%=opt.getTicketpointId()%>"/>
    <select style="width: 90px" disabled="disabled">
			<%for(BaTicketpoint tp: tpList){ %>
				<option value="<%=tp.getId() %>" <%=tp.getId().equals(opt.getTicketpointId())?"selected='selected'":""%>><%=tp.getName()%></option>
			<%}%>			
		</select></td>
  
   
   
   
   
 
    
   
	<td width="8%"><%=opt.getTeamName()==null?"":opt.getTeamName()%></td>
   
    <td ><%=opt.getRemark()==null?"":opt.getRemark()%></td>
  </tr>
		
		


<%k++;} %>
</table>
</form>
<font>&nbsp; <input type="button" id="bt2" name="bt" class="btn2" value="改签" onclick="check(<%=size%>)"/>
 
 
  </body>
</html>
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "flydate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   
  
  //-->
</SCRIPT>
