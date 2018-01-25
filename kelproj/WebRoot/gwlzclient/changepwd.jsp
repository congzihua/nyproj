<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../md5.html"%>
<html>
	<head>
		<title>修改用户密码</title>
		<script type="text/javascript" src="../js/common.js"></script>
		<script type="text/javascript">
		function check()
		{
		   if (frm.pwd.value == "")
		   {
		      alert('密码不能为空');
		      frm.pwd.focus();
		      return false;
		   }
		   if (frm.pwd.value != frm.rpwd.value)
		   {
		       alert('两次输入密码不一致');
		       return false;
		   }
		    
		   var sUrl = "modifypwd.jsp?pwd="+MD5(frm.pwd.value);
		  new net.ContentLoader(sUrl, doFinishModify); 
		 }
		function doFinishModify()
		{
		    var info = this.getReq().responseText;
		    alert(info);
		    top.close();
		}
		</script>

	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"  leftmargin="0" topmargin="0">
		<form name="frm" method="post" action="">
			<table width="100%">
				<tr>
					<td>
						<table border="0" width="100%" height="25" cellspacing="0"
							cellpadding="0" background="../images/weizhi.jpg">
							<tr>
								<td width="95%" height="25" style="font-size:12px">
									<font face="Wingdings" size="2">&nbsp; l </font>当前位置：修改用户密码
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table height="100%" cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="98%" align="center">
						<div align="center">

							<table cellspacing="0" cellpadding="0" width="99%" border="0" style="font-size:12px">
								<tr valign="middle">
									<td width="99%" rowspan="34" valign="top" align="center">
										<fieldset style="padding: 5; width:98%; height:100%">
											<legend>
												密码修改
											</legend>
											<table class="tlist" id="listtable" cellspacing="2"
												cellpadding="1" align="center" border="0" width="100%">
												<tr class="tableheader" align="left">
													<td style="font-size:12px">新密码:</td>
                                                <td><input type="password" name="pwd"  size="20" /><font color='red'> *</font></td>
												</tr>
												<tr class="tableheader" align="left">
													<td style="font-size:12px">确认新密码:</td>
                                                <td><input type="password" name="rpwd"  size="20" /><font color='red'> *</font></td>
												</tr>
												<tr>
																<td colspan="2" align="middle">
																	<input class="button2" type="button" onclick="javascript:check();" value=" 保存 " />
																	&nbsp;
																	<input class="button2" type="reset" value=" 重置 "/>
																</td>
															</tr>
											</table>
										</fieldset>
									</td>
								</tr>

							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
