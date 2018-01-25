<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.UserService"/>
<jsp:directive.page import="com.founder.enp.entity.UserKeyWord"/>
<jsp:directive.page import="com.founder.enp.entity.User"/>

<%
   UserService service = new UserService();
   UserKeyWord keyword = new UserKeyWord();
   String dmpid = request.getParameter("dmpid");
   keyword.setDmpid(Integer.parseInt(dmpid));
   int count = service.queryUserCount(keyword);
   keyword.setPageInfo(count, 1);
   List list = service.listUser(keyword);
   Iterator iter = list.iterator();

   int n = 0;

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户调序</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="../../css/admin.css">
  </head>
  
  <body style="margin:0"
		oncontextmenu="if (!event.ctrlKey){return false;}">
    <table style="font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25"><font face="Wingdings" size="2"> l </font>当前位置：用户管理 → 用户管理 →
						用户调序
					</td>
				</tr>

			</table>
			<table style="font-size:12px;">
			<tr>
				<td>
					<input type="submit" class="button2" onclick="return order();"
						value="确 定" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:window.close();"
						value="关 闭" />
				</td>
				
			</tr>

		</table>
		<fieldset>
			<legend style="font-size:12px;margin:5px">
				用户列表
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
  </body>
</html>
