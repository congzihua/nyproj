<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.founder.enp.entity.User"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <jsp:directive.page import="java.util.Iterator" />
<%
String deleNum = request.getAttribute("deleNum")==null?"":request.getAttribute("deleNum").toString().trim();
int count = (Integer) request.getAttribute("count");
	//页的数量
	int pageCount = (Integer) request.getAttribute("pageCount");
	//当前请求页
	int currentPage = (Integer) request.getAttribute("currentPage");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>订票点管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
			<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<script type="text/javascript">
		<%if(!deleNum.equals("")){%>
			alert("成功删除<%=deleNum%>条记录！");
		<%}%>		 
		function key()
		{
		     var nodes = document.getElementsByName('check_box');
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		           idstring += nodes[i].value+ ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要解锁的记录');
		       return ;
		     }
		   if (confirm("您勾选的信息将解锁，您确认解锁吗?"))
		   {	
		       document.forms[0].action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=keyTicketprices&ids="+idstring;
		       document.forms[0].submit();
  	       }
		}
		function del()
		{
		     var nodes = document.getElementsByName('check_box');
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		           idstring += nodes[i].value+ ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要删除的记录');
		       return ;
		     }
		   if (confirm("您勾选的信息将被删除，信息无法恢复，您确认删除吗?"))
		   {	
		       document.forms[0].action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=deleteTicketalloc&ids="+idstring;
		       document.forms[0].submit();
  	       }
		}
		function add()
		{	
			var url = "<%=request.getContextPath()%>/roc/sysman/addOper.jsp";
			var rv = window.showModalDialog(url,'增加票额信息','dialogWidth=600px;DialogHeight=400px;scrollbars=no;help=no;resizable=no;center:yes');
			 if(rv == 1){
		    	 document.forms[0].action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=seleTicketsallocList";
		       document.forms[0].submit();
		    }
	        
		}
		function bentchAdd()
		{	
			var url = "<%=request.getContextPath()%>/roc/sysman/bentchAdd.jsp";
			var rv = window.showModalDialog(url,'批量增加票额信息','dialogWidth=650px;DialogHeight=400px;scrollbars=no;help=no;resizable=no;center:yes');
			  document.forms[0].action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=seleTicketsallocList";
		       document.forms[0].submit();
		    
	        
		}
		function edit()
		{
			 var nodes = document.getElementsByName("check_box");
		    var n = 0,j=0;
		    var objs;
		    for (var i = 0; i < nodes.length; i++)
		    {
		        if (nodes[i].checked)
		        {
		          objs = nodes[i];
		          j=i;		         
		          n++;
		        }
		    }
		    if (n == 0)
		    {
		       alert('请选择要操作的记录');
		       return false;
		    }
		    if (n > 1)
		    {
		       alert('只能选择一项操作记录');
		       return false;
		    }
		    var name = document.getElementsByName("name")[j].value;
		   
		     var flight = document.getElementsByName("flight")[j].value;
		   
		      var orderdate = document.getElementsByName("orderdate")[j].value;
		     
		      var amount = document.getElementsByName("amount")[j].value;
		      
		      var lockednum = document.getElementsByName("lockednum")[j].value;
		     
		   var url = "<%=request.getContextPath()%>/roc/sysman/editOper.jsp?id="+objs.value+"&name="+encodeURI(encodeURI(name))+"&flight="+encodeURI(encodeURI(flight))+"&orderdate="+encodeURI(encodeURI(orderdate))+"&amount="+encodeURI(encodeURI(amount))+"&lockednum="+encodeURI(encodeURI(lockednum));
			var rv = window.showModalDialog(url,'修改信息','dialogWidth=600px;DialogHeight=400px;scrollbars=no;help=no;resizable=no;center:yes');
			 if(rv == 1){
		    	  document.forms[0].action="<%=request.getContextPath()%>/ticketsAllocAction.do?method=seleTicketsallocList";
		       document.forms[0].submit();
		    }
	 
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
	     document.userForm.currentPage.value=number;
	     document.forms[0].submit();
	    
	  }
	  function query()
	  {
	     document.forms[0].currentPage.value="1";
	     document.forms[0].submit();
	  }
	
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<form name="userForm" action="<%=request.getContextPath()%>/clientAction.do?method=seleCustomerLogList"  method="post">
	   
	    <input type="hidden" name="currentPage" />
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath()%>/images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：基础数据管理 → 用户信息分析
				</td>
			</tr>

		</table>
		<table style="font-size:12px;">
			<tr>
				<td style="color:#568ba4">
					客户姓名：					
				</td>
				<td style="color:#568ba4">
					<input type="text" name="name" value="${name}"/>					
				</td>
				<td style="color:#568ba4">
					证件号码：					
				</td>
				<td style="color:#568ba4">
					<input type="text" name="certNo" value="${certNo}"/>					
				</td>
				<td>
					<input type="submit"  class="button2"
						value="查询" />
					
				</td>
				
				<td>
					<img border="0" src="<%=request.getContextPath()%>/images/decoration.jpg" width="102"
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
							<td background="<%=request.getContextPath()%>/images/bg_board.gif" height=25 width=10%>
								客户姓名
							</td>
							<td width=20% background="<%=request.getContextPath()%>/images/bg_board.gif">
								证件类型
							</td>
							
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								证件号码
							</td>						
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								状态
							</td>
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								航程
							</td>							
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								航班日期
							</td>
							<td width="15%" background="<%=request.getContextPath()%>/images/bg_board.gif">
								操作时间
							</td>										
						</tr>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
						<c:forEach var="item" items="${list}">
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td style="cursor:hand" width=10%>
								${item.name}
							</td>
							
							<td style="cursor:hand" width=20%>
								${item.certType}
							</td>
							<td 
								style="cursor:hand" width="15%">
								${item.certNo}
							</td>

							<td 
								style="cursor:hand" width="15%">
								<c:if test="${item.type==0}">订  &nbsp; 票 </c:if>
								<c:if test="${item.type==1}">订票确认 </c:if>
									<c:if test="${item.type==2}">售 &nbsp; 票</c:if>
								    <c:if test="${item.type==3}">换登机牌</c:if>
								    <c:if test="${item.type==4}">已登机</c:if>
								    <c:if test="${item.type==5}">改  &nbsp; 签</c:if>
								     <c:if test="${item.type==6}">修改信息</c:if>
								   <c:if test="${item.type==8}">退  &nbsp; 订</c:if>
								    <c:if test="${item.type==9}">退 &nbsp;  票</c:if>
							</td>
							<td 
								style="cursor:hand" width="15%">
								${item.flight}
							</td>
							<td 
								style="cursor:hand" width="15%">
								<fmt:formatDate value="${item.flightDate}" pattern="yyyy-MM-dd"/>
							</td>
							<td 
								style="cursor:hand" width="15%">
								<fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=10 height=1></TD>
						</TR>
						</c:forEach>
						
						
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
							face="webdings" size="3" color="red">4</font></span>
				</td>
				<td align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;共有&nbsp;<FONT COLOR="red"><%=count%></FONT>&nbsp;条记录&nbsp;&nbsp;&nbsp;&nbsp;第&nbsp;<font color=red><%=currentPage%></font>&nbsp;页/共&nbsp;<font color=red><%=pageCount%></font>&nbsp;页
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>

