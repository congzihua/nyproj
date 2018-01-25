<%@ page language="java" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
	function add()
	{
	   var parentid ; 
	   if (iframe.tree.getSelected() == null || iframe.tree.getSelected().getAttribute("dmId") == undefined) 
	   {
	      parentid = 0;
	   }
	   else
	   {
	      parentid = iframe.tree.getSelected().getAttribute("dmId");
	   }
	 window.open('add.jsp?id='+parentid,'新建部门','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');

	}
	function edit()
	{
	   if (iframe.tree.getSelected() == null || iframe.tree.getSelected().getAttribute("dmId") == undefined) 
	   {
	      alert("请选择要修改的部门");
	      return ;
	   }
	   var id = iframe.tree.getSelected().getAttribute("dmId");
	   window.open('departMentsAction.do?id='+id+'&oper=query','修改部门','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
	   
	}
	function del()
	{
	   
	   if (iframe.tree.getSelected() == null || iframe.tree.getSelected().getAttribute("dmId") == undefined) 
	   {
	      alert("请选择要删除的部门");
	      return ;
	   } 
	   if (!confirm("与部门相关信息将被删除，确认删除吗?"))
	   {
		   return ;
	   }
	   var id = iframe.tree.getSelected().getAttribute("dmId"); 
	   window.open('departMentsAction.do?oper=del&id='+id,'del','top='+(screen.height/2-60)+',left='+(screen.width/2-200)+',width=400,height=120,scrollbars=no,resizable=yes,center:yes');
  
	}
	
	</script>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}">
		<form action="">
		<table  style="margin:0px;font-size:12px" border="0" width="800" height="25" cellspacing="0"
							cellpadding="0" background="../../images/weizhi.jpg">
							<tr>
								<td width="95%" height="25">
									<font face="Wingdings" size="2">&nbsp;l </font>当前位置：用户管理 → 部门管理
								</td>
							</tr>
							
						</table>
			<table>
				<tr>
					<td>
						<input type="button" class="button2" onclick="javascript:add()"
							value="新 建" />
					</td>
					<td>
						<input type="button" class="button2" onclick="javascript:edit()"
							value="修 改" />
					</td>
					<td>
						<input type="button" class="button2" onclick="javascript:del()"
							value="删 除" />
					</td>
					<td>
						<img border="0" src="../../images/decoration.jpg" width="102"
							height="24">
					</td>
				</tr>

			</table>
			<table>
				<tr>
					<td>
						<iframe id=iframe name="iframe" frameborder=1 scrolling=yes
							src="departMentTree.jsp" style='height:500px;width:300px'></iframe>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
