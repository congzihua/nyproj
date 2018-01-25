<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.ViewBean"/>
<jsp:directive.page import="com.founder.enp.service.DocService"/>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.entity.DocFlowsKeyWord" />
<jsp:directive.page import="com.founder.enp.entity.UserPage" />
<jsp:directive.page import="com.founder.enp.util.Global" />
<%
   Authorization authorization = (Authorization) session.getAttribute("authorization");
   UserPage userPage = (UserPage) session.getAttribute("userPage");
   DocService service = new DocService();
   int currentPage = Integer.parseInt(request.getParameter("currentPage") == null?"1":request.getParameter("currentPage"));
   Integer count = 0;
   DocFlowsKeyWord keyword = new DocFlowsKeyWord();
   keyword.setUserid(authorization.getLeaderid());
   keyword.setPageInfo(userPage.getFileNumber(), currentPage);
   List list = service.getTaskList(keyword);
   count = service.getTaskListCount(keyword);
   Integer pageCount = Integer.valueOf(Global.computePageCount(count,userPage.getFileNumber()));
   Iterator iter = list.iterator();
	  
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'task.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../css/admin.css">
		<script type="text/javascript">
		function goTo(pg)
		{
		   document.location.href= "docFlowsAction.do?pg="+pg;
		}
		function go()
		{
		    var pageno = document.all("pageno").value;
		    var pageCount=<%=pageCount%>;
		    if(isNaN(pageno))
		    {
		        alert('非法数字');
		        return;
		    }
		    if(pageno < 1 || pageno > pageCount)
		    {
		        alert('输入的跳转范围无效');
		        document.all("pageno").select();
		        return;
		    }
		    goPage(pageno);
		}
		function goPage(number)
		{
		     window.location.href = "task.jsp?currentPage="+number;
		}
		
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}" topmargin=0
		leftmargin=0>
		<table width="100%" >
			<tr>
				<td>
					<table border="0" width="800px" height="25" cellspacing="0"
						cellpadding="0" background="../images/weizhi.jpg" style="FONT-SIZE: 12px">
						<tr>
							<td width="95%" height="25">
								<font face="Wingdings" size="2">&nbsp; l </font>当前位置：公文管理 → 待办任务
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="100%">
						<tr align="middle">
							<td background="../images/bg_board.gif" height=25 width="50">
								<!--  <input onclick="selectAll();" type="checkbox">
													全选-->
							</td>
							<td background="../images/bg_board.gif" width="20">
							</td>
							<td background="../images/bg_board.gif" width="20">
							</td>
							<td background="../images/bg_board.gif" width="50%">
								发文标题
							</td>

							<td background="../images/bg_board.gif" width="10%">
								起草日期
							</td>

							<td background="../images/bg_board.gif" width="12%">
								文种
							</td>

							<td background="../images/bg_board.gif" width="8%">
								紧急程度
							</td>
							<td background="../images/bg_board.gif" width="10%">
								状态
							</td>

							<td background="../images/bg_board.gif" width="10%">
								处理人
							</td>
						</tr>
						</tr>
											<%
													while (iter.hasNext()) {

													ViewBean bean = (ViewBean) iter.next();
													String title = bean.getTitle();
											%>
											<tr 
												onmouseout="this.bgColor=''"
												onmouseover="this.bgColor='ffcccc'" align="left"
												style="FONT-SIZE: 12px;color:#000000">
												<td width="50" align="center">
													<input type="radio"
														onclick="goTo(<%=bean.getPowergroup() %>)" name="radio" />

												</td>
												<td width="20" align="center">

													<img height=16 width=16 src="../images/File_State_Comm.gif" alt="未处理" >

												</td>
												<td width="20" align="center">
													<%
													if (bean.getUrgency().equals("")) {
													%>
													<%
													} else {
													%>
													<img height=16 width=16 src="../images/File_State_Urge.gif"
														alt="<%=bean.getUrgency()%>">
													<%
													}
													%>
												</td>
												<td onclick="goTo(<%=bean.getPowergroup() %>)"  style="cursor:hand" title="<%=bean.getTitle()%>" width="50%">
													<%
													if (title.length() > 35) {
													%>
													<%=title.substring(0, 35) + "．．．"%>
													<%
													} else {
													%>
													<%=title%>
													<%
													}
													%>
												</td>

												<td style="cursor:hand" onclick="goTo(<%=bean.getPowergroup() %>)" width="10%">
													<%=bean.getCreatetime()%>
												</td>
												<td style="cursor:hand" onclick="goTo(<%=bean.getPowergroup() %>)" width="12%">
													<%=bean.getTypename()%>
												</td>


												<td style="cursor:hand"
													 onclick="goTo(<%=bean.getPowergroup() %>)" width="8%">
													<%=bean.getUrgency()%>
												</td>
												<td style="cursor:hand"
												  onclick="goTo(<%=bean.getPowergroup() %>)" width="10%">
													<%=bean.getStatus()%>
												</td>

												<td style="cursor:hand"
													onclick="goTo(<%=bean.getPowergroup() %>)" width="10%">
													<%=bean.getOperationtor()%>
												</td>
											</tr>
											<TR>
												<TD background="../images/dot_board.gif" colSpan=23 height=1></TD>
											</TR>
											<%
											}
											%>
					</table>

				</td>
			</tr>
		</table>
