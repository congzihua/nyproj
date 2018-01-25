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
 if (tip.equals("adddmpsuccess"))
 {
 %>
 <p align=center>添加部门成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.iframe.tree.reload();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("adddmperror"))
 {
   %>
 <p align=center>添加部门失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("querydmperror"))
{%>
 <p align=center>查询部门信息失败,窗体将在三秒后自动关闭</p>
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editdmpsuccess"))
 {
 
%>
 <p align=center>修改部门信息成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
  window.opener.iframe.tree.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("editdmperror"))
{%>
 <p align=center>修改部门信息失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%}else if (tip.equals("delsuccess"))
{%>
 <p align=center>删除部门信息成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.iframe.tree.reload();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("delerror"))
{%>
 <p align=center>删除部门信息失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("notdel"))
{%>
 <p align=center>部门已被用，不能删除,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} %>
　</fieldset>
  </body>
</html>
