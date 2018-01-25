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
 if (tip.equals("addugsuccess"))
 {
 %>
 <p align=center>添加用户组成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("addugsuccess"))
 {
  %>
 <p align=center>添加用户组失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("listugerror"))
{%>
 <p align=center>查询部门用户组信息失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editugsuccess"))
 {
%>

 <p align=center>修改用户组信息成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editugerror"))
{%>
 <p align=center>修改用户组信息失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("updatepowerssuccess"))
 {
%>

 <p align=center>用户组设置权限成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("updatepowerserror"))
{%>
 <p align=center>用户组设置权限失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("haveuser"))
{%>
 <p align=center>不能删除用户组，用户组已被用,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delerror"))
{%>
 <p align=center>删除用户组失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delsuccess"))
{%>
 <p align=center>删除用户组成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.location.reload();
window.setTimeout("window.close();",3000);
</script>
<%} %>
　</fieldset>
  </body>
</html>
