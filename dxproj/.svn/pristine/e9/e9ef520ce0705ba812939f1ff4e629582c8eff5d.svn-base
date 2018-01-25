<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.User"/>
<%

   List list = (List)request.getAttribute("boundList");
   Iterator iter = list.iterator();
   int n = 0;
   String userName = (String) request.getAttribute("userName");
	if (userName == null || userName.equals(""))
		userName = "";
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'unbound.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		function unbound()
		{
		
		   var nodes = document.getElementsByName("check_box");
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
		       alert('请选择要解除绑定的记录');
		       return ;
		     }
		      window.open('accountieAction.do?oper=updateunbound&userid=<%=request.getParameter("userid")%>&idString='+idstring,'bound','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
  
		}
		</script>
		</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		style="margin:0px">
		<html:form action="/gwlzadmin/accountie/accountieAction.do?oper=bound"  method="post">
	    <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
		<table>
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:unbound()"
						value="解除绑定" />
				</td>
				<td style="color:#568ba4">
					姓名：<input type="text" size="15" class="textbox" value="<%=userName%>" id="name" name="name" />
				</td>
				<td>
					<input type="submit"  class="button2"
						value="查询" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>

		</table>

		<fieldset>
			<legend style="font-size:12px;margin-top:5px">
				已绑定用户列表
			</legend>
			<table width="100%">
				<tr>
				
				<%if (list.size() == 0)
				{ %>
				 <td style="color:red;font-size:14px">
				 没有记录
				 </td>
				<%} %>
			  <%while (iter.hasNext())
			  { 
			      User user = (User)iter.next();
			  
			  %>
			
				<td  style="color:#568ba4;font-size:14px">
					<input  type="checkbox"
									id="check<%=user.getUserid()%>" name="check_box" /> <%=user.getName() %>
					</td>
				
             <%
                n++;
                if (n % 6 == 0)
                {
                %>
                
                </tr>
                <TR>
							<TD background="../../images/dot_board.gif" colSpan=10 height=1></TD>
						</TR>
                <tr>
                <% 
                }
             
             } %>


			</table>
		</fieldset>
		</html:form>
	</body>
</html>
