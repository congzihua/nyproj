<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.founder.enp.entity.User"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <jsp:directive.page import="java.util.Iterator" />
<%
String deleNum = request.getAttribute("deleNum")==null?"":request.getAttribute("deleNum").toString().trim();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>航程管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type="text/javascript">
		<%if(!deleNum.equals("")){%>
			alert("成功删除<%=deleNum%>条航程记录！");
		<%}%>
		function switchChange(userid)
		{
		   var order = document.all("orderSelect"+userid).value;
		    var sUrl = "userAction.do?oper=order&userid="+userid+"&order="+order;
		   new net.ContentLoader(sUrl, doFinishOrder); 
		}
		
		
        
		 function getSelectID()
		  {
		    var nodes = document.getElementsByName(check_name);
		    var n = 0;
		    var objs,id ;
		    for (var i = 0; i < nodes.length; i++)
		    {
		        if (nodes[i].checked)
		        {
		          objs = nodes[i];
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
		    id = objs.id.substring(5, objs.id.length);
		    return id;
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
		   if (confirm("航程信息将被删除，信息无法恢复，您确认删除吗?"))
		   {	
		       document.forms[0].action="<%=request.getContextPath()%>/flightAction.do?method=deleteFlights&ids="+idstring;
		       document.forms[0].submit();
  	       }
		}
		function add()
		{	
			var url = "<%=request.getContextPath()%>/roc/hxmanag/addHX.jsp";
			window.location.href =url;
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
		    var f = document.getElementsByName("flight")[j].value;
		     var ename = document.getElementsByName("englishname")[j].value;
		   var url = "<%=request.getContextPath()%>/roc/hxmanag/editHX.jsp?id="+objs.value+"&f="+encodeURI(encodeURI(f))+"&ename="+encodeURI(encodeURI(ename));
		   window.location.href =url;
		}
	 
	
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/flightAction.do?method=deleteFlights"  method="post">
	   
	    <input type="hidden" name="currentPage" />
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath()%>/images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：基础数据管理 → 航程信息管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:add()"
						value="增加航程" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:edit()"
						value="修 改航程" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:del()"
						value="删 除航程" />
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
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=20% background="<%=request.getContextPath()%>/images/bg_board.gif">
								航程
							</td>
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								英文名
							</td>
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								创建时间
							</td>					

						</tr>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
						<c:forEach var="item" items="${list}">
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox"
									id="" name="check_box" value="${item.id}"/>
                               
							</td>
							
							<td style="cursor:hand" width=20%>
								<input type="hidden" name="flight" value="${item.flight}"/>${item.flight}
							</td>
							
							<td 
								style="cursor:hand" width="15%">
								<input type="hidden" name="englishname" value="${item.englishname}"/>${item.englishname}
							</td>
							<td 
								style="cursor:hand" width="15%">
								<fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
						</c:forEach>
						
						
						
					</table>

				</td>
			</tr>
		</table>
		
		</html:form>
	</body>
</html>
