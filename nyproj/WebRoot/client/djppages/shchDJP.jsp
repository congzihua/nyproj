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
	String fyt = flightinfo.getFlyTime();
	String o = fyt.split(":")[0];
	String m = fyt.split(":")[1];
	java.util.List<BaTicketpoint> tpList = (java.util.List<BaTicketpoint>)request.getAttribute("tpList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
 	String[] hourandmin = flightinfo.getGateTime()==null||flightinfo.getGateTime().equals("")?null:flightinfo.getGateTime().split(":");
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
 	Integer status = Integer.valueOf(flightinfo.getStatus()); 	
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
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
<SCRIPT language="JavaScript">
    function check(data,type,flightinfoId)
		{	      
			var seatNum = document.getElementById("seatNum");			
			var luggSum = document.getElementById("luggSum");	
			var gate = document.getElementById("gate");
			if(gate.value==null || gate.value==""){
				alert("登机口信息不能为空， 请填写！");
				gate.focus();
				return;
			}
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
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			var flightno= document.getElementById("flightNo").value;
			
			if(jsTrim(flightno)==""||jsTrim(flightno)==null){
				alert("航班号不能为空，请先设定航班号！");
				return;
			}
			
			var flydate=document.getElementById("flydate").value;
			var vipo=document.getElementById("vipFlag").value;
			var vipText="";
			if(vipo=="1"){
				vipText="是";
			}
			var flightTo=document.getElementById("flightTo").value;
			var name=document.getElementById("name").value;
			var certNo=document.getElementById("certNo").value;
			var status = document.getElementById("status").value;
			SysmanagerDWR.djpOrXlqSave(data,'<%=auth.getUserid()%>',type,seatNum.value,document.getElementById("gate").value,flyhour.value+":"+flyminute.value,luggSum.value,weightSum.value,flightinfoId,flightno,flydate,vipText,flightTo,name,certNo,status,onHandleM1);		
			
		}
		function prxlq(data,type,flightinfoId)
		{	
			var vv = document.getElementById("panduan").value;
			if(vv==0){
				alert("请先打印完登机牌再打印行李签！");
				return;
			}
			var seatNum = document.getElementById("seatNum");			
			var luggSum = document.getElementById("luggSum");	
			var gate = document.getElementById("gate");
			
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
			document.getElementById("tuipiao").disabled="disabled";
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			var flightno= document.getElementById("flightNo").value;
			if(jsTrim(flightno)==""||jsTrim(flightno)==null){
				alert("航班号不能为空，请先设定航班号！");
				return;
			}
			var flydate=document.getElementById("flydate").value;
			//var id=document.getElementById("flightinfoId").value;
			var flightTo=document.getElementById("flightTo").value;
			var name=document.getElementById("name").value;
			
			SysmanagerDWR.xlqSave(data,'<%=auth.getUserid()%>',type,seatNum.value,document.getElementById("gate").value,flyhour.value+":"+flyminute.value,lugs,wsums,flightinfoId,flightTo,<%=auth.getWorkerNo()%>,flightno,flydate,name,jsTrim(luggSum.value),onHandleM2);		
			
		}
		function seleSeat(data){
			var url = "<%=request.getContextPath()%>/client/djppages/seleSeat.jsp?id="+data;
			
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
			
			document.getElementById("panduan").value='1';
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
//"航班号#DATA1#^日期#DATA2#^VIP#DATA3#^座位号#DATA4#^目的地#DATA5#^始发地#DATA6#^登机口#DATA7#^登记时间#DATA8#^姓名#DATA9#^证件号码#DATA10#^条码ID#DATA11#"

//"目的地#DATA1#^工号#DATA2#^件数#DATA3#^重量#DATA4#^座位号#DATA5#^航班号#DATA6#^日期#DATA7#^姓名#DATA8#^条形码#DATA9#^号码#DATA10#^条码ID#DATA11#"

var varItem1 = 'HB1^RQ1^VIP1^ZW1^MDD1^SFD1^DJK1^DJSJ1^XM1^ZJHM1^1234567890123';
var varItem2 = '北京南郊^100190^1^25.336^288963^4008^2月15日^中国*织造^2012021510023^51296829^NewYork^2201111988';
var varDemo1 = 'MB1.PRN^LPT1^';
var varDemo2 = 'MB2.PRN^LPT2^';
var socketUrl = 'ws://localhost:7302/PrintServer';
//登机牌打印
function PrintLab1(data){
    var flightNo = document.getElementById("flightNo").value;
    var flydate = document.getElementById("flydate").value;
    var vipFlag = document.getElementById("vipFlag").value; 
    if(vipFlag==1){
    	vipFlag = "是";
    }else{
    	vipFlag = "";
    }
    var seatNum = document.getElementById("seatNum").value;
    var flightTo = document.getElementById("flightTo").value;
    var gate = document.getElementById("gate").value;
    var flyhour = document.getElementById("flyhour").value;
    var flyminute = document.getElementById("flyminute").value;
    var flytime = flyhour+":"+flyminute;
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
    
	varItem1 = flightNo+'^'+flydate+'^'+vipFlag+'^'+seatNum+'^'+flightTo+'^北京南郊^'+gate+'^'+flytime+'^'+name+'^'+certNo+'^'+id;
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
var socket = null;
function buildSocket() {
    if ('WebSocket' in window) {
        socket = new ReconnectingWebSocket(socketUrl);
    } else if ('MozWebSocket' in window) {
        socket = new MozWebSocket(socketUrl);
    } else {
        socket = new SockJS(socketUrl);
    }
};
function PrintLab2(data){	
    var luggSum = document.getElementById("luggSum").value;
    var weightSum = document.getElementById("weightSum").value;
    var flightTo = document.getElementById("flightTo").value;
    var name = document.getElementById("name").value;
    var flightNo = document.getElementById("flightNo").value;
    var id = document.getElementById("id").value;
    var monandday = document.getElementById("monandday").value;
    var lsum = document.getElementById("luggSum").value;
	
	
	for(var i=0;i<lsum;i++){
		varItem2 = '北京南郊^100190^'+luggSum+'^'+weightSum+'^288963^'+flightNo+'^'+monandday+'^'+name+'^'+data.split(';')[i]+'^51296829^'+flightTo+'^'+id;
    	if (varItem2.length > 0) 
		{
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
    }
		SysmanagerDWR.printUpdate(document.getElementById("id").value,data,myHandle);
    		
}
function myHandle(data){
	
}

</SCRIPT>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<object id="utxB" name="utxB" width="1" height="1" visible="true" classid="clsid:860C7EA3-E6E5-428c-B314-FEFECBC72F4D" ></object>
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			换 登 机 牌
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/clientAction.do?method=editOrderInfo" method="post" target="dspBottom">&nbsp;  
	<input type="hidden" id="flightId" name="flightId" value="${flightinfo.flightId}"/>
	<input type="hidden" id="orderdate" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" id= "flyTime" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" id="flightinfoId" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" id="id" name="id" value="${id}"/>
	<input type="hidden" id="flightNo" name="flightNo" value="${flightinfo.flightNo}" />
	<input type="hidden" id="status" name="status" value="${flightinfo.status}" />
	 <input type="hidden" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="MM月dd日"/>" name="monandday" id="monandday"  readonly="readonly"/>   
	<input id="panduan" type="hidden" value="<%=flightinfo.getGate()==null||flightinfo.getGate().trim().equals("")?"0":"1" %>"/>
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  
  <tr bgcolor="#FFFFFF">
    
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">座位：</FONT></td>
    <td width="18%" nowrap="nowrap"><input type="text" style="width: 55%" id="seatNum" name="seatNum" value="${flightinfo.seatNum}" readonly="readonly"/> <input type="button" name="xz" onclick="seleSeat(${flightinfo.flightinfoId});" value="选 择" /></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机口：</FONT></td>
    <td width="18%"><input type="text" id="gate" name="gate" value="${flightinfo.gate==null ||flightinfo.gate=='' ?'5':flightinfo.gate}"/></td>
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
										<td align="center"><input type="button" id="bc" name="bc" value="打印登机牌" onclick="check(${flightinfo.id},3,${flightinfo.flightinfoId})"/></td>
  </tr>
    <tr bgcolor="#FFFFFF">
   <td align="right" ><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李数：</FONT></td>
    <td width="18%"><input type="text" id="luggSum" name="luggSum" value="${flightinfo.luggSum}" style="width: 60px"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="luggSum1" id="luggSum1" value="${flightinfo.luggSum}" align="right" readonly="readonly"/> 件</td>
    <td align="right" ><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李重量：</FONT></td>
    <td  colspan="2"><input type="text" id="weightSum" name="weightSum" value="${flightinfo.weightSum}" style="width: 60px"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="weightSum1" id="weightSum1" value="${flightinfo.weightSum}" align="right" readonly="readonly"/>（KG）</td>
    <td align="left" colspan="2"> &nbsp;  &nbsp;  &nbsp;<input type="button" id="tuipiao" name="tuipiao" value="打印行李签" onclick="prxlq(${flightinfo.id},3,${flightinfo.flightinfoId});" /></td>
   </tr> 
  <tr bgcolor="#FFFFFF"><td colspan="7"><hr style="color: blue"/></td></tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">目的地：</FONT></td>
    <td width="18%"><input type="text" id="flightTo" name="flightTo" value="${flightinfo.flight}" readonly="readonly"/></td>
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
    <td width="18%"><input type="text" id="name" name="name" value="${flightinfo.name}" readonly="readonly"/></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件类型：</FONT></td>
    <td width="18%"><select id="certType" name="certType" style="width: 98%" disabled="disabled">
		
		<option value="身份证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件号码：</FONT></td>
    <td colspan="2"><input type="text" id="certNo" name="certNo" value="${flightinfo.certNo}"/></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
  <td align="right" width="15%">航班号：
    </td>
	<td width="18%">${flightinfo.flightNo}</td>
    <td align="right" width="15%">联系电话：</td>
    <td width="18%">${flightinfo.linkphone}</td>
   
    <td align="right" width="15%">订票点：</td>
    <td colspan="2"><select id="ticketpointId" name="ticketpointId" style="width: 90%" disabled="disabled">
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
    <td colspan="2">
    <select id="payment" name="payment" style="width: 90%" disabled="disabled">
    	<option value="现金" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("现金")?"selected='selected'":"" %>>现金</option>
    	<option value="支配" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("支配")?"selected='selected'":"" %>>支配</option>
    	<option value="银行卡" <%=flightinfo.getPayment()!=null && flightinfo.getPayment().equals("银行卡")?"selected='selected'":"" %>>银行卡</option>
    </select>
   </td>
  </tr>   
   <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">票价类型：</td>
    <td  colspan="6">
    <select id="priceId" name="priceId" disabled="disabled">
    <option value="">--请选择--</option>
    	<%for(BaTicketprice tpr:tprice){ %>
    	
    	<option value="<%=tpr.getId()%>" <%=flightinfo.getPriceId()!=null && flightinfo.getPriceId().equals(tpr.getId())?"selected='selected'":"" %>><%=tpr.getDiscountType()%></option>
    	<%} %>
    </select>
    
    </td>
    
  </tr>  
  <tr bgcolor="#FFFFFF">
   <td align="right" width="15%">VIP：</td>
    <td width="18%"><select name="vipFlag" id="vipFlag" style="width: 96%" disabled="disabled">
			<option value="0"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    <td height="74" align="right" width="15%">备注：</td>
    <td colspan="4"><textarea id="remark" name="remark" class="tearea" readonly="readonly">${flightinfo.remark}</textarea></td>
  </tr>
	<tr bgcolor="#FFFFFF">
	 <td colspan="7" align="center"> <input type="button" id="cl" name="cl" value="关 闭" onclick="window.close();"/> </td>
	</tr>	
		
</table>
</form>
<!--  div align="center"><br/>
	
	<img src="<%=request.getContextPath()%>/images/djp.jpg" alt="登机牌"  title="登机牌"/>
</div>-->
  </body>
</html>
<!--
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">

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
   
  
  //
</SCRIPT>-->