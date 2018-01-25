<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Template"/>
<jsp:directive.page import="com.founder.enp.service.TemplateService"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Iterator"/>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>
<%
  //  String templateid = request.getParameter("templateid");
    TemplateService service = new TemplateService();
   // Template template = service.selectTemplate(Integer.parseInt(templateid));
    List list = service.getAllTemplate();
    if (list == null || list.size() == 0) {
		out.println("<font size=5 color=red>没有可用模板，请先定制模板</font>");
		return;
	}
	Iterator iter = list.iterator();

 %>
<html>
	<head>
		<script type="text/javascript" src="../../js/table.js"></script>
	</head>
	<LINK href="../../css/Styles.css" type=text/css rel=stylesheet>
	<body oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0"
		topmargin="0">
		<form action="">
          <input type="hidden" id="docTypesid" name="docTypesid" value="<%=request.getParameter("docTypesid") %>">

			<table cellspacing="2" cellpadding="1"
				style="FONT-SIZE: 14px;color:#ffffff" align="center" border="0"
				width="100%">
				<tr align="middle">
					<td background="../../images/bg_board.gif" height=25 width="30">
						选择
					</td>

					<td background="../../images/bg_board.gif">
						公文模板名称
					</td>
				</tr>
   <%
       while (iter.hasNext())
       {
           Template template = (Template)iter.next();
    %>
				<tr align="left" style="FONT-SIZE: 14px;color:#000000">
					<td width="30" align="middle">
						<input type="radio"  id="<%=template.getFilename() %>" <%if (template.getTempletname().equals("空文档")){ %> checked <%} %> name="template" />

					</td>

					<td style="cursor:hand">
						<%=template.getTempletname() %>
					</td>
				</tr>
				<TR>
					<TD background="../../images/dot_board.gif" colSpan=23 height=1></TD>
				</TR>
         <%} %>
			</table>
	</body>

</html>
