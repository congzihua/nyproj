<%@ page language="java"  pageEncoding="UTF-8"%>
<%
    String tip = String.valueOf(request.getAttribute("message"));
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>操作提示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <body style="color:#000000;font-size:12px" margin="0px" oncontextmenu="if (!event.ctrlKey){return false;}">
 <fieldset>
<legend>系统提示:</legend>

<%if (tip.equals("1"))
{%>
 <p align=center>售票成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%}else if(tip.equals("0")){%>

 	<p align=center style="color: red">售票信息添加失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%}else if(tip.equals("2")){%>

 	<p align=center style="color: red">打印票据失败！
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%}%>

 	
　</fieldset>
  </body>
</html>
