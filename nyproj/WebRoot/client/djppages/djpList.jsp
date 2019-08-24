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
		
  
  	function sp(data){
		var url = "<%=request.getContextPath()%>/clientAction.do?method=editSp&id="+data;
		window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
		document.forms[0].submit();
	}
	var idValue = "";
	function dgpage(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgpageHandle);	
		
	}
	function dgpageHandle(data){
		if(data){
			var url = "<%=request.getContextPath()%>/dJPAction.do?method=toDJPPage&id="+idValue;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 550px; help: no; scroll: no; status: no");
			
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function dgpageHandle1(data){
		if(data){
			var url = "<%=request.getContextPath()%>/dJPAction.do?method=toDJPPage1&id="+idValue;
			//window.open(url);
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 550px; help: no; scroll: auto; status: no");
			
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function dgpage1(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgpageHandle1);	
		
	}
	function sx(){
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
div{margin:0;border:0;padding:0;}
body,html{
margin:0px;
}

-->
</STYLE>
<SCRIPT type="text/javascript">
function Show(divid) {
} 
function Hide(divid) {
}
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}" background="<%=request.getContextPath()%>/image/bg.jpg">
 
  <form action="<%=request.getContextPath()%>/dJPAction.do?method=toList" method="post">&nbsp; 
  <input type="hidden" name="flightinfoId" value="${flightinfoId}"/>
  <input type="hidden" name="flight" value="${flight}"/>
  <input type="hidden" name="flightDate" value='<%=request.getAttribute("flightDate")!=null?request.getAttribute("flightDate").toString():""%>'/>  
  <input type="hidden" name="flyTime" value="${flyTime}"/> 
  <input type="hidden" name="flightNo" value="${flightNo}"/> 
  <%
  	String flightDate = request.getAttribute("flightDate")==null?"": request.getAttribute("flightDate").toString().trim();
  	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  	java.util.Date date = format.parse(flightDate);
  	java.util.Calendar c = java.util.Calendar.getInstance();
  	c.setTime(date);
  	int dayOfWeek = c.get(java.util.Calendar.DAY_OF_WEEK);
	String weeks = null;
	if(dayOfWeek==2){
	  weeks = "一";
	}else if(dayOfWeek==3){
	   weeks = "二";
	}else if(dayOfWeek==4){
	   weeks = "三";
	}else if(dayOfWeek==5){
	   weeks = "四";
	}else if(dayOfWeek==6){
		weeks = "五";
	}else if(dayOfWeek==7){
	    weeks = "六";
	}else if(dayOfWeek==1){
	    weeks = "日";
	}
   %>
  
 <div align="center" style='z-index:0'>
 
  <div align="left" style="width: 1024">
  
<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';"> 目的地：</FONT><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#B22222">  ${flight} &nbsp; </FONT>
<FONT style="FONT-SIZE: 20px;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightNo} &nbsp; &nbsp; &nbsp;</font></FONT>
<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">乘机时间: </FONT><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#B22222">&nbsp;<%=request.getAttribute("flightDate")!=null?request.getAttribute("flightDate").toString():""%> ${flyTime} &nbsp; 星期 <%=weeks%></FONT>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <img alt="刷新" onclick="sx();" src="<%=request.getContextPath()%>/images/Refresh.png" width="20" height="20">
</div>
</div>
 
 <div align="center" style=" height:600px;overflow-y:auto;width:  100%;top: 0px;margin: 0px；z-index:2; position::absolute;">
 <table id="txtBox" style='top: 0px;' width="1024" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">

  <p align="center">
      <font size="3"><input id="string" name="string" type="text" size="15" onChange="n = 0;"></font> 
    
      <input      type="button" value="查找" onclick="findInPage(document.getElementById('string').value);"> 
	</p>   
  
  <tr bgcolor="#F0F0F0">
     <th width="5%">序号</th>
    <th width="10%">姓名</th>
    <th width="10%">证件类型</th>
    <th width="15%">证件号码</th> 
    <th width="6%">座位</th>    
    <th width="5%">VIP</th>
    <th  width="10%">联系电话</th>
    <th  width="12%">状态</th>  
    <th width="10%">团队名称</th>  
    <th width="8%">备注</th>
    <th width="8%">操作</th>
  </tr>
 
  <%int i = 0; %>
  <c:forEach var="item" items="${infoList}">
  <tr bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'">
     <td align="center" width="5%"><%=++i %></td>
    <td align="center" width="10%">${item.name}</td>
    <td align="center" width="10%">${item.certType}</td>
   
    <td align="center" width="15%">${item.certNo}</td>
    <td align="center" width="6%">${item.seatNum}</td>
    <td align="center" width="5%"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center" width="10%">${item.linkphone}</td>
    <td align="center" width="12%">
    <c:if test="${item.status==2}">已售 票</c:if>
    <c:if test="${item.status==3}">已换登机牌</c:if>   
     <c:if test="${item.status==4}">已安检</c:if>    
    </td>
    <td align="center" width="10%">
    <c:if test="${item.teamflag==1}">${item.teamName}</c:if>
    <c:if test="${item.teamflag==0}">&nbsp;</c:if>
    </td>
    <td width="8%" align="center" onMouseOver="Show('www_zzjs_net<%=i%>');" onMouseOut="Hide('www_zzjs_net<%=i%>');">
      <c:choose>
          <c:when test="${fn:length(item.remark) > 8}">
              <c:out value="${fn:substring(item.remark, 0, 8)}..." />
          </c:when>
         <c:otherwise>
            <c:out value="${item.remark}" />
          </c:otherwise>
      </c:choose>
     <div id="www_zzjs_net<%=i%>" class="article">${item.remark}</div>
    </td>
    <td align="center" width="8%"> 
     <c:if test="${item.teamflag==1}">   
	<input type="button" style="width: 60px" value="换登机牌" onclick="dgpage1(${item.id},${item.status});"/>
	</c:if> 
	<c:if test="${item.teamflag==0||item.teamflag==null||item.teamflag==''}">   
	<input type="button" style="width: 60px" value="换登机牌" onclick="dgpage(${item.id},${item.status});"/>
	</c:if> 
	</td>
  </tr>
  </c:forEach>
</table>
</div>
</form>  
</body>
</html>


<script type="text/javascript">
var NS4 = (document.layers);    // Which browser?
var IE4 = (document.all);
var win = window;    // window to search.
var n   = 0;
function findInPage(str) {
  var txt, i, found;
  if (str == "")
    return false;
  // Find next occurance of the given string on the page, wrap around to the
  // start of the page if necessary.
  if (NS4) {
    // Look for match starting at the current point. If not found, rewind
    // back to the first match.
    if (!win.find(str))
      while(win.find(str, false, true))
        n++;
    else
      n++;
    // If not found in either direction, give message.
    if (n == 0)
      alert("Not found.");
  }
  if (IE4) {
    txt = win.document.body.createTextRange();
    // Find the nth match from the top of the page.
    for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
      txt.moveStart("character", 1);
      txt.moveEnd("textedit");
    }
    // If found, mark it and scroll it into view.
    if (found) {
      txt.moveStart("character", -1);
      txt.findText(str);
      txt.select();
      txt.scrollIntoView();
      n++;
    }
    // Otherwise, start over at the top of the page and find first match.
    else {
      if (n > 0) {
        n = 0;
        findInPage(str);
      }
      // Not found anywhere, give message.
      else
        alert("Not found.");
    }
  }
  return false;
}


</script>




