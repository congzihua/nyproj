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
		     alert("�ָ�����ʧ��");
		   }
	}
	function del()
	{
	   var flowids = parent.frames[1].getSelectMore();
	   if (flowids == false)
		 return ;
	   if (!confirm("ȷ��ɾ����?"))
	   return ;
	   var sUrl = "../doc/docAction.do?oper=delok&flowids="+flowids;
       new net.ContentLoader(sUrl, doFinishDel); 
	}
	function doFinishDel()
	{
	      var info = this.getReq().responseText;
	      if (info=='delsuccess')
		   {
		     alert("ɾ�����ĳɹ�");
			 parent.frames[1].document.location.href="../docFlowsAction.do?pg=9&currentPage="+parent.frames[2].Number;
		   }
		   else
		   {
		     alert("ɾ������ʧ��");
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
									<font face="Wingdings" size="2">&nbsp; l </font>��ǰλ�ã����Ĺ��� �� ������
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
												<input type="button" value="�� ��" onclick="javascript:restore();" class="buttonimg">
											</td>
											<td>
												&nbsp;
											</td>
											<td>
												<input type="button" value="ɾ ��" onclick="javascipt:del();" class="buttonimg">
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
