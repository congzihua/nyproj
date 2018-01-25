<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>
<%
 String flowids = request.getParameter("flowids");
 String sel = request.getParameter("sel");
 %>
<html>
<head>
<title>
<%if (sel.equals("single"))
{ %>
提交
<%}else {
 %>
送会签
 <%} %>
</title>
</head>
<frameset cols="200,*" framespacing="0" frameborder="1">
  <frame src="submitleft.jsp?sel=<%=sel %>&flowids=<%=flowids%>" name="tree" scrolling="no" frameborder="1">
  <frame src="submit.jsp?sel=<%=sel %>&flowids=<%=flowids%>" name="main">
</frameset>
<frameset>
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>

</html>