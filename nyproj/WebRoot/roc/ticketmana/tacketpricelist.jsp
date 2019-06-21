<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.founder.enp.entity.User"%>
<%@page import="com.roc.enp.entity.BaFlight"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
String deleNum = request.getAttribute("deleNum")==null?"":request.getAttribute("deleNum").toString().trim();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>票价列表</title>

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
		   if (confirm("您勾选的票价信息将被删除，信息无法恢复，您确认删除吗?"))
		   {	
		       document.forms[0].action="<%=request.getContextPath()%>/ticketpriceAction.do?method=deleteTicketprices&ids="+idstring;
		       document.forms[0].submit();
  	       }
		}
		function add()
		{
			var url = "<%=request.getContextPath()%>/roc/ticketmana/addOper.jsp";
	        window.location.href=url;
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
		    var f = document.getElementsByName("flightName")[j].value;
		     var discountType = document.getElementsByName("discountType")[j].value;
		     var realAmount = document.getElementsByName("realAmount")[j].value;
		   var url = "<%=request.getContextPath()%>/roc/ticketmana/editOper.jsp?id="+objs.value+"&discountType="+encodeURI(encodeURI(discountType))+"&flightName="+encodeURI(encodeURI(f))+"&realAmount="+encodeURI(encodeURI(realAmount));
			window.location.href=url;
		}
	  
	
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/user/userAction.do?oper=list"  method="post">
	   
	    <input type="hidden" name="currentPage" />
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath()%>/images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：基础数据管理 → 票价管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:add()"
						value="新 建" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:edit()"
						value="修 改" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:del()"
						value="删 除" />
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
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								航程
							</td>
							<td width=20% background="<%=request.getContextPath()%>/images/bg_board.gif">
								折扣类型
							</td>
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								实际金额（元）
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
							
							<td style="cursor:hand" width=15%>
								<input type="hidden" name="flightId" value="${item.flightId}"/><input type="hidden" name="flightName" value="${item.flightName}"/>${item.flightName}
							</td>
							<td style="cursor:hand" width=20%>
								<input type="hidden" name="discountType" value="${item.discountType}"/>${item.discountType}
							</td>
							<td 
								style="cursor:hand" width="15%">
								<input type="hidden" name="realAmount" value="${item.realAmount}"/>${item.realAmount}
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
