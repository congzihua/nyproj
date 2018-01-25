<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:include flush="true" page="../../jsp-header.jsp"></jsp:include>

<html>
	<head>
		<LINK href="../../css/Styles.css" type=text/css rel=stylesheet>
	
		<script type="text/javascript">
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
									<font face="Wingdings" size="2">&nbsp; l </font>当前位置：公文管理 →
									我的文档
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
												<input type="button" value="查看处理单"
													onclick="javascript:ViewProcess();" class="buttonimg">
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

