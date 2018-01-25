<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
<style type="text/css">
	   .btn {
BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid
}
	   
	 </style>
	 <script type="text/javascript">
	 	var op = '<%=auth.getPassword()%>';
	 	function updatePWD(){
	 		var oldPWD = document.getElementById("oldPWD");
	 		var password = document.getElementById("password");
	 		var password2 = document.getElementById("password2");
	 		if(oldPWD.value==null || oldPWD.value ==''){
	 			alert('请输入原密码！');
	 			oldPWD.focus();
	 			return;
	 		}else if(oldPWD.value!=op){
	 			alert("原密码输入错误，请核查！");
	 			oldPWD.focus();
	 			return;
	 		}
	 		if(password.value==null || password.value ==''){
	 			alert('请输入新密码！');
	 			password.focus();
	 			return;
	 		}else if(password.value.length>20){
	 			alert('新密码长度超出范围，请重新输入！');
	 			password.focus();
	 			return;
	 		}
	 		if(password2.value==null || password2.value ==''){
	 			alert('请输入确认密码！');
	 			opassword2.focus();
	 			return;
	 		}
	 		if(password.value!=password2.value){
	 			alert("两次输入密码不一致，请核查！");
	 			password2.focus();
	 			return;
	 		}
	 	  
	 		SysmanagerDWR.updatePassword('<%=auth.getUserid()%>',password.value,handlerM);
	 	}
	 	function handlerM(data){
	 		if(data){
	 		   alert("密码修改成功，下次登录时候将生效！");
	 		   window.close();
	 		}else{
	 			alert("密码修改失败！");
	 		}
	 	}
	 </script>
  </head>
  
  <body>
    	<form action="<%=path%>/flightAction.do?method=updateUserPassword" method="post">
    		<table align="center" style="font-size: 12px">
    		    <tr>
    				<td colspan="2" align="center"><font style="font-weight:600;font-size: 18">修  改  密  码</font></td>
    				
    			</tr>
    			<tr>
    				<td colspan="2"><hr width="100%"/></td>
    				<input type="hidden" id="mold" name="mold" value="${pwd}"/>
    			</tr>
    			<tr>
    				<td align="right">用  &nbsp;户&nbsp;  &nbsp;名  ：</td>
    				<td align="center"><%=auth.getName() %></td>
    			</tr>
    			<tr>
    				<td align="right">原  &nbsp;密&nbsp;  &nbsp;码  ：</td>
    				<td><input id="oldPWD" type="password" name="oldPWD"  width="100%"/></td>
    			</tr>
    			<tr>
    				<td align="right">新  &nbsp;密&nbsp; &nbsp;码  ：</td>
    				<td><input id="password" type="password" name="password" width="100%"/></td>
    			</tr>
    			<tr>
    				<td align="right">新密码确认：</td>
    				<td><input id="password2" type="password" name="password2" width="100%"/></td>
    			</tr>
    		</table>
    		<div align="center">
    				<br/>
    				<input type="button" value="确认" onclick="updatePWD();" class="btn">
    				&nbsp; &nbsp;
    				<input type="button" value="取消" onclick="window.close();" class="btn">
    			</div>
    	</form>
  </body>
</html>
