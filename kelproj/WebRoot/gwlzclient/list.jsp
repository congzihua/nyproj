<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.ViewBean" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.founder.enp.entity.DocFlowsKeyWord"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:include flush="true" page="../jsp-header.jsp"></jsp:include>
<%
	List list = (List) session.getAttribute("list");
	Iterator iter = list.iterator();
	Integer count = (Integer) session.getAttribute("count");
	Integer currentPage = (Integer) session.getAttribute("currentPage");
	Integer pageCount = (Integer) session.getAttribute("pageCount");
	String pg = (String) session.getAttribute("pg");
%>
<html>
	<head>
		<script type="text/javascript" src="../js/table.js"></script>
		<link rel="stylesheet" href="../css/admin.css">
		<link rel="stylesheet" type="text/css" media="all"
			href="../js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		<script type="text/javascript" src="../js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="../js/calendar/src/calendar.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="../js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="../js/calendar/src/calendar-setup.js"></script>
		<script type="text/javascript">
		var DocID = 0;
		
		function checkSelected(v)
		{
		    var trstyle = GetRow( window.event.srcElement );
		    if (! trstyle )
		        return false;
		    if (trstyle.style.backgroundColor.toLowerCase() == "#ffcccc")
		    {
		        trstyle.style.backgroundColor = "";
		        DocID = 0;
		    }
		    else
		    {
		        trstyle.style.backgroundColor = "#FFCCCC";
		        DocID = v;
		        showText(v)
		    }
		}
		
		function selected(id)
		{
		    var checkid = "check" + id;
		    var checkobj = document.all(checkid);
		    if (checkobj.checked)
		    {
		        checkobj.checked = false;
		        DocID = 0;
		    }
		    else
		    {
		        checkobj.checked = true;
		        DocID = checkobj.value;
		    }
		    var trstyle = GetRow( window.event.srcElement );
		    if (! trstyle )
		        return false;
		    if (trstyle.style.backgroundColor.toLowerCase() == "#ffcccc")
		        trstyle.style.backgroundColor = "";
		    else
		        trstyle.style.backgroundColor = "#FFCCCC";
		}
		function selectedOne(flowid)
		{
		    all_obj = document.all(check_name);
		    if(all_obj != null)
		    {
		       len = all_obj.length;
		       var j = 0;
		       for (i = 0; i < len; i++)
		       {
		          all_obj[i].checked = false;
		          listtable.rows.item(j+1).style.backgroundColor = "";
		          j+=2
		        }
		      }
		      selected(flowid);
		      var checkid = "check" + flowid;
		      var checkobj = document.all(checkid);
		      showText(checkobj.value);
		      
		}
		function showText(docid)
		{
		    var ReNumber = parent.frames[3].frames[1].ReNumber;
		    switch(ReNumber)
		    {
		      case 0:
		      parent.frames[3].frames[0].location.href="docparam.jsp?docid="+docid;
		      break;
		      case 1:
		      parent.frames[3].frames[0].location.href="attache.jsp?docid="+docid;
		      break;
		      case 2:
		       parent.frames[3].frames[0].location.href="docflows.jsp?docid="+docid;
		      break;
		     
		    }
		}
		function getSelectMore()
		{
		    var nodes = document.getElementsByName(check_name);
		     var idstring='';
		     for (var i = 0; i < nodes.length; i++)
		     {
		        if (nodes[i].checked)
		        {
		          var id =  nodes[i].id.substring(5, nodes[i].id.length);
		           idstring += id + ";";
		        }
		     }
		     if (idstring == '')
		     {
		       alert('请选择要操作的记录');
		       return false;
		     }
		     return idstring;
		}
		function getSelectOne()
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
		    id = objs.value;
		    return id;
		} 
		function viewDoc(docid)
		{
		        var width=screen.width;
			    var height=screen.height;
				var xPosition=0;
				var yPosition=0;
				if ((parseInt(navigator.appVersion) >= 4 ))
				{
					xposition = (screen.width - width) / 2;
					yposition = (screen.height - height) / 2;
				}
				var theWindowProperty="toolbar=0,"
				+ "width=" + (width-10) + ","
				+ "height=" + (height-56) + ","
			        + "resizable=1,"
			        + "scrollbars=1,"
				+ "screenx=" + xposition + "," //for Netscape
				+ "screeny=" + yposition + "," //for Netscape
				+ "left=" + xposition + "," //IE
				+ "top=" + yposition; //IE
				
				window.open("doc/getDocAction.do?oper=view&docid="+docid,"查看公文",theWindowProperty);

		}
		function display_search()
		{
		    var targetText = document.getElementById("searchTD");
		    var targetTable = document.getElementById("search");
		    if ("object" == typeof(targetText))
		    {
		       if (targetTable.style.display!='block')
		       {
		          targetTable.style.display='block';
		          targetText.innerText='隐藏检索';
		          
		       }
		       else
		       {
		         targetTable.style.display='none';
		         targetText.innerText='显示检索';
		       }
		    }
		}
		function check()
		{
		   var startDate = document.all("createTimeF").value;
		   var endDate = document.all("createTimeL").value;
		    if (startDate != "")
		    {
		       if (endDate == "")
		       {
		          alert("结束日期不能为空");
		          return ;
		       }
		    }
		    if (endDate != "")
		    {
		       if (startDate == "")
		       {
		          alert("起始日期不能为空");
		          return ;
		       }
		    }
		    goPage(1);
		}
		</script>
	</head>
	<LINK href="../css/Styles.css" type=text/css rel=stylesheet>
	<body oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0"
		topmargin="0">
	<html:form action="/gwlzclient/docFlowsAction.do"  method="post">
	<input type="hidden" name="pg" value="<%=pg%>">
	<input type="hidden" name="currentPage">
			<%
			if (pg.equals("8") || pg.equals("10")) {
			DocFlowsKeyWord keyword = (DocFlowsKeyWord)session.getAttribute("keyword"); 
			%>
			<table>
				<tr>
					<td id="searchTD" style="cursor:pointer;color:red"
						onclick="javascript:display_search()">
						显示检索
					</td>
			<td>
			<table id="search" style="display:none">
				<tr>
					<td>
						&nbsp;
					</td>
					<td style="color:#568ba4">
						标题：
						<input type="text" size="30" class="textbox" value="<%=keyword.getTitle()==null?"": keyword.getTitle()%>" id="name"
							name="name" />
					</td>
					<td>
						&nbsp;
					</td>
					<td style="color:#568ba4">
						起草日期：
						<input type="textbox" class="textbox" size="15" name="createTimeF"
							value="<%=keyword.getStartDate()==null?"": keyword.getStartDate()%>" readonly></input>
						<span style="cursor: hand"><img
								src="../images/caldendar.gif" id="caldendar1" /> </span>

					</td>
					<td>
						&nbsp;至&nbsp;
						<input class="textbox" type="textbox" size="15" name="createTimeL"
							value="<%=keyword.getEndDate()==null?"": keyword.getEndDate()%>" readonly></input>
						<span style="cursor: hand"><img
								src="../images/caldendar.gif" id="caldendar2" /> </span>

					</td>
					<td>
						<input type="button" value="查 询" onclick="check();" class="button2">
					</td>
					<td>
						&nbsp;
					</td>

					<td>
						&nbsp;
					</td>
				</tr>
				
			</table>
			</td>
			</tr>
			</table>
			<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "createTimeF",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
   Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "createTimeL",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  
  //-->
</SCRIPT>
			<%
			}
			%>
			<table  cellspacing="0" cellpadding="0" width="100%"
				border="0">
				<tr>
					<td valign="top" width="100%" align="center">
						<div align="center">

							<table cellspacing="0" cellpadding="0" width="100%" border="0">
								<tr align="middle">
									<td width="100%" rowspan="34" valign="top" align="center">

										<table id="listtable" cellspacing="2" cellpadding="1"
											style="FONT-SIZE: 14px;color:#ffffff" align="center"
											border="0" width="100%">
											<tr align="middle">
												<td background="../images/bg_board.gif" height=25 width="50">
													<!--  <input onclick="selectAll();" type="checkbox">
													全选-->
												</td>
												<td background="../images/bg_board.gif" width="20">
												</td>
												<td background="../images/bg_board.gif" width="20">
												</td>
												<td background="../images/bg_board.gif" width="50%">
													发文标题
												</td>

												<td background="../images/bg_board.gif" width="10%">
													起草日期
												</td>

												<td background="../images/bg_board.gif" width="12%">
													文种
												</td>

												<td background="../images/bg_board.gif" width="8%">
													紧急程度
												</td>
