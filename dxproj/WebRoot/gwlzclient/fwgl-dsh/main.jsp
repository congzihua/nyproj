<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'main.jsp' starting page</title>

  </head>
  
  <frameset rows="60,50%,33,*" frameborder="0" border="0" id="commfrm">
  
        <frame id="oper" name="list" scrolling="no" src="fwgl-dsh/operation.jsp">
        <frame id="list" name="list" src="list.jsp">
        <frame id="page" name="page" src="page.jsp" >
		<frame id="view" name="view" src="view.jsp" >
  </frameset>
    <noframes>
        <body>
            <p>no frames</p>
                    </body>
    </noframes>
</frameset>
</html>