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
	java.util.List<OpOrdertickets> ooList = (java.util.List<OpOrdertickets>)request.getAttribute("ooList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
 	String[] hourandmin = flightinfo.getGateTime()==null||flightinfo.getGateTime().equals("")?null:flightinfo.getGateTime().split(":");
 	String fyt = flightinfo.getFlyTime();
 	String o = fyt.split(":")[0];
	String m = fyt.split(":")[1];
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
 	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
					String f = format1.format(new java.util.Date());
					int f1 = (Integer.valueOf(f.substring(0,4))-2);					
					f= f1+f.substring(4);
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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css"></link>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/Scripts/reconnecting-websocket.min.js"></script>
	   <script type="text/javascript" src="<%=request.getContextPath()%>/js/Scripts/offline.min.js"></script>
	
	

<STYLE type="text/css">

.tearea{overflow-y:auto;padding:0;width:99%;height:70px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}

</STYLE>

	
<SCRIPT language="JavaScript" >
var printIds = "";
var printNames = ""; 
var printCertType = "";
var printCertNo = "";
var printVipFlag ="";
function check(type,flightinfoId)
		{
			var member = document.getElementsByName("member");
			var name = document.getElementsByName("name");
			var certType = document.getElementsByName("certType");
			var certNo = document.getElementsByName("certNo");
			var vipFlag = document.getElementsByName("vipFlag");
			var seatSele = document.getElementsByName("seatSele");
			var ids = '';
			
			
			for (var i = 0; i < member.length; i++){
				if (member[i].checked==true){  
					ids += member[i].value+","
					printNames +=name[i].value+","; 
					printCertType +=certType[i].value+",";
					printCertNo += certNo[i].value+",";
					
					printVipFlag +=vipFlag[i].value+",";
					
				}
			}
			if(ids==null||ids==""){
				alert("请选择要打印登机牌的乘客");
					return false;
			}
			
			ids = ids.substring(0,ids.length-1);			
			printNames =printNames.substring(0,printNames.length-1); 
			printCertType = printCertType.substring(0,printCertType.length-1);
			printCertNo = printCertNo.substring(0,printCertNo.length-1);
			printVipFlag = printVipFlag.substring(0,printVipFlag.length-1);
						
			var luggSum = document.getElementById("luggSum");	
			var djpCount = document.getElementById("djpCount");
			var gate = document.getElementById("gate");
			if(gate.value==null || gate.value==""){
				alert("登机口信息不能为空， 请填写！");
				gate.focus();
				return;
			}
			var fNo = '${flightinfo.flightNo}';
			if(fNo == null || jsTrim(fNo)==''){
				alert("航班号不能为空，请先设定航班号！");
				return;
			}
			var weightSum = document.getElementById("weightSum");	
			var luggSum = document.getElementById("luggSum");	
			var re = /^[0-9]+.?[0-9]*$/;
			var re1 = /^[0-9]*$/;    //判断字符串是否为数字  
			if (jsTrim(luggSum.value)!='' && !re1.test(jsTrim(luggSum.value)))
		    { 
				 alert("行李数请输入正整数！");
				        luggSum.focus();
				        return false;
			}			
			if(jsTrim(weightSum.value)!=''&&!re.test(jsTrim(weightSum.value))){
				 alert("行李重量请输入数字！");
				        weightSum.focus();
				        return false;
			}    
			
			document.getElementById("tuipiao").disabled="disabled";
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			var status = document.getElementById("status").value;	
			printIds = ids;
			SysmanagerDWR.djpOrXlqSaveTeam(ids,'<%=auth.getUserid()%>',type,document.getElementById("seatNum").value,document.getElementById("gate").value,flyhour.value+":"+flyminute.value,jsTrim(luggSum.value),jsTrim(weightSum.value),flightinfoId,status,onHandleM1);		
		}
		function changebox(parm){
			var member = document.getElementsByName("member");
			for (var i = 0; i < member.length; i++){
				if(parm=='yes'){
					member[i].checked = true;
				}else{
					member[i].checked = false;
				}
			}
		}
		
		function prxlq(type,flightinfoId)
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
			if(!window.confirm("您确认要打印行李签吗？")){
				return;
			}
			var ids = '';
			var name = document.getElementsByName("name");
			var certType = document.getElementsByName("certType");
			var certNo = document.getElementsByName("certNo");
			var vipFlag = document.getElementsByName("vipFlag");
			var member = document.getElementsByName("member");
			printNames = '';
			for (var i = 0; i < member.length; i++){
				 if (member[i].checked==true){  
					ids += member[i].value+","
					printNames +=name[i].value+","; 
					printCertType +=certType[i].value+",";
					printCertNo += certNo[i].value+",";
					printVipFlag +=vipFlag[i].value+",";
					
				}			
				
			}
			if(ids==null||ids==""){
				alert("请选择乘客!");
					return false;
			}
			printIds = ids;
			document.getElementById("tuipiao").disabled="disabled";
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			var flyhour = document.getElementById("flyhour");
			var flyminute = document.getElementById("flyminute");
			var flightno= document.getElementById("flightNo").value;
			var flydate=document.getElementById("orderdate").value;
			SysmanagerDWR.xlqSaveTeam(ids,'<%=auth.getUserid()%>',type,document.getElementById("seatNum").value,document.getElementById("gate").value,flyhour.value+":"+flyminute.value,lugs,wsums,flightinfoId,type,jsTrim(luggSum.value),onHandleM2);		
			
		}
		function seleSeat(data,seleSeatCount){
			var url = "<%=request.getContextPath()%>/client/djppages/seleSeatTEAM.jsp?id="+data+"&count="+seleSeatCount;
			var size = document.getElementsByName("member");
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
			document.getElementById("luggSum1").value=jsTrim(document.getElementById("luggSum").value);
			document.getElementById("weightSum1").value=jsTrim(document.getElementById("weightSum").value);
			document.getElementById("seatNum").value="";
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
				document.getElementById("seatNum").value="";
				document.getElementById("panduan").value='1';
				document.getElementById("tuipiao").disabled="";
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
			}
	}
