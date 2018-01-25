<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新建模板</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		function check()
		{
		   if (document.templateForm.file.value == "")
		   {
		      alert("请选择要上传的文件");
		      document.templateForm.file.focus();
		      return false;
		   }
		}
		</script>
	</head>
	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/templtes/templateAction.do?oper=upload"
			method="post" 	enctype="multipart/form-data">
			<html:hidden property="templetid" value="<%=request.getParameter("id") %>" name="templateForm"/>
			<table style="margin:0px;font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25">
						<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 模板管理 →
						上传模板
					</td>
				</tr>

			</table>
			<div style="margin-top:10px;margin-left:10px;" >
					
								<table style="font-size:14px;color:#568ba4" border="0"
									width="100%" align="center">

									<tr align="middle">

										<td>
										本地路径:
	                                       <html:file property="file" size="30" name="templateForm" />

											<font color='red'>*</font>
										</td>
										
									</tr>
									<tr align="middle">
										<td colspan="2">
											<html:submit onclick="return check();" styleClass="button2" value="上传模板"></html:submit>
										&nbsp;
										    <html:reset styleClass="button2" value=" 重 置 "></html:reset>
										</td>
									</tr>
								</table>
			
			</div>
		</html:form>
	</body>
</html>
