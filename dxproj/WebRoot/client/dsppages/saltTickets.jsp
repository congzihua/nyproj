<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%

	java.util.List<BaTicketpoint> tpList = (java.util.List<BaTicketpoint>)request.getAttribute("tpList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
	String ot = (String)request.getAttribute("orderdate");
	
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  	java.util.Date date = format.parse(ot);
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
window.name="mypage";
<%if(request.getAttribute("message")!=null && request.getAttribute("message").toString().trim().equals("1")){%>
		alert("订票信息保存成功！");
	<%}else if(request.getAttribute("message")!=null && request.getAttribute("message").toString().trim().equals("0")){%>
  		alert("订票信息保存失败！");
  	<%}else if(request.getAttribute("message")!=null && request.getAttribute("message").toString().trim().equals("2")){%>
  		alert("订票信息打印失败！");
  	<%}%>
function check()
		{	      
			var name = document.getElementById("name");
			
			var certNo = document.getElementById("certNo");
			var linkphone = document.getElementById("linkphone");
			var ticketpointId = document.getElementById("ticketpointId");
			
			var halfpricecard =  document.getElementById("halfpricecard");
			var zeropricecard =  document.getElementById("zeropricecard");
			var priceId =  document.getElementById("priceId");
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
			if(certNo.value == null || certNo.value==''){
				alert('证件号码不能为空，请填写！');
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
               		alert('输入的身份证号或户口簿长度不对，或者号码不符合规定！/n15位号码应全为数字，18位号码末位可以为数字或X。');   
             	 	certNo.focus();
             	 	return false;   
        	 	}   
			}
			if(linkphone.value==null||linkphone.value==''){
				alert('联系电话不能为空，请重新填写！');
				linkphone.focus();
				return;				
			}
			if(linkphone.value.length>25){
				alert('联系电话长度超出范围,不能超过25个字符！');
				linkphone.focus();
				return;
				
			}
			if(ticketpointId.value==null||ticketpointId.value==''){
				alert('订票点不能为空，请重新填写！');				
				return;				
			}
			
			if(halfpricecard.value.length > 25){
				alert("五折优惠卡长度超出范围，不能超过25个字符！");
				halfpricecard.focus();
				return;
				
			}
			if(zeropricecard.value.length > 25){
				alert("全免优惠卡长度超出范围，不能超过25个字符！");
				zeropricecard.focus();
				return;
				
			}
			if(priceId.value == null || priceId.value==""){
				alert("票价不能为空，请选择！");
				priceId.focus();							
				return;
			}
			var isT = document.getElementById("teamflag").value;
			var teamName = document.getElementById("teamName");
			if(isT==1){
				if(teamName.value==null || jsTrim(teamName.value)==''||jsTrim(teamName.value).length==0){
					alert('团体名称不能为空，请填写！');	
					teamName.focus();			
					return;		
				}
			}
			if(remark.value.length>200){
				alert('备注长度超出范围,不能超过200个字符！');	
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
			document.getElementById("gb").disabled="disabled";		
			
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
		function newValidate(data){
			if(data==4){
				alert("该用户已经被列入黑名单中，如有疑问请在后台移除！");
				document.getElementById("bc").disabled="";
				document.getElementById("gb").disabled="";
			}else if(data==3){
				alert("该用户已经订票/或售票不能再次售票！");
				document.getElementById("bc").disabled="";
				document.getElementById("gb").disabled="";
			}else if(data==2){
				alert("该票点票额不足，请核查！");
				document.getElementById("bc").disabled="";
				document.getElementById("gb").disabled="";
			}else if(data==1){
				
				document.forms[0].submit();
			}
		}
function dgpage(){
	var url = "dinggaipage.html";
window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
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
	<div align="left">
		<div style="width: 96%" align="center">
		<FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">
			目的地：</FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #b22222; HEIGHT: 9pt">&nbsp; ${flightinfo.flight} &nbsp; </FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightinfo.flightNo} &nbsp; &nbsp; &nbsp;</font></FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">乘机日期：</FONT>&nbsp; <FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt"><fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/> &nbsp;${flightinfo.flyTime} &nbsp; 星期 <%=weeks%>
		</FONT>
		</div>
		<div style="width: 96%" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			售 票 信 息 表
		</FONT>
		</div>
	</div>
	<div style="width: 94%" align="left">	
	<form action="<%=request.getContextPath()%>/clientAction.do?method=addSaltTicketsInfo" method="post" target="mypage">
	<input type="hidden" id="flightId" name="flightId" value="${flightId}"/>
	<input type="hidden" id="orderdate" name="orderdate" value="${orderdate}"/>
	<input type="hidden" id="flyTime" name="flyTime" value="${flyTime}"/>
	<input type="hidden" id="flightinfoId" name="flightinfoId" value="${flightinfoId}"/>
	<input type="hidden" name="ordertime" value="${flyTime}"/>
	<table width="100%" border="0" align="left"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
 
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
    <td width="18%"><select name="vipFlag" style="width: 100%">
			<option value="0">否</option>
			<option value="1">是</option>
		</select>	</td>
	<td align="right" width="15%">联系电话：</td>
    <td width="18%"><input type="text" id="linkphone" name="linkphone" value="${linkphone}" style="width:90%"/><font color="red">*</font></td>
    <td align="right" width="15%">订票点：</td>
    <td width="18%"><select id="ticketpointId" name="ticketpointId" style="width: 90%">
			<c:forEach var="it" items="${tpList}">
				<option value="${it.id}">${it.name}</option>
			</c:forEach>			
		</select>	<font color="red">*</font></td>
  </tr>  
   <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">五折优惠卡：</td>
    <td width="18%"><input type="text" id="halfpricecard" name="halfpricecard" value="" style="width:90%"/></td>
    <td align="right" width="15%">全免优惠卡：</td>
    <td width="18%"><input type="text" id="zeropricecard" name="zeropricecard" value="" style="width:90%"/></td>
    <td align="right" width="15%">付款方式：</td>
    <td width="18%">
    <select id="payment" name="payment" style="width: 90%">
    	<option value="现金">现金</option>
    	<option value="支票">支票</option>
    	<option value="银行卡">银行卡</option>
    </select>
    <font color="red">*</font></td>
  </tr>   
   <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">票价类型：</td>
    <td  colspan="5">
    <select id="priceId" name="priceId">
   
    	<%for(BaTicketprice tpr:tprice){ %>
    	
    	<option value="<%=tpr.getId()%>"><%=tpr.getDiscountType()%></option>
    	<%} %>
    </select>
    <font color="red">*</font>
    </td>
    
  </tr>  
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">团体：</td>
    <td width="18%"><select id='teamflag' name="teamflag" style="width: 100%" onchange="isTeam();">
			<option value="0" <%=request.getAttribute("teamflag")==null||request.getAttribute("teamflag").toString().trim().equals("0")?"selected=\"selected\"":"" %>>否</option>
			<option value="1" <%=request.getAttribute("teamflag")!=null&&request.getAttribute("teamflag").toString().trim().equals("1")?"selected='selected'":""%>>是</option>
		</select>	</td>
	<td align="right" width="15%">团体名称：</td>
    <td width="18%">
    <% if(request.getAttribute("teamflag")!=null&&request.getAttribute("teamflag").toString().trim().equals("1")){%>
    <input type="text" id="teamName" name="teamName" value="<%=request.getAttribute("teamName").toString() %>"  style="width:90%;"/>
    <%}else{ %>
    <input type="text" id="teamName" name="teamName" value=""  style="width:90%;display: none"/>
    <%} %>
    </td>
    <td  align="right" width="15%">备注：</td>
    <td colspan="1"><textarea id="remark" name="remark" class="tearea"></textarea></td>
  </tr>
		<tr align="center" bgcolor="#FFFFFF">
			
			<td align="center" colspan="6">  
				<input id="bc" type="button" value="保 存" onclick="check()"/>
				<input id="gb" type="button" value="关闭" onclick="window.close();"/> 
				</td>
		</tr>
		
</table>

</form>
</div>

  </body>
</html>