<table style="margin-top:10px;font-size:12px" border="0"
			bgColor="#FFFFFF" cellPadding="0" align="right" cellSpacing="1">
			<tr>

				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
					<%
					if (currentPage > 1) {
					%>
					<span onclick="javascript:goPage(1)" style="cursor:hand"
						title="第一页"> <font face="webdings" size="2" color="red">9</font>
					</span>&nbsp;
					<%
						}
						if (currentPage <= 1) {
					%>
					<span style="cursor:hand" title="第一页"> <font face="webdings"
						size="2" color="red">9</font> </span>&nbsp;
					<%
					}
					%>
					<%
					if (currentPage > 1) {
					%>
					<span onclick="javascript:goPage(<%=currentPage - 1%>)"
						style="cursor:hand" title="前一页"> <font face="webdings"
						size="2" color="red">7</font> </span>&nbsp;
					<%
						}
						if (currentPage <= 1) {
					%>
					<span style="cursor:hand" title="前一页"> <font face="webdings"
						size="2" color="red">7</font> </span>&nbsp;
					<%
					}
					%>

					<%
					if (currentPage < pageCount) {
					%>
					<span onclick="javascript:goPage(<%=currentPage + 1%>)"
						style="cursor:hand" title="下一页"> <font face="webdings"
						size="2" color="red">8</font> </span>&nbsp;
					<%
						}
						if (currentPage >= pageCount) {
					%>
					<span style="cursor:hand" title="下一页"> <font face="webdings"
						size="2" color="red">8</font> </span>&nbsp;
					<%
					}
					%>
					<%
					if (currentPage < pageCount) {
					%>
					<span onclick="javascript:goPage(<%=pageCount%>)"
						style="cursor:hand" title="最后一页"> <font face="webdings"
						size="2" color="red">:</font> </span>&nbsp;
					<%
						}
						if (currentPage >= pageCount) {
					%>
					<span style="cursor:hand" title="最后一页"> <font
						face="webdings" size="2" color="red">:</font> </span>&nbsp;
					<%
					}
					%>
				</td>
				<td align="center">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT type="text" value=<%=currentPage%> name="pageNo" size="2">
					&nbsp;
					<a href="javascript:go();"> <span title="跳转"> <font
							face="webdings" size="3" color="red">4</font> </span>
				</td>
				<td align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;共有&nbsp;
					<FONT COLOR="red"><%=count%> </FONT>&nbsp;条记录&nbsp;&nbsp;&nbsp;&nbsp;第&nbsp;
					<font color=red><%=currentPage%> </font>&nbsp;页/共&nbsp;
					<font color=red><%=pageCount%> </font>&nbsp;页
				</td>
			</tr>
		</table>
	</body>
</html>
