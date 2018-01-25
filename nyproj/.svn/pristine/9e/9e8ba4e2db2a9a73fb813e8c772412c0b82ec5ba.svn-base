<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.founder.enp.entity.UserGroup"%>
<%
	String dmpid = (String) request.getAttribute("dmpid");
	List list = (List) request.getAttribute("list");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/table.js" ></script>
		<script type="text/javascript">

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
		function add()
		{
		 window.open('add.jsp?dmpid=<%=dmpid%>','新建用户组','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');

		}
		function edit()
		{
		 var id = getSelectID();
         if (id == false)
            return false;
		  window.open('userGroupAction.do?id='+id+'&oper=query','修改用户组','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
		 
		}
		function setpriv()
		{
		  var id = getSelectID();
          if (id == false)
            return false;
          window.open('userGroupAction.do?id='+id+'&oper=powersList','权限设置','top='+(screen.height/2-300)+',left='+(screen.width/2-400)+',width=800,height=600,scrollbars=yes,resizable=yes,center:yes');
	
		}
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
		   if (!confirm("用户组相关信息将被删除，确认删除吗?"))
		   {
		        return ;
		   }
		  window.open('userGroupAction.do?oper=del&idString='+idstring,'del','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
  
		}
	
	</script>
	</head>

	<body  style="margin:0px;"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<table  style="margin:0px;font-size:12px" border="0" width="800" height="25" cellspacing="0"
							cellpadding="0" background="../../images/weizhi.jpg">
							<tr>
								<td width="95%" height="25">
									<font face="Wingdings" size="2">&nbsp;l </font>当前位置：用户管理 → 组别设置
								</td>
							</tr>
							
						</table>
		<table>
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
					<input type="button" class="button2" onclick="javascript:setpriv()"
						value="权限设置" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>

		</table>


		<table width="650" cellspacing="0" cellpadding="0" width="100%"
			border="0">
			<tr align="middle">
				<td valign="top" align="center">

					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="100%">
						<tr align="middle">
							<td background="../../images/bg_board.gif" height=25 width=100>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=50 background="../../images/bg_board.gif">
								流水号
							</td>
							<td width="200" background="../../images/bg_board.gif">
								组别名称
							</td>

							<td width="300" background="../../images/bg_board.gif">
								备注
							</td>

						</tr>
						<%
							Iterator iter = list.iterator();
							while (iter.hasNext()) {
								UserGroup group = (UserGroup) iter.next();
						%>
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=100>
								<input onclick="checkSelected()" type="checkbox"
									id="check<%=group.getId()%>" name="check_box" />

							</td>
							<td onclick="selected(<%=group.getId()%>)" style="cursor:hand"
								width=50>
								<%=group.getId()%>
							</td>
							<td onclick="selected(<%=group.getId()%>)" style="cursor:hand"
								width="200">
								<%=group.getName()%>
							</td>

							<td onclick="selected(<%=group.getId()%>)" style="cursor:hand"
								width="300">
								<%=group.getMem()%>
							</td>
						</tr>
						<TR>
							<TD background="../../images/dot_board.gif" colSpan=4 height=1></TD>
						</TR>
						<%
						}
						%>
					</table>

				</td>
			</tr>
		</table>
	</body>
</html>
