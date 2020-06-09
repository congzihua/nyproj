<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	int flightinfoId =(int)request.getAttribute("flightinfoId");
%>

<html>
<head>
<title>
登机扫描系统-框架
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
					message.src="<%=request.getContextPath()%>/tempflight/djsmpages/message.jsp?message=succ";
					//message.innerHTML="<font color='red'>条形码验证成功！</font>";
					document.getElementById("uncharge").src="<%=request.getContextPath()%>/tfClientAction.do?method=toFlyAlrSafeCheck&flightinfoId=<%=flightinfoId %>";
					document.getElementById("charged").src="<%=request.getContextPath()%>/tfClientAction.do?method=areadyToFly&flightinfoId=<%=flightinfoId %>";
				}else{
					var message=document.getElementById("message");
					message.src="<%=request.getContextPath()%>/tempflight/djsmpages/message.jsp?message=fail";
					//message.innerHTML="<font color='red'>条形码验证失败！</font>";
				}
			}
				document.onkeypress=keyContent;
		}
	</script>
</head>

<frameset rows="310,30,*" cols="195" frameborder="1" border="1" id="appMainFrame">
     <frame id="uncharge" scrolling="yes"  style="width:98%"  name="main" src="<%=request.getContextPath()%>/tfClientAction.do?method=toFlyAlrSafeCheck&flightinfoId=<%=flightinfoId %>" >
     <frame id="message" scrolling="no"  name="main"  style="width:98%" src="<%=request.getContextPath()%>/tempflight/djsmpages/message.jsp?flightinfoId=<%=flightinfoId %>">
     <frame id="charged" scrolling="yes"  style="width:98%" name="main" src="<%=request.getContextPath()%>/tfClientAction.do?method=areadyToFly&flightinfoId=<%=flightinfoId %>" >
	
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>



</html>
