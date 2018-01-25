<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:directive.page import="java.util.*" />
<% 
Integer num=(Integer)request.getAttribute("howMany"); 
String flightdate=(String)request.getAttribute("odate");
%>

<html>
<head>
<title>
指挥中心主页面
</title>
</head>
<frameset  rows="500,*,100" cols="195" frameborder="1" border="1" id="appMainFrame">

     <%
     for(int i=0;i<(num>3?3:num);i++){
    	%>
    	<frame id="contain<%=i%>" scrolling="yes" name="contains" style="width:98%" src="<%=request.getContextPath()%>/commandCenter.do?method=toMainPageContain<%=i%>&orderdate=<%=flightdate%>" >
    	<% 
   			  }
    	%>
     	
	


    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>
