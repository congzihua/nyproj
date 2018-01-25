<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript">
		function check()
		{
			var template = document.parameterForm.templateip.value;
			if (jsTrim(template) == "")
			{
			    alert("模板路径不能为空");
			    document.parameterForm.templateip.focus();
			    return false;
			}
			if (template.length > 128)
			{
			    alert("模板路径超出范围");
			    document.parameterForm.templateip.focus();
			    return false;
			}
			
			var attacheip = document.parameterForm.attacheip.value;
			if (jsTrim(attacheip) == "")
			{
			    alert("附件路径不能为空");
			    document.parameterForm.attacheip.focus();
			    return false;
			}
			if (attacheip.length > 128)
			{
			    alert("附件路径超出范围");
			    document.parameterForm.attacheip.focus();
			    return false;
			}
			
			var contentip = document.parameterForm.contentip.value;
			if (jsTrim(contentip) == "")
			{
			    alert("正文路径不能为空");
			    document.parameterForm.contentip.focus();
			    return false;
			}
			if (contentip.length > 128)
			{
			    alert("正文路径超出范围");
			    document.parameterForm.contentip.focus();
			    return false;
			}
			
			var docsbackip = document.parameterForm.docsbackip.value;
			if (jsTrim(docsbackip) == "")
			{
			    alert("归档路径不能为空");
			    document.parameterForm.docsbackip.focus();
			    return false;
			}
			if (docsbackip.length > 128)
			{
			    alert("归档路径超出范围");
			    document.parameterForm.docsbackip.focus();
			    return false;
			}
			 document.parameterForm.submit();
		}
		
		</script>
	</head>
	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/parameter/parameterAction.do?oper=update"
			method="post">
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="../../images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：系统管理 → 参数配制
				</td>
			</tr>

		</table>
		<table>
			<tr>
				<td>
					<input type="button"  onclick = "return check();" class="button2" value="保存" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>
		</table>
		<table
			style="margin-top:5px;margin-left:10px;font-size:12px;color:red">
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
			<tr>
				<td>
					公文模板路径：
					<html:text size="40" property="templateip" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					公文附件路径：
					<html:text size="40" property="attacheip" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>
			</tr>
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
			<tr>
				<td>
					公文正文路径：
					<html:text size="40" property="contentip" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					公文归档路径：
					<html:text size="40" property="docsbackip" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>

			</tr>
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
			<tr>
				<td>
					HTTP上传服务：
					<html:text size="40" property="httpupload" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>
				<td>
					&nbsp;
				</td>
				<td >
					HTTP下载服务：
					<html:text size="40" property="httpdnload" name="parameterForm" styleClass="textbox">
						</html:text>
					<font color=red>*</font>
				</td>
			</tr>
			<TR>
				<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
			</TR>
		
		</table>
		</html:form>
	</body>
</html>
