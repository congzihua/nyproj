<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
	值登机系统
</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
</head>
<frameset rows="60,23,*" frameborder="0" border="0" id="appMainFrame">
	<frame name="top" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/client/djppages/top.jsp" marginheight="0">
	<frame name="nav" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/client/djppages/nav.jsp" marginheight="0">
     <frame id="main" name="main" src="<%=request.getContextPath()%>/client/djppages/homePage.jsp" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>