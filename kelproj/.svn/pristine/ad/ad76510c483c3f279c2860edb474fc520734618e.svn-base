<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocTypesService" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.DocTypes" />

<%
	DocTypesService service = new DocTypesService();
	List list = service.getAllDocTypes();

	if (list == null || list.size() == 0) {
		out.println("<font size=5 color=red>没有可用文种模板，请先定制文种模板</font>");
		return;
	}
	Iterator iter = list.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'doctypes.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript">
		function change()
		{
		    var f = document.all("doctypes").value;
		    var docTypesid = f.split(":");
		    parent.template.document.location.href = "template.jsp?docTypesid="+docTypesid[0]+"&templateid="+docTypesid[1]
		}
		
		</script>

	</head>

	<body leftmargin="0" topmargin="0"
		oncontextmenu="if (!event.ctrlKey){return false;}" onload="javascript:change();">
		<table>
			<tr>
				<td style="color:red;font-size:12px">
					文档类型名
				</td>
			</tr>
			<tr>
				<td>
					<select style="width:140;font-size:12px" onchange="javascript:change()"  name="doctypes" id="doctypes" size="35">
					<%
					      if (iter.hasNext())
					      {
					         DocTypes docTypes = (DocTypes)iter.next();
					 %>
						<option selected value="<%=docTypes.getDoctypeid()+":"+docTypes.getTempletid() %>">
						    <%=docTypes.getTypename()%>
						</option>
						<%} 
						 while (iter.hasNext())
						 {
						   DocTypes docTypes = (DocTypes)iter.next();%>
						<option   value="<%=docTypes.getDoctypeid()+":"+docTypes.getTempletid() %>">
						    <%=docTypes.getTypename()%>
						</option>
						 <%} %>
					</select>
				</td>
			</tr>
		</table>
	</body>
</html>
