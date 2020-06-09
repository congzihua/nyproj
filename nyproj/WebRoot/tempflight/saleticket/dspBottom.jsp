<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.roc.syspe.entity.BaTicketsalloc"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js?version=1"></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/TfSysmanagerDWR.js'> </script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/js/jquery.min.js'></script> 
	<script type="text/javascript">
		
  	function init(data){
  		var pd = parent.dspTop.document;
  		if(data==1){
  			alert("订票信息增加成功！");
  			pd.getElementById("name").value="";
  			pd.getElementById("certNo").value="";
  			//pd.getElementById("linkphone").value="";
  			pd.getElementById("remark").value="";
  			pd.getElementById("bc").disabled="";
  		}else{
  			alert("订票信息增加失败！");
  			pd.getElementById("bc").disabled="";
  		}
  	}
  	<%if(request.getAttribute("message")!=null && request.getAttribute("message").toString().trim().equals("1")){%>
		init(1);
	<%}else if(request.getAttribute("message")!=null && request.getAttribute("message").toString().trim().equals("0")){%>
  		init(0);
  	<%}%>
  	var idValue = "";
  	var nowStatus = "";
	
	function shux(){
		document.forms[0].submit();
	}
	function xiugai(data,status){
		idValue = data;
		TfSysmanagerDWR.getOrderStatus(data,status,xiugaiHandle);		
	}
	function xiugaiHandle(data){
		if(data){
			var url = "<%=request.getContextPath()%>/tfClientAction.do?method=toEdpage&id="+idValue;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 600px; help: no; scroll: no; status: no");
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function handlerM(data){
		if(data){
			document.forms[0].submit();
		}else{
			alert("信息确认失败！");
		}
	}
	function tp(data,status){
	    if(status==7){
	        alert("该用户已登机，不能进行退票操作！");
	    	return;
	    }
		idValue = data;
		TfSysmanagerDWR.getOrderStatus(data,status,tpHandle);	
	  			
	}
	function tpHandle(data){
		if(data){
			if(window.confirm("您确认要进行退票操作吗？"))
			TfSysmanagerDWR.ticketsInforeturn(idValue,9,handlerTP);
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function handlerTP(data){
		if(data){
			alert("退票信息保存成功！");
			document.forms[0].submit();
		}else{
			alert("退票信息保存失败！");
					
		}
	}
	
	
	
	
	</script>
	<STYLE type="text/css">
<!--
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCCFF; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
-->


<style type="text/css" media="all">
div{
        margin: 0;
        padding: 0;
        border: 0;
        top:0;
        left: 0;
        bottom: 0;
}
body,html{
margin:0px;
}
.btn{
    width: 40px;
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


</STYLE>
<SCRIPT >
<!--
function Show(divid) {
//divid.filters.revealTrans.apply();
//divid.style.visibility = "visible";
//divid.filters.revealTrans.play();
} 
function Hide(divid) {
//divid.filters.revealTrans.apply();
//divid.style.visibility = "hidden";
//divid.filters.revealTrans.play();
}
//-->
</script>
  </head>
  
  <body oncontextmenu="if (!event.ctrlKey){return false;}">
  <form action="<%=request.getContextPath()%>/tfClientAction.do?method=toBottomList" method="post">
  <div align="center">
	 
 <div align="left" style="width:100%;border:0" >
<FONT  style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt;height: 30px;">
 &nbsp; &nbsp;舱  单<img alt="刷新" onclick="shux();" src="<%=request.getContextPath()%>/images/Refresh.png" width="20" height="20">
   &nbsp; &nbsp; 
<input id="string" name="string" type="text" size="15" onChange="nextIndex = 0;"></font> 
      <input      type="button" value="查找" onclick="findInPage();"> 
		</FONT>
 <table width="99%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">
  <tr bgcolor="#F0F0F0" style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
  	 <th width="4%">NO.</th>
  	<th width="7%">航程</th>
    <th width="7%">姓名</th>
    <th width="6%">证件类型</th>
    <th width="17%">证件号码</th>    
    <th width="5%">VIP</th>
    <th width="9%">联系电话</th>
    <th width="5%">状态</th> 
      
    <th width="6%">团体</th>
    <th width="8%">备注</th>
    <th  width="17%">操作</th>
  </tr>
  </table>
  </div>

<div  align="center"  style=" height:500px;overflow-y:auto;width:100%;top: 0px;margin: 0px">
 <!--  hr color="#0033FF" />-->
 <table width="99%" border="0"  align="center"   cellpadding="0" cellspacing="1" bgcolor="#3366FF">
  
  <input type="hidden" name="flightinfoId" value="${flightinfoId}"/>
	<input type="hidden" name="orderdate" value="<%=request.getAttribute("orderdate").toString()%>"/>
	<input type="hidden" name="ordertime" value="${ordertime}"/>
  <%int i = 0; %>
  <c:forEach var="item" items="${oporderList}">
   <%++i; %>
  <tr bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'" style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
  	<td align="center" width="4%"><%=i %></td>
  	<td align="center" width="7%">${item.flightInfo}</td>
    <td  class="highlightRow" align="center" width="7%">${item.name}</td>
    <td  class="highlightRow" align="center" width="6%">${item.certType}</td>
   
    <td  class="highlightRow" align="center" width="17%">${item.certNo}</td>
    
    <td  class="highlightRow" align="center" width="5%"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td  class="highlightRow" align="center" width="9%">${item.linkphone}</td>
    <td  class="highlightRow" align="center" width="5%"><c:if test="${item.status==0}">订 &nbsp; 票</c:if>
    <c:if test="${item.status==1}">确认订票</c:if>
    <c:if test="${item.status==2}">已售票</c:if>
    <c:if test="${item.status==3}">换登机牌</c:if>
    <c:if test="${item.status==4}">已安检</c:if>
    <c:if test="${item.status==7}">已登机</c:if>
   	<c:if test="${item.status==8}">已退订</c:if>
    <c:if test="${item.status==9}">已退票</c:if>
        </td>
    <td  class="highlightRow" align="center" width="6%" onMouseOver="Show(www_zzjs<%=i%>);" onMouseOut="Hide(www_zzjs<%=i%>);">
		<c:choose>
          <c:when test="${fn:length(item.teamName) > 4}">
              <c:out value="${fn:substring(item.teamName, 0, 4)}..." />
          </c:when>
         <c:otherwise>
            <c:out value="${item.teamName}" />
          </c:otherwise>
      </c:choose>   
     <div id="www_zzjs<%=i%>" class="article">${item.teamName}</div>
	</td>
    <td  class="highlightRow" width="8%" align="center" onMouseOver="Show(www_zzjs_net<%=i%>);" onMouseOut="Hide(www_zzjs_net<%=i%>);">
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
    <td   align="left" width="17%" > 
      
	 <c:if test="${item.status <=2}">
      <input type="button" style="width:50px" value="修改" onclick="xiugai(${item.id},${item.status});"/>
	</c:if>
	
	<c:if test="${item.status < 7 }">	
		<input type="button" class="btn" value="退票" onclick="tp(${item.id},${item.status});"/> 
	</c:if>
	</td>
  </tr>
  </c:forEach>
</table>


</div>
</div> 
</form> 
</body>
</html>
<script type="text/javascript">
//在整个文本中查找第几个，从0开始
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
		return;
	}else{
		//循环查找
		if (nextIndex > 0) { 
			nextIndex = 0; 
			findInPage(); 
			return;
		}
	}
	alert("信息未发现~");
  	return;
}


function selectAll(theField){
	var tempval=eval("document."+theField);
	tempval.focus();
	tempval.select();
}

</script>