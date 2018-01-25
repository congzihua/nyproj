<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.roc.syspe.entity.BaTicketsalloc"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
	<script type="text/javascript">
		
  
  	function ch(){
		var name = document.getElementById("name").value;
		var certNo = document.getElementById("certNo").value;
		if((name ==null ||name=="" )&&(certNo==null || certNo=='')){
			alert("请输入客户姓名或证件号码！");
			return;
		}
		document.forms[0].submit();
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
<SCRIPT language=JavaScript1.2>
<!--
function Show(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "visible";
divid.filters.revealTrans.play();
} 
function Hide(divid) {
divid.filters.revealTrans.apply();
divid.style.visibility = "hidden";
divid.filters.revealTrans.play();
}
//-->
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}" background="<%=request.getContextPath()%>/image/bg.jpg">
 
  
  
 
 <div align="center" >
 
  <div align="left" style="width: 1024">
  
<form name="userForm" action="<%=request.getContextPath()%>/clientAction.do?method=seleCustomerList"  method="post">
	   
	   
		
		<table style="font-size:12px;">
			<tr>
				<td>
					客户姓名：					
				</td>
				<td>
					<input type="text" id="name" name="name" value="${name}"/>					
				</td>
				<td>
					证件号码：					
				</td>
				<td>
					<input type="text" id="certNo" name="certNo" value="${certNo}"/>					
				</td>
				<td>
					<input type="button"  class="button2"
						value="查询" onclick="ch();"/>
					
				</td>
				
				
			</tr>

		</table>
		</form> 
		<div align="left" style=" height:651px;overflow-y:auto;width: 100%;top: 0px;margin: 0px">
<table width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">

	

  <tr bgcolor="#F0F0F0">
     <th>序号</th>
    <th>客户姓名</th>
    <th>证件类型</th>
    <th>证件号码</th> 
    <th>VIP</th>
    <th>联系电话</th>
    <th>状态</th>  
     <th>时间</th>  
     <th>行李编码</th>
    <th>备注</th>
   
  </tr>
  <%int i = 0; %>
  <c:forEach var="item" items="${list}">
  <tr bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'">
     <td align="center"><%=++i %></td>
    <td align="center">${item.name}</td>
    <td align="center">${item.certType}</td>
   
    <td align="center">${item.certNo}</td>
   
    <td align="center"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center">${item.linkphone}</td>
    <td align="center">
   <c:if test="${item.type==0}">订  &nbsp; 票 </c:if>
								<c:if test="${item.type==1}">订票确认 </c:if>
									<c:if test="${item.type==2}">售 &nbsp; 票</c:if>
								    <c:if test="${item.type==3}">换登机牌</c:if>
								    <c:if test="${item.type==4}">已安检</c:if>
								    <c:if test="${item.type==5}">改  &nbsp; 签</c:if>
								     <c:if test="${item.type==6}">修改信息</c:if>
								       <c:if test="${item.type==7}">已登机</c:if>
								   <c:if test="${item.type==8}">退  &nbsp; 订</c:if>
								    <c:if test="${item.type==9}">退 &nbsp;  票</c:if>
        </td>
    
   <td align="center">
   <fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
   </td>
    <td align="center">
      ${item.bagNum}
    </td>
    <td align="center" onMouseOver="Show(www_zzjs_net<%=i%>);" onMouseOut="Hide(www_zzjs_net<%=i%>);">
      <c:choose>
          <c:when test="${fn:length(item.remark) > 5}">
              <c:out value="${fn:substring(item.remark, 0, 5)}..." />
          </c:when>
         <c:otherwise>
            <c:out value="${item.remark}" />
          </c:otherwise>
      </c:choose>
     <div id="www_zzjs_net<%=i%>" class="article">${item.remark}</div>
    </td>
   
  </tr>
  </c:forEach>
</table>
</div>
 
</div>
</div>
</body>
</html>
