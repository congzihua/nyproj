<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录页面</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #056DAB;
	background-image: url(loginimages/logobj.jpg);
	background-repeat: repeat-x;
	background-position: center top;
}
.z1 {
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	font-weight: normal;
	color: #FFFF00;
	text-decoration: underline;
}
.z1 a:link, .z1 a:visited, .z1 a:hover, .z1 a:active{
	font-family: "宋体";
	font-size: 12px;
	line-height: 20px;
	font-weight: normal;
	color: #FFFF00;
	text-decoration: underline;
}
.dan {
	font-size: 12px;
	color: #000000;
	text-decoration: none;
	height: 14px;
}
.dan a:link, .dan a:visited, .dan a:hover, .dan a:active{
	font-size: 12px;
	color: #000000;
	text-decoration: none;
	height: 14px;
}

-->
</style>
<script >
window.name="tag"
function login(){
var url = ""
var id = document.getElementById('textfield').value;

if(id==1)
 	url = '<%=request.getContextPath()%>/client/dsppages/dspMain.jsp';
if(id==2)
 	url = 'client/djp_page.html';
if(id==3)
 	url = 'client/zhzx_page.html';
 	
 
 if(url==''){
 	alert('请输入正确的用户名！');
 	return;
 }
window.open(url);
window.close();

}
</script>
</head>

<body>
<form action="/loginAction.do" method="post" target="_top">
<table width="800" height="171" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="183" align="center">&nbsp;</td>
  </tr>
</table>
<table width="577" height="143" border="0" align="center" cellpadding="0" cellspacing="0" background="loginimages/logob2.jpg">
  <tr>
    <td width="119" height="268">&nbsp;</td>
    <td valign="top"><table width="577" height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
    </table>
      <table width="577" height="148" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center"><form id="form1" name="form1" method="post" action="">
            <table width="286" height="97" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="55" align="left"><img src="loginimages/01.gif" width="44" height="13" /></td>
                <td colspan="2" align="left"><input name="account" type="text" class="dan" id="name" size="23" /></td>
                <td width="74" rowspan="3" align="center"><input type="image" onclick="login();" name="imageField" id="imageField" src="loginimages/denglu.jpg" /></td>
              </tr>
              <tr>
                <td align="left"><img src="loginimages/02.gif" width="44" height="13" /></td>
                <td colspan="3" align="left"><input name="password" type="password" class="dan" id="password" size="25" /></td>
                </tr>
                 <tr>
                <td align="left"></td>
                <td colspan="2"><select id="admin" name="admin" >
									<option value="2">订售票系统</option>
									<option value="3">值登机系统</option>
									<option value="4">指挥中心系统</option>
									<option value="5">登机安检系统</option>
									<option value="1">系统管理员</option>
								</select>
							</td>
                
              </tr>
              <!--tr>
                <td align="left"><img src="loginimages/03.gif" width="44" height="13" /></td>
                <td width="86" align="left"><input name="textfield3" type="text" class="dan" id="textfield3" size="8" maxlength="4" /></td>
                <td width="71" align="left"><input type="image" name="imageField2" id="imageField2" src="loginimages/untitled.bmp" /></td>
                <td align="center" class="z1">看不清？</td>
              </tr-->
            </table>
                    </form>
          </td>
        </tr>
      </table></td>
    <td width="122">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
