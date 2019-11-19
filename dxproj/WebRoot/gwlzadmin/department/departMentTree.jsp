<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<script type="text/javascript" src="../../xtree/xtree.js"></script>
		<script type="text/javascript" src="../../xtree/xloadtree.js"></script>
		<link type="text/css" rel="stylesheet" href="../../xtree/xtree.css" />
		<script type="text/javascript">
		function itemClick(src)
		{  
		}
		function rootclick(src)
		{
		}
		</script>
	</head>
	<body topmargin="0">
	<div style="margin-left:0px;margin-top:5px">
	<script language="javascript">
	     var docTypeMenu = null;
	     webFXTreeConfig.rootPath="../../";
		 webFXTreeConfig.defaultAction = "javascript:void(0);"; 
		 webFXTreeConfig.cbRefAttribute	= "identify";
	     tree = new WebFXLoadTree("鼎新", "../GetDepartMentTree.do",'','','../../images/foldericon.png','../../images/foldericon.png');
	     tree.click = "rootclick(this)";
		 document.write(tree);

</script>
   </div>
	</body>
</html>