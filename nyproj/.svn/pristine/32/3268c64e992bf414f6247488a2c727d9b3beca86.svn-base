<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocService" />
<jsp:directive.page import="com.founder.enp.entity.DocEntity" />
<%
	DocService service = new DocService();
	DocEntity docEntity = service.getDoc(Integer.parseInt(request
			.getParameter("docid")));
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'docparam.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<LINK href="../css/Styles.css" type=text/css rel=stylesheet>
	</head>

	<body style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}">

		<table width="850" bgcolor="#000000" cellpadding="7" cellspacing="1"
			style="color: #000000;font-size:12">
			<tr bgcolor="#ffffff">
				<td width="60" style="color:red">
					文件标题：
				</td>
				<td colspan="5">
					<%=docEntity.getTitle()%>
				</td>
				<td style="color:red">
					印发份数：
				</td>
				<td>
					<%=docEntity.getPrintnum()==null?"":docEntity.getPrintnum()%>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td style="color:red">
					发文字号：
				</td>
				<td width="100">
					<%=docEntity.getDocnum() == null ? "" : docEntity
					.getDocnum()%>
				</td>
				<td width="55" style="color:red">
					拟稿人：
				</td>
				<td width="150">
					<%=docEntity.getCreator()%>
				</td>

				<td width="60" style="color:red">
					秘密等级：
				</td>
				<td>
					<%=docEntity.getSecret()%>
				</td>
				<td width="60" style="color:red">
					紧急程度：
				</td>
				<td colspan=3>

					<%=docEntity.getUrgence()%>
				</td>
			</tr>

			<tr bgcolor="#ffffff">
				<td style="color:red">
					发送范围：
				</td>
				<td colspan="10">
					<table style="font-size:12">
						<tr>
							<td style="color:red">
								主送单位：
							</td>
							<td>
								<%=docEntity.getToOrg()%>
							</td>
						</tr>
						<tr>
							<td style="color:red">
								抄送单位：
							</td>
							<td>
								<%=docEntity.getCopyto()%>
							</td>
						</tr>

					</table>
				</td>
			</tr>




			<tr bgcolor="#ffffff">
				<td style="color:red">
					主题词：
				</td>
				<td colspan=3>
					<%=docEntity.getKeywords()%>
				</td>
				<td style="color:red">
					印发日期：
				</td>
				<td width=100>
					<%=docEntity.getPublishtime()==null?"":docEntity.getPublishtime()%>
				</td>
				<td style="color:red">
					制作日期：
				</td>
				<td>
					<%=docEntity.getMaketime()==null?"":docEntity.getMaketime()%>
				</td>
			</tr>

			<tr bgcolor="#ffffff">
				<td style="color:red">
					发文单位：
				</td>
				<td colspan=3>
					<%=docEntity.getPublishOrg()%>
				</td>
				<td style="color:red">
					生成方式：
				</td>
				<td>

					<%=docEntity.getCreatemode()%>
				</td>
				<td style="color:red">
					文 种：
				</td>
				<td>
					<%=docEntity.getTypename()%>
				</td>
			</tr>

			<tr bgcolor="#ffffff">
				<td style="color:red">
					制作单位：
				</td>
				<td colspan=3>
					<%=docEntity.getCreateorg()%>
				</td>
				<td style="color:red">
					发布层次：
				</td>
				<td>
					<%=docEntity.getPublishlevel()%>
				</td>
				<td style="color:red">
					保密期限：
				</td>
				<td>
					<%=docEntity.getSecretime()%>
				</td>
			</tr>
		</table>
	</body>
</html>
