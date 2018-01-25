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
 if (tip.equals("addsuccess"))
 {
 %>
 <p align=center>添加公文文种成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("adderror"))
 {
  %>
 <p align=center>添加公文文种失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("listerror"))
{%>
 <p align=center>查询公文文种信息失败
 </p>

<%} else if (tip.equals("editsuccess"))
 {
%>

 <p align=center>修改公文文种成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editerror"))
{%>
 <p align=center>修改公文文种失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("rname"))
 {
%>

 <p align=center>模板名称重复,请重新上传模板
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>

<%} else if (tip.equals("delsuccess"))
{%>
 <p align=center>删除模板成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delerror"))
{
 %>
 <p align=center>删除模板失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%} else if (tip.equals("dontdel"))
{
 %>
 <p align=center>已有公文引用模板，不能删除,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
 <%} %>
　</fieldset>
  </body>
</html>
