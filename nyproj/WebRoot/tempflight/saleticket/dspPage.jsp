<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	
	List<TempFlightinfo> tempFlightinfos = (List<TempFlightinfo>)request.getAttribute("flightInfoList");
	Integer flightInfoId = tempFlightinfos.get(0).getId();
	
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
<frameset rows="210,*" frameborder="0" border="0" id="appMainFrame">
	<frame id="dspTop" name="dspTop" noresize="noresize"  src="<%=request.getContextPath()%>/tfClientAction.do?method=toTopInfoPage&flightinfoId=<%=flightInfoId%>" marginheight="0">
     <frame id="dspBottom" name="dspBottom" src="<%=request.getContextPath()%>/tfClientAction.do?method=toBottomList&flightinfoId=<%=flightInfoId%>&orderdate=<%=orderdate%>&ordertime=<%=flyTime%>" >
	<noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>