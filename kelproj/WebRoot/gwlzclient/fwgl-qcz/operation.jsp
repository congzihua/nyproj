<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Authorization"/>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>
<%
   Authorization authorization = (Authorization)session.getAttribute("authorization");
 %>
<%

 %>
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<LINK href="../../css/Styles.css" type=text/css rel=stylesheet>
		
	    <script type="text/javascript" src="../../js/common.js"></script>
		<script type="text/javascript">
		var flowidstr="";
		var varDocid=0;
		function modify()
		{
		   var docid = parent.frames[1].getSelectOne();
		   
		   if (docid == false)
		   return;
		   var flowids = parent.frames[1].getSelectMore();
		   varDocid = docid
		   var sUrl = "../doc/docAction.do?oper=checkModify&docid="+docid+"&flowid="+flowids;
		   new net.ContentLoader(sUrl, doFinishCheckModify); 
		}
		
		function doFinishCheckModify()
		{
		     var info = this.getReq().responseText;  
		     if (info == 'modifyOk')
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
				
				window.open("../doc/getDocAction.do?oper=modify&docid="+varDocid,"修改公文",theWindowProperty);

		     }
		     else if (info == 'modifyReject')
		     {
		        alert("您已提交,不能进行修改");
		     }
		     else
		     {
		        alert('此公文正被修改');
		     }
		}
		function add()
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
			  window.open("addfrm.jsp","打开",theWindowProperty); 
		}
		function del()
		{
		    var flowids = parent.frames[1].getSelectMore();
		    if (flowids == false)
		    return ;
		    if (confirm("确认删除公文吗?"))
		    {
			    var sUrl = "../doc/docAction.do?oper=del&flowids="+flowids;
		        new net.ContentLoader(sUrl, doFinish); 
	        }
		}
		function refreshPre()
		{
		   	 parent.frames[1].document.location.href="../gwlzclient/docFlowsAction.do?pg=0&currentPage="+parent.frames[2].Number;
		
		}
		function refresh()
		{
		   	 parent.frames[1].document.location.href="../docFlowsAction.do?pg=0&currentPage="+parent.frames[2].Number;
		
		}
		function doFinish()
		{
		   var info = this.getReq().responseText;
		   if (info=='delsuccess')
		   {
			 alert("公文已经移到垃圾箱,如完全删除请到垃圾箱进行");
			 refresh();
		   }
		   else if (info == 'nodel')
		   {
		     alert("有些公文已经提交,不能删除");
		   }
		   else
		   { 
		      alert("删除公文失败");
		   }
		   
		}
		function ViewProcess()
		{
		   var docid = parent.frames[1].getSelectOne();
		   if (docid == false)
		   return;
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
			var newwin=window.open("../ViewProcess.jsp?docid="+docid,"查看处理单",theWindowProperty);
		}
		function submitDoc()
		{
		    
		    var flowids = parent.frames[1].getSelectMore();
		    if (flowids == false)
		    return ;
		    flowidstr = flowids;
		    var sUrl = "../submit/submitAction.do?oper=check&flowids="+flowids;
		    new net.ContentLoader(sUrl, doFinishCheckSubmit); 
			
		}
		function doFinishCheckSubmit()
		{
		   
		   var info = this.getReq().responseText;
		   if (info=='nosubmit')
		   {
			 alert("不能重复提交已提交的公文");
		   }
		   else
		   {
		      window.open("../submit/submitmain.jsp?sel=single&flowids="+flowidstr,"提交",'top='+(screen.height/2-200)+',left='+(screen.width/2-400)+',width=800,height=400,scrollbars=no,resizable=yes,center:yes'); 
		   }
		   
		   
		}
		
		function withDraw()
		{
		     var flowids = parent.frames[1].getSelectMore();
		    if (flowids == false)
		    return ;
		    flowidstr = flowids;
		    var sUrl = "../withDrawAction.do?flowids="+flowids;
		    new net.ContentLoader(sUrl, doFinishCheckWithDraw); 
			
		}
		function doFinishCheckWithDraw()
		{
		   var info = this.getReq().responseText;
		   if (info=='nowithDraw')
		   {
			 alert("不能撤回已提交的公文");
		   }
		   else if (info=='yeswithDraw')
		   {
			 alert("撤回公文成功");
			 refresh();
		   }
		   else if (info=='nowithDraw')
		   {
			 alert("撤回公文失败");
		   }
		   else if (info = 'nowithDrawSelf')
		   {
		    alert("此公文还没有提交,不能撤回");
		   }
		   
		   
		}
		function getTask()
		{
		     window.open("../../gettask.jsp?account=lygjyl","提交",'top='+(screen.height/2-100)+',left='+(screen.width/2-200)+',width=400,height=200,scrollbars=no,resizable=yes,center:yes'); 
		
		}
		</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}" leftmargin="0"
		topmargin="0">
		<form action="">

			<table width="100%">
				<tr>
					<td>
						<table border="0" width="800px" height="25" cellspacing="0"
							cellpadding="0" background="../../images/weizhi.jpg">
							<tr>
								<td width="95%" height="25">
									<font face="Wingdings" size="2">&nbsp; l </font>当前位置：公文管理 → 起草中
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table align="left" border="0" cellPadding="0" cellSpacing="0"
							height="22">
							<tr>
								<td>
									<table align="left" border="0" cellPadding="0" cellSpacing="0"
										height="22">
										<tr>
										<td>
												<input type="button" value="查看处理单" onclick="javascript:ViewProcess();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<%
											   if (authorization.getPowers().contains("0;"))
											   {
											 %>
											<td>  
												<input type="button" onclick="add()" value="新 建" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<%} %>
											<td>
												<input type="button" value="删 除" onclick="javascript:del();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" value="提 交" onclick="javascript:submitDoc();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" value="撤 回" onclick="javascript:withDraw();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" value="修 改" onclick="javascript:modify();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<!-- <td>
												<input type="button" value="提取待办任务" onclick="javascript:getTask();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td> -->
											<td>
												<img border="0" src="../../images/decoration.jpg"
													width="102" height="24">
											</td>
										</tr>

									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
	</body>

</html>
