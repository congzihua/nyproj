<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.DocNum"/>

<%
   DocNum docNum = (DocNum)request.getAttribute("docNum"); 
   String nextNum = String.valueOf(docNum.getNextnum());
   if (nextNum.length()==1)
     nextNum = "00"+nextNum;
   else if (nextNum.length() ==2)
     nextNum = "0"+nextNum;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript">
		function save()
		{
		   var year = document.all("year").value;
		   if (year.length !=4)
		   {
		     alert("年号不合法")
		     return ;
		   }
		   var number = document.all("number").value;
		   if (number.length > 3)
		   {
		      alert("序号不合法");
		      return ;
		   }
		    window.open('docNumAction.do?oper=save&year='+year+'&number='+number+'&docnumid='+document.all("docnumid").value,'save','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
  
		}
		</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<input type="hidden" name="docnumid" value="<%=docNum.getDocnumid()%>" %>
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="../../images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 公文文号管理 → <%=docNum.getTypename() %>
				</td>
			</tr>

		</table>
		<table style="font-size:12px;color:red">
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
			<tr>
				<td>
					规则：文种+[
					<input type="text" class="textbox"  size="10" onkeypress="enterNumber()" value="<%=docNum.getYear() %>" name="year">
					]+
					<input type="text" class="textbox" size="10" onkeypress="enterNumber()" value="<%=nextNum%>" name="number">
					+号
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:save();"
						value="保存" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
			<tr>
				<td height="24">
					下一文号：
					<%=docNum.getTypename() %>
					[<%=docNum.getYear() %>]<%=nextNum %>号
				</td>
			</tr>
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
		</table>
	</body>
</html>
