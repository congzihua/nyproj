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
	function uppassword(){
		var url = "<%=request.getContextPath()%>/updatePassWord.jsp"
		window.showModalDialog(url,window,"dialogWidth: 512px; dialogHeight: 400px; help: no; scroll: auto; status: no");
	}
	</script>   
  </head>
  
  <body topmargin="10" leftmargin="0"
		style="font-size:14px;margin:0;background-image: url(<%=request.getContextPath() %>/tempflight/img/nav.png);background-size: 100% 100%;background-repeat: no-repeat"
		oncontextmenu="if (!event.ctrlKey){return false;}" >
		<form action="<%=request.getContextPath()%>/tfClientAction.do?method=tc" method="post"></form>
		<div align="center" style="width: 100%">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr valign="middle">
      <th  scope="col"  nowrap="nowrap"><div align="left"> &nbsp;
       <a href="<%=request.getContextPath()%>/tempflight/safecheck/homePage.jsp" target="main"> <font style="font-size:12";style="font-family:'宋体'"color="#FFFFFF">首页</font></a>|
      </div></th>
      <th scope="col" align="right"><div align="right"><a href="#" onclick="uppassword();"><font style="font-size:12";style="font-family:'宋体'" color="#FFFFFF">修改密码</font></a>|<a href="#" onclick="tc();"><font style="font-size:12";style="font-family:'宋体'" color="#FF0000"> 退出</font></a></div></th>
    </tr>
  </table>
		</div>
  </body>
</html>

