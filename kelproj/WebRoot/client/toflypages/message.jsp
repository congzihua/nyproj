<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.roc.sysmanager.base.service.ClienService"%>
<%@page import="com.roc.syspe.entity.OpOrderticketsKeyword"%>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>
<%
String orderdate = request.getParameter("orderdate");
String flightId = request.getParameter("flightId");
String flyTime = request.getParameter("flyTime");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String message=request.getParameter("message");
ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setSeleFlightId(Integer.valueOf(flightId));
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
		Integer flightInfoId = ol1.get(0).getId();
String dialog="";
if("succ".equals(message)){
	dialog="条形码验证成功！";
}else if("fail".equals(message)){
	dialog="条形码验证失败！";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/util.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/UpdateStatusDWR.js'> </script>
<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/jquery/jquery-3.2.1.min.js"></script>
  </head>
  
  <body style="margin: 0">
  
   <table border="0" height="100%" width="100%"> 
   <tr valign="bottom"> 
   	
   	<td width="40%"> 
   	    
   	<font color="red" >光标聚焦到此对话框进行扫描</font> 
   	<input width="100%" type="text" id="txmv" name="txmv" value="" > 
   	</td> 
   	<td align="left" width="40%" id="info" style="font-size:16px;text-shadow:Red;font-family:'黑体';color: red" nowrap="nowrap"> 
   	  
   	</td> 
   </tr> 
     
   </table>
  </body>
</html>
<script type="text/javascript">
<!--
  document.getElementById("txmv").focus();
var info1 = '正在扫描中...';
  function dataUp(){
  	var message=document.getElementById("info");
	//message.innerHTML=info1;
  	if(document.getElementById("txmv").value!=null && document.getElementById("txmv").value!='' && parseFloat(document.getElementById("txmv").value)>10000){
  		
  		window.setTimeout("mydata();",800);
    }else{
		return;
	//message.innerHTML=info1 +"请继续扫描";
    }
  }
	
  function mydata(){
    var txm  = document.getElementById("txmv");  
    var re = /^[0-9]*$/; 
  	if (txm.value!=null && txm.value !='' && re.test(txm.value)&&parseFloat(document.getElementById("txmv").value)>10000)    {
  			var message=document.getElementById("info");
			//message.innerHTML='正在提交数据...';
			
  		 UpdateStatusDWR.updateStatusAtDJP(txm.value,<%=flightInfoId%>,onHandleM);
				  
	 //}//else if(txm.value!=null && txm.value !=''){
	 	//var message=document.getElementById("info");
			//message.innerHTML='正在提交数据...';
	 	//UpdateStatusDWR.updateStatusAtDJPForSeatNum(txm.value.toUpperCase(),'<%=flightInfoId%>',onHandleM);
	 }else{
		//var message=document.getElementById("info");
	 	////message.innerHTML="登机扫描 继续核对...";
					 document.getElementById("txmv").value='';
				      document.getElementById("txmv").focus();
	 }
  }
			function onHandleM(data){
				if(data>0){
					var message=document.getElementById("info");
					//info1 ="登机核对成功！";
					//message.innerHTML="<font color='red'>条形码验证成功！</font>";
				   parent.document.getElementById("uncharge").src="<%=request.getContextPath()%>/clientAction.do?method=toPageAtDJP1&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>";
					parent.document.getElementById("charged").src="<%=request.getContextPath()%>/clientAction.do?method=toPageAtDJP2&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>&id="+data;
					message.innerHTML="";
				    document.getElementById("txmv").value='';
				      document.getElementById("txmv").focus();

					
				}else{
					 document.getElementById("txmv").value='';
					 document.getElementById("txmv").onblur;
					 var message=document.getElementById("info");
	 				 message.innerHTML="该乘客不是本次航班或不是待安检状态，请核查...";
				     document.getElementById("txmv").focus();
				}
			}
			document.getElementById("txmv").focus();
			$("#txmv").bind("input propertychange",function(){
				dataUp();
			});
//-->
</script>

