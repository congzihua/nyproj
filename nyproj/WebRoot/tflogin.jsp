<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="./tflogin/css/login.css">
</head>
<body>
<div class="login">
    <div class="login_title">
        <p>任务保障系统</p>
    </div>
    <div class="login_main">
        <div class="main_left"></div>
        <div class="main_right">
            <div class="right_title">用户登录</div>
            <form action="<%=request.getContextPath()%>/tfLoginAction.do" method="post">
                <div class="username">
                    <img src="./tflogin/images/username.png" alt="">
                    <input id="account" name="account" type="text" placeholder="请输入用户名">
                </div>
                <div class="password">
                    <img src="./tflogin/images/password.png" alt="">
                    <input  id="password" name="password" type="password" placeholder="请输入密码">
                </div>
                <div  class="password">
                    <select id="admin" name="admin" style="height: 12">
									<option value="2">订售票系统</option>
									<option value="3">值登机系统</option>
									<option value="4">指挥中心系统</option>
									<option value="5">安检系统</option>
									<option value="6">登机扫描系统</option>
					</select>
                </div>
                <div class="yes_login"><a href="javascript:void(0);" onclick="check()">登&nbsp;&nbsp;&nbsp;&nbsp;录</a></div>
				<center><p id="msg" style="margin-top:20px;font-size:12px;color:#FA6F03;">${msg}</p></center>
            </form>
        </div>
    </div>
    <div class="login_footer">
        <p class="name">Copyright © 2018-2020</p>
		<p>建议浏览器：IE8及以上、360</p>        
    </div>
</div>

</body>
<script language="JavaScript" type="text/javascript">
		function check(){
		    if (document.getElementsByName("account")[0].value == "")
		    {
		        alert('用户名不能为空');
		        document.getElementsByName("account")[0].focus();
		        return false;
		    }
		   var pw =  document.getElementById("password").value;
		   if (pw == null || pw == "") {
			   alert('密码不能为空');
		       return false;
		   }
		   document.forms[0].submit();
		}
</script>
</html>