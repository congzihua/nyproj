<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.Attache" />
<jsp:directive.page import="java.util.ArrayList" />
<jsp:directive.page import="com.founder.enp.entity.Parameter" />
<jsp:directive.page import="com.founder.enp.service.ParameterService" />
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
			String docOper = session.getAttribute("docOper") == null ? ""
			: (String) session.getAttribute("docOper");

	List list = (List) session.getAttribute("attache");
	if (list == null) {
		list = new ArrayList();
	}
	String oper = (String) session.getAttribute("docOper");
	Parameter parameter = null;
	if (oper != null) {
		ParameterService service = new ParameterService();
		parameter = service.listParameter();
	}
	Iterator itera = list.iterator();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'attache.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript" src="../../js/table.js"></script>
		<script type="text/javascript">
		function del()
		{
		   var nodes = document.getElementsByName(check_name);
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		           var id = nodes[i].id.substring(5, nodes[i].id.length);
		           idstring += id + ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要删除的记录');
		       return ;
		     }
		     document.all("oper").value="del";
		     document.all("idString").value=idstring;
		     attacheForm.submit();
		}
		function add()
		{
		   var title = jsTrim(document.all("ntitle").value);
		   if (title=="")
		   {
		      alert("附件名称不能为空");
		      document.all("ntitle").focus();
		      return ;
		   }
		   if (title.length > 128)
		   {
		       alert("附件长度超出范围");
		      document.all("ntitle").focus();
		      return ;
		   }
		   if (document.all("ffilename").value=="")
		   {
		      alert("文件名称不能为空");
		      document.all("ffilename").focus();
		      return ;
		   }
		   document.all("filename").value = document.all("ffilename").value;
		   document.all("title").value = title;
		   document.all("oper").value="add";
		   attacheForm.submit();
		}
		function Init()
		{
		   parent.oper.location.reload();
		}
		
		</script>
	</head>

	<body style="margin:0px" onload="javascript:Init();"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzclient/doc/attacheAction.do" method="post">
			<html:hidden property="filename" name="attacheForm" />
			<html:hidden property="title" name="attacheForm" />
			<input type="hidden" name="idString" />
			<input type="hidden" name="oper" />
			<table align="center">
				<tr>
					<td>
						<table style="color: #729eb3;font-size:12">
							<tr>
								<td>
									文件名称：
								</td>
								<td>
									<input size="30" name="ffilename" type="file">
								</td>
							</tr>
							<tr>
								<td>
									附件名称：
								</td>
								<td>
									<input type="text" name="ntitle" size="50">
								</td>
								<td>
									<input <%if (docOper.equals("view") || docOper.equals("finish")){ %> disabled <%} %> type="button" onclick="javascript:add()" class="button2"
										value="增 加">
								</td>
								<td>
									<input type="button" <%if (docOper.equals("view") || docOper.equals("finish")){ %> disabled <%} %> onclick="javascript:del()" class="button2"
										value="删 除">
								</td>
							</tr>
						</table>
					</td>
				</tr>

			</table>
			<table style="color: #ffffff;font-size:12" width="100%">
				<tr>
					<td>
						<hr color="#1973ba">
					</td>
				</tr>
				<tr>

					<td bgcolor="#1973ba" height="20px" colspan=2>
						<font face="Wingdings" size="2">l</font>附件列表
						<font face="Wingdings" size="2">l</font>
					</td>
				</tr>
			</table>
			<table id="listtable" cellspacing="2" cellpadding="1" width="100%"
				style="color: #ffffff;font-size:12">

				<tr>
					<td background="../../images/bg_board.gif" width=60 height=25>
						<input onclick="selectAll();" type="checkbox">
						全选
					</td>
					<td background="../../images/bg_board.gif">
						&nbsp;附件名称
					</td>
					<td background="../../images/bg_board.gif">
						&nbsp;文件路径
					</td>
					<td width="30" background="../../images/bg_board.gif">
						&nbsp;
					</td>
				</tr>
				<%
							while (itera.hasNext()) {
							Attache attache = (Attache) itera.next();
				%>
				<tr onmouseout="this.bgColor=''" onmouseover="this.bgColor='ffcccc'"
					style="FONT-SIZE: 14px;color:#000000">
					<td width=60>
						<input onclick="checkSelected()" type="checkbox"
							id="check<%=attache.getAttacheid()%>" name="check_box" />

					</td>
					<td style="cursor:hand"
						onclick="selected(<%=attache.getAttacheid()%>)"
						style="color:#000000">
						<%=attache.getTitle()%>
					</td>
					<td style="cursor:hand"
						onclick="selected(<%=attache.getAttacheid()%>)"
						style="color:#000000">
						<%
						if (oper != null && attache.getFileOrgName() == null) {
						%>
						<%=parameter.getAttacheip()
								+ attache.getFilename()%>
						<%
						} else {
						%>
						<%=attache.getFileOrgName()%>
						<%
						}
						%>
					</td>
					<td>
					<%
						if (oper != null && attache.getFileOrgName() == null) {
						%>
							<a href="../DownLoadFile.do?fileServer=<%=parameter.getAttacheip() %>&fileName=<%=attache.getFilename() %>" style="color:red" target="_blank">下 载</a>
					<%} %>
					</td>
				</tr>
				<TR>
					<TD background="../../images/dot_board.gif" colSpan=6 height=1></TD>
				</TR>
				<%
				}
				%>
			</table>
		</html:form>

	</body>

</html>
