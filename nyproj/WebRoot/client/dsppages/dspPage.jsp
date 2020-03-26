<%@page import="com.roc.syspe.entity.OpOrdertickets"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	
	List<OpOrdertickets> ol1 = (List<OpOrdertickets>)request.getAttribute("flightInfoList");
	String flightInfoIds = "";
	String flightIds = "";
	for (OpOrdertickets ot:ol1) {
		flightInfoIds +=","+ ot.getId();
		flightIds += ","+ot.getFlightId();
	}
	flightInfoIds = flightInfoIds.substring(1);
	flightIds = flightIds.substring(1);
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
	<frame id="dspTop" name="dspTop" scrolling="auto" noresize="noresize"  src="<%=request.getContextPath()%>/clientAction.do?method=toTopInfoPage&flightinfoIds=<%=flightInfoIds%>" marginheight="0">
	
     <frame id="dspBottom" name="dspBottom" src="<%=request.getContextPath()%>/clientAction.do?method=toBottomList&flightinfoIds=<%=flightInfoIds%>&orderdate=<%=orderdate%>&ordertime=<%=flyTime%>&flightIds=<%=flightIds %>" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>