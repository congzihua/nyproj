<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'navigator.jsp' starting page</title>
		<LINK href="../../css/tab1.css" type=text/css rel=stylesheet>
		<script type="text/javascript">
		
		function Tcase(v)
		{
		   var a = document.getElementsByTagName("li");
		   for (var i = 0; i < a.length;i++)
		   {
		      if (a[i].id == "current")
		         a[i].id = "current"+i;
		   }
		   document.all("current"+v).id="current";
		   if (v == 0)
		   {
		     parent.content.location.href="accountieAction.do?oper=unbound&userid=<%=request.getParameter("userid")%>";
		   }
		   else
		   {
		      parent.content.location.href="accountieAction.do?oper=bound&userid=<%=request.getParameter("userid")%>";
		   }
		
		}
		function doInit()
		{
		  document.all("current0").id="current";
		  parent.content.location.href="accountieAction.do?oper=unbound&userid=<%=request.getParameter("userid")%>";
		}
		</script>
	</head>
	<body topmagrin=0 leftmagrin=0
		oncontextmenu="if (!event.ctrlKey){return false;}" onload="doInit()">
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="../../images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 帐户绑定管理
				</td>
			</tr>

		</table>
			<div style="margin-top:5px;margin-left:1px" id="tabsB">
				<ul>
					<li id="current0">
						<a href="#" onclick="Tcase(0)"><span>未绑定</span> </a>
					</li>
					<li id="current1">
						<a href="#" onclick="Tcase(1)"><span>已绑定</span> </a>
					</li>

				</ul>
			</div>
	</body>
</html>
