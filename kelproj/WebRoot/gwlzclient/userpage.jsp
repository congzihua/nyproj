<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.UserPage"/>
<jsp:directive.page import="com.founder.enp.entity.DepartMent"/>
<jsp:directive.page import="com.founder.enp.service.DepartMentService"/>
<jsp:directive.page import="com.founder.enp.entity.UserGroup"/>
<jsp:directive.page import="com.founder.enp.service.UserGroupService"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%  

    Authorization authorization = (Authorization) session
			.getAttribute("authorization");
    UserPage userPage = (UserPage)session.getAttribute("userPage"); 
    UserGroupService groupService = new UserGroupService();
    UserGroup group = groupService.queryUgInfo(authorization.getGroupid());
    DepartMentService dpService = new DepartMentService();
    DepartMent departMent = dpService.queryDpmInfo(authorization.getDmpid());
%>
<html>
	<head>
		<title>个人设置</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
        <script type="text/javascript" src="../js/verify.js"></script>
	<script type="text/javascript">
	function doCommit()
	{
	
	    var fileTempPath = jsTrim(document.all("fileTempPath").value);
	    if (fileTempPath=="")
	    {
	       alert("本地临时工作目录不能为空");
	       document.all("fileTempPath").focus();
	       return false;
	    }
	    if (fileTempPath.length > 128)
	    {
	        alert("本地临时工作目录超出允许范围");
	       document.all("fileTempPath").focus();
	       return false;
	    }
	    var fileNumber = jsTrim(document.all("fileNumber").value);
	    if (fileNumber=="")
	    {
	       alert("每页显示记录数不能为空");
	       document.all("fileNumber").focus();
	       return false;
	    }
	    var selectLogin = document.all("selectLoginForm").value;
	    document.all("selectLogin").value=selectLogin;
	    userPageForm.submit();
	}
	function changePassWord()
	{
	     	window.open("changepwd.jsp","修改密码",'top='+(screen.height/2-100)+',left='+(screen.width/2-200)+',width=400,height=200,scrollbars=no,resizable=yes,center:yes'); 
	
	}
	
	</script>

	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}" topmargin=10
		leftmargin=60 style="FONT-SIZE: 12px">
		<html:form action="/gwlzclient/userPageAction.do" method="post">
			<html:hidden property="selectLogin" name="userPageForm"/>
			<html:hidden property="userid" name="userPageForm" value="<%=String.valueOf(authorization.getUserid()) %>"/>
		<Table style='font-size:12px;width:600px' align=center cellspacing=1
			cellpadding=0 border=0>
			<TR height=26px>
				<TD background="../images/weizhi.jpg" colspan=4>
					&nbsp&nbsp&nbsp&nbsp

					<%=authorization.getName()%>
					的当前登录身份为：<%=departMent.getName() %> → <%=group.getName() %>

				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<BR>
			<BR>
			<tr>
				<td align=middle rowSpan=20 vAlign=top width=109>
					<img src='../images/logos.jpg' onclick='ShowInfo()'>
				</td>
				<TD bgColor=#75783c rowSpan=20 width=1>
					<BR>
				</TD>
				<TD rowSpan=20 width=16 valign=bottom>
					<BR>
				</TD>
				<Td>
					<Div align=center>
						个人设置
					</Div>
					<BR>
					<HR align=left color=#75783c SIZE=1 width=350>
				</td>
			</tr>
			</td>
			</tr>
			<tr height=26px>
				<td>
					&nbsp&nbsp&nbsp&nbsp 本地临时路径：
					<html:text property="fileTempPath" value="<%=userPage.getFileTempPath() %>" name="userPageForm"
						style='width:180px;font-size:12px'>
						</html:text>
				</td>
			</tr>
			<tr height=26px>
				<td>
					&nbsp&nbsp&nbsp&nbsp 每页信息条数：
					<html:text property="fileNumber" value="<%=String.valueOf(userPage.getFileNumber()) %>" onkeypress="enterNumber()"  name="userPageForm"
						style='width:180px;font-size:12px'>
						</html:text>
					条
				</td>
			</tr>
			<tr height=26px>
				<td>
					&nbsp&nbsp&nbsp&nbsp 设置登录界面：
					<SELECT id=selectLoginForm name=select3
						style='width:180px;font-size:12px'>
                        <option value=11 <% if(userPage.getSelectLogin() == 11){ %> selected <%} %>>
							待办任务
						</option>
						<option <% if(userPage.getSelectLogin() == 0){ %> selected <%} %> value=0>
							起草中
						</option>
						<option <% if(userPage.getSelectLogin() == 1){ %> selected <%} %> value=1>
							待核稿
						</option>
						<option value=2 <% if(userPage.getSelectLogin() == 2){ %> selected <%} %>>
							承办处审核
						</option>
						<option value=3 <% if(userPage.getSelectLogin() == 3){ %> selected <%} %>>
							承办部室审批
						</option>
						<option value=4 <% if(userPage.getSelectLogin() == 4){ %> selected <%} %>>
							主管书记审批
						</option>
						<option value=5 <% if(userPage.getSelectLogin() == 5){ %> selected <%} %>>
							记协领导审批
						</option>
						<option value=6 <% if(userPage.getSelectLogin() == 6){ %> selected <%} %>>
							审批完毕
						</option>
						<option value=7 <% if(userPage.getSelectLogin() == 7){ %> selected <%} %>>
							已办结
						</option>
						<option value=8 <% if(userPage.getSelectLogin() == 9){ %> selected <%} %>>
							我的文档
						</option>
						<option value=10 <% if(userPage.getSelectLogin() == 10){ %> selected <%} %>>
							全部文档
						</option>
					</select>
				</td>
			</tr>

			<!--  <tr height=26px>
				<td height="24" width="358">
					&nbsp&nbsp&nbsp&nbsp 更改用户口令：
					<INPUT type="button" value="更 改 口 令" id=changePass name=button1
						onclick='changePassWord()'
						style='width:180px;height:22px;font-size:12px'>
				</td>
			</tr>-->
			<tr height=26px>
				<td height="24" width="358">
				</td>
			</tr>
			<tr height=50px>
				<td height="50" width="358">
					<p align="center">
						<a><FONT color=blue face="" onclick='doCommit()'
							style='cursor:hand'><U>确定</U>
						</FONT>
						</a> &nbsp;&nbsp;&nbsp;&nbsp;
						<a><FONT color=blue face="" onclick='javascript:window.close();'
							style='cursor:hand'><U>关闭</U>
						</FONT>
						</a>
				</td>
			</tr>
		</Table>
		</html:form>
	</body>
</html>
