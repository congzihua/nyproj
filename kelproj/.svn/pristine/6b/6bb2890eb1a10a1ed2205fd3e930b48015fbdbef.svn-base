<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.founder.enp.entity.UserGroup"%>
<%@ page import="com.founder.enp.service.UserGroupService"%>
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.UGRelation" />
<jsp:directive.page import="com.founder.enp.service.UserService"/>
<%
	UserGroupService service = new UserGroupService();
	List list = service.queryDpmUg(Integer.parseInt(request.getParameter("dmpid")));
	Iterator iter = list.iterator();
	List ugrelation = null;
	String strRelation = "";
	if (request.getParameter("userid") != null)
	{
	    UserService userService = new UserService();
	    ugrelation =  userService.queryUserGroup(Integer.parseInt(request.getParameter("userid")));
	     Iterator iterUg = ugrelation.iterator();
	     while (iterUg.hasNext())
	     {
		     UGRelation re = (UGRelation)iterUg.next();
		     strRelation += re.getGroupid()+"-";
	     }			
    }

	int n = 0;
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'group.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body style="margin:0px;">
		<table style="font-size:14px;color:#568ba4">
			<tr>
				<%
						while (iter.hasNext()) {
						UserGroup group = (UserGroup) iter.next();
				%>

				<td>
					<input id="<%=group.getId()%>" <%if (strRelation.contains(String.valueOf(group.getId())+"-")){ %> checked  <%} %> name="check_name" type="checkbox">
					<%=group.getName()%>
				</td>
				<%
						n++;
						if (n % 2 == 0) {
				%>
			</tr>
			<tr>
				<%
					}
					}
				%>
			</tr>
		</table>
	</body>
</html>
