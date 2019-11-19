<%@ page contentType="text/html; charset=UTF-8" %>
<%
	
	Integer flightinfoId = (Integer)request.getAttribute("flightinfoId");
		String flightId = (String)request.getAttribute("flightId");
	String orderdate = (String)request.getAttribute("orderdate");
	String flyTime = (String)request.getAttribute("flyTime");
%>
<html>
<head>
<title>
订售票主页面
</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
</head>
<frameset rows="160,*" frameborder="0" border="0" id="appMainFrame">
	<frame id="dspTop" name="dspTop" scrolling="auto" noresize="noresize"  src="<%=request.getContextPath()%>/clientAction.do?method=toTopInfoPage&flightinfoId=<%=flightinfoId%>" marginheight="0">
	
     <frame id="dspBottom" name="dspBottom" src="<%=request.getContextPath()%>/clientAction.do?method=toBottomList&flightinfoId=<%=flightinfoId%>&flightId=<%=flightId%>&orderdate=<%=orderdate%>&ordertime=<%=flyTime%>" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>