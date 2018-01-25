<%@ page language="java" pageEncoding="UTF-8"%>

<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="java.util.Date" />
<jsp:directive.page import="com.founder.enp.entity.LogEntity"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Iterator"/>
<jsp:directive.page import="com.founder.enp.entity.LogKeyWord"/>
<%
    List list = (List)request.getAttribute("list");
    Iterator iter = list.iterator();
    LogKeyWord keyword = (LogKeyWord)request.getAttribute("keyword");
	int count = (Integer) request.getAttribute("count");
	//页的数量
	int pageCount = (Integer) request.getAttribute("pageCount");
	//当前请求页
	int currentPage = (Integer) request.getAttribute("currentPage");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/table.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="../../js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		<script type="text/javascript" src="../../js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="../../js/calendar/src/calendar.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="../../js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="../../js/calendar/src/calendar-setup.js"></script>
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
		   if (!confirm("日志将被删除，确认删除吗?"))
		   {
		        return ;
		   }
		    window.open('logAction.do?oper=del&idString='+idstring,'del','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
   
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
		     var startDate = document.all("createTimeF").value;
		     var endDate = document.all("createTimeL").value;
		     window.location.href = "logAction.do?oper=list&currentPage="+number+"&beginDate="+startDate+"&endDate="+endDate;
		  }
		  function query()
		  {
		     var startDate = document.all("createTimeF").value;
		     var endDate = document.all("createTimeL").value;
		     window.location.href = "logAction.do?oper=list&beginDate="+startDate+"&endDate="+endDate;
		  } 
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="../../images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：日志管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;color:#568ba4">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:del()"
						value="删除" />
				</td>
				<td>
					日期：
					<input type="textbox" class="textbox" size="15" name="createTimeF"
						value="<%=keyword.getStartDate() %>" readonly></input>
					<span style="cursor: hand"><img
							src="../../images/caldendar.gif" id="caldendar1" />
					</span>

				</td>
				<td>
					&nbsp;至&nbsp;
					<input class="textbox" type="textbox" size="15" name="createTimeL"
						value="<%=keyword.getEndDate() %>" readonly></input>
					<span style="cursor: hand"><img
							src="../../images/caldendar.gif" id="caldendar2" />
					</span>

				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:query()"
						value="查询" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>

		</table>


		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr align="middle">
				<td valign="top" align="center">

					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="100%">
						<tr align="middle">
							<td background="../../images/bg_board.gif" height=25 width=10%>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=15% background="../../images/bg_board.gif">
								用户名称
							</td>
							<td width="18%" background="../../images/bg_board.gif">
								操作类型
							</td>

							<td width="20%" background="../../images/bg_board.gif">
								操作名称
							</td>
							<td width="15%" background="../../images/bg_board.gif">
								IP
							</td>
							<td width="34%" background="../../images/bg_board.gif">
								操作时间
							</td>

						</tr>
<%
    while (iter.hasNext())
    {
       LogEntity log = (LogEntity)iter.next();
 %>
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox" id="check<%=log.getLogid() %>"
									name="check_box" />

							</td>
							<td onclick="selected(<%=log.getLogid() %>)" style="cursor:hand" width=15%>
								<%=log.getAccount() %>
							</td>
							<td onclick="selected(<%=log.getLogid() %>)" style="cursor:hand" width="18%">
								<%=log.getActiontype() %>
							</td>

							<td onclick="selected(<%=log.getLogid() %>)" style="cursor:hand" width="20%">
								<%=log.getAction() %>
							</td>
							<td onclick="selected(<%=log.getLogid() %>)" style="cursor:hand" width="15%">
								<%=log.getIp() %>
							</td>
							<td onclick="selected(<%=log.getLogid() %>)" style="cursor:hand" width="34%">
							  <%=log.getLogtime() %> 
							</td>
						</tr>
						<TR>
							<TD background="../../images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
						
				<%} %>
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
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "createTimeF",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "createTimeL",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  
  //-->
</SCRIPT>
