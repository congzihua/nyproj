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
	       parent.main.document.location.href="submit.jsp?sel=<%=request.getParameter("sel") %>&flowids=<%=request.getParameter("flowids")%>&dmpid="+dmpid;
		}
		function rootclick(src)
		{}
		</script>
	</head>
	<body bgcolor="#ffffff" style="margin:0px;">

		
		<div style="margin-left:5px;margin-top:5px">
			<script language="javascript">
	     var docTypeMenu = null;
	     webFXTreeConfig.rootPath="../../";
		 webFXTreeConfig.defaultAction = "javascript:void(0);"; 
		 webFXTreeConfig.cbRefAttribute	= "identify";
	     tree = new WebFXLoadTree("中国记协", "../../gwlzadmin/GetDepartMentTree.do",'','','../../images/foldericon.png','../../images/foldericon.png');
	     tree.click = "rootclick(this)";
		 document.write(tree);

</script>
		</div>
	</body>
</html>
