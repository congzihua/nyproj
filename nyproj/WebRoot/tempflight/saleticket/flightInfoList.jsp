<%@page import="com.founder.enp.entity.Authorization"%>
<%@page import="com.tempflight.entity.TempFlightinfo"%>
<%@page import="com.tempflight.service.TempClienService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	Authorization authorization = (Authorization)session.getAttribute("authorization");
	TempClienService service = new TempClienService();
	List<TempFlightinfo> list =  service.tempFlightInfoListByLimit();
	Integer userId = authorization != null ? authorization.getUserid():null;
	Integer num = (Integer)request.getAttribute("num");
	num = num == null?0:num;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var n = <%=num%>;
		function succ() {
			if (n == -1) {
				alert("删除失败");
			}else if(n > 0) {
				alert("删除成功");
			}
		}
		succ();
		var uId = <%=userId%>;
		function updateInfo(data){
			if (uId == null || uId <= 0) {
				alert("登录信息已过期，请重新登录");
				return;
			}
			var url = "<%=request.getContextPath()%>/tempflight/saleticket/flightInfo.jsp?id="+data;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 650px; help: no; scroll: no; status: no");
			opNew();
		}
		function dele(id){
			if (uId == null || uId <= 0) {
				alert("登录信息已过期，请重新登录");
				return;
			}
			if (confirm("你确定要删除该数据吗？")) {
				var url = "<%=request.getContextPath()%>/tfClientAction.do?method=deleteTempFlightInfo";
				document.getElementById("id").value=id;
				document.getElementById("myform").action = url;
				document.getElementById("myform").submit();
			}
		}
		function addInfo(){
			if (uId == null || uId <= 0) {
				alert("登录信息已过期，请重新登录");
				return;
			}
			var url = "<%=request.getContextPath()%>/tempflight/saleticket/flightInfo.jsp";
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 650px; help: no; scroll: no; status: no");
			opNew();
		}
		function opNew() {
			var url = "<%=request.getContextPath()%>/tfClientAction.do?method=toTempFlightInfoList";
			document.getElementById("myform").action = url;
			document.getElementById("myform").submit();
		}
	</script>
	<STYLE type="text/css">
<!--
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCCFF; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}

 .clearfix{zoom:1;}
.clearfix:after{content:'.';display:block;visibility:none;height:0;clear:both;}
#bd{background-color:#DDD}
#bd .right{background-color:red;float:right;width:100%;margin-left:-25em;}
#bd .right .content{margin-left:270px;background-color:blue;color:#FFF;}
#bd .left{background-color:green;color:#FFF;width:260px;float:left;}

body,html{
margin:0px;
}

-->
</STYLE>
<SCRIPT type="text/javascript">
function Show(divid) {
document.getElementById(divid).style.display="block";
} 
function Hide(divid) {
	document.getElementById(divid).style.display="none";
}
</script>
  </head>
  
  <body >
  <form action="" method="post" id="myform">
  	<input id="id" name="id" value ="" type="hidden"/>
  </form>
 <div align="center" >
  <div align="left" style="width: 1024">  
   <input id="fid" type="hidden" name="fid" value="<%=request.getAttribute("flightinfoId")==null?"":Integer.valueOf(request.getAttribute("flightinfoId").toString()) %>"/>
    <table border="0" width="1024" align="center">
    	<tr>
    		<td><input type="button" name="add" onclick="addInfo();" value="新增"/></td>    		
    	</tr>
    </table>
</div>
</div>
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">
  <tr bgcolor="#F0F0F0">
     <th>序号</th>
     <th>出发地</th>
    <th>航程</th>
    <th>航班号</th>
    <th>登机口</th> 
    <th>起飞日期</th>    
    <th>起飞时间</th>
    <th>创建时间</th>
     <th>操作</th>  
  </tr>
  <%int i = 0; %>
  <%
  	for (TempFlightinfo info:list) {
  %>
  <tr  bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'">
     <td align="center"><%=++i %></td>
     <td align="center"><%=info.getOrigin()%></td>
    <td align="center"><%=info.getFlightInfo()%></td>
    <td align="center"><%=info.getFlightNo()%></td>
    <td align="center"><%=info.getGateNo()%></td>
    <td align="center"><fmt:formatDate value="<%=info.getFlightDate()%>" pattern="yyyy-MM-dd"/></td>
    <td align="center"><%=info.getFlyTime()%></td>
    <td align="center"><fmt:formatDate value="<%=info.getCreateTime()%>" pattern="yyyy-MM-dd"/></td>
    <td align="center">
    	<input type="button" id="update" onclick="updateInfo(<%=info.getId()%>)" value="修改"/>
    	<input type="button" id="dele" onclick="dele(<%=info.getId()%>);" value="删除"/>
    </td>
  </tr>
  
  <%} %>
</table>
</body>
</html>
