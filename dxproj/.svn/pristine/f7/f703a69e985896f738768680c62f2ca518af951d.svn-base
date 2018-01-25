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
 if (tip.equals("listerror"))
 {
 %>
 <p align=center>系统查询流程列表出错，请检查服务器配制．．．</p>
 <%} if (tip.equals("submitsuccess"))
 {
 %>
 <p align=center>提交公文成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refresh();
window.setTimeout("window.close();",3000);
</script>
 <%}
 else if (tip.equals("submiterror"))
 {
  %>
 <p align=center>提交公文失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("rejectsuccess"))
 {
  %>
 <p align=center>驳回公文成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refreshPre();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("rejecterror"))
 {
  %>
 <p align=center>驳回公文失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%}else if (tip.equals("submitMoresuccess"))
 {
  %>
 <p align=center>公文送会签成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refresh();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("submitMoreerror"))
 {
  %>
 <p align=center>公文送会签失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("csignsuccess"))
 {
  %>
 <p align=center>会签成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refreshPre();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("csignerror"))
 {
  %>
 <p align=center>会签失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%}else if (tip.equals("withdcssuccess"))
 {
  %>
 <p align=center>撤回会签用户成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refreshPre();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("withdcserror"))
 {
  %>
 <p align=center>撤回会签用户失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("auditfinishsuccess"))
 {
  %>
 <p align=center>签批公文成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refreshPre();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("auditfinisherror"))
 {
  %>
 <p align=center>签批公文失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("docNumOpersuccess"))
 {
  %>
 <p align=center>获得公文文号成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("docNumOpererror"))
 {
  %>
 <p align=center>获得公文文号失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%}else if (tip.equals("finishsuccess"))
 {
  %>
 <p align=center>办结公文成功,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.opener.refreshPre();
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("finisherror"))
 {
  %>
 <p align=center>办结公文失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("nopower"))
 {
  %>
 <p align=center>您没有权限访问此功能!!!
 </p>
<%} else if (tip.equals("userpageUpdateSuccess"))
 {
  %>
 <p align=center>更新个人设置成功,下次登录个人设置将生效,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} else if (tip.equals("userpageUpdateError"))
 {
  %>
 <p align=center>更新个人设置失败,窗体将在三秒后自动关闭
 <a href="javascript:window.close()" style="color:blue">[关闭]</a></p>
<script>
window.setTimeout("window.close();",3000);
</script>
<%} %>
　</fieldset>
  </body>
</html>
