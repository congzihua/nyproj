<%@ page language="java"  pageEncoding="UTF-8"%>
<%
    String tip = String.valueOf(request.getAttribute("oper"));
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>操作提示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <body style="color:#000000;font-size:12px" margin="0px">
 <fieldset>
<legend>系统提示:</legend>
<%
 if (tip.equals("insertsuccess"))
 {
 %>
 <p align=center>添加用户成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("inserterror"))
 {
  %>
 <p align=center>添加用户失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("listerror"))
{%>
 <p align=center>查询用户信息失败
 </p>

<%} else if (tip.equals("editsuccess"))
 {
%>

 <p align=center>修改用户成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editerror"))
{%>
 <p align=center>修改用户,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delsuccess"))
{%>
 <p align=center>删除用户成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delerror"))
{
 %>
 <p align=center>删除用户失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%}if (tip.equals("transferok"))
 {
 %>
 <p align=center>调动用户成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("transfererror"))
 {
  %>
 <p align=center>调动用户失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} %>
　</fieldset>
  </body>
</html>
