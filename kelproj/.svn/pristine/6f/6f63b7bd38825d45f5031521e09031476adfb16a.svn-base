<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String docOper = request.getSession().getAttribute("docOper")==null?"":(String)request.getSession().getAttribute("docOper");
  %>
<html>
  <head>
    <title><%if (docOper.equals("view")){ %>查看公文<%}else if (docOper.equals("finish")){ %>办结公文<%}else{ %>公文编辑<%} %></title>
      <script type="text/javascript" src="../../js/common.js"></script>
    <script type="text/javascript">
    function doUnLoad()
    {
        var sUrl = "docAction.do?oper=clearsession";
		new net.ContentLoader(sUrl, doFinishClearSession); 
    }
    function doFinishClearSession()
    { 
    }
    </script>
  </head>
  <frameset onunload="javascript:doUnLoad();"  rows="27,*,40" frameborder="0" border="0"  id="addfrm">
  
        <frame id="top" name="top" scrolling="no"  src="top.jsp">
        <frame id="content" name="content" scrolling="no" frameborder="0"  src="">
        <frame id="oper" name="oper" scrolling="no" frameborder="1"  src="save.jsp">
  </frameset>
    <noframes>
        <body>
            <p>no frames</p>
        </body>
    </noframes>
</frameset>
</html>