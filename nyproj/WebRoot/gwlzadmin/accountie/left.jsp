<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<script type="text/javascript" src="../../xtree/xtree.js"></script>
		<script type="text/javascript" src="../../xtree/xloadtree.js"></script>
		<link type="text/css" rel="stylesheet" href="../../xtree/xtree.css" />
			<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript">
		function itemClick(src)
		{  
	
	       var userid =  src.getAttribute("userid");
	       parent.main.location.href="mainfrm.jsp?userid="+userid;
		}
		function rootclick(src)
		{}
		</script>
	</head>
	<body  style="margin:0px;">

		<table cellpadding=0 cellspacing=0  background="../../images/weizhi.jpg" width=100%>
			<tr>
				<td>
					<font
						style=" FONT: 12px;
		    color:black;
		    height:25;
		    padding:3px;">&nbsp;
						<font face="Wingdings" size="2">l </font>用户列表</font>
				</td>
			</tr>
		</table>
		<div style="margin-left:5px;margin-top:5px">
			<script language="javascript">
		     var docTypeMenu = null;
		     webFXTreeConfig.rootPath="../../";
			 webFXTreeConfig.defaultAction = "javascript:void(0);"; 
			 webFXTreeConfig.cbRefAttribute	= "identify";
		     tree = new WebFXLoadTree("用户列表", "../GetUserInfoTree.do",'','','../../xtree/images/openfoldericon.png','../../xtree/images/openfoldericon.png');
		     tree.click = "rootclick(this)";
			 document.write(tree);

           </script>
		</div>
	</body>
</html>
