<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>登录</TITLE>
<LINK href="<%=request.getContextPath()%>/loginimages/Default.css" type=text/css rel=stylesheet><LINK 
href="<%=request.getContextPath()%>/loginimages/xtree.css" type=text/css rel=stylesheet><LINK 
href="<%=request.getContextPath()%>/loginimages/User_Login.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.6000.16674" name=GENERATOR>
<script language="JavaScript" type="text/javascript">
		function check()
		{
		    if (document.getElementsByName("account")[0].value == "")
		    {
		        alert('登录名称不能为空');
		        document.getElementsByName("account")[0].focus();
		        return false;
		    }
		   
		   document.forms[0].submit();
		}
		</script>
		<style type="text/css">
		#userlogin_body {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(<%=request.getContextPath()%>/loginimages/user_all_bg.gif) #226cc5 repeat-x 50% top; PADDING-BOTTOM: 0px; MARGIN: 110px 0px 0px; FONT: 12px/150% Arial, "����" ,Helvetica,sans-serif; PADDING-TOP: 0px; TEXT-DECORATION: none
}
		</style>
</HEAD>
<BODY id=userlogin_body>
<DIV><a href="<%=request.getContextPath()%>/tflogin.jsp">保障系统</a></DIV>
<form action="<%=request.getContextPath()%>/loginAction.do" method="post" target="_top">
<DIV id=user_login>
<DL>
  <DD id=user_top>
  <UL>
    <LI class=user_top_l></LI>
    <LI class=user_top_c></LI>
    <LI class=user_top_r></LI></UL>
  <DD id=user_main>
  <UL>
    <LI class=user_main_l></LI>
    <LI class=user_main_c>
    <DIV class=user_main_box>
    <UL>
      <LI class=user_main_text>用户名 </LI>
      <LI class=user_main_input><INPUT class=TxtUserNameCssClass id=TxtUserName 
      maxLength=20 name="account"> </LI></UL>
    <UL>
      <LI class=user_main_text>密&nbsp; &nbsp; 码 </LI>
      <LI class=user_main_input><INPUT class=TxtPasswordCssClass id=TxtPassword 
      type=password name='password'> </LI></UL>
    <UL>
      <LI class=user_main_text>系&nbsp; &nbsp; 统</LI>
      <LI class=user_main_input ><select id="admin" name="admin" style="height: 12">
									
									<option value="2">订售票系统</option>
									<option value="3">值登机系统</option>
									<option value="4">指挥中心系统</option>
									<option value="5">安检系统</option>
									<option value="6">登机扫描系统</option>									
									<option value="1">系统管理员</option>
								
								</select></LI></UL></DIV></LI>
    <LI class=user_main_r><INPUT class=IbtnEnterCssClass id=IbtnEnter 
    style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
    onclick='javascript:check()' 
    type=image src="loginimages/user_botton.gif" name=IbtnEnter> </LI></UL>
  <DD id=user_bottom>
  <UL>
    <LI class=user_bottom_l></LI>
    <LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px">  
    </SPAN> </LI>
    <LI class=user_bottom_r><% if(request.getAttribute("msg")!=null){%>					
				<%=request.getAttribute("msg").toString() %>					
<%} %></LI></UL></DD></DL></DIV><SPAN id=ValrUserName 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrPassword 
style="DISPLAY: none; COLOR: red"></SPAN><SPAN id=ValrValidateCode 
style="DISPLAY: none; COLOR: red"></SPAN>

<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red">

</DIV>

<DIV></DIV>

</FORM></BODY></HTML>
