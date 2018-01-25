<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.forms.SelectTemplateForm" />
<jsp:directive.page import="com.founder.enp.entity.UserPage"/>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.forms.DocsForm" />
<jsp:directive.page import="com.founder.enp.service.DocService"/>
<jsp:directive.page import="com.founder.enp.entity.Flows"/>
<%
	SelectTemplateForm form = (SelectTemplateForm) session.getAttribute("selectTemplate");
	Integer select = form.getSelect();
	String content = form.getContent();
	String f = request.getParameter("f");
	Authorization authorization = (Authorization) session.getAttribute("authorization");
	String docOper = session.getAttribute("docOper") == null ? "": (String) session.getAttribute("docOper");
	UserPage userPage = (UserPage)session.getAttribute("userPage"); 
	DocsForm frm = null;
	if (session.getAttribute("docsForm") == null) {
		frm = new DocsForm();
	} else {
		frm = (DocsForm) session.getAttribute("docsForm");
	} 
	DocService docService = new DocService();
	String docFinisher = "";
	if (docOper.equals("view")  || docOper.equals("finish"))
	{
	     docFinisher = docService.getFinisher(frm.getDocid());
	}
    if (docOper.equals("view")  || docOper.equals("finish") || docOper.equals("modify"))
	{
	     Flows flows  = new Flows();
	     flows.setDocid(frm.getDocid());
	   
	     flows.setProcessorid(authorization.getLeaderid());
	     docService.setReadFlag(flows);
	}
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'content.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript">
		 var filePath = "";
		function Init()
		{
		   filePath = "<%=content%>";
		   var tempPath = "<%=userPage.getFileTempPath()+"\\\\"%>";
		  <%
		  if (select == 2 && f == null )
		  {%>
		     var fso = new ActiveXObject("Scripting.FileSystemObject");
		     if (!fso.FolderExists(tempPath))
		     {
		        fso.CreateFolder(tempPath);
		     }
		     tempPath=tempPath+filePath.substring(filePath.lastIndexOf("/")+1,filePath.length);
		     try
		     {

		        if (IEWord.DownloadFile(filePath,tempPath) == 'RemoteFile Error')
		        {
		           alert("下载文件出错");
		           return ;
		        }
		        filePath = tempPath;
		     }
		     catch(e)
		     {
		        alert(e.description);
		        return ;
		     }
		  <%}
		  if (select == 2 && f != null )
		  {%>
		    
		    filePath = tempPath+filePath.substring(filePath.lastIndexOf("/")+1,filePath.length);
		      
		  <%}%>
		    IEWord.open(filePath);
		    IEWord.caption="编辑正文"
		    <%
		    if (docOper.equals("view") || docOper.equals("finish"))
		    {%>
		       IEWord.SetFieldValue("docNumber","<%=frm.getDocnum()==null?"":frm.getDocnum()%>","");
		       IEWord.SetFieldValue("docAuditor","<%=docFinisher==null?"":docFinisher%>","");
		       IEWord.ProtectDoc(1,1,"pwd");
		       IEWord.caption="查看正文"
		    <%}%>
		    IEWord.SetCurrUserName("<%=authorization.getName()%>");
		     <%
		    if (docOper.equals("modify"))
		    {%>
		       
		       IEWord.SetTrackRevisions(1);
		    <%}%>
		    
	
		}
		function unload()
		{
		   <%
		    if (!docOper.equals("view") && !docOper.equals("finish"))
		    {%>
		   try
		   {
			   if (IEWord.IsDirty)
			   {
			       if (confirm("文档已经被修改，是否保存?"))
			       {
			          IEWord.Save();    
			       }
			   }
		   }
		   catch(e)
		   {
		   }
		   <%}%>
		IEWord.Close();
		}
		</script>

	</head>

	<body onunload="javascript:unload();" onload="javascript:Init();"
		topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

		<table width="100%" height="100%" cellspacing="0" cellpadding="0"
			border="0">
			<tr>
				<td valign="top" colspan="2">
					<object classid="clsid:00460182-9E5E-11d5-B7C8-B8269041DD57"
						id="IEWord" codebase="../../bin/IEWord.cab#version=2,3,0,0" width="100%" height="100%">
						<param name="BorderStyle" value="1">
						<param name="TitlebarColor" value="#9dc2db">
						<param name="TitlebarTextColor" value="#ffffff">
						<param name="Menubar" value="1">
					</object>
				</td>
			</tr>
		</table>
	</body>
</html>
