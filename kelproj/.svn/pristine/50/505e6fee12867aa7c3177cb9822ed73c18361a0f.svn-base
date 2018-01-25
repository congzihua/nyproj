<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization"/>

<%
    Authorization authorization = (Authorization)session.getAttribute("authorization");
	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'nav.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<script type="text/javascript">
	function init(name)
	{
	    document.getElementById("position").innerText=name;
	}

    function doUnLoad()
    {
      
		document.all("frame1").src="./gwlzclient/unloadAction.do";
	    alert("正在断开与数据库的连接,请在5秒钟之后,关闭此对话框");
    }
	</script>   
  </head>
  
  <body topmargin="0" leftmargin="0" onbeforeunload="return doUnLoad();" 
		style="font-size:14px; "
		oncontextmenu="if (!event.ctrlKey){return false;}" BACKGROUND="images/nav.bmp">
		<div style="margin-left:10px;margin-top:8px;color:white">
		
		 <span><%=authorization.getName() %> 您好</span>
		  <span> 登录时间：<%=authorization.getRtime() %></span><span id="position"></span>
		</div>
        
        <div>
        <iframe id="frame1" style="display:none" ></iframe>
  </body>
</html>

