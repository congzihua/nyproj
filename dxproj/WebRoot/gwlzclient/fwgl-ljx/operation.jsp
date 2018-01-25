<%@ page language="java" pageEncoding="GBK"%>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>

<html>
	<head>
	<LINK href="../../css/Styles.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="../../js/common.js"></script>
	<script type="text/javascript">
	function restore()
	{
	  var flowids = parent.frames[1].getSelectMore();
	  if (flowids == false)
		 return ;
	  var sUrl = "../doc/docAction.do?oper=restore&flowids="+flowids;
      new net.ContentLoader(sUrl, doFinish); 
	}
	function doFinish()
	{
		   var info = this.getReq().responseText;
		   if (info=='restoresuccess')
		   {
			 parent.frames[1].document.location.href="../docFlowsAction.do?pg=9&currentPage="+parent.frames[2].Number;
		   }
		   else
		   {
		     alert("恢复公文失败");
		   }
	}
	function del()
	{
	   var flowids = parent.frames[1].getSelectMore();
	   if (flowids == false)
		 return ;
	   if (!confirm("确认删除吗?"))
	   return ;
	   var sUrl = "../doc/docAction.do?oper=delok&flowids="+flowids;
       new net.ContentLoader(sUrl, doFinishDel); 
	}
	function doFinishDel()
	{
	      var info = this.getReq().responseText;
	      if (info=='delsuccess')
		   {
		     alert("删除公文成功");
			 parent.frames[1].document.location.href="../docFlowsAction.do?pg=9&currentPage="+parent.frames[2].Number;
		   }
		   else
		   {
		     alert("删除公文失败");
		   }
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
									<font face="Wingdings" size="2">&nbsp; l </font>当前位置：公文管理 → 垃圾箱
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
												<input type="button" value="恢 复" onclick="javascript:restore();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" value="删 除" onclick="javascipt:del();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
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
