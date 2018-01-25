<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
   String strUserIDS = request.getParameter("userid");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>调动部门</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="../../css/admin.css">
   <script type="text/javascript">
   
   function transfer()
   {
       if (iframe.tree.getSelected() == null || iframe.tree.getSelected().getAttribute("dmId") == undefined) 
	   {
	      alert("请选择部门");
	      return false;
	   }
	    var id = iframe.tree.getSelected().getAttribute("dmId");
	    document.all("dmpid").value=id;
	    
   }
   
   </script>
  </head>
  
  <body style="margin:0"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/user/userAction.do?oper=transfer"
			method="post">
	    <input type="hidden" name="dmpid"/>
	    <input type="hidden" name="userids" value="<%=strUserIDS %>"/>
   <table style="font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25"><font face="Wingdings" size="2"> l </font>当前位置：用户管理 → 用户管理 →
						部门调动
					</td>
				</tr>

			</table>
				<table style="font-size:12px;">
			<tr>
				<td>
					<input type="submit" class="button2" onclick="return transfer();"
						value="确 定" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:window.close();"
						value="关 闭" />
				</td>
				
			</tr>

		</table>
		<table>
				<tr>
					<td>
						<iframe id=iframe name="iframe" frameborder=1 scrolling=yes
							src="../department/departMentTree.jsp" style='height:340px;width:300px'></iframe>
					</td>
				</tr>
			</table>	
			</html:form>
  </body>
</html>
