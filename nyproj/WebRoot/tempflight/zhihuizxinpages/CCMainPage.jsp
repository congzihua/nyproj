<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
List<TempFlightinfo> flightInfos =(List<TempFlightinfo>)request.getAttribute("flightInfos"); 
%>

<html>
<head>
<title>
指挥中心主页面
</title>
</head>
<frameset  rows="400,*,100" cols="195" frameborder="1" border="1" id="appMainFrame">

     <%
     int i = 0;
     for(TempFlightinfo info:flightInfos){
    	%>
    	<frame id="contain<%=i%>" scrolling="yes" name="contains" style="width:98%" src="<%=request.getContextPath()%>/tfCommandCenter.do?method=toMainPageContain&flightinfoId=<%=info.getId()%>&posNum=<%=i %>"  >
    	<% 
   		i++;	  
     }
    	%>
     	
	


    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>
