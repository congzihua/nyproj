<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.User" />
<jsp:directive.page import="com.founder.enp.service.DocService" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="java.util.List" />
<%
	String flowsid = request.getParameter("flowids");
	DocService service = new DocService();
	List list = service.getCounterUserInfo(flowsid);
	if (list == null)
		return;
	int n = 0;
	Iterator iter = list.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>选择撤回用户</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript">
		function check()
		{
		    var nodes = document.getElementsByName("check_box");
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		           var id = nodes[i].value;
		           idstring += id + ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要撤回的用户');
		       return false;
		     }
		    document.all("userids").value=idstring;
		}
		
		
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		style="font-szie:12px;" bgcolor="#f0fafd">
		<html:form action="/gwlzclient/counterSignAction.do?oper=withdrow">
		<input type="hidden" name="flowsid" value="<%=flowsid %>"/>
		<input type="hidden" name="userids"/>
		<fieldset>
			<legend style="font-size:12px;margin-top:5px">
				用户列表
			</legend>
			<table>
				<tr>
					<%
					if (list.size() == 0) {
					%>
					<td style="color:red;font-size:14px">
						没有记录
					</td>
					<%
					}
					%>
					<%
							while (iter.hasNext()) {
							List listUser = (List) iter.next();
							Iterator iterUser = listUser.iterator();
							while (iterUser.hasNext()) {
								User user = (User) iterUser.next();
					%>

					<td style="color:#568ba4;font-size:14px">
						<input type="checkbox" value="<%=user.getUserid()%>"
							id ="check_box"  name="check_box" />
						<%=user.getName()%>
					</td>

					<%
								n++;
								if (n % 5 == 0) {
					%>

				</tr>
				<tr>
					<%
							}
							}

						}
					%>
				
			</table>
		</fieldset>
		<table align="center">
			<tr>
				<td>
					<input type="submit" onclick="return check();" value="确 定">
					<input type="button" onclick="javascript:window.close();"
						value="取 消">
				<td>
			</tr>
		</table>
	   </html:form>
	</body>
</html>
