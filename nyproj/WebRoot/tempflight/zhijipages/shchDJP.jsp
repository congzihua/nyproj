<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.flyticket.system.util.ArgsUnit"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	String gt = ArgsUnit.gateDeafult();
	TempFlightinfo flightinfo = (TempFlightinfo)request.getAttribute("flightinfo");
	TempOrdertickets orderInfo = (TempOrdertickets)request.getAttribute("orderInfo");
	String fyt = flightinfo.getFlyTime();
	String o = fyt.split(":")[0];
	String m = fyt.split(":")[1];
	
 	String[] hourandmin = flightinfo.getFlyTime()==null||flightinfo.getFlyTime().equals("")?null:flightinfo.getFlyTime().split(":");
    if(hourandmin==null||hourandmin.length<2){
    	Integer oi = 0,mi = 0;
    	mi = Integer.valueOf(m)-30;
    	
    	if(mi < 0){
    		if(o.equals("00")){
    			oi = 23;
    		}else{
    			oi = Integer.valueOf(o)-1;
    		}
    		mi += 60; 
    		m = mi.toString().length()>1?mi.toString():("0"+mi.toString()) ; 
    		o = oi.toString().length()>1?oi.toString():("0"+oi.toString()) ; 
    	}else{
    		m = mi.toString().length()>1?mi.toString():("0"+mi.toString()) ;    		
    	}	
    }
   
 	String hour = hourandmin==null||hourandmin.length<2?o:hourandmin[0];
 	String minute = hourandmin==null||hourandmin.length<2?m:hourandmin[1]; 	
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
	
	   <script type="text/javascript" src="<%=request.getContextPath()%>/js/Scripts/reconnecting-websocket.min.js"></script>
	   <script type="text/javascript" src="<%=request.getContextPath()%>/js/Scripts/offline.min.js"></script>
	

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
<SCRIPT language="JavaScript">
	var fIds = '${flightinfo.id}';
    function check(data,type)
		{	      
			var seatNum = document.getElementById("seatNum");			
			var luggSum = document.getElementById("luggSum");	
			var gate = '${orderInfo.gate}';
			
			var weightSum = document.getElementById("weightSum");	
			var re = /^[0-9]+.?[0-9]*$/;
			var re1 = /^[0-9]*$/;    //判断字符串是否为数字      
		     if (luggSum.value!=null &&luggSum.value!="" && !re1.test(luggSum.value))
		    {
				 alert("行李数请输入正整数！");
				        luggSum.focus();
				        return false;
			}
			if(weightSum.value!=null && weightSum.value!=''&&!re.test(weightSum.value)){
				 alert("行李重量请输入数字！");
				        weightSum.focus();
				        return false;
			}
			
			document.getElementById("tuipiao").disabled="disabled";
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			
			var flightno= '${flightinfo.flightNo}';
			
			if(jsTrim(flightno)==""||jsTrim(flightno)==null){
				alert("航班号不能为空，请先设定航班号！");
				return;
			}
			
			var flydate='${flightinfo.flyTime}';;
			var vipo=document.getElementById("vipFlag").value;
			var vipText="";
			if(vipo=="1"){
				vipText="是";
			}
			var flightTo='${orderInfo.flightInfo}';
			var name=document.getElementById("name").value;
			
			TfSysmanagerDWR.djpOrXlqSave(data,seatNum.value,luggSum.value,weightSum.value,fIds,onHandleM1);		
			
		}
		function prxlq(data,type){	
			var seatNum = document.getElementById("seatNum");			
			var luggSum = document.getElementById("luggSum");	
			var weightSum = document.getElementById("weightSum");	
			var re = /^[0-9]+.?[0-9]*$/;
			var re1 = /^[0-9]*$/;    //判断字符串是否为数字      
			if(luggSum.value==null||luggSum.value==""){
				alert("行李件数不能为空，请填写！");
				luggSum.focus();
				return;
			}
		     if (!re1.test(luggSum.value))
		    {
				 alert("行李数请输入正整数！");
				        luggSum.focus();
				        return false;
			}
			if(weightSum.value==null||weightSum.value==""){
				alert("行李重量不能为空，请填写！");
				weightSum.focus();
				return;
			}
			if(!re.test(weightSum.value)){
				 alert("行李重量请输入数字！");
				        weightSum.focus();
				        return false;
			}
			if(!window.confirm("您确认要打印行李签吗？")){
				return;
			}
			var lugs = 0,wsums=0;
			if(jsTrim(luggSum.value)!=""&&jsTrim(luggSum.value)!=null){
				lugs +=parseInt(jsTrim(luggSum.value),10);
			}
			var luggSum1 = document.getElementById("luggSum1").value;
			
			var weightSum1 = document.getElementById("weightSum1").value;
			if(jsTrim(weightSum.value)!=""&&jsTrim(weightSum.value)!=null){
				wsums +=parseFloat(jsTrim(weightSum.value),10);
			}
			
			document.getElementById("tuipiao").disabled="disabled";
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			TfSysmanagerDWR.xlqSave(data,seatNum.value,lugs,wsums,fIds,jsTrim(luggSum.value),onHandleM2);		
			
		}
		function seleSeat(){
			var url = "<%=request.getContextPath()%>/tempflight/zhijipages/seleSeat.jsp?flightInfoId="+fIds;
			
			var rv = window.showModalDialog(url, window, "dialogWidth: 432px; dialogHeight: 700px; help: no; scroll: yes; status: no");
			if(rv!=null)
				document.getElementById("seatNum").value=rv;
		}
		function onHandleM1(data){
			if(data=="0"){
				alert("您选择的座位已经被选，请重新选择!");
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else if(data=="1"){
				alert("信息保存失败！");
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else if(data=="5"){
				alert("信息保存失败，你选择的信息状态已经改变，请核查后重新选择！");
				
			}else {
			    if(window.confirm("信息保存成功，是否进行打印操作！")){
		         	PrintLab1(data);
				}
				var luggSum = document.getElementById("luggSum");
				var weightSum = document.getElementById("weightSum");
				document.getElementById("luggSum1").value=luggSum.value;
				document.getElementById("weightSum1").value=weightSum.value;
				
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
		   }
	    }
		function onHandleM2(data){
			if(data=="0"||data=="-1"){
				alert("信息保存失败或生成行李编码失败！");
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}else{		
				 if(window.confirm("信息保存成功，是否进行打印操作！")){
	         		PrintLab2(data);	
	         	 }			
				var luggSum = document.getElementById("luggSum");
			var weightSum = document.getElementById("weightSum");
			var lugs = 0,wsums=0;
			if(jsTrim(luggSum.value)!=""&&jsTrim(luggSum.value)!=null){
				lugs +=parseInt(jsTrim(luggSum.value),10);
			}
			var luggSum1 = document.getElementById("luggSum1").value;
			if(jsTrim(luggSum1)!=""&&jsTrim(luggSum1)!=null){
				lugs += parseInt(luggSum1,10);
			}
			var weightSum1 = document.getElementById("weightSum1").value;
			if(jsTrim(weightSum.value)!=""&&jsTrim(weightSum.value)!=null){
				wsums +=parseFloat(jsTrim(weightSum.value),10);
			}
			
			if(jsTrim(weightSum1)!=""&&jsTrim(weightSum1)!=null){
				wsums += parseFloat(weightSum1,10);
			}
			document.getElementById("luggSum1").value=lugs;
			document.getElementById("weightSum1").value=wsums;
			
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";	
			}
	}
</script>
<SCRIPT LANGUAGE="JavaScript">
var varItem1 = 'MB1.PRN^LPT1^4008^2012-01-22^是^1-A^库尔勒^北京^4-6^08:30^科比布莱恩提^220111198804153641^12';
var varItem2 = 'MB2.PRN^LPT2^北京^100190^1^25.336^288963^4008^2月15日^中国*织造^2012021510023^51296829^NewYork^2201111988';
var varDemo1 = 'MB1.PRN^LPT1^';
var varDemo2 = 'MB2.PRN^LPT2^';
var socketUrl = 'ws://localhost:7302/PrintServer';
var socket = null;
var startAddress = '${flightinfo.origin}';
//登机牌打印
function PrintLab1(data){
    var flightNo = document.getElementById("flightNo").value;
    var flydate = document.getElementById("orderdate").value;
    var vipFlag = document.getElementById("vipFlag").value; 
    if(vipFlag==1){
    	vipFlag = "是";
    }else{
    	vipFlag = " ";
    }
    var seatNum = document.getElementById("seatNum").value;
    var flightTo = '${orderInfo.flightInfo}';
    var gate = '${orderInfo.gate}';
    var flytime = '${flightinfo.flyTime}';
    var name = document.getElementById("name").value;
    var certNo = document.getElementById("certNo").value;
    var id = document.getElementById("id").value;
    if(certNo.length==18){
    	certNo=certNo.substring(0,6)+"******"+certNo.substring(14);
	}
    if(seatNum == null || seatNum == '') {
    	alert("座位不能为空！");
    	return;
    }
    
	varItem1 = flightNo+'^'+flydate+'^'+vipFlag+'^'+seatNum+'^'+flightTo+'^'+startAddress+'^'+gate+'^'+flytime+'^'+name+'^'+certNo+'^'+id;
	 var pData  = varDemo1+varItem1;
     buildSocket();
     socket.onopen = function (event) {
         socketStatus = true;
         if (socket.readyState == 1) {
             socket.send(pData);
         }
     }
     socket.onmessage = function (event) {
         socketStatus = false;
         pData = '';
         socket.close();
     };
     socket.onerror = function (evnt) {
         socketStatus = false;
     };
     socket.onclose = function (event) {
         socketStatus = false;
         socket = null;
     };
}

function buildSocket() {
    if ('WebSocket' in window) {
        socket = new ReconnectingWebSocket(socketUrl);
    } else if ('MozWebSocket' in window) {
        socket = new MozWebSocket(socketUrl);
    } else {
        socket = new SockJS(socketUrl);
    }
}
function PrintLab2(data){//行李签打印	
    var luggSum = document.getElementById("luggSum").value;
    var weightSum = document.getElementById("weightSum").value;
    var flightTo = '${orderInfo.flightInfo}';
    var name = document.getElementById("name").value;
    var flightNo = '${flightinfo.flightNo}';
    var id = document.getElementById("id").value;
    var monandday = document.getElementById("monandday").value;
    var lsum = document.getElementById("luggSum").value;
    varItem2 = '';
	
	for(var i=0;i<lsum;i++){
		if (varItem2.length > 0) {
			varItem2 += "|";
		}
		varItem2 += startAddress+'^100190^'+luggSum+'^'+weightSum+'^288963^'+flightNo+'^'+monandday+'^'+name+'^'+data.split(';')[i]+'^51296829^'+flightTo+'^'+id;
		
    }
	if (varItem2.length > 0) {
		 var pData  = varDemo2+varItem2;
		 buildSocket();
	     socket.onopen = function (event) {
	         socketStatus = true;
	         if (socket.readyState == 1) {
	             socket.send(pData);
	         }
	     }
	     socket.onmessage = function (event) {
	         socketStatus = false;
	         pData = '';
	         socket.close();
	     };
	     socket.onerror = function (evnt) {
	         socketStatus = false;
	     };
	     socket.onclose = function (event) {
	         socketStatus = false;
	         socket = null;
	     };
	}	
		TfSysmanagerDWR.printUpdate(document.getElementById("id").value,data,myHandle);
    		
}
function myHandle(data){
	
}

</SCRIPT>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			换 登 机 牌
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/tfClientAction.do?method=editOrderInfo" method="post" target="dspBottom">&nbsp;  
	<input type="hidden" id="flightId" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" id="orderdate" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" id= "flyTime" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" id="id" name="id" value="${id}"/>
	<input type="hidden" id="flightNo" name="flightNo" value="${flightinfo.flightNo}" />
	<input type="hidden" id="status" name="status" value="${orderInfo.status}" />
	 <input type="hidden" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="MM月dd日"/>" name="monandday" id="monandday"  readonly="readonly"/>   
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  
  <tr bgcolor="#FFFFFF">
    
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">座位：</FONT></td>
    <td width="18%" nowrap="nowrap"><input type="text" style="width: 55%" id="seatNum" name="seatNum" value="${orderInfo.seatNum}" readonly="readonly"/> <input type="button" name="xz" onclick="seleSeat();" value="选 择" /></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机口：</FONT></td>
    <td width="18%">${orderInfo.gate}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机时间：</FONT></td>
    <td width="18%">
    ${flightinfo.flyTime}
    </td>
										<td align="center"><input type="button" id="bc" name="bc" value="打印登机牌" onclick="check(${orderInfo.id},3)"/></td>
  </tr>
    <tr bgcolor="#FFFFFF">
   <td align="right" ><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李数：</FONT></td>
    <td width="18%"><input type="text" id="luggSum" name="luggSum" value="${orderInfo.luggSum}" style="width: 60px"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="luggSum1" id="luggSum1" value="${orderInfo.luggSum}" align="right" readonly="readonly"/> 件</td>
    <td align="right" ><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李重量：</FONT></td>
    <td  colspan="2"><input type="text" id="weightSum" name="weightSum" value="${orderInfo.weightSum}" style="width: 60px"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="weightSum1" id="weightSum1" value="${orderInfo.weightSum}" align="right" readonly="readonly"/>（KG）</td>
    <td align="left" colspan="2"> &nbsp;  &nbsp;  &nbsp;<input type="button" id="tuipiao" name="tuipiao" value="打印行李签" onclick="prxlq(${orderInfo.id},3);" /></td>
   </tr> 
  <tr bgcolor="#FFFFFF"><td colspan="7"><hr style="color: blue"/></td></tr>
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
    
	<td width="18%" colspan="2">
		${flightinfo.flyTime}
	</td>
	
    
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">姓名：</FONT></td>
    <td width="18%"><input type="text" id="name" name="name" value="${orderInfo.name}" readonly="readonly"/></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件类型：</FONT></td>
    <td width="18%">
    	<input type="text" id="certType" name="certType" value="${orderInfo.certType}" readonly="readonly"/>
    </td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件号码：</FONT></td>
    <td colspan="2"><input type="text" id="certNo" name="certNo" value="${orderInfo.certNo}"/></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
  <td align="right" width="15%">
  	<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">航班号：</FONT>
    </td>
	<td width="18%">${flightinfo.flightNo}</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">联系电话：</FONT></td>
    <td width="18%">${orderInfo.linkphone}</td>
   
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">VIP：</FONT></td>
    <td colspan="2"><select name="vipFlag" id="vipFlag" style="width: 96%" disabled="disabled">
			<option value="0"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
  </tr> 
    
  
  <tr bgcolor="#FFFFFF">
   
    <td height="74" align="right" width="15%">备注：</td>
    <td colspan="6">${orderInfo.remark}</td>
  </tr>
	<tr bgcolor="#FFFFFF">
	 <td colspan="7" align="center"> <input type="button" id="cl" name="cl" value="关 闭" onclick="window.close();"/> </td>
	</tr>	
		
			</table>
		</form>
	</body>
</html>