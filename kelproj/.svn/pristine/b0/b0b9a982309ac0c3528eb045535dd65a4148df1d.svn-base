<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.Template" />
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
	java.util.List list = (java.util.List) request.getAttribute("list");
	Iterator iter = list.iterator();
	int count = (Integer) request.getAttribute("count");
	//页的数量
	int pageCount = (Integer) request.getAttribute("pageCount");
	//当前请求页
	int currentPage = (Integer) request.getAttribute("currentPage");
	String keyword = (String)request.getAttribute("keyword");
	String templatePath = (String)request.getAttribute("templatePath");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/table.js"></script>
		<script type="text/javascript">

		 function getSelectID()
		  {
		    var nodes = document.getElementsByName(check_name);
		    var n = 0;
		    var objs,id ;
		    for (var i = 0; i < nodes.length; i++)
		    {
		        if (nodes[i].checked)
		        {
		          objs = nodes[i];
		          n++;
		        }
		    }
		    if (n == 0)
		    {
		       alert('请选择要操作的记录');
		       return false;
		    }
		    if (n > 1)
		    {
		       alert('只能选择一项操作记录');
		       return false;
		    }
		    id = objs.id.substring(5, objs.id.length);
		    return id;
		  }
		function add()
		{
		 window.open('add.jsp','新建模板','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
		
	
		}
		function upload()
		{
		    var id = getSelectID();
		    if (id == false)
		    return ;
		  	 window.open('upload.jsp?id='+id,'上传模板','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
	
		}
		function del()
		{
		 var nodes = document.getElementsByName(check_name);
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		           var id = nodes[i].id.substring(5, nodes[i].id.length);
		           idstring += id + ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要删除的记录');
		       return ;
		     }
		   if (!confirm("模板相关信息将被删除，确认删除吗?"))
		   {
		        return ;
		   }
		  window.open('templateAction.do?oper=del&idString='+idstring,'del','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
      }
	  function go()
	  {
	    var pageno = document.all("pageno").value;
	    var pageCount=<%=pageCount%>;
	    if(isNaN(pageno))
	    {
	        alert('非法数字');
	        return;
	    }
	    if(pageno < 1 || pageno > pageCount)
	    {
	        alert('输入的跳转范围无效');
	        document.all("pageno").select();
	        return;
	    }
	    goPage(pageno);
	  }
	  function goPage(number)
	  {
	     document.templateForm.currentPage.value=number;
	     document.templateForm.submit();
	    
	  }
	  function query()
	  {
	     document.templateForm.currentPage.value="1";
	     document.templateForm.submit();
	  }
	
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzadmin/templtes/templateAction.do?oper=list"  method="post">
		 <input type="hidden" name="currentPage" />
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="../../images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：公文管理 → 模板管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:add()"
						value="新建" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:del()"
						value="删除" />
				</td>
	             <td>
					<input type="button" class="button2" onclick="javascript:upload()"
						value="替换模板" />
				</td>
				<td style="color:#568ba4">
					模板名称：
					<html:text styleClass="textbox" property="templetname" value="<%=keyword %>" name="templateForm" />
											
				</td>
				<td>
					<input type="button" onclick="javascript:query()" class="button2" value="查询" />
				</td>
				<td>
					<img border="0" src="../../images/decoration.jpg" width="102"
						height="24">
				</td>
			</tr>

		</table>


		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr align="middle">
				<td valign="top" align="center">

					<table id="listtable" cellspacing="2" cellpadding="1"
						style="FONT-SIZE: 12px;color:#ffffff" align="center" border="0"
						width="100%">
						<tr align="middle">
							<td background="../../images/bg_board.gif" height=25 width=10%>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=40% background="../../images/bg_board.gif">
								模板名称
							</td>
							<td width="40%" background="../../images/bg_board.gif">
								模板文件名
							</td>
						</tr>
						<%
								while (iter.hasNext()) {
								Template template = (Template) iter.next();
						%>
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox"
									id="check<%=template.getTempletid()%>" name="check_box" />

							</td>
							<td onclick="selected(<%=template.getTempletid()%>)"
								style="cursor:hand" width=40%>
								<%=template.getTempletname()%>
							</td>
							<td onclick="selected(<%=template.getTempletid()%>)"
								style="cursor:hand" width="40%">
								<%=templatePath+template.getFilename()%>
							</td>
						</tr>
						<TR>
							<TD background="../../images/dot_board.gif" colSpan=5 height=1></TD>
						</TR>
						<%
						}
						%>
					</table>

				</td>
			</tr>
		</table>
		<table style="margin-top:10px;font-size:12px" border="0"
			bgColor="#FFFFFF" cellPadding="0" align="right" cellSpacing="1">
			<tr>

				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
					<%
					if (currentPage > 1) {
					%>
					<span onclick="javascript:goPage(1)" style="cursor:hand"
						title="第一页"> <font face="webdings" size="2" color="red">9</font>
					</span>&nbsp;
					<%
						}
						if (currentPage <= 1) {
					%>
					<span style="cursor:hand" title="第一页"> <font face="webdings"
						size="2" color="red">9</font> </span>&nbsp;
					<%
					}
					%>
					<%
					if (currentPage > 1) {
					%>
					<span onclick="javascript:goPage(<%=currentPage - 1%>)"
						style="cursor:hand" title="前一页"> <font face="webdings"
						size="2" color="red">7</font> </span>&nbsp;
					<%
						}
						if (currentPage <= 1) {
					%>
					<span style="cursor:hand" title="前一页"> <font face="webdings"
						size="2" color="red">7</font> </span>&nbsp;
					<%
					}
					%>

					<%
					if (currentPage < pageCount) {
					%>
					<span onclick="javascript:goPage(<%=currentPage + 1%>)"
						style="cursor:hand" title="下一页"> <font face="webdings"
						size="2" color="red">8</font> </span>&nbsp;
					<%
						}
						if (currentPage >= pageCount) {
					%>
					<span style="cursor:hand" title="下一页"> <font face="webdings"
						size="2" color="red">8</font> </span>&nbsp;
					<%
					}
					%>
					<%
					if (currentPage < pageCount) {
					%>
					<span onclick="javascript:goPage(<%=pageCount%>)"
						style="cursor:hand" title="最后一页"> <font face="webdings"
						size="2" color="red">:</font> </span>&nbsp;
					<%
						}
						if (currentPage >= pageCount) {
					%>
					<span style="cursor:hand" title="最后一页"> <font
						face="webdings" size="2" color="red">:</font> </span>&nbsp;
					<%
					}
					%>
				</td>
				<td align="center">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<INPUT type="text" value=<%=currentPage%> name="pageNo" size="2">
					&nbsp;
					<a href="javascript:go();"> <span title="跳转"> <font
							face="webdings" size="3" color="red">4</font>
					</span>
				</td>
				<td align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;共有&nbsp;
					<FONT COLOR="red"><%=count%>
					</FONT>&nbsp;条记录&nbsp;&nbsp;&nbsp;&nbsp;第&nbsp;
					<font color=red><%=currentPage%>
					</font>&nbsp;页/共&nbsp;
					<font color=red><%=pageCount%>
					</font>&nbsp;页
				</td>
			</tr>
		</table>
		</html:form>
	</body>
</html>
