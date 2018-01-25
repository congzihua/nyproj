<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Advice"/>
<%
  List list = (List)request.getAttribute("list");
  if (list == null)
  {
     	out.println("<font size=5 color=red>获得审批常用语错误!!!</font>");
		return;
  }
  Iterator itera = list.iterator();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>审批常用语</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link rel="stylesheet" href="css/admin.css">
    <script type="text/javascript" src="js/common.js">
    </script>
    <script type="text/javascript">
    function getAdvice()
    {
      if (document.all("advice").value == "")
      {
          alert("请选择审批常用语");
         return ;
      }
      var size = document.all("advice").length;
      var advice = "";
      for (var i = 0; i < size; i++)
      {
         if (document.all("advice").options[i].selected)
         {
             advice = document.all("advice").options[i].innerText;
             break;
         }
      }
     
      window.returnValue = advice;
      window.close();
    }
    function delAdvice()
    {
      if (document.all("advice").value == "")
      {
          alert("请选择要删除的审批常用语");
         return ;
      }
      var sUrl = "adviceAction.do?oper=del&adsid="+document.all("advice").value;
	  new net.ContentLoader(sUrl, doFinishDel); 
    }
    function doFinishDel()
    {
        var info = this.getReq().responseText;
        if (info == 'delok')
        {
          alert("删除审批语成功");
          window.close();
     
        }
        else
        {
          alert("删除审批语失败");
        }
    }
    
    </script>

  </head>
  
  <body style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}" bgcolor="e1e7fb">
  <table>
			<tr>
				<td>
					<select style="width:450" name="advice" id="advice" size=14>
					<%
					  while (itera.hasNext())
					  {
					     Advice advice = (Advice)itera.next();
					 %>
					  <option value="<%=advice.getAdsid() %>"><%=advice.getAdvice() %></option>
					  <%} %>
					</select>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td valign="top">
					<table>
						<tr>
							<td>
								<input type="button" value="确 定" onclick="javascript:getAdvice();" class="button2">
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="button" value="删 除" onclick="javascript:delAdvice();" class="button2">
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="取 消" onclick="javascript:window.close();" class="button2">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
  </body>
</html>
