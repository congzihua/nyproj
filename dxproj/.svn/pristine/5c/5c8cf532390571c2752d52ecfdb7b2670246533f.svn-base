<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocService" />
<jsp:directive.page import="com.founder.enp.entity.Attache" />
<jsp:directive.page import="com.founder.enp.service.ParameterService" />
<jsp:directive.page import="com.founder.enp.entity.Parameter" />
<%
	DocService serivce = new DocService();
	ParameterService parameterService = new ParameterService();
	Parameter parameter = parameterService.listParameter();
	List list = serivce.getDocAttache(Integer.parseInt(request.getParameter("docid")));
	Iterator iter = list.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'attache.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<LINK href="../css/Styles.css" type=text/css rel=stylesheet>
	</head>

	<body style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<table border=0 style='width:800px;font-size:12px' cellspacing=2
			cellpadding=0>
		<tr align="center" bgcolor='#dcdcdc'
				style='height:20px;color:DarkViolet'>
				<td style='width:600px;BACKGROUND-COLOR: #dcdcdc'>
					附件名称
				</td>
				<td style='width:150px;BACKGROUND-COLOR: #dcdcdc'>
					附件类型
				</td>
				
			</tr>
	   <%while (iter.hasNext())
	   { 
	        Attache attache = (Attache)iter.next();
	   %>
			<tr  onmouseout="this.bgColor=''"
												onmouseover="this.bgColor='ffcccc'"	align="center" style='height:20px;color:DarkViolet'>
			<td>
			<%=attache.getTitle() %>
			</td>
			<td>
			<%=attache.getFiletype() %>
			</td>
			
			</tr>
			<TR>
					<TD background="../images/dot_board.gif" colSpan=6 height=1></TD>
				</TR>
				<%} %>
		</table>
	</body>
</html>
