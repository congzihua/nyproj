<%@ page language="java" pageEncoding="GBK"%>
<jsp:include flush="true" page="../jsp-header.jsp"></jsp:include>

<html>
	<head>

		<title>My JSP 'page.jsp' starting page</title>
		<script>
		var Current=0;
		var Pages=0;
		var FileCount=0;
		var Number = 1;
		function Init(iCurrent,iPages,iFileCount)
		{
		    Current = iCurrent
		    Pages = iPages
		    FileCount = iFileCount
		    document.all.CurrentTag.innerText = "第 "+Current+" 页"
		    document.all.TotalTag.innerText = "共 "+Pages+" 页"
		    document.all.TotalFileTag.innerText = "共 "+FileCount+" 条记录"
		    document.all.TotalCount.innerText = ""
		    
				if ((Current == 1) || (Current == 0)) 
				   fPageUp.src = '../images/Page_Up_Dis.gif'
				else
				   fPageUp.src = '../images/Page_Up.gif'
				   
				if (Current == Pages) 
				   fPageDown.src = '../images/Page_Down_Dis.gif'
				else   
				   fPageDown.src = '../images/Page_Down.gif'

		        NoInput.value = iCurrent  
		}
		function changeWin()
		{
			if(parent.commfrm != null)
			{
				if(parent.commfrm.rows != "60,50%,33,*")
				{
					parent.commfrm.rows = "60,50%,33,*";
					document.all.topmenuSwitch.innerHTML = "<font class=o1>6</font>";
				}
				else
				{
					parent.commfrm.rows = "60,*,33,0";
					document.all.topmenuSwitch.innerHTML = "<font class=o1>5</font>";
				}
			}
		}
		  function go()
		  {
		    var pageno = document.all("NoInput").value;
		   
		    if(isNaN(pageno))
		    {
		        alert('非法数字');
		        return;
		    }
		    if(pageno < 1 || pageno > Pages)
		    {
		        alert('输入的跳转范围无效');
		        document.all("NoInput").select();
		        return;
		    }
		    to(pageno);
		  }
		  function to(number)
		  {
		      Number = number;
		      parent.frames[1].goPage(number);
		  }
		  function goPage(f)
		  {
		     if (f == 'prev')
		     {
		       if (Current == 1)
		          alert("已经是第一页");
		       else
		          to(Current-1);
		     }
		     else
		     {
		        if (Current ==Pages)
		            alert("已经是最后一页");
		       else
		          to(Current+1);
		     }
		     
		  }
		</script>
		<style>
		<!--
		A {cursor:hand;color:black}
		-->
		.o1 {
			FONT-SIZE: 12px; CURSOR: hand; COLOR: #000000; FONT-FAMILY: "Webdings"; 
		}
		</style>
	</head>

	<body oncontextmenu="if (!event.ctrlKey){return false;}"
		style="font-size:12px" topmargin="0" leftmargin="0" bgcolor="silver"
		background="../images/Page_BG.gif">
		<table border="0" cellspacing="0" cellpadding="0"
			style="position:absolute;top:4px;font-size:12px;color:#2C6ECC"
			align="center">
			<tr align="center">
				<td id="CurrentTag" valign="middle" width="60"></td>
				<td id="TotalTag" valign="middle" width="60"></td>
				<td id="TotalFileTag" valign="middle" width="80">
				</td>
				<td id="TotalCount" valign="middle" width="80">
				</td>
				<td class=o1 id=topmenuSwitch onclick=changeWin() align="left"
					valign="left" width="20">
					<FONT class=o1>6</FONT>
				</td>
				<td valign="middle" width="1"></td>
				<td align="right" style="cursor:hand" width="20">
					<img id="fPageUp" src="../images/Page_Up.gif" alt="上一页"
						onclick="goPage('prev')">
				</td>
				<td valign="middle" width="40" onclick="goPage('prev')"
					style='cursor:hand'>
					上一页
				</td>
				<td valign="middle" width="3"></td>
				<td valign="middle" width="40" onclick="goPage('next')"
					style='cursor:hand'>
					下一页
				</td>
				<td align="left" style="cursor:hand" width="20">
					<img id="fPageDown" src="../images/Page_Down.gif" alt="下一页"
						onclick="goPage('next')">
				</td>
				<td valign="top" width="20"></td>
				<td width="30">
					至第
				</td>
				<td width="40">
					<input type="text" size="3"  name="NoInput" style="font-size:12px">
				</td>
				<td>
					页
				</td>
				<td width="30">
					<img src="../images/Page_Go.gif" style="cursor:hand"
						onclick="javascript:go();" alt="跳至所定页数">
				</td>
			</tr>
		</table>
	</body>
</html>
