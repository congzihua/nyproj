<%@page import="com.roc.enp.entity.BlacklistUser"%>
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
	int count = (Integer) request.getAttribute("count");
	//页的数量
	int pageCount = (Integer) request.getAttribute("pageCount");
	//当前请求页
	int currentPage = (Integer) request.getAttribute("currentPage");
	String name = (String) request.getAttribute("name");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/table.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath() %>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		<script type="text/javascript" src="<%=request.getContextPath() %>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/calendar/src/calendar.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/calendar/src/calendar-setup.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		
          function del(id)
		  {
		   
		   if (!confirm("确认取消该用户的黑名单吗?"))
		   {
		        return ;
		   }
		   var url = "<%=request.getContextPath()%>/blacklistUserAction.do?method=delete&id="+id
		   $.ajax({
		        url:url,
		        type:"post",
		        success:function(data){
		        	if(data == 1){
		        		 window.location.href = "<%=request.getContextPath()%>/blacklistUserAction.do?method=toBlacklistUserList";
		        	}
		        }
		    });
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
			 var name = document.getElementById("name").value;
		     window.location.href = "<%=request.getContextPath()%>/blacklistUserAction.do?method=toBlacklistUserList&currentPage="+number+"&name="+name;
		  }
		  function query()
		  {
		     var name = document.getElementById("name").value;
		     window.location.href = "<%=request.getContextPath()%>/blacklistUserAction.do?method=toBlacklistUserList&name="+name;
		  } 
		  function add()
		  {
		     window.location.href = "<%=request.getContextPath()%>/blacklistUserAction.do?method=toAdd";
		  } 
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath() %>/images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：黑名单管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;color:#568ba4">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:add()"
						value="新增" />
				</td>
				<td>
				姓名：
				</td>
				<td>
					<input class="textbox" type="text" size="15" name="name" id="name"
						value="<%=name==null?"":name %>" ></input>
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:query()"
						value="查询" />
				</td>
				
			</tr>

		</table>


		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr align="middle">
				<td valign="top" align="center">

					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="95%">
						<tr align="middle">
							<td background="<%=request.getContextPath() %>/images/bg_board.gif" height=25 width=10%>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=15% background="<%=request.getContextPath() %>/images/bg_board.gif">
								姓名
							</td>
							<td width="15%" background="<%=request.getContextPath() %>/images/bg_board.gif">
								证件号码
							</td>

							<td width="10%" background="<%=request.getContextPath() %>/images/bg_board.gif">
								证件类型
							</td>
							<td width="20%" background="<%=request.getContextPath() %>/images/bg_board.gif">
								操作
							</td>
						</tr>
<%
    while (iter.hasNext())
    {
    	BlacklistUser bUser = (BlacklistUser)iter.next();
 %>
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox" id="check<%=bUser.getId() %>"
									name="check_box" />

							</td>
							<td onclick="selected(<%=bUser.getId() %>)" style="cursor:hand" width=15%>
								<%=bUser.getName() %>
							</td>
							<td onclick="selected(<%=bUser.getId() %>)" style="cursor:hand" width="15%">
								<%=bUser.getIdcard()%>
							</td>

							<td onclick="selected(<%=bUser.getId() %>)" style="cursor:hand" width="15%">
								<%=bUser.getCertType() %>
							</td>
							<td onclick="selected(<%=bUser.getId() %>)" style="cursor:hand" width="15%">
							   <input type="button" class="button2" onclick="javascript:del('<%=bUser.getId() %>')"
									value="删除" />
							</td>
						</tr>
						<TR>
							<TD background="<%=request.getContextPath() %>/images/dot_board.gif" colSpan=5 height=1></TD>
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

