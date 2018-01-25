<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocService" />
<jsp:directive.page import="com.founder.enp.entity.ViewBean" />
<jsp:directive.page import="com.founder.enp.entity.DocFlowsKeyWord" />
<jsp:directive.page import="com.founder.enp.entity.User" />
<jsp:directive.page import="com.founder.enp.service.UserService" />
<%
	String account = request.getParameter("account");
	UserService userService = new UserService();
	User user = new User();
	user.setAccount(account);
	user = userService.checkUser(user);
	if (user == null) {
		out
		.println("<font size=5 color=red>系统提示:您在公文管理系统中没有通过用户验证!</font>");
		return;
	}
	DocService service = new DocService();
	DocFlowsKeyWord keyword = new DocFlowsKeyWord();
	keyword.setUserid(user.getUserid());
	int count = service.getTaskListCount(keyword);
	keyword.setPageInfo(count, 1);
	List list = service.getTaskList(keyword);
	Iterator itera = list.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>待办任务列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<style type="text/css">
<!--
body {
	margin-left: 15px;
	margin-top: 15px;
}
</style>
		<script type="text/javascript">
function CloseWin()
{
	var ua=navigator.userAgent
	var ie=navigator.appName=="Microsoft Internet Explorer"?true:false
	if(ie){
		var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE "))))
		if(IEversion< 5.5){
		   var str  = '<object id=noTipClose type="application/x-oleobject"  classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">'
		   str += '<param name="Command" value="Close"></object>';
		   document.body.insertAdjacentHTML("beforeEnd", str);
		   document.all.noTipClose.Click();
		}
		else{
		   window.opener = null;
		   window.close();
		}
	}
	else{
	   window.close();
	}
}


function goto()
{
	var width=screen.width;
	var height=screen.height;

	var xPosition=0;
	var yPosition=0;
	if ((parseInt(navigator.appVersion) >= 4 ))
	{
		xposition = (screen.width - width) / 2;
		yposition = (screen.height - height) / 2;
	}
	var theWindowProperty="toolbar=0,"
	+ "width=" + (width-10) + ","
	+ "height=" + (height-56) + ","
        + "resizable=1,"
        + "scrollbars=1,"
	+ "screenx=" + xposition + "," //for Netscape
	+ "screeny=" + yposition + "," //for Netscape
	+ "left=" + xposition + "," //IE
	+ "top=" + yposition; //IE
	var newwin=window.open("http://169.254.61.188:8080/Zgjx_Gwlz/loginAction.do?admin=0&account=<%=account%>","_blank",theWindowProperty);
	CloseWin();
}
</script>
	</head>

	<body>
		<form name="taskForm"
			action="http://169.254.61.188:8080/Zgjx_Gwlz/loginAction.do?account=<%=account%>"
			target="_blank">
			<table width="366" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						&nbsp;&nbsp;
					</td>
					<td align="left"
						style="font: bold 14px Verdana, Arial, Helvetica, sans-serif;color:#214465;">
						您有
						<span style="color:red;cursor:hand" onclick="javascript:goto();">
							<%=count%>
						</span>条未办事宜 点击数字进行处理
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<marquee onmouseover="this.stop()" onmouseout="this.start()"
				direction="up" scrollamount="2" width=366 height=116 Direction=up>
				<table width="366" border="0" cellspacing="0" cellpadding="0"
					style="font-size:14px;color:#214465;line-height:25px">


					<%
							while (itera.hasNext()) {
							ViewBean bean = (ViewBean) itera.next();
					%>
					<tr>
						<td width="10" align="center" class="zy" height="25" valign="top">
							·
						</td>
						<td valign="top">
							<%=bean.getTitle()%>
							<span class="sj">(<%=bean.getSendtime()%>)
							</span>
						</td>
					</tr>
					<%
					}
					%>

				</table>
			</marquee>
		</form>
	</body>
</html>