//-->
</script>
<SCRIPT LANGUAGE="JavaScript">
var varItem1 = 'HB1^RQ1^VIP1^ZW1^MDD1^SFD1^DJK1^DJSJ1^XM1^ZJHM1^1234567890123';

var varItem2 = '北京南郊^100190^1^25.336^288963^4008^2月15日^中国*织造^2012021510023^51296829^NewYork^2201111988';
var varDemo1 = 'MB1.PRN^LPT1^';
var varDemo2 = 'MB2.PRN^LPT2^';
var socketUrl = 'ws://localhost:7302/PrintServer';
var socket = null;

function PrintLab1(data){
    var flightNo = document.getElementById("flightNo").value;
    var flydate = document.getElementById("orderdate").value;
    var flightTo = document.getElementById("flight").value;
    var gate = document.getElementById("gate").value;
    var flyhour = document.getElementById("flyhour").value;
    var flyminute = document.getElementById("flyminute").value;
    var flytime = flyhour+":"+flyminute;
	
     varItem1 ='';
     var idAr =printIds.split(',');
    
	var vipFlag=" ";
    for(var i = 0;i<idAr.length;i++){
        vipFlag=" ";
	    if(printVipFlag.split(",")[i]==1){
	   		vipFlag="是";
	    }
	    var certNo = printCertNo.split(",")[i];
	    if(certNo.length==18){
	    	certNo=certNo.substring(0,6)+"******"+certNo.substring(14);
	    }
	    var seatNumPostion = data.split(",")[i] == null || data.split(",")[i] == ""?" ":data.split(",")[i];
	    if (varItem1 != '')
	    	varItem1 += "|";
	    varItem1 += flightNo+'^'+flydate+'^'+vipFlag+'^'+seatNumPostion+'^'+flightTo+'^北京南郊^'+gate+'^'+flytime+'^'+printNames.split(",")[i]+'^'+certNo+'^'+idAr[i];   
    }
     var pData  = varDemo1+varItem1;
	 socketStatus = true;
     if (socket.readyState == 1) {
		    socket.send(pData);
	 }
     varItem1 = '';
	}
