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
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript" src="../../js/common.js"></script>
		<script type="text/javascript">
		function check()
		{
		    var name = document.templateForm.templetname.value;
		    if (jsTrim(name)=="")
		    {
		       alert("模板名称不能为空");
		       return false;
		    }
		    if (name.length > 128)
		    {
		       alert("模板名称长度超出范围");
		       return false;
		    } 
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
		<html:form action="/gwlzadmin/templtes/templateAction.do?oper=add"
			method="post" enctype="multipart/form-data">
			<table style="margin:0px;font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25">
						<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 模板管理 →
						新建模板
					</td>
				</tr>

			</table>
			<div style="margin-top:10px;margin-left:10px;" >
					
								<table style="font-size:14px;color:#568ba4" border="0"
									width="100%" align="center">

									<tr>

										<td>
										 模板名称:

											<html:text property="templetname" name="templateForm" />

											<font color='red'>*</font>
										</td>
										</tr>
										<tr >
										<td>
										 模板路径:

											<html:file property="file" size="30" name="templateForm" />

										</td>
										
										
									</tr>
									<tr align="middle">
										<td colspan="2">
											<input type="submit" Class="button2" value=" 保存" onclick="return check();" />
											<input type="reset" Class="button2" value=" 重置 " />
										</td>
									</tr>
								</table>
			
			</div>
		</html:form>
	</body>
</html>
