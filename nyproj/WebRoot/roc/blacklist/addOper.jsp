
<%@page import="com.roc.enp.entity.BlacklistUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/table.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath() %>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		
		<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		
          
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath() %>/images/weizhi.jpg">
			<tr>
				<td width="50%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：新增黑名单
				</td>
			</tr>

		</table>
		<form id="fm" action="<%=request.getContextPath()%>/blacklistUserAction.do" method="post">
		<input type="hidden" name="method" value="addInfo">
		<table height="100%" cellspacing="0" cellpadding="0" width="50%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr>
								
									<td align="center">
										姓名:
									</td>
									<td colspan="3" align="left">
										<input style="width: 90%" type="text" name ="name" id="name"/>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr>
									<td align="center">
										证件类型:
									</td>
									<td align="left">
									<select style="width: 90%" name="certType" id="certType">
										<option value="身份证" >身份证</option>
										<option value="军人证" >军人证</option>
										<option value="户口簿" >户口簿</option>
										<option value="警官证" >警官证</option>
										<option value="其他" >其他</option>
									</select>
									</td>
								</tr>
								<tr>
									<td align="center">
										证件号码:
									</td>
									<td colspan="3" align="left">
										<input style="width: 90%" type="text" name ="idcard" id="idcard"/>
										<font color='red'>*</font>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input type="button" class="button2" onclick="javascript:save();" value="保存" />
						<input type="button" class="button2" 
						 onclick='javascript:window.location.href = "<%=request.getContextPath()%>/blacklistUserAction.do?method=toBlacklistUserList"':
							value="返回" />
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table>
			</form>
	</body>
	<script type="text/javascript">
	function save(){
		var name = document.getElementById("name").value;
		var idcard = document.getElementById("idcard").value;
		if (name == null || name == '' || name.length > 50) {
			alert("姓名应该在1-50个字符之间");
			return;
		}
		if (idcard == null || idcard == '' || idcard.length > 50) {
			alert("证件号码应该在1-50个字符之间");
			return;
		}
		$("#fm").submit();
	}
	</script>
</html>