<%
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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

  function buildSocket() {
            if ('WebSocket' in window) {
                socket = new ReconnectingWebSocket(socketUrl);
            } else if ('MozWebSocket' in window) {
                socket = new MozWebSocket(socketUrl);
            } else {
                socket = new SockJS(socketUrl);
            }
        };
        
     window.onload = function(){
    	    try{
                buildSocket();
                    socket.onopen = function (event) {                
                }
                socket.onmessage = function (event) {
                    socketStatus = false;                             
                };
                socket.onerror = function (evnt) {
                    socketStatus = false;
                };
                socket.onclose = function (event) {
                    socketStatus = false;
                    socket = null;
                };     
            }catch(err) {

            }
              
     };
	function PrintLab2(data){
	
    var luggSum = document.getElementById("luggSum").value;
    var weightSum = document.getElementById("weightSum").value;
    var flightTo = document.getElementById("flight").value;    
    var flightNo = document.getElementById("flightNo").value;    
    var monandday = document.getElementById("monandday").value;
    varItem2 = "";
	 for(var i = 0;i<jsTrim(luggSum);i++){
		if (varItem2.length > 0) {
			varItem2 += "|";
		}
        varItem2 += '北京南郊^100190^'+luggSum+'^'+weightSum+'^288963^'+flightNo+'^'+monandday+'^'+printNames.split(",")[0]+'^'+data.split(";")[i]+'^51296829^'+flightTo+'^'+printIds.split(',')[1];  
	 }
	 if (varItem2.length > 0){
		 var pData  = varDemo2+varItem2;
			socketStatus = true;
	     if (socket.readyState == 1) {
	         socket.send(pData);
	     }	 
	 }	
	 SysmanagerDWR.printUpdateTeam(printIds,data,myHandle);   
	    	
	    	
}
function myHandle(data){
	
}
</SCRIPT>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div align="center" >
 
  <div align="left" style="width: 100%">
  
<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 目的地：</FONT><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#B22222"> ${flightinfo.flight} &nbsp; </FONT>
<FONT style="FONT-SIZE: 20px;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightinfo.flightNo} &nbsp; &nbsp; &nbsp;</font></FONT>
<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">乘机时间: </FONT><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#B22222">&nbsp;<%=new SimpleDateFormat("yyyy-MM-dd").format(flightinfo.getFlightDate()) %>&nbsp;<%=flightinfo.getFlyTime() %> &nbsp; 星期 <%=weeks%></FONT>

