<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
	值登机系统
</title>
</head>
<frameset rows="70,20,*" frameborder="0" border="0" id="appMainFrame">
	<frame name="top" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/tempflight/zhijipages/top.jsp" marginheight="0">
	<frame name="nav" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/tempflight/zhijipages/nav.jsp" marginheight="0">
     <frame id="main" name="main" src="<%=request.getContextPath()%>/tempflight/zhijipages/homePage.jsp" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>