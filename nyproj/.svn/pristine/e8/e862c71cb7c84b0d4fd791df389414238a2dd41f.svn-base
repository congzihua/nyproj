<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	OpOrdertickets flightinfo = (OpOrdertickets)request.getAttribute("flightinfo");
	java.util.List<BaTicketpoint> tpList = (java.util.List<BaTicketpoint>)request.getAttribute("tpList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<script type="text/javascript" src="js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="js/verify.js"></script>
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
.tearea{overflow-y:auto;padding:0;width:99%;height:70px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->
</STYLE>
<SCRIPT language=JavaScript1.2>
<!--
window.name="mytable";
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
			
			if(remark.value.length>200){
				alert('备注长度超出范围,不能超过200个字符！');	
				remark.focus();			
				return;				
			}
			
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			document.forms[0].submit();			
			
		}
		function qren(data){
			if(window.confirm('您确定要进行退订操作吗？'))
				SysmanagerDWR.ticketsInforeturn(data,'<%=auth.getUserid()%>',8,handlerM);
		}
		function handlerM(data){
			if(data){
				window.close();
			}else{
				document.getElementById("bc").disabled="";
				document.getElementById("cl").disabled="";
				alert("信息确认失败！");
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
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			订 票 信 息 修 改 
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/clientAction.do?method=orderInfoEdit" method="post" target="mytable">
	<input type="hidden" name="flightId" value="${flightinfo.flightId}"/>
	<input type="hidden" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" name="flightinfoId" value="${flightinfo.flightinfoId}"/>
	<input type="hidden" name="id" value="${id}"/>
	<input type="hidden" name="status" value="${flightinfo.status}"/>
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">目的地：</td>
    <td width="18%">${flightinfo.flight}</td>
    <td align="right" width="15%">乘机日期：</td>
    <td width="18%"><fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/> ${flightinfo.flyTime}</td>
     <td align="right" width="15%">航班号：</td>
    
	<td width="18%">${flightinfo.flightNo}</td>
	
    
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">姓名：</td>
    <td width="18%"><input type="text" value="${flightinfo.name}" id="name" name="name" style="width: 90%"/><font color="red">*</font></td>
    <td align="right" width="15%">证件类型：</td>
    <td width="18%"><select id="certType" name="certType" style="width: 98%">
		
		<option value="身份证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=flightinfo.getCertType()!=null && flightinfo.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>
    <td align="right" width="15%">证件号码：</td>
    <td width="18%"><input type="text" id="certNo" name="certNo" value="${flightinfo.certNo}" style="width: 96%"/></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">联系电话：</td>
    <td width="18%"><input type="text" id="linkphone" name="linkphone" value="${flightinfo.linkphone}" style="width:90%"/><font color="red">*</font></td>
    <td align="right" width="15%">VIP：</td>
    <td width="18%"><select name="vipFlag" style="width: 100%">
			<option value="0"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=flightinfo.getVipFlag()!=null && flightinfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    <td align="right" width="15%">订票点：</td>
    <td width="18%"><select id="ticketpointId" name="ticketpointId" style="width: 90%">
			<%for(BaTicketpoint tp: tpList){ %>
				<option value="<%=tp.getId() %>" <%=tp.getId().equals(flightinfo.getTicketpointId())?"selected='selected'":""%>><%=tp.getName()%></option>
			<%}%>			
		</select>	<font color="red">*</font></td>
  </tr> 
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">团体：</td>
    <td width="18%"><select id='teamflag' name="teamflag" style="width: 100%" onPropertyChange="isTeam();">
			<option value="0"  <%=flightinfo.getTeamflag()!=null && flightinfo.getTeamflag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1" <%=flightinfo.getTeamflag()!=null && flightinfo.getTeamflag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
	<td align="right" width="15%">团体名称：</td>
    <td width="18%">
    	<%if(flightinfo.getTeamflag()!=null && flightinfo.getTeamflag().equals("1")){ %>
    	<input type="text" id="teamName" name="teamName" value="${flightinfo.teamName}" style="width:90%;"/>
    	<%}else { %>
    	<input type="text" id="teamName" name="teamName" value="" style="width:90%;display: none"/>
    	<%} %>
    	</td>
    <td  align="right" width="15%">备注：</td>
    <td colspan="1"><textarea id="remark" name="remark" class="tearea">${flightinfo.remark}</textarea></td>
  </tr>
  
		<tr align="center" bgcolor="#FFFFFF">
			<td align="center" colspan="6">  
				<input id="bc" type="button" value="保存" onclick="check()"/>
				<input id="bc" type="button" value="退订" onclick="qren(${id})"/>
				<input id="cl" type="button" value="关 闭" onclick="window.close();"/>
				</td>
		</tr>
		
</table>
</form>

  </body>
</html>
