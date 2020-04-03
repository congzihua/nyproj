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
.btn{
    width: 70px;
    padding: 0;
    border: none;
    color: blue;
    background: none;
    font-size: 14px;
    margin-left: 5px;
}

.btn:hover{
    cursor: pointer;
    border-bottom: 1px solid blue;
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
  <input type="hidden" name="flightDate" value='<%=request.getAttribute("flightDate")!=null?request.getAttribute("flightDate").toString():""%>'/>  
  <input type="hidden" name="flyTime" value="${flyTime}"/> 
  <input type="hidden" name="flightNo" value="${flightNo}"/> 
   <input type="hidden" name="flightInfoIds" value="${flightInfoIds}"/> 
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
  
<FONT style="FONT-SIZE: 20px;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightNo} &nbsp; &nbsp; &nbsp;</font></FONT>
<FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';">乘机时间: </FONT><FONT style="font-size:20px;text-shadow:Red;font-family:'黑体';color:#B22222">&nbsp;<%=request.getAttribute("flightDate")!=null?request.getAttribute("flightDate").toString():""%> ${flyTime} &nbsp; 星期 <%=weeks%></FONT>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <img alt="刷新" onclick="sx();" src="<%=request.getContextPath()%>/images/Refresh.png" width="20" height="20">
</div>
</div>
 
 <div align="center" style=" height:600px;overflow-y:auto;width:  100%;top: 0px;margin: 0px；z-index:2; position::absolute;">
 <table id="txtBox" width="98%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">

  <p align="center">
      <font size="3"><input id="string" name="string" type="text" size="15" onChange="n = 0;"></font> 
    
      <input      type="button" value="查找" onclick="findInPage();"> 
	</p>   
  
  <tr bgcolor="#F0F0F0" style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
     <th width="5%">序号</th>
     <th width="5%">航程</th>
    <th width="9%">姓名</th>
    <th width="9%">证件类型</th>
    <th width="15%">证件号码</th> 
    <th width="6%">座位</th>    
    <th width="4%">VIP</th>
    <th  width="10%">联系电话</th>
    <th  width="10%">状态</th>  
    <th width="10%">团队名称</th>  
    <th width="8%">备注</th>
    <th width="11%">操作</th>
  </tr>
 
  <%int i = 0; %>
  <c:forEach var="item" items="${infoList}">
  <tr bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'" style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
     <td align="center" width="5%"><%=++i %></td>
      <td align="center" width="5%">${item.flight}</td>
    <td align="center" width="9%">${item.name}</td>
    <td align="center" width="9%">${item.certType}</td>
   
    <td align="center" width="15%">${item.certNo}</td>
    <td align="center" width="6%">${item.seatNum}</td>
    <td align="center" width="4%"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center" width="10%">${item.linkphone}</td>
    <td align="center" width="10%">
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
    <td align="center" width="11%"> 
     <c:if test="${item.teamflag==1}">   
	<input type="button" class="btn" value="换登机牌" onclick="dgpage1(${item.id},${item.status});"/>
	</c:if> 
	<c:if test="${item.teamflag==0||item.teamflag==null||item.teamflag==''}">   
	<input type="button" class="btn" value="换登机牌" onclick="dgpage(${item.id},${item.status});"/>
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
var nextIndex = 0;
//上一次需要查找的字符串
var searchValue = '';

function findInPage() {
	var searchText = document.getElementById('string').value;
	//判断搜索字符是否为空
	if (!searchText){
		alert('搜索字符串为空');
		return;
	}
	//判断搜索条件是否已经改变
	if(searchText && searchText != searchValue && nextIndex > 0){
		searchValue = searchText;
		nextIndex = 0;
	}else{
		searchValue = searchText;
	}
	var txt = document.body.createTextRange();
	//搜索str
	var found = '';
	//查找第nextIndex个的字符串。之所以要用循环，是因为TextRange对象每次都是新生成的，所以查找初始位置每次都会还原。那么要查找第n次出现的字符串，就需要调用findText()方法多次，且每次查找都要重新设置开始位置和结束位置。
	for (i = 0; i <= nextIndex && (found = txt.findText(searchValue))==true; i++) {
		txt.moveStart("character", 1);
		txt.moveEnd("textedit");
	}
	//选中本次查找的字符串
	if (found) {
                      //这里设置为-1，表示为倒序查找。之所以要这样做，是因为此时我们已经查找到了第nextIndex出现的字符串，那么此时如果设置为倒序查找，且将开始位置设置为末尾，那么此时调用findText()方法查找，则会刚好查到我们上一次查到的字符串
		txt.moveStart("character", -1);
		txt.findText(searchValue);
		txt.select();
      //滚动屏幕到合适位置
		txt.scrollIntoView();
		nextIndex++;
	}else{
		//循环查找
		if (nextIndex > 0) { 
			nextIndex = 0; 
			findInPage(); 
		}
	}
	return;
}


</script>




