<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'navigator.jsp' starting page</title>
		<LINK href="../css/tab1.css" type=text/css rel=stylesheet>
		<script type="text/javascript">
		var ReNumber = 0;
		function Tcase(v)
		{
		   var a = document.getElementsByTagName("li");
		   for (var i = 0; i < a.length;i++)
		   {
		      if (a[i].id == "current")
		         a[i].id = "current"+i;
		   }
		   document.all("current"+v).id="current";
		   ReNumber = v;
		   var docid = parent.parent.frames[1].DocID;
		   if (docid == 0)
		   return ;
		   switch(v)
		   { 
		     case 0:
		      parent.frames["showtext"].location.href="docparam.jsp?docid="+docid;
		      break;
		      case 1:
		      parent.frames["showtext"].location.href="attache.jsp?docid="+docid;
		      break;
		      case 2:
		       parent.frames["showtext"].location.href="docflows.jsp?docid="+docid;
		      break;
		   }
		}
		function Init()
		{
			  document.all("current0").id="current";
		}
		</script>
	</head>
	<body onload="javascript:Init()">
		<div id="tabsB">
			<ul>
				<li id="current0">
					<a href="#" onclick="Tcase(0)"><span >公文属性</span>
					</a>
				</li>
				<li id="current1">
					<a href="#" onclick="Tcase(1)"><span>相关文件</span>
					</a>
				</li>
				<li id="current2">
					<a href="#" onclick="Tcase(2)"><span>处理记录</span>
					</a>
				</li>
			</ul>
		</div>
	</body>
</html>
