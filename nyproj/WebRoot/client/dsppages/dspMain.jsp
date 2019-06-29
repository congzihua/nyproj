<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
订售票主页面
</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
</head>
<frameset rows="60,40,*" frameborder="0" border="0" id="appMainFrame">
	<frame name="top" scrolling="no" noresize="noresize"  src="<%=request.getContextPath()%>/client/dsppages/top.jsp" marginheight="0">
	<frame name="nav" scrolling="no" noresize="noresize" target="enpMainFrame" src="<%=request.getContextPath()%>/client/dsppages/nav.jsp" marginheight="0">
     <frame id="main" name="main" frameborder="0" marginwidth="0" noresize="noresize" scrolling="no" src="<%=request.getContextPath()%>/client/dsppages/homePage.jsp" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>
