<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
登机扫描系统-框架页面
</title>
</head>
<frameset rows="60,20,*" frameborder="0" border="0" id="appMainFrame">
	<frame name="top" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/nyaddfold/clientfold/ajwindow/top.jsp" marginheight="0">
	<frame name="nav" scrolling="no" noresize="noresize" target="enpMainFrame" src="<%=request.getContextPath()%>/nyaddfold/clientfold/ajwindow/nav.jsp" marginheight="0">
     <frame id="main" name="main" src="<%=request.getContextPath()%>/nyaddfold/clientfold/ajwindow/homePage.jsp" >
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>