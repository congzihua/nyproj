<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.DocTypes"/>
<jsp:directive.page import="com.founder.enp.service.DocTypesService"/>
<jsp:directive.page import="com.founder.enp.service.TemplateService"/>
<jsp:directive.page import="com.founder.enp.entity.Template"/>
<jsp:directive.page import="java.util.List"/>
<jsp:directive.page import="java.util.Iterator"/>
<%
  /* TemplateService service = new TemplateService();
   List list = service.getAllTemplate();
   if (list == null)
      return ;
   Iterator iter = list.iterator();
   int selTemplateid = types.getTempletid();*/
    DocTypesService typeService = new DocTypesService();
   DocTypes types = typeService.getDocTypesInfo(Integer.parseInt(request.getParameter("doctypesid")));
 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>修改公文文种</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript">
		function check()
		{
		   var name = document.docTypesForm.typename.value;
		   if (jsTrim(name) == "")
		   {
		      alert("公文文种名称不能为空");
		      document.docTypesForm.typename.focus();
		      return false;
		   }
		   if (name > 40)
		   {
		      alert("公文文种长度超出范围");
		      document.docTypesForm.typename.focus();
		      return false;
		   }
		   document.docTypesForm.templetid.value = 0;//废弃了
		   
		}
		
		</script>
	</head>
	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/doctypes/docTypesAction.do?oper=edit"  method="post">
		<html:hidden property="templetid" name="docTypesForm" />
		<html:hidden property="doctypeid" name="docTypesForm" value="<%=request.getParameter("doctypesid") %>" />
			<table style="margin:0px;font-size:12px" border="0" width="800"
				height="25" cellspacing="0" cellpadding="0"
				background="../../images/weizhi.jpg">
				<tr>
					<td width="95%" height="25">
						<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 文种管理 →
						新建文种
					</td>
				</tr>

			</table>
			<div style="margin-top:10px;margin-left:10px;">
				<table>
					<tr align="middle">
						<td>

							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%" align="center">

								<tr>

									<td >
										文种名称:
									
									 <html:text  property="typename" value="<%=types.getTypename() %>" name="docTypesForm"></html:text>

										<font color='red'>*</font>
									</td>

								</tr>
							<!--  	<tr>
									<td >
										公文模板:
										<select id = "template" name="template">
										
										</select>
									</td>
								</tr>
-->

								<tr>
									<td colspan="2"  align="center">
										<input type="submit"  Class="button2" value=" 保存"
											onclick="return check();" />
										<input type="button" Class="button2" value=" 重置 " />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</body>
</html>
