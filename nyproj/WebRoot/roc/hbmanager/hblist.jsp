<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.founder.enp.entity.User"%>
<jsp:directive.page import="com.roc.enp.entity.FlightInfo" />
<jsp:directive.page import="java.util.*" />
<jsp:directive.page import="java.text.SimpleDateFormat" />
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
	
	
	int count = request.getAttribute("count")==null||request.getAttribute("count").equals("")?0:(Integer) request.getAttribute("count");
	//页的数量
	int pageCount = request.getAttribute("pageCount")==null?0:(Integer) request.getAttribute("pageCount");
	//当前请求页
	int currentPage = request.getAttribute("currentPage")==null?0:(Integer) request.getAttribute("currentPage");
	//当前list
	List<FlightInfo> list=request.getAttribute("list")==null?new ArrayList<FlightInfo>():(List<FlightInfo>)request.getAttribute("list");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/FlightInfoDWR.js'> </script>
		<script type="text/javascript">
		function switchChange(userid)
		{
		   var order = document.all("orderSelect"+userid).value;
		    var sUrl = "userAction.do?oper=order&userid="+userid+"&order="+order;
		   new net.ContentLoader(sUrl, doFinishOrder); 
		}
		function doFinishOrder()
		{
		    var info = this.getReq().responseText;
		    if (info == 'ordererror')
		      alert("排序失败");
		    else
		      document.location.reload();
		}
		
         function transfer()
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
		       alert('请选择要调动的用户');
		       return false;
		     }
		   if (!confirm("确认调动选择的用户吗?"))
		   {
		        return false;
		   }
		   window.open("transfer.jsp?userid="+idstring,"transfer",'top='+(screen.height/2-200)+',left='+(screen.width/2-200)+',width=400,height=400,scrollbars=no,resizable=yes,center:yes');
         }
		 function getSelectID()
		  {
		    var nodes = document.getElementsByName("check_box");
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
		    id = objs.value;
		  
		    return id;
		  }
		function deleteFlightInfo()
		{
		     var nodes = document.getElementsByName("check_box");
		     var total=0;
		     var ids='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		        	total++;
		           var id = nodes[i].value;
		          ids+=id+";";
		        }
		     }
		     if (total == 0)
		     {
		       alert('请选择要删除的记录');
		       return ;
		     }
		   if (confirm(total+"条信息将被删除，确认删除吗?"))
		   {	
		       FlightInfoDWR.deleteFlightInfo(ids,onHandleM);
  	       }
		}
		function onHandleM(data){
				alert("成功删除"+data+"条！");
		       document.myform.submit();
		}
		
		function addFlightInfo()
		{
			window.location.href ="<%=request.getContextPath()%>/roc/hbmanager/addOper.jsp";
		}
		function editFlightInfo()
		{
			var id=getSelectID();
			if(id==false){
				return;
			}
			var url = "<%=request.getContextPath()%>/roc/hbmanager/editOper.jsp?id="+id;
			window.location.href =url;
	 
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
	     document.myform.currentPage.value=number;
	     document.myform.submit();
	  }
	  function query()
	  {
	     document.myform.currentPage.value="1";
	     document.myform.submit();
	  }
	  
	  function batchAddFlightInfo(){
		  window.location.href = "<%=request.getContextPath()%>/roc/hbmanager/batchAddOper.jsp";
	  }
	
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<form name="myform" action="<%=request.getContextPath()%>/flightInfoAction.do?method=list" method="post">
	   <!--  html:hidden property="selectLogin" name="flightInfoForm"/>
	   <html:hidden property="userid" name="flightInfoForm" value=""/>-->
	    <input type="hidden" name="currentPage" value="1"/>
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath()%>/images/weizhi.jpg">
			<tr>
				<td width="95%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：基础数据管理 → 航班信息管理
				</td>
			</tr>

		</table>
		<table style="font-size:12px;">
			<tr>
				<td>
					<input type="button" class="button2" onclick="javascript:addFlightInfo()"
						value="新 建" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:editFlightInfo()"
						value="修 改" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:deleteFlightInfo()"
						value="删 除" />
				</td>
				<td>
					<input type="button" class="button2" onclick="javascript:batchAddFlightInfo()"
						value="批量新建" />
				</td>
				
				<td>
					<img border="0" src="<%=request.getContextPath()%>/images/decoration.jpg" width="102"
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
							<td background="<%=request.getContextPath()%>/images/bg_board.gif" height=25 width=10%>
								<input onclick="selectAll();" type="checkbox">
								全选
							</td>
							<td width=20% background="<%=request.getContextPath()%>/images/bg_board.gif">
								航程
							</td>
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								起飞日期
							</td>
							<td width=15% background="<%=request.getContextPath()%>/images/bg_board.gif">
								起飞时间
							</td>
						</tr>
						<%
							for(int i=0;i<list.size();i++){
								FlightInfo flightinfo=list.get(i);
								Date FIDate=flightinfo.getFlight_date();
								SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
								String FIDateS=sdf.format(FIDate);
						%>
						
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
						<tr onmouseout="this.bgColor=''"
							onmouseover="this.bgColor='ffcccc'" align="middle"
							style="FONT-SIZE: 14px;color:#000000">
							<td width=10%>
								<input onclick="checkSelected()" type="checkbox" value="<%=flightinfo.getId()%>"
									id="<%=flightinfo.getId()%>" name="check_box" />
                               
							</td>
							
							<td style="cursor:hand" width=20%>
								<%=flightinfo.getFlight_name() %>
							</td>
							
							<td 
								style="cursor:hand" width="15%">
								<%=FIDateS %>
							</td>
							
							<td 
								style="cursor:hand" width="15%">
								<%=flightinfo.getFly_time()%>
							</td>
							
						</tr>
						<%
							}
						%>
						<TR>
							<TD background="<%=request.getContextPath()%>/images/dot_board.gif" colSpan=6 height=1></TD>
						</TR>
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
							face="webdings" size="3" color="red">4</font></span>
				</td>
				<td align="right">
					&nbsp;&nbsp;&nbsp;&nbsp;共有&nbsp;<FONT COLOR="red"><%=count%></FONT>&nbsp;条记录&nbsp;&nbsp;&nbsp;&nbsp;第&nbsp;<font color=red><%=currentPage%></font>&nbsp;页/共&nbsp;<font color=red><%=pageCount%></font>&nbsp;页
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
