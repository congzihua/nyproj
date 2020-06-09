<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.roc.sysmanager.base.action.ExcelUtil" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//ExcelUtil.printByExcel();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TiaoXingMa.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script> 
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script> 
		<script type='text/javascript' src='<%=path %>/dwr/interface/UpdateStatusDWR.js'> </script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	//tiaoxingma();
		function tiaoxingma(){
		
		//window.onload = function() {
 	//	 k = document.getElementById("txm");
 	//	 if (k.addEventListener) {
  		// k.addEventListener('keypress', keyContent, false);
 	//	 }
 	//	 else if (k.attachEvent) {
 	//	  k.attachEvent('onkeypress', keyContent);
 	//	 }
 	//	}
		
		//	if(event.keyCode==13){  
	//			alert("~~~~~!");
   	//			document.getElementById("txm").value="SB";  
		//	} 
			
			function keyContent(e) {
				  var e=e||event;
				  var keyCode=e.keyCode?e.keyCode:e.which;  
				  character = String.fromCharCode(keyCode);
				  k = document.getElementById("txm");
				  k.value = character;
				  UpdateStatusDWR.updateStatusAtDJP(character,onHandleM);
				  event.returnValue=false; 
				 }
			function onHandleM(data){
				if(data){
					alert("条形码验证成功！");
				}else{
					alert("条形码验证失败！");
				}
			}
				document.onkeypress=keyContent;
				
		}
	</script>
  </head>
  
  <body>
    二维条码：<input type="text" id="txm"/> 
  </body>
</html>
