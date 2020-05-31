<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	TempFlightinfo flightinfo = (TempFlightinfo)request.getAttribute("flightinfo");
	TempOrdertickets orderInfo = (TempOrdertickets)request.getAttribute("orderInfo");
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 %>
<!DOCTYPE html>
<html>
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
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/TfSysmanagerDWR.js'> </script>
		<STYLE type="text/css">
<!--
.tearea{overflow-y:auto;padding:0;width:99%;height:70px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->
</STYLE>
<script type="text/javascript">
window.name="mypage";
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
			
			if(remark.value.length>200){
				alert('备注长度超出范围,不能超过200个字符！');	
				remark.focus();			
				return;				
			}
			
			document.getElementById("bc").disabled="disabled";
			document.getElementById("cl").disabled="disabled";
			document.forms[0].submit();			
			
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
	
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div style="width: 1024" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			订 票 信 息 修 改 
		</FONT>
		</div>
	<form action="<%=request.getContextPath()%>/tfClientAction.do?method=orderInfoEdit" method="post" target="mypage">
	<input type="hidden" name="orderdate" value="<fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/>"/>
	<input type="hidden" name="flyTime" value="${flightinfo.flyTime}"/>
	<input type="hidden" name="flightinfoId" value="${flightinfo.id}"/>
	<input type="hidden" name="id" value="${id}"/>
	<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">目的地：</td>
    <td width="18%">${orderInfo.flightInfo}</td>
    <td align="right" width="15%">乘机日期：</td>
    <td width="18%"><fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/> ${flightinfo.flyTime}</td>
     <td align="right" width="15%">航班号：</td>
    
	<td width="18%">${flightinfo.flightNo}</td>
	
    
  </tr><tr bgcolor="#FFFFFF">
    <td align="right" width="15%">始发地：</td>
    <td width="18%">${flightinfo.origin}</td>
    <td align="right" width="15%">航程：</td>
    <td width="18%">
    	<input type="text" value="${orderInfo.flightInfo}" id="flightInfo" name="flightInfo" class="input" style="width: 90%"/><font color="red">*</font>
    </td>
    <td align="right" width="15%">登机口：</td>
    <td width="18%"><input type="text" id="gate" class="input" name="gate" value="${orderInfo.gate}" style="width: 90%"/><font color="red">*</font></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">姓名：</td>
    <td width="18%"><input type="text" value="${orderInfo.name}" id="name" name="name" style="width: 90%"/><font color="red">*</font></td>
    <td align="right" width="15%">证件类型：</td>
    <td width="18%"><select id="certType" name="certType" style="width: 98%">
		
		<option value="身份证" <%=orderInfo.getCertType()!=null && orderInfo.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=orderInfo.getCertType()!=null && orderInfo.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=orderInfo.getCertType()!=null && orderInfo.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=orderInfo.getCertType()!=null && orderInfo.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=orderInfo.getCertType()!=null && orderInfo.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>
    <td align="right" width="15%">证件号码：</td>
    <td width="18%"><input type="text" id="certNo" name="certNo" value="${orderInfo.certNo}" style="width: 96%"/></td>
  </tr>
  <tr bgcolor="#FFFFFF" >
    <td align="right" width="15%">联系电话：</td>
    <td width="18%"><input type="text" id="linkphone" name="linkphone" value="${orderInfo.linkphone}" style="width:90%"/><font color="red">*</font></td>
    <td align="right" width="15%">VIP：</td>
    <td width="18%"><select name="vipFlag" style="width: 100%">
			<option value="0"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=orderInfo.getVipFlag()!=null && orderInfo.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    <td align="right" width="15%">团体：</td>
    <td width="18%"><select id='teamflag' name="teamflag" style="width: 100%" onchange="isTeam();">
			<option value="0"  <%=orderInfo.getTeamflag()!=null && orderInfo.getTeamflag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1" <%=orderInfo.getTeamflag()!=null && orderInfo.getTeamflag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
	
  </tr> 
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">团体名称：</td>
    <td width="18%">
    	<%if(orderInfo.getTeamflag()!=null && orderInfo.getTeamflag().equals("1")){ %>
    	<input type="text" id="teamName" name="teamName" value="${orderInfo.teamName}" style="width:90%;"/>
    	<%}else { %>
    	<input type="text" id="teamName" name="teamName" value="" style="width:90%;display: none"/>
    	<%} %>
    	</td>
    <td  align="right" width="15%">备注：</td>
    <td colspan="3"><textarea id="remark" name="remark" class="tearea">${orderInfo.remark}</textarea></td>
  </tr>
  
		<tr align="center" bgcolor="#FFFFFF">
			<td align="center" colspan="6">  
				<input id="bc" type="button" value="保存" onclick="check()"/>
				<input id="cl" type="button" value="关 闭" onclick="javascript:window.close();"/>
				</td>
		</tr>
		
</table>
</form>

  </body>
</html>
