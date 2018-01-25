<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocService"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.entity.DepartFlows" />
<jsp:directive.page import="com.founder.enp.service.UserService" />
<jsp:directive.page import="com.founder.enp.entity.User" />

<%
	String flowids = request.getParameter("flowids");
	DocService docService = new DocService();
	java.util.StringTokenizer token = new java.util.StringTokenizer(flowids, ";");
	String docTitle="";
	if (token.hasMoreTokens())
	{
	   Integer flowsid = Integer.parseInt(token.nextToken());
	   docTitle = docService.getDocTitle(flowsid);
	}
	Authorization authorization = (Authorization) request.getSession()
			.getAttribute("authorization");
	Integer dmpid = request.getParameter("dmpid") == null ? authorization
			.getDmpid()
			: Integer.parseInt(request.getParameter("dmpid"));
	String pg = (String) session.getAttribute("pg");
	Integer flows = request.getParameter("flows") == null ? Integer
			.parseInt(pg) + 1 : Integer.parseInt(request
			.getParameter("flows"));
	UserService service = new UserService();
	DepartFlows departFlows = new DepartFlows();
	departFlows.setDepartmentid(dmpid);
	departFlows.setPowerid(flows);
	departFlows.setUserid(authorization.getLeaderid());
	List list = service.getDepartFlowsUser(departFlows);
	String sel = request.getParameter("sel");
	String strUserName = docService.getConterSignProcessorids(flowids);
	if (list == null) {
		out
		.print("<div style=\"color:red;\"><font size=14px>提取用户信息错误!</font></div>");
		return;
	}

	Iterator iter = list.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>提交</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<LINK href="../../css/Styles.css" type=text/css rel=stylesheet>
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript">
        function switchChange()
        {
          document.location.href = "submit.jsp?sel=<%=sel%>&flowids=<%=flowids%>&dmpid=<%=dmpid%>&flows="+document.all("flowsSelect").value;
        }
        function check()
        {
        <%if (sel.equals("single"))
        {%>
           var userids = document.getElementsByName("userName");
           var userName="";
           var userid="";
           for (var i = 0; i < userids.length; i++)
           {
               if (userids[i].checked)
               {
	                userid = userids[i].id;
	                userName = userids[i].value;
	                break;
               }
           }
           if (userName== "")
           {
               alert("请选择执行人");
               return false;
           }
           var advice = jsTrim(document.all("advicetextarea").value);
           if (advice=="")
           {
              if (!confirm("您还没有填写意见,是否提交?"))
              {
                 document.all("advicetextarea").focus();
                 return false;
              }
           }
           if (advice.length > 1024)
           {
              alert("意见超出系统允许的范围");
              return false;
           }
         
           var powerid = document.all("flowsSelect").value;
           document.submitForm.processid.value = userid;
           document.submitForm.powerid.value=powerid;
           document.submitForm.name.value=userName;
           document.submitForm.advice.value=advice;
           <%}
           else
           {%>
               var userids = document.getElementsByName("userName");
	           var userName="";
	           var userid="";
	           for (var i = 0; i < userids.length; i++)
	           {
	               if (userids[i].checked)
	               {
		                userName = userName+(userids[i].id+":"+userids[i].value)+"*";
		                
	               }
	           }
	           if (userName== "")
	           {
	               alert("请选择执行人");
	               return false;
	           }
	           var powerid = document.all("flowsSelect").value;
	        
	           document.submitForm.powerid.value=powerid;
	           document.submitForm.name.value=userName;
	           
           <%}%>
           var email = document.all("emailset");
           var message = document.all("info");
           var remark = document.submitForm.remark;
           if (email.checked || message.checked)
           {
              if (remark.value=="")
              {
                  if (!confirm("提示信息没有添写,是否继续?"))
                  {
                     return ;
                  }
              }
           }
           if (email.checked)
           {
               document.all("email").value=1;
           }
           if (message.checked)
           {
              document.all("message").value=1;
           }
        }
        function getAdvice()
        { 
           var rtnMsg = window.showModalDialog('../../adviceAction.do?oper=list','获取审批常用语','dialogWidth=600px;DialogHeight=300px;scrollbars=no;help=no;resizable=no;center:yes');
           if (rtnMsg == undefined)
           return ;
           document.all("advicetextarea").value=rtnMsg;
        }
        function saveAdvice()
        {
         if (jsTrim(document.all("advicetextarea").value) == "")
         {
               alert("审批语不能为空");
               document.all("advicetextarea").focus();
               return ;
         }
          
         alert("当提交后,审批语才会保存");
         document.all("adviceFlag").value=1;
        }
        </script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		style="margin:10px" bgcolor="#f0fafd">
		<html:form action="/gwlzclient/submit/submitAction.do?oper=submit"
			method="post" target="_top">
			<input type="hidden" name="adviceFlag" value="0"/>
			<input type="hidden" name="sel" value="<%=sel%>" />
			<input type="hidden" name="processids" />
			<html:hidden property="processid" name="submitForm" />
			<html:hidden property="email" name="submitForm" value="0"/>
			<html:hidden property="message" name="submitForm" value="0" />
			<html:hidden property="flowids" value="<%=flowids%>"
				name="submitForm" />
			<html:hidden property="powerid" name="submitForm" />
			<html:hidden property="name" name="submitForm" />
			<html:hidden property="advice" name="submitForm" />
			<html:hidden property="operationtor"
				value="<%=authorization.getName()%>" name="submitForm" />
			<table>
				<tr>
					<td>
						流程:
					</td>
					<td>
						<select onchange="javascirpt:switchChange();" name="flowsSelect">
							<option <%if (flows == 1){ %> selected <%} %> value="1">
								待核稿
							</option>
							<option <%if (flows == 2){ %> selected <%} %> value="2">
								承办处审核
							</option>
							<option <%if (flows == 3){ %> selected <%} %> value="3">
								承办部室审批
							</option>
							<option <%if (flows == 4){ %> selected <%} %> value="4">
								主管书记审批
							</option>
							<option <%if (flows == 5){ %> selected <%} %> value="5">
								记协负责人审批
							</option>
						</select>
					</td>
				</tr>
			</table>
			<table width="100%" style="margin:5px" bgcolor="#e1f5fb">
				<tr>
					<td valign="top" width="200">
						<table style="margin:5px" cellpadding="4" cellspacing="1"
							width="200" bgcolor="#81bddf">
							<tr>
								<td bgcolor="#ffffff" style="font-szie:16px;">
									<img src="../../images/Navi_userInfo.gif" width="20"
										height="15">
									&nbsp;&nbsp;执行人
								</td>

							</tr>
							<tr>
								<td bgcolor="#ffffff">
									<table width="100%" bgcolor="#ffffff">
										<%
													while (iter.hasNext()) {
													User user = (User) iter.next();
													
													if (String.valueOf(user.getUserid()).equals(String.valueOf(authorization.getLeaderid())))
													{
													    continue;
													}else
													{
										%>
										<tr>
											<td>
												<%
												if (sel.equals("single")) {
												%>
												<input id=<%=user.getUserid()%> value=<%=user.getName()%>
													checked name="userName" type="radio">
												<%=user.getName()%>
												<%
												} else {
												  if (strUserName.contains(user.getName()+"*"))
												  {
												     continue;
												  }
												%>
												
												<input id=<%=user.getUserid()%> value=<%=user.getName()%>
													name="userName" type="checkbox">
												<%=user.getName()%>
												<%
							
												
												}
												%>
											</td>
										</tr>
										<TR>
											<TD background="../../images/dot_board.gif" colSpan=23
												height=1></TD>
										</TR>
										<%
												break; }}
												while (iter.hasNext()) {
													User user = (User) iter.next();
													if (String.valueOf(user.getUserid()).equals(String.valueOf(authorization.getLeaderid())))
													{
													   continue;
													}
										%>
										<tr>
											<td>
												<%
												if (sel.equals("single")) {
												%>
												<input id=<%=user.getUserid()%> value=<%=user.getName()%>
													name="userName" type="radio">
												<%=user.getName()%>
												<%
												} else {
												 if (!strUserName.contains(user.getName()+"*"))
												 {
												%>
												<input id=<%=user.getUserid()%> value=<%=user.getName()%>
													name="userName" type="checkbox">
												<%=user.getName()%>
												<%
												}}
												%>
											</td>
										</tr>
										<TR>
											<TD background="../../images/dot_board.gif" colSpan=23
												height=1></TD>
										</TR>
										<%
										}
										%>
									</table>
								</td>
							</tr>

						</table>
					</td>
					<td valign="top">
						<table>
							<tr>
								<td width="60">
									提示信息:
								</td>
								<td>
									<html:textarea name="submitForm" value="<%=docTitle %>" property="remark" rows="6" cols="35"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									提醒方式:
								</td>
								<td>
									<table>
										<tr>
											<td>
											
											<input type="checkbox" name="emailset" id="emailset">电子邮件

											</td>
										</tr>
										<tr>
											<td>
													<input type="checkbox" name="info" id="info">即时通讯
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>

			</table>
			<%
			if (sel.equals("single")) {
			%>
			<table width="100%">
				<tr>
					<td colspan=10>
						<hr>
					</td>
				</tr>
				<tr>
					<td>
						填写意见:&nbsp;&nbsp;<a href="#" onclick="javascript:getAdvice();" style="color:red">提取审批语</a>&nbsp;&nbsp;<a href="#" style="color:red" onclick="javascript:saveAdvice()">保存审批语</a>
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="advicetextarea" cols="85" rows="5"></textarea>
					</td>
				</tr>
			</table>
			<%
			}
			%>
			<table align="center">
				<tr>
					<td>
						<input type="submit" onclick="return check();" value="确 定">

					</td>
					<td>
						<input type="button" onclick="javascript:top.close();" value="取 消">
					</td>
				</tr>
			</table>

		</html:form>
	</body>
</html>
