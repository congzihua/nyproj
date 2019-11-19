
<%@page import="com.roc.enp.entity.BlacklistUser"%>
<%@ page language="java" pageEncoding="UTF-8"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>值机时间管理</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin.css">
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/table.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath() %>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		
		<script type="text/javascript"
			src="<%=request.getContextPath() %>/js/jquery/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		
          
	</script>
	</head>

	<body style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		
		<table style="margin:0px;font-size:12px" border="0" width="800"
			height="25" cellspacing="0" cellpadding="0"
			background="<%=request.getContextPath() %>/images/weizhi.jpg">
			<tr>
				<td width="50%" height="25">
					<font face="Wingdings" size="2">&nbsp;l </font>当前位置：值机时间管理
				</td>
			</tr>

		</table>
		<form id="fm" action="<%=request.getContextPath()%>/blacklistUserAction.do" method="post">
		<input type="hidden" name="method" value="addInfo">
		<table height="100%" cellspacing="0" cellpadding="0" width="50%"
				border="0">
				<tr>
					<td valign="top" width="50%" >
						
							<table style="font-size:14px;color:#568ba4" border="0"
								width="100%">
								
								<tr>
								
									<td align="center">
										开始时间:
										<select name="st" id="st">
											<%
											com.roc.enp.entity.Dutytime dt = (com.roc.enp.entity.Dutytime)request.getAttribute("dutyTime");
											int id = dt.getId();
											int st = 0,et = 24;
											if (dt != null) {
												st = dt.getSt();et = dt.getEt();
											}
											for(int i = 0;i < 24;i++) { 
												
											%>
											 <%if(i == st) { %>
												<option value="<%=i%>" selected="selected"><%=i%>时</option>
											<%}else{ %>
												<option value="<%=i%>"><%=i%>时</option>
											<%}} %>
										</select>
									</td>
									<td align="center">
										结束时间：
										<select name="et" id="et">
											<%for(int i = 0;i < 25;i++) { %>
												 <%if(i == et) { %>
												<option value="<%=i%>" selected="selected"><%=i%>时</option>
											<%}else{ %>
												<option value="<%=i%>"><%=i%>时</option>
												
											<%}} %>
										</select>
									</td>
									<td align="center">
									<input type="button" class="button2" onclick="javascript:update();" value="保存" />
									</td>
								</tr>
								
								
							</table>
					</td>
				</tr>
			</table>
			</form>
	</body>
	<script type="text/javascript">
	function update()
	  {
		var st = $("#st").val();
		var et = $("#et").val();
	   var url = "<%=request.getContextPath()%>/dutyTimeAction.do?method=update&id=<%=id%>&st="+st+"&et="+et;
	   $.ajax({
	        url:url,
	        type:"post",
	        success:function(data){
	        	if(data == 1){
	        		alert("修改成功！");
	        	}
	        }
	    });
	  }
	</script>
</html>




