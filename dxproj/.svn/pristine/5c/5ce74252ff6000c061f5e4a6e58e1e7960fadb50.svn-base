<%@ page language="java" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript">
	function oper(v)
	{
	   if (v == 1)
	   {
	      parent.operfrm.location.href="import.jsp";
	   }
	   else
	   {
	    //  parent.operfrm.location.href="newfrm.jsp";
	    parent.operfrm.location.href="template.jsp";
	   }
	}
	function Init()
	{
	  var c = document.all("oper");
	  if (c[0].checked)
	  {
	     oper(1);
	  }
	  else
	  {
	     oper(2);
	  }
	}
	
	</script>
  </head>
  
  <body onload="Init();" topmargin="0" leftmargin="0">
  <table>
  <tr>
  <td>
  <input type="radio" id="oper" name="oper" value="1" onclick="oper(1);">引入
  </td>
  <td>
   <input type="radio" id="oper" name="oper" value="2" checked onclick="oper(2);">新建
  </td>  
  </tr>
  </table>
  </body>
</html>
