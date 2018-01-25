<%@ page language="java" pageEncoding="UTF-8"%>

<html>
  <head>
    <title></title>
  </head>
  <frameset rows="54,*" frameborder="1" >
  
        <frame id="top" name="top" scrolling="no" frameborder="0"  src="top.jsp?userid=<%= request.getParameter("userid") %>">
        <frame id="content" name="content" scrolling="yes" frameborder="0"  src="">
  </frameset>
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>