</div>
</div>
	<form action="<%=request.getContextPath()%>/clientAction.do?method=editOrderInfo" method="post" target="dspBottom">
	<input type="hidden" id="flightId" name="flightId" value="${flightinfo.flightId}"/>
	<input type="hidden" id="orderdate" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" id="flyTime" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" id="flightinfoId" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" id="id" name="id" value="${id}"/>
	<input type="hidden" id="flightNo" name="flightNo" value="${flightinfo.flightNo }" />
	<input type="hidden" id="status" name="status" value="${flightinfo.status}" />
	<input type="hidden" id="djpCount" value="<%=ooList.size()%>" />
	 <input type="hidden" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="MM月dd日"/>" name="monandday" id="monandday"  readonly="readonly"/> 
	 <input type="hidden" id="flight" value="${flightinfo.flight}"/>
	 <input id="panduan" type="hidden" value="<%=flightinfo.getGate()==null||flightinfo.getGate().trim().equals("")?"0":"1" %>"/>
	<table width="100%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  
  <tr bgcolor="#FFFFFF">
    
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">座位：</FONT></td>
    <td width="18%" nowrap="nowrap"><input type="text" style="width: 55%" id="seatNum" name="seatNum" value="" readonly="readonly"/> 
    <input type="button" name="xz" onclick="seleSeat(${flightinfo.flightinfoId},<%=ooList.size()%>);" value="选 择" /></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机口：</FONT></td>
    <td width="18%"><input type="text" id="gate" name="gate" value="${flightinfo.gate==null ||flightinfo.gate=='' ?'1':flightinfo.gate}"/></td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">登机时间：</FONT></td>
    
	
    <td width="18%" colspan="2">
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
    <td width="18%"><input type="text" id="luggSum" name="luggSum" value="${flightinfo.luggSum}" style="width:60px;"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="luggSum1" id="luggSum1" value="${flightinfo.luggSum}" align="right" readonly="readonly"/> 件</td>
    <td align="right" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">行李重量：</FONT></td>
    <td width="18%"><input type="text" id="weightSum" name="weightSum" value="${flightinfo.weightSum}" style="width:60px;"/> &nbsp;<input style="width:60px;border-top: 0px;border-left: 0px;border-right:0px;border-bottom:1px" type="text" name="weightSum1" id="weightSum1" value="${flightinfo.weightSum}" align="right" readonly="readonly"/> (KG)</td>
    <td align="center" colspan="3" width="15%">
    <input type="button" id="tuipiao" name="tuipiao" value="打印行李签" onclick="prxlq(3,${flightinfo.flightinfoId});"/>&nbsp;&nbsp;
  		<input type="button" id="cl" name="cl" value="关 闭" onclick="window.close();"/>
    </td>
    
   </tr> 
  <tr bgcolor="#FFFFFF" align="left" >
  	<td colspan="7">
  		<input type="button" style="margin-left: 10px; " id="bc" name="bc" value="打印登机牌" onclick="check(3,${flightinfo.flightinfoId})"/>&nbsp;&nbsp;
  	</td>
  </tr>
  <tr bgcolor="#F0F0F0">
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt"><input type="checkbox" value="全选" id="allmember" onclick="if(this.checked==true){changebox('yes');}else{changebox('no');}  ;" name="members" /> 姓名[<%=ooList.size()%>]人</FONT></td>
   <td align="center" width="10%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">座位号</FONT></td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件类型</FONT></td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">证件号码</FONT></td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">联系电话</FONT></td>
    <td align="center" width="10%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt">订票点</FONT></td>
    <td align="center" width="15%"><FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: blue; HEIGHT: 9pt"> VIP </FONT></td>
  </tr>
  <%for(OpOrdertickets oo: ooList){ %>
  <tr bgcolor="#DFFFDF">
  <td align="left">
  <input type="checkbox" value="<%=oo.getId()%>" id=<%=oo.getId() %> name="member" />
  <input type="hidden" name="name" value="<%=oo.getName() %>"/>
  <%=oo.getName() %>
  </td>
  <td align="center">
	  <input type="hidden" name="seatSele" value="<%=oo.getSeatNum()==null?"":oo.getSeatNum()%>"/>
	  <%=oo.getSeatNum()==null?"":oo.getSeatNum() %>
  </td>
  <td align="center">
	  <input type="hidden" name="certType" value="<%=oo.getCertType() %>"/>
	  <%=oo.getCertType() %>
  </td>
  <td align="center">
  	<input type="hidden" name="certNo" value="<%=oo.getCertNo() %>"/>
  	<%=oo.getCertNo() %>
  </td>
  <td align="center"><%=oo.getLinkphone() %></td>
  <td align="center"><%=oo.getTicketpointname() %></td>
  <input type="hidden" name="vipFlag" value="<%=oo.getVipFlag()%>"/>
  <%
  	if(oo.getVipFlag()!=null && oo.getVipFlag().equals("0")){
   %>
  <td align="center"></td>
  <%
  	}else{
   %> 
    <td align="center">是</td>
   <%} %>
  </tr>
		
	<%} %>
</table>
</form>

  </body>
</html>
