<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="com.founder.enp.entity.UserPage"/>
<% 

 UserPage userPage = session.getAttribute("userPage")==null?null:(UserPage)session.getAttribute("userPage"); 
 Integer loginSelected =userPage==null?0: userPage.getSelectLogin();
%>
<html>
<head>
<title>

</title>
<script type="text/javascript">
window.location.href="login.jsp";
function window_onbeforeunload()
{
	var n = window.event.screenX - window.screenLeft;     
	var b = n > document.documentElement.scrollWidth-20;     
	if(b && window.event.clientY < 0 || window.event.altKey){
	}
	else{
	  window.location.href="login.jsp";
	}
}

</script>
</head>
<frameset  rows="80,30,*" onbeforeunload="return window_onbeforeunload();" frameborder="0" border="0" id="appMainFrame">
	<frame name="banner" scrolling="no" noresize="noresize" target="MainFrame" src="top.jsp" marginheight="0">
    <frame name="nav" scrolling="no" noresize="noresize" target="enpMainFrame" src="banner.jsp" marginheight="0">
   
	<frameset frameborder="0" cols="170,*" id="MainFrame" border="0">
		<frame id="TaskMenu" name="TaskMenu" src="nav.jsp" scrolling="no" noresize="noresize" target="main">
		<frame id="main" name="main" <%if (loginSelected == 11){ %>src="./gwlzclient/task.jsp"<%}else{ %>src="./gwlzclient/docFlowsAction.do?pg=<%=userPage.getSelectLogin() %>"<%} %> >
	</frameset>
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>