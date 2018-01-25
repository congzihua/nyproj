<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'navigator.jsp' starting page</title>
		<LINK href="../../css/tab1.css" type=text/css rel=stylesheet>
		<script type="text/javascript">
		
		function Tcase(v)
		{
		   var a = document.getElementsByTagName("li");
		   for (var i = 0; i < a.length;i++)
		   {
		      if (a[i].id == "current")
		         a[i].id = "current"+i;
		   }
		   document.all("current"+v).id="current";
		   if (v == 0)
		   {
		     parent.content.location.href="content.jsp?f=y";
		   }
		   else if (v == 1)
		   {
		      parent.content.location.href="param.jsp";
		   }
		   else
		   {
		       parent.content.location.href="attache.jsp";
		   }
		}
		function doInit()
		{
		  document.all("current0").id="current";
		  parent.content.location.href="content.jsp";
		}
		</script>
	</head>
	<body onload="doInit()">
		<div id="tabsB">
			<ul>
				<li id="current0">
					<a href="#" onclick="Tcase(0)"><span >正文</span>
					</a>
				</li>
				<li id="current1">
					<a href="#" onclick="Tcase(1)"><span>公文属性</span>
					</a>
				</li>
				<li id="current2">
					<a href="#" onclick="Tcase(2)"><span>相关文件</span>
					</a>
				</li>
			</ul>
		</div>
	</body>
</html>
