<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<script type="text/javascript" src="../../xtree/xtree.js"></script>
		<script type="text/javascript" src="../../xtree/xloadtree.js"></script>
		<link type="text/css" rel="stylesheet" href="../../xtree/xtree.css" />
		<script type="text/javascript">
		function itemClick(src)
		{  
	
	       var dmpid =  src.getAttribute("dmId");
	       
	       parent.main.location.href="userAction.do?oper=list&dmpid="+dmpid;
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
						<font face="Wingdings" size="2">l </font>部门列表</font>
				</td>
			</tr>
		</table>
		<div style="margin-left:5px;margin-top:5px">
			<script language="javascript">
	     var docTypeMenu = null;
	     webFXTreeConfig.rootPath="../../";
		 webFXTreeConfig.defaultAction = "javascript:void(0);"; 
		 webFXTreeConfig.cbRefAttribute	= "identify";
	     tree = new WebFXLoadTree("马兰", "../GetDepartMentTree.do",'','','../../images/foldericon.png','../../images/foldericon.png');
	     tree.click = "rootclick(this)";
		 document.write(tree);

</script>
		</div>
	</body>
</html>
