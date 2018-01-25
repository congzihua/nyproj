<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.entity.SelectGroup" />
<jsp:directive.page import="com.founder.enp.service.UserService" />
<%
			Authorization authorization = (Authorization) session
			.getAttribute("authorization");
	UserService service = new UserService();
	List list = service.getUserSelGoup(authorization.getUserid());
	List boundList = service.getBoundUserPower(authorization
			.getUserid());
	Iterator iter = list.iterator();
	Iterator boundIter = boundList.iterator();
	int n = 0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>选择身份</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript">
		function DoClick(leaderid,groupid)
		{
		  if (confirm("确认进入选择的角色吗?"))
		  {
	    	document.location.href="transfer.jsp?leaderid="+leaderid+"&groupid="+groupid
		  }
		  
		}
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}" topmargin=10
		leftmargin=60 style="FONT-SIZE: 12px">
		<Table style='font-size:12px;width:600px' align=center cellspacing=1
			cellpadding=0 border=0>
			<TR height=26px>
				<TD background="images/weizhi.jpg"  colspan=4>
					&nbsp&nbsp&nbsp&nbsp 欢迎使用中国记协公文流转系统

				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<BR>
			<BR>
			<tr>
				<td align=middle rowSpan=20 vAlign=top width=109>
					<img src='images/logos.jpg'>
				</td>
				<TD bgColor=#75783c rowSpan=20 width=1>
					<BR>
				</TD>
				<TD rowSpan=20 width=16>
					<BR>
				</TD>
				<Td>
					<Div align=center>
						请选择您登录的身份
					</Div>
					<BR>
					<HR align=left color=#75783c SIZE=1 width=350>
				</td>
			</tr>
			
						<%
								while (iter.hasNext()) {
								SelectGroup sg = (SelectGroup) iter.next();
						%>
						<TR>
							<TD>
								<input type=radio name=groupClass onclick=DoClick(
									<%=sg.getLeaderid()%>,<%=sg.getGroupid()%>)
										checked>
								<A href="#"
									onclick="javascript:DoClick(<%=sg.getLeaderid()%>,<%=sg.getGroupid()%>);"><%=sg.getDmpname()%>&nbsp;&nbsp;&nbsp;<%=sg.getGroupname()%>
							</TD>
						</TR>
						<%
						}
						%>
						<%
								while (boundIter.hasNext()) {
								SelectGroup sg = (SelectGroup) boundIter.next();
						%>
						<TR>
							<TD>
								<input type=radio name=groupClass onclick=DoClick(
									<%=sg.getLeaderid()%>,<%=sg.getGroupid()%>)
										checked>
								<A href="#"
									onclick="javascript:DoClick(<%=sg.getLeaderid()%>,<%=sg.getGroupid()%>);"><%=sg.getDmpname()%>&nbsp;&nbsp;&nbsp;<%=sg.getGroupname()%>
							</TD>
						</TR>
						<%
						}
						%>
					</table>
	</body>
</html>
