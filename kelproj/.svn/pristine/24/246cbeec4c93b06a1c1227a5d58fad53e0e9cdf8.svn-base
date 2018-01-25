<%@ page language="java" pageEncoding="UTF-8"%>

<jsp:directive.page import="com.founder.enp.entity.Attache" />
<jsp:directive.page import="com.founder.enp.forms.DocsForm" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.founder.enp.forms.SelectTemplateForm" />
<jsp:directive.page import="com.founder.enp.entity.Parameter" />
<jsp:directive.page import="com.founder.enp.service.ParameterService" />
<jsp:directive.page import="com.founder.enp.entity.UserPage"/>
<%
String docOper = session.getAttribute("docOper")==null?"":(String)session.getAttribute("docOper");
UserPage userPage = (UserPage)session.getAttribute("userPage"); 

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'save.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<link rel="stylesheet" href="../../css/admin.css">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../../js/common.js"></script>
		<script type="text/javascript">
	function save()
	{
		  if (parent.content.document.all.IEWord != undefined)
		  {
		       if (parent.content.document.all.IEWord.IsDirty)
			   {
				  parent.content.document.all.IEWord.Save();    
			   }
			     parent.content.document.all.IEWord.Close();
		  }
		 var result = checkDocsForm();
		 if (!result)
		 {
		 	     parent.frames[0].Tcase(1);
		    return ;
		 }
		 result = uploadContent();
		 if (result=="false")
		 {
		     alert("上传公文失败，请检查网络");
		     return ;
		 }
		 <%if(!docOper.equals("finish"))
		 {%>
			result = uploadAttache();
		    if (result=="false")
			{
			  alert("上传附件失败，请检查网络");
		      return ;
		    }
	    <%}%>
	    var sUrl = "docAction.do?oper=add";
	    <%if (!docOper.equals(""))
	    {
	       if (docOper.equals("modify"))
	       {
	    
	    %>  
	         sUrl = "docAction.do?oper=modify";
	    
	    <%}
	    else if (docOper.equals("finish"))
	    {
	    %>
	     sUrl = "docAction.do?oper=finish";
	   <% }}%>
	    new net.ContentLoader(sUrl, doFinish); 
	}
	function doFinish()
	{
	   var info = this.getReq().responseText;
	   if (info=='addsuccess')
	   {
		 alert("保存公文成功");
		 parent.opener.parent.location.reload();
		 top.close();
		
	   }
	    else if (info=='editsuccess')
	   {
		 alert("修改公文成功");
		 parent.opener.parent.location.reload();
		 top.close();
		
	   }
	   else if 
	   (info=='editerror')
	   {
		 alert("修改公文失败");
	   }
	   else if (info=='finishsuccess')
	   {
	      alert("办结公文成功");
	      top.close();
	      top.opener.refreshPre();
	   }
	   else if (info == 'finisherror')
	   {
	      alert('办结公文失败');
	   }
	   else
	   {
	     alert("保存公文失败");
	   }
	}
	function uploadAttache()
	{
	        <%
	         ParameterService service = new ParameterService();
             Parameter param = service.listParameter();
	        List list = (List)session.getAttribute("attache");
	        if (list == null)
	        {
	        %>
	         return "no";
	        <%
	        }
	        else
	        {
	           Iterator itera = list.iterator();
	           while (itera.hasNext())
	           {
	               Attache attache = (Attache)itera.next();
	               if (attache.getFileOrgName() != null)
	               {
	               String destPath = param.getAttacheip()+attache.getFilename();
	               destPath = destPath.replace("\\",  "\\\\");
	               String localfile = attache.getFileOrgName();
	               localfile = localfile.replace("\\",  "\\\\");
	                
	               %>
	                 var localfile="<%=localfile%>";
	                 var httpurl = "<%=param.getHttpupload()%>?destPath=<%=destPath%>";
	                 var szResult = httpUploadFile(httpurl,localfile);
	                 if (szResult=="false")
	                 {
	                     return "false"
	                 }
	           <%}}}%>
	       return "success";
	}
	function checkDocsForm()
	{
	   <%
       
	     DocsForm docsForm = (DocsForm)session.getAttribute("docsForm");
	     if (docsForm == null)
	     {
	   %>    
	     alert("请添写公文属性");

		  return false;
	   <%
	   }
	   %>
	   return true;
	}
	
	function uploadContent()
	{ 
		<%
			SelectTemplateForm form = (SelectTemplateForm) session.getAttribute("selectTemplate");
			Integer select = form.getSelect();
			String content = form.getContent();
			String contentName = form.getContentName();  
		
		%>
	     var filePath = "<%=content%>";
		 var tempPath = "<%=userPage.getFileTempPath()+"\\\\"%>";
	     <%if (select == 2)
	     {%>
	       filePath = tempPath+filePath.substring(filePath.lastIndexOf("/")+1,filePath.length);
	     <%}%>
		  var httpurl = "<%=param.getHttpupload()%>?destPath=<%=contentName%>";	 
		 return httpUploadFile(httpurl,filePath);
		  
	}
	function httpUploadFile(httpurl,localfile)
	{
		   var szReturn = "";
		   try
		   {
			  szReturn = document.all.IEUploadFile.uploadFile(localfile,httpurl);
		   }
		   catch(e)
		   {
		        alert(e.description);
		   }
			if (szReturn == true)	{
				
				return	"success";
			}
			else
				return "false"
	}
	
	function cancel()
	{
	   top.close();
	}
	</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0"
		topmargin="0">
		<object classid="clsid:50568700-FC76-4069-9F5C-12F63F459A9B"
			id="IEUploadFile"
			codebase="../../bin/httpUploadFile.cab#version=1,0,0,6"
			style="display:none">
		</object>
		<table align="center">
			<tr>
			  <%
			       if (!docOper.equals("view"))
			       {
			    
			    %>  
				<td>
					<input type="button" onclick="javascript:save();" class="button2"
						value="完 成">
                
				</td>
				<%} %>
				<td>
					<input type="button" onclick="javascript:cancel();" class="button2"
						value="关 闭">

				</td>
			</tr>
		</table>
	</body>
</html>
