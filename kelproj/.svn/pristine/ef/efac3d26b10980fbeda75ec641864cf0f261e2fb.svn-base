<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'save.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="stylesheet" href="../../css/admin.css">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript">
	function save()
	{
	 var radio =  parent.topfrm.document.getElementsByName('oper');
	 var select = 2;
	 var content="";
	 var docTypesid='0';
	 for(var j=0;j<radio.length;j++)
	 {
	    if(radio[j].checked)
	    {
	       select = radio[j].value;
	    }
	 }
	 if (select == 2)
	 {
	    content = parent.operfrm.document.getElementsByName("template");
	    for (var n = 0; n < content.length;n++)
	    {
	       if (content[n].checked)
	       {
	         content = content[n].id;
	         break;
	       }
	    }
	    if (content == "")
	    {
	       alert("请选择模板");
	       return false;
	    }
	   // docTypesid = parent.operfrm.template.document.all("docTypesid").value;
	 }
	 else 
	 {
	     content = parent.operfrm.document.all("path").value;
	     if (content == "")
	     {
	        alert("请选择公文");
	        return false;
	     }
	 }
	 document.all("select").value = select;
	 document.all("content").value = content;
	 //document.all("doctypesid").value=docTypesid;
	}
	function cancel()
	{
	   top.close();
	}
	</script>
  </head>
  
<body oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0" topmargin="0">

<html:form action="/gwlzclient/doc/selectTemplateAction.do"
			method="post" target="_top">
			<html:hidden property="select" name="selectTemplateForm"/>
			<html:hidden property="content" name="selectTemplateForm"/>
			<!--<html:hidden property="doctypesid" name="selectTemplateForm"/>-->
<table align="center"> 
<tr>
<td>
<input type="submit" onclick="return save();" class="button2" value="确 定">

</td>
<td>
<input type="button" onclick="javascript:cancel();" class="button2"  value="取 消">

</td>
</tr>
</table>
</html:form>
  </body>
</html>
