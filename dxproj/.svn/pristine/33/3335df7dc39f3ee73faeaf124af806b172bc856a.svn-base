<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.founder.enp.entity.UserGroup"%>
<jsp:directive.page import="java.util.StringTokenizer" />
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%
	UserGroup group = (UserGroup) request.getAttribute("userGroupForm");
	String powers = group.getPowers() == null ? "" : group.getPowers()
			.substring(0, group.getPowers().lastIndexOf(";"));
	StringTokenizer token = new StringTokenizer(powers, ";");
%>
<html>
	<head>
		<title><%=group.getName()%>-组权限设置</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		 function Init()
		 {
		    <%
		     while(token.hasMoreTokens())
		     {    
		    %>
			      var nodes = document.getElementsByName("cbName");
	             for (var i = 0; i < nodes.length; i++)
	             {
	               if (nodes[i].id == <%=token.nextToken()%> )
	               {
	                   nodes[i].checked = "true";
	               }
	             }
		    <%}%>
		 }
         function check()
         {
            var powers='';
            var nodes = document.getElementsByName("cbName");
             for (var i = 0; i < nodes.length; i++)
             {
               if (nodes[i].checked )
               {
                   powers+=nodes[i].id+";";
               }
             }
             if (powers=='')
             {
                alert("请选择权限");
                return false;
             }
             document.userGroupForm.powers.value=powers; 
         }
		
		</script>
	</head>

	<body bgcolor="#ffffff"
		oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0"
		topmargin="0" onload="Init()">

		<html:form
			action="/gwlzadmin/usergroup/userGroupAction.do?oper=powers"
			method="post">
			<html:hidden property="id" name="userGroupForm" />
			<html:hidden property="powers" name="userGroupForm" />
			<table style="margin:0px;font-size:12px" border="0" width="100%"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25">
						<font face="Wingdings" size="2">&nbsp; l </font>当前位置：用户管理 → 组别设置 →
						权限设置
					</td>
				</tr>

			</table>
			<table>
				<tr>
					<td>
						<input type="submit" class="button2" onclick="return check();"
							value="保存" />
						<input type="button" class="button2" onclick="window.close();"
							value="关闭" />
					</td>
				</tr>
			</table>
			<div style="margin:10px">
				<fieldset>
					<legend style="font-size: 14px; color: rgb(86, 139, 164);">
						权限设置
					</legend>

					<div style="margin-top:0px;margin-left:10px">
						<table style="font-size: 14px; color: rgb(86, 139, 164);" >
							<TR>
								<TD background="../../images/dot_board.gif" colSpan=15 height=1></TD>
							</TR>
							<tr>
								<td>
									<input type="checkbox" name="cbName" id="0">
									订售票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="checkbox" name="cbName" id="1">
									值登机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="checkbox" name="cbName" id="2">
									指挥中心 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="checkbox" name="cbName" id="5">
									登机安检 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="checkbox" name="cbName" id="3">
									系统管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<input type="checkbox" name="cbName" id="4">
									高级管理人员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<TR>
								<TD background="../../images/dot_board.gif" colSpan=15 height=1></TD>
							</TR>
							
						</table>
					</div>
				</fieldset>
			</div>
		</html:form>
	</body>
</html>
