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
	 function tc(){
		if(window.confirm("您确定要退出系统吗？")){
			document.forms[0].submit();
		}
	}
	</script>   
  </head>
  
  <body topmargin="0" leftmargin="0"
		style="font-size:14px;"
		oncontextmenu="if (!event.ctrlKey){return false;}" BACKGROUND="<%=request.getContextPath() %>/image/blue.jpg">
		<form action="<%=request.getContextPath()%>/clientAction.do?method=tc" method="post"></form>
		<div align="center">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <th valign="top"scope="col" ><div align="left"><span><font style="font-size:12";style="font-family:'宋体'" color="blue"><%=authorization.getName() +"："%> 您好！ 登录时间：<%=authorization.getRtime() %></font></span> &nbsp; <span><a href="<%=request.getContextPath()%>/client/toflypages/homePage.jsp" target="main"><font style="font-size:12";style="font-family:'宋体'"color="#FF0000">首页</font></a></span></div></th>
      <th scope="col" align="right"><div align="right"><a href="#" onclick="tc();"><font style="font-size:12";style="font-family:'宋体'" color="#FF0000"> 退出</font></a></div></th>
    </tr>
  </table>
		
		</div>
        
  </body>
</html>

