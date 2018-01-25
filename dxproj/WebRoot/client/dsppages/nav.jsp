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
	function myInfo(){
		var url = '<%=request.getContextPath()%>/client/dsppages/units/myUnits.jsp';
		window.showModalDialog(url,window,"dialogWidth: 790px; dialogHeight: 800px;  help: no; scroll: no; status: no");
	}
	</script>   
  </head>
  
  <body topmargin="0" leftmargin="0"
		style="font-size:14px;margin:0"
		oncontextmenu="if (!event.ctrlKey){return false;}" BACKGROUND="<%=request.getContextPath() %>/image/blue.jpg">
		<form action="<%=request.getContextPath()%>/clientAction.do?method=tc" method="post"></form>
		<div align="center">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr valign="top">
      <th height="41" scope="col"  nowrap="nowrap"><div align="left"><span><font style="font-size:12";style="font-family:'宋体'" color="blue"><%=authorization.getName() +"："%> 您好！ 登录时间：<%=authorization.getRtime() %></font></span> &nbsp;
       <a href="<%=request.getContextPath()%>/client/dsppages/homePage.jsp" target="main"> <font style="font-size:12";style="font-family:'宋体'"color="#FF0000">首页</font></a>|
      <span><a href="<%=request.getContextPath()%>/client/dsppages/flightInfoList.jsp" target="main"><font style="font-size:12";style="font-family:'宋体'" color="#FF0000">生成航班号</font></a></span>|
      <span><a href="<%=request.getContextPath()%>/client/dsppages/units/myUnits.jsp" target="main"><font style="font-size: 12";style="font-family:'宋体'" color="#FF0000">我的信息</font></a></span>|
      <a href="<%=request.getContextPath()%>/client/dsppages/userFlyInfoList.jsp" target="main"> <font style="font-size:12";style="font-family:'宋体'"color="#FF0000">信息查询</font></a></span>|
      </div></th>
      <th scope="col" align="right"><div align="center"><a href="#" onclick="uppassword();"><font style="font-size:12";style="font-family:'宋体'" color="#FF0000">修改密码</font></a>|<a href="#" onclick="tc();"><font style="font-size:12";style="font-family:'宋体'" color="#FF0000"> 退出</font></a></div></th>
    </tr>
  </table>
		
		</div>
        
  </body>
</html>

