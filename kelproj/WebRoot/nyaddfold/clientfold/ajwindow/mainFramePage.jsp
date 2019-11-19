<%@ page contentType="text/html; charset=UTF-8" %>
<% 
String flightId=(String)request.getAttribute("flightId"); 
String flight=java.net.URLEncoder.encode((String)request.getAttribute("flight"),"utf-8");
String orderdate=(String)request.getAttribute("orderdate");
String flyTime=(String)request.getAttribute("flyTime");
%>

<html>
<head>
<title>
登机牌核对主页面
</title>
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/util.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/UpdateStatusDWR.js'> </script>
<script type="text/javascript">
	//tiaoxingma();
		function tiaoxingma(){
			function keyContent(e) {
					var e=e||event;
				  var keyCode=e.keyCode?e.keyCode:e.which;  
				  character = String.fromCharCode(keyCode);
				  //k = document.getElementById("txm");
				  //k.value = character;
				  UpdateStatusDWR.updateStatusAtDJP(character,onHandleM);
				  e.returnValue=false; 
				 }
			function onHandleM(data){
				if(data){
					var message=document.getElementById("message");
					message.src="<%=request.getContextPath()%>/client/toflypages/message.jsp?message=succ";
					//message.innerHTML="<font color='red'>条形码验证成功！</font>";
					document.getElementById("uncharge").src="<%=request.getContextPath()%>/clientAction.do?method=toFlyAlrSafeCheck&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>";
					document.getElementById("charged").src="<%=request.getContextPath()%>/clientAction.do?method=areadyToFly&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>";
				}else{
					var message=document.getElementById("message");
					message.src="<%=request.getContextPath()%>/client/toflypages/message.jsp?message=fail";
					//message.innerHTML="<font color='red'>条形码验证失败！</font>";
				}
			}
				document.onkeypress=keyContent;
		}
	</script>
</head>

<frameset rows="310,30,*" cols="195" frameborder="1" border="1" id="appMainFrame">
     <frame id="uncharge" scrolling="yes"  style="width:98%"  name="main" src="<%=request.getContextPath()%>/clientAction.do?method=toFlyAlrSafeCheck&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>&flight=<%=flight %>" >
     <frame id="message" scrolling="no"  name="main"  style="width:98%" src="<%=request.getContextPath()%>/nyaddfold/clientfold/ajwindow/message.jsp?orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>">
     <frame id="charged" scrolling="yes"  style="width:98%" name="main" src="<%=request.getContextPath()%>/clientAction.do?method=areadyToFly&orderdate=<%=orderdate %>&flightId=<%=flightId%>&flyTime=<%=flyTime%>" >
	
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>



</html>
