<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=path %>/dwr/interface/SysmanagerDWR.js'> </script>
	
	
	

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
function check(data)
		{	      
			var flightNo = document.getElementById("flightNo");
			if(flightNo.value ==null||flightNo.value==''){
				alert('航班号不能为空！');
				flightNo.focus();
				return;
				
			}		
			if(flightNo.value !=null&&flightNo.value.length>15){
				alert('航班号长度超出范围，不能超过15个字符，请重新填写！');
				flightNo.focus();
				return;
				
			}			
			document.getElementById("bc").disabled="disabled";
			SysmanagerDWR.bentchUpdateFlightNo(data,flightNo.value,handlerMethod)			
			
		}
		function handlerMethod(data){
			if(data){
				alert("信息批量修改成功");				
			}else{
				alert("信息批量修改失败！");
				document.getElementById("bc").disabled="";
			}
		}

//-->
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	 <%if(request.getAttribute("message").toString().equals("1")) {%>
	 

	<form action="" method="post" target="_slef">
	
	<input type="hidden" name="flightinfoId" value="${flightinfoId}"/>
	
	<table width="500" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
  <tr bgcolor="#FFFFFF">
    
     <td align="right" width="15%">航班号：</td>
    
	<td><input type="text" id="flightNo" name="flightNo" style="width: 65%" value="${flightinfo.flightNo}"/>
 
			  
				&nbsp; &nbsp; &nbsp; &nbsp; <input id="bc" type="button" value="批量生成" onclick="check('${flightinfoId}')"/>
				
				</td>
		</tr>
		
</table>
</form>
<%}else{ %>
	<font color="red">您选择的航程和起飞时间没有航班信息，请重新查询！</font>
<%}%>
  </body>
</html>
