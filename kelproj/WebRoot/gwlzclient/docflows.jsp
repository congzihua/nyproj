<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Flows" />
<jsp:directive.page import="com.founder.enp.service.DocService" />
<%
	DocService service = new DocService();
	List list = service.getFlowsRecord(Integer.parseInt(request
			.getParameter("docid")));
	if (list == null) {
		return;
	}
	Iterator itera = list.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'docflows.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	<LINK href="../css/Styles.css" type=text/css rel=stylesheet>
	</head>

	<body style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<table border=0 style='width:950px;font-size:12px' cellspacing=2
			cellpadding=0>
			<tr align="center" bgcolor='#dcdcdc'
				style='height:20px;color:DarkViolet'>
				<td style='width:150px;BACKGROUND-COLOR: #dcdcdc'>
					提交日期
				</td>
				<td style='width:150px;BACKGROUND-COLOR: #dcdcdc'>
					处理日期
				</td>
				<td style='width:100px;BACKGROUND-COLOR: #dcdcdc'>
					操作人
				</td>
				<td style='width:150px;BACKGROUND-COLOR: #dcdcdc'>
					处理信息
				</td>
				<td style='width:150px;BACKGROUND-COLOR: #dcdcdc'>
					公文到达位置
				</td>
				<td style='width:300px;BACKGROUND-COLOR: #dcdcdc'>
					审核意见
				</td>
			</tr>
			<%
					while (itera.hasNext()) {
					Flows flows = (Flows) itera.next();
			%>
			<tr align="center"  onmouseout="this.bgColor=''"
												onmouseover="this.bgColor='ffcccc'" style='height:20px;color:DarkViolet'>
			   <td>
				<%=flows.getSendtime() %>
				</td>
				<td>
				<%=flows.getOpertime() == null?"":flows.getOpertime() %>
				</td>
				
				<td>
				<%=flows.getFlowtor() %>
				</td>
				<td>
				<%=flows.getFlowName().equals("counterSign") ? "会签" : flows.getFlowName()%>
				</td>
				<td>
				<%=flows.getStatus() %>
				</td>
				<td>
				<%=flows.getAdvice()==null?"":flows.getAdvice() %>
				</td>
			</tr>
			<TR>
				<TD background="../images/dot_board.gif" colSpan=23 height=1></TD>
			</TR>
			<%
			}
			%>
		</table>
	</body>
</html>
