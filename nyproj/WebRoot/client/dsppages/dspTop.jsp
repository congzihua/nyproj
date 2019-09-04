<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	OpOrdertickets ot = new OpOrdertickets();
	ot = (OpOrdertickets)request.getAttribute("flightinfo");
	
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  	java.util.Date date = ot.getFlightDate();
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

	<script type="text/javascript" src="js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="js/worktable.js"></script>
		<script type="text/javascript"
			src="js/calendar/src/calendar-setup.js"></script>
		<LINK href="css/tab1.css" type=text/css rel=stylesheet>
			<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js?version=1"></script>
	

		<STYLE type="text/css">
<!--
.tearea{overflow-y:auto;padding:0;width:99%;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->
</STYLE>
<script type="text/javascript">
<!--
function saltTickets(){
	var flightId  = document.getElementById("flightId").value;
	var orderdate = document.getElementById("orderdate").value;
	var flyTime = document.getElementById('flyTime').value;
	var flightinfoId = document.getElementById('flightinfoId').value;
	var ordertime = document.getElementById('ordertime').value;
	var url = "<%=request.getContextPath()%>/clientAction.do?method=toSp&flightId="+flightId+"&orderdate="+orderdate+"&flyTime="+flyTime+"&ordertime="+ordertime+"&flightinfoId="+flightinfoId;
	window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
	parent.dspBottom.document.forms[0].submit();
}
function check()
		{	      
			
			var name = document.getElementById("name");
			
			var certNo = document.getElementById("certNo");
			var linkphone = document.getElementById("linkphone");
			var ticketpointId = document.getElementById("ticketpointId");
			var remark = document.getElementById("remark");
			
			if(name.value==null||name.value==''){
				alert('姓名不能为空，请重新填写！');
				name.focus();
				return;				
			}
			if(name.value.length>25){
				alert('姓名长度超出范围,不能超过25个字符！');
				name.focus();
				return;
				
			}
			if(certNo.value==null || certNo.value==''){
				alert('证件号码不能为空 ，请输入！');
				certNo.focus();
				return;	
			}
			if(certNo.value.length>25){
				alert('证件号码长度超出范围，不能超过25个字符！');
				certNo.focus();
				return;				
			}
			var re =  /(^\d{15}$)|(^\d{17}([0-9]|X|x|Y|y)$)/;			
			if((document.getElementById("certType").value=="身份证" || document.getElementById("certType").value=="户口簿")&&certNo.value.length>0){
				if (!(re.test(certNo.value)))     
          		{   
               		alert('输入的身份证或户口簿号长度不对，或者号码不符合规定！/n15位号码应全为数字，18位号码末位可以为数字或X。');   
             	 	certNo.focus();
             	 	return false;   
        	 	}   
			}
			if(linkphone.value==null||jsTrim(linkphone.value)==''){
				alert('联系电话不能为空，请重新填写！');
				linkphone.focus();
				return;				
			}
			if(linkphone.value.length>25){
				alert('联系电话长度超出范围,不能超过25个字符！');
				linkphone.focus();
				return;
				
			}
			if(ticketpointId.value==null||name.value==''){
				alert('订票点不能为空，请重新填写！');				
				return;				
			}
			var ul = parent.dspBottom.document.getElementById(ticketpointId.value);
			if(ul==null || ul==undefined){
				alert("您选择的订票点没有分配票额，或页面未刷新完全，请注意核实！");
				return;
			}
			if(ul.value-1<0){
				alert("该售票点票额已经为0，不能继续添加订票信息！");
				return;
			}
			var isT = document.getElementById("teamflag").value;
			var teamName = document.getElementById("teamName");
			if(isT==1){
				if(teamName.value==null || jsTrim(teamName.value)==''){
					alert('团体名称不能为空，请填写！');	
					teamName.focus();			
					return;		
				}
			}
			
			if(remark.value.length>200){
				alert('备注长度超出范围,不能超过25个字符！');	
				remark.focus();			
				return;				
			}
			//Integer flightId,Integer flightinfoId,String orderdate,Integer ticketpointId,String flyTime,String certType,String certNo
			var flightId = document.getElementById("flightId").value;
			var flightinfoId = document.getElementById("flightinfoId").value;
			var orderdate = document.getElementById("orderdate").value;
			var flyTime = document.getElementById("flyTime").value;
			var certType = document.getElementById("certType").value;
			
			SysmanagerDWR.validate(flightId,flightinfoId,orderdate,ticketpointId.value,flyTime,certType,certNo.value,newValidate);
			document.getElementById("bc").disabled="disabled";
					
			
		}
		function newValidate(data){
			if(data==4){
				alert("该用户已经被列入黑名单中，如有疑问请在后台移除！");
				document.getElementById("bc").disabled="";
			}else if(data==3){
				alert("该用户已经订票不能再次订票！");
				document.getElementById("bc").disabled="";
			}else if(data==2){
				alert("该票点票额不足，请核查！");
				document.getElementById("bc").disabled="";
			}else if(data==1){				
				document.forms[0].submit();
			}
		}
		function isTeam(){
			var isT = document.getElementById("teamflag").value;
			var teamName = document.getElementById("teamName");
			if(isT==0){
				teamName.style.display='none';
				teamName.value='';
			}else{
				teamName.style.display='';
			}
		}
function dgpage(){
	var url = "dinggaipage.html";
	window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
}

function petp(){
	var url = "petp_info.html";
	window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
}
function hbh(){
	var url = "hbh_info.html";
window.showModalDialog(url, window, "dialogWidth: 700px; dialogHeight: 400px; help: no; scroll: no; status: no");
}
function Show(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "visible";
divid.filters.revealTrans.play();
} 
function Hide(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "hidden";
divid.filters.revealTrans.play();
}
//-->
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return true;}">
	<div align="center">
		<div style="width: 98%" align="center">
		<FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">
			目的地：</FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #b22222; HEIGHT: 9pt">&nbsp; ${flightinfo.flight} &nbsp; </FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightinfo.flightNo} &nbsp; &nbsp; &nbsp;</font></FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">乘机日期：</FONT>&nbsp; <FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt"><fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/> &nbsp;${flightinfo.flyTime} &nbsp; 星期 <%=weeks%>
		</FONT>
		</div>
		<div style="width: 98%" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			订 票 信 息 表
		</FONT>
		</div>
	</div>
	<div style="width: 98%" align="center">	
	<form action="<%=request.getContextPath()%>/clientAction.do?method=addOrderInfo" method="post" target="dspBottom">
	<input type="hidden" id="flightId" name="flightId" value="${flightinfo.flightId}"/>
	<input type="hidden" id="orderdate" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" id="flyTime" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" id="flightinfoId" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" id="ordertime" name="ordertime" value="${flightinfo.flyTime}"/>
	<table width="98%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
 
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">姓名：</td>
    <td width="18%"><input type="text" value="" id="name" name="name" style="width: 90%"/><font color="red">*</font></td>
    <td align="right" width="15%">证件类型：</td>
    <td width="18%"><select id="certType" name="certType" style="width: 98%">
		<option value="身份证">身份证</option>
		<option value="军人证">军人证</option>
		<option value="户口簿">户口簿</option>
		<option value="警官证">警官证</option>
		<option value="其他">其他</option>
	</select></td>
    <td align="right" width="15%">证件号码：</td>
    <td width="18%"><input type="text" id="certNo" name="certNo" value="" style="width: 90%"/><font color="red">*</font></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
    
     <td align="right" width="15%">VIP：</td>
    <td width="18%"><select id="vipFlag" name="vipFlag" style="width: 100%">
			<option value="0">否</option>
			<option value="1">是</option>
		</select>	</td>
	<td align="right" width="15%">联系电话：</td>
    <td width="18%"><input type="text" id="linkphone" name="linkphone" value="" style="width:90%"/><font color="red">*</font></td>
    <td align="right" width="15%">订票点：</td>
    <td width="18%"><select id="ticketpointId" name="ticketpointId" style="width: 90%">
			<c:forEach var="it" items="${tpList}">
				<option value="${it.id}">${it.name}</option>
			</c:forEach>			
		</select>	<font color="red">*</font></td>
  </tr>  
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">团体：</td>
    <td width="18%"><select id='teamflag' name="teamflag" style="width: 100%" onchange="isTeam();">
			<option value="0">否</option>
			<option value="1">是</option>
		</select>	</td>
	<td align="right" width="15%">团体名称：</td>
    <td width="18%"><input type="text" id="teamName" name="teamName" value="" style="width:90%;display: none"/></td>
    
    <td  align="right" width="15%">备注：</td>
    <td colspan="1"><textarea id="remark" name="remark" class="tearea"></textarea></td>
  </tr>
		<tr align="center" bgcolor="#FFFFFF">
			
			<td align="center" colspan="6">  
				<input id="bc" type="button" value="订票保存" onclick="check()"/>
				<input id="bc" type="button" value="售 票" onclick="saltTickets()"/>
				</td>
		</tr>
		
</table>

</form>
</div>

  </body>
</html>
