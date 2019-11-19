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
<SCRIPT language=JavaScript1.2>
<!--
window.name="mypage";
function check(data,status)
		{	      
			var flydate = document.getElementById("flydate");			
			if(flydate.value < '<%=currentDate%>'){
				if(window.confirm("您选择的日期小于当前日期，您确定要改签到此日期吗？")){
					
				}else{
					flydate.focus();										
					return;
				}
			}			
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			var ticketpointId = document.getElementById("ticketpointId");
			SysmanagerDWR.ticketsDateUpdate(data,document.getElementById("flightId").value,ticketpointId.value,'<%=auth.getUserid()%>',flydate.value,flyhour.value+":"+flyminute.value,'2',status,onHandleM);		
			
		}
		function onHandleM(data){
			if(data==1){
				alert("当日无航班信息，不能进行改签！");
				
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else if(data == 2){
				alert("当日该票点没有分配票额，不能进行改签！");
				
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else if(data == 3){
				alert("当日该票点票额不足，不能进行改签！");
				
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else if(data == 5){
				alert("改签成功！");
				window.returnValue=1; 
				window.opener=null;
				window.open("","_self");
				window.close();	
			}else if(data == 6){
				alert("信息状态已经改变，请重新选择！");
				
			}else{
				alert("改签失败！");
				
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}
		}

//-->
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			改 签
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/clientAction.do?method=editOrderInfo" method="post" target="mypage">&nbsp; 
	<input type="hidden" id="flightId" name="flightId" value="${flightinfo.flightId}"/>
	<input type="hidden" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" id="id" name="id" value="${id}"/>
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">航程：</td>
    <td width="18%">${flightinfo.flight}</td>
    <td align="right" width="15%">乘机日期：</td>
    <td width="18%"><table border="0">
									<tr>
						        <td>
						        <input value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>" name="flydate" id="flydate" width="100%" readonly="readonly"/>        </td>
						        <td>
						        	 <span style="cursor: hand"><img	src="<%=request.getContextPath()%>/images/caldendar.gif" id="caldendar1" /> </span>	 
						        	
						        	   </td> 
									</tr>
								</table></td>
     <td align="right" width="15%">起飞时间：</td>
    
	<td width="18%">
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
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">姓名：</td>
    <td width="18%">${flightinfo.name}</td>
    <td align="right" width="15%">证件类型：</td>
    <td width="18%"><select id="certType" name="certType" style="width: 98%" disabled="disabled">
		
		<option value="身份证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>
    <td align="right" width="15%">证件号码：</td>
    <td width="18%">${flightinfo.certNo}</td>
  </tr>
  <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">联系电话：</td>
    <td width="18%">${flightinfo.linkphone}</td>
    <td align="right" width="15%">VIP：</td>
    <td width="18%"><select name="vipFlag" style="width: 96%" disabled="disabled">
			<option value="0"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    <td align="right" width="15%">订票点：</td>
    <td width="18%"><select id="ticketpointId" name="ticketpointId" style="width: 90%">
			<%for(BaTicketpoint tp: tpList){ %>
				<option value="<%=tp.getId() %>" <%=tp.getId().equals(flightinfo.getTicketpointId())?"selected='selected'":""%>><%=tp.getName()%></option>
			<%}%>			
		</select></td>
  </tr> 
  <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">五折优惠卡：</td>
    <td width="18%">${flightinfo.halfpricecard}</td>
    <td align="right" width="15%">全免优惠卡：</td>
    <td width="18%">${flightinfo.zeropricecard}</td>
    <td align="right" width="15%">付款方式：</td>
    <td width="18%">
    <select id="payment" name="payment" style="width: 90%" disabled="disabled">
    	<option value="现金" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("现金")?"selected='selected'":"" %>>现金</option>
    	<option value="支票" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("支票")?"selected='selected'":"" %>>支票</option>
    	<option value="银行卡" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("银行卡")?"selected='selected'":"" %>>银行卡</option>
    </select>
   </td>
  </tr>   
   <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">票价类型：</td>
    <td  colspan="5">
    <select id="priceId" name="priceId" disabled="disabled">
    <option value="">--请选择--</option>
    	<%for(BaTicketprice tpr:tprice){ %>
    	
    	<option value="<%=tpr.getId()%>" <%=flightinfo.getPriceId()!=null && flightinfo.getPriceId().equals(tpr.getId())?"selected='selected'":"" %>><%=tpr.getDiscountType()%></option>
    	<%} %>
    </select>
    
    </td>
    
  </tr>  
  <tr bgcolor="#FFFFFF">
    <td height="74" align="right" width="15%">备注：</td>
    <td colspan="5"><textarea id="remark" name="remark" class="tearea" readonly="readonly">${flightinfo.remark}</textarea></td>
  </tr>
		<tr align="center" bgcolor="#FFFFFF">
			<td align="center" colspan="6"> 
				 
				<input id="bc" type="button" value="改 签" onclick="check(${id},'<%=flightinfo.getStatus()%>')"/>
				<input id="cl" type="button" value="关 闭" onclick="window.close();"/>
				</td>
		</tr>
		
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
    inputField        : "flydate",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   
  
  //-->
</SCRIPT>