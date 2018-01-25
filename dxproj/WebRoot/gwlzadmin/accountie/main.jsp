<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>
<html>
<head>
<title>
main
</title>
</head>
<frameset cols="200,*" framespacing="0" frameborder="1">
  <frame src="left.jsp" name="tree" scrolling="yes" frameborder="1">
  <frame src="" name="main" frameborder="1">
</frameset>
<frameset>
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>

</html>