<%if (pg.equals("8") )
{%>
												<td background="../images/bg_board.gif" width="10%">
													归档日期
												</td>
												<%}else
												{ %>
												<td background="../images/bg_board.gif" width="10%">
													状态
												</td>
												<%} %>

												<td background="../images/bg_board.gif" width="10%">
													处理人
												</td>


											</tr>
											<%
													while (iter.hasNext()) {

													ViewBean bean = (ViewBean) iter.next();
													if (bean.getFlag() == null)
													break;
													String title = bean.getTitle();
											%>
											<tr ondblclick="javascript:viewDoc(<%=bean.getDocid()%>);"
												onmouseout="this.bgColor=''"
												onmouseover="this.bgColor='ffcccc'" align="left"
												style="FONT-SIZE: 14px;color:#000000">
												<td width="50" align="center">
													<input type="checkbox"
														onclick="checkSelected(<%=bean.getDocid()%>)"
														id="check<%=bean.getFlowid()%>"
														value="<%=bean.getDocid()%>" name="check_box" />

												</td>
												<td width="20" align="center">

													<img
														<%if (bean.getFlag() != 0 && bean.getFlag() != 2 && bean.getFlag() != 5 ){ %>
														height=16 width=14 src="../images/File_State_Audit.gif"
														alt="已处理" <%}else{ %> height=16 width=16
														src="../images/File_State_Comm.gif" alt="未处理" <%} %>>

												</td>
												<td width="20" align="center">
													<%
													if (bean.getUrgency().equals("")) {
													%>
													<%
													} else {
													%>
													<img height=16 width=16 src="../images/File_State_Urge.gif"
														alt="<%=bean.getUrgency()%>">
													<%
													}
													%>
												</td>
												<td style="cursor:hand" title="<%=bean.getTitle()%>"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="50%">
													<%
													if (title.length() > 35) {
													%>
													<%=title.substring(0, 35) + "．．．"%>
													<%
													} else {
													%>
													<%=title%>
													<%
													}
													%>
												</td>

												<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="10%">
													<%=bean.getCreatetime()%>
												</td>
												<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="12%">
													<%=bean.getTypename()%>
												</td>


												<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="8%">
													<%=bean.getUrgency()%>
												</td>

<%if (pg.equals("8") )
{%>
												
													<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="10%">
													<%=bean.getCreatetime()%>
										
												</td>
												<%}else
												{ %>
												<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="10%">
													<%=bean.getStatus()%>
												</td>
												<%} %>

												



												<td style="cursor:hand"
													onclick="selectedOne(<%=bean.getFlowid()%>)" width="10%">
													<%=bean.getOperationtor()%>
												</td>
											</tr>
											<TR>
												<TD background="../images/dot_board.gif" colSpan=23 height=1></TD>
											</TR>
											<%
											}
											%>
										</table>

									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
	</html:form>
		<script>
		startLoad();
		function startLoad()
		{
			if (parent.frames[2].document.readyState != "complete")
	        {
	           window.setTimeout('startLoad()',1);
	        }
	        else
	        {
	           parent.frames[2].Init(<%=currentPage%>,<%=pageCount%>,<%=count%>);
	        }
        }
	    function goPage(number)
	    {
	      document.all("currentPage").value = number;
	      document.docNumOperForm.submit();
	    }
		</script>
	</body>

</html>
