<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.roc.syspe.entity.BaTicketsalloc"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
List<BaTicketsalloc> tilist = request.getAttribute("ticketsPointC")==null?null:(List<BaTicketsalloc> )request.getAttribute("ticketsPointC");
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js?version=1"></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
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
  	function sp(data,status){ 
  		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,toIsSaltTicekets); 
  	}
  	function saltTeamTickets(data,name,status){
  		var url = "<%=request.getContextPath()%>/clientAction.do?method=toSaltTeamTickets&flightinfoId="+data+"&name="+encodeURI(encodeURI(name))+"&status="+status;
  		window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 600px; help: no; scroll: yes; status: no");
		document.forms[0].submit();	
  	} 
  	
	function toIsSaltTicekets(data){
		if(data){
	  		var url = "<%=request.getContextPath()%>/clientAction.do?method=editSp&id="+idValue;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 650px; help: no; scroll: no; status: no");
			document.forms[0].submit();	
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}
	}
	function dgpage(data,status){	   
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgpageHandle);		
	}
	function dgpageHandle(data){
		if(data){
			var url = "<%=request.getContextPath()%>/clientAction.do?method=tgSp&id="+idValue;
			var rv = window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}
	}
	function dgq(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgqHandle);		
	}
	function dgqHandle(data){
		if(data){
			var url = "<%=request.getContextPath()%>/clientAction.do?method=toDGQ&id="+idValue;
			var rv = window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
			document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}
	}
	function qren(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,qrenHandle);	
		
	}
	function qrenHandle(data){
		if(data){
			if(window.confirm('您确定要进行订票信息确认吗？'))
				SysmanagerDWR.ticketsInforeturn(idValue,'<%=auth.getUserid()%>',1,handlerM);
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
		}	
	}
	function shux(){
		document.forms[0].submit();
	}
	function xiugai(data,status){
		
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,xiugaiHandle);		
	}
	function xiugaiHandle(data){
		if(data){
			var url = "<%=request.getContextPath()%>/clientAction.do?method=toEdpage&id="+idValue;
			window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
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
	        alert("该用户已登记，不能进行退票操作！");
	    	return;
	    }
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,tpHandle);	
	  			
	}
	function tpHandle(data){
		if(data){
			if(window.confirm("您确认要进行退票操作吗？"))
			SysmanagerDWR.ticketsInforeturn(idValue,'<%=auth.getUserid()%>',9,handlerTP);
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
	function prin(data){
		if(window.confirm("您确定要进行打印操作吗？")){
			SysmanagerDWR.printTickets(data,'<%=auth.getName()%>',handlerP);
		}
	}
	function handlerP(data){
		if(data==1){
			alert("打印成功！");
		}else{
			alert("打印失败！");
		}
	}
	
	function dgq1(data,status){
		idValue = data;
  		SysmanagerDWR.getOrderStatus(data,status,dgqHandle1);		
	}
	function dgqHandle1(data){
		if(data){
			var url = "<%=request.getContextPath()%>/clientAction.do?method=toUPdateTeampage&id="+idValue;
			var rv = window.showModalDialog(url, window, "dialogWidth: 1024px; dialogHeight: 400px; help: no; scroll: no; status: no");
			if(rv == 1)
				document.forms[0].submit();
		}else{
			alert("信息状态已经改变，请重新选择！");
			document.forms[0].submit();	
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
  <form action="<%=request.getContextPath()%>/clientAction.do?method=toBottomList" method="post">
  <div align="left">
  <div style="width: 96%;" align="center">
		<FONT style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
			&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 票额分配一览表  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
			
			&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
			<img alt="刷新" onclick="shux();" src="<%=request.getContextPath()%>/images/Refresh.png" width="20" height="20">
		</FONT>
	</div>	
	 <div style="width: 96%;" align="left">
   <table width=" 100%" border="1" align="left" style="border-collapse:collapse; border-color:#333333;
	font-size:14px;">
  <tr>
  <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
  	单位
  </th>
  <c:forEach var="tp" items="${ticketsPointC}">
    <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center"><input type="hidden" id="${tp.ticketpointId}" name="${tp.ticketpointId}" value="${tp.balance}"/>${tp.name}</th>
    </c:forEach>
   <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">
  	合计
  </th> 
  </tr>
  <tr>
  
  <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">票额</th>
  <% int total = 0;for(BaTicketsalloc b: tilist){total+=b.getAmount();%>
    <td style="height:30px;color:blue; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center"><%=b.getAmount() %></td>
  <%} %>
    <td style="height:30px;color:blue; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center">
   	<%=total %>
    </td>
  </tr>
  <tr>
  <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">已用(订/售)</th>
  <% int total1 = 0,totalOrder=0;for(BaTicketsalloc b: tilist){total1+=b.getUsedCount();totalOrder+=b.getOrderCount();%>
    <td style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center"><%=b.getUsedCount()+"("+b.getOrderCount()+"/"+(b.getUsedCount()-b.getOrderCount())+")"%></td>
    <%} %>
    <td style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center">
   	<%=total1+"("+totalOrder+"/"+(total1-totalOrder)+")" %>
    </td>
  </tr>
  <tr>
  <th style="height:30px; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;">剩余</th>
   <% int total2 = 0;for(BaTicketsalloc b: tilist){total2+=b.getLookBalance();%>
    <td style="height:30px;color:green; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center"><b><%=b.getLookBalance()<1?"<font color='red'>无</font>":b.getLookBalance()%></b></td>
     <%} %>
    <td style="height:30px;color:green; border-color:#333333; text-align:center; vertical-align:middle;	word-break:break-all;overflow:auto;" align="center">
   	<%=total2 %>
    </td>
  </tr>
</table>
</div>
 <div align="left" style="width:  100%;border:0" >
<FONT  style="FONT-SIZE: 14pt;font-weight:7;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt">
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
 &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 舱  单&nbsp;
   &nbsp; &nbsp; &nbsp; &nbsp; 
<input id="string" name="string" type="text" size="15" onChange="n = 0;"></font> 
      <input      type="button" value="查找" onclick="findInPage();"> 
		</FONT>
 <table width="96%" border="0" align="left"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">
  
  <tr bgcolor="#F0F0F0">
     <!--  th width="6%">序号</th>-->
     <th width="9%">售票点</th>
    <th width="8%">姓名</th>
    
    <th width="6%">证件类型</th>
    <th width="12%">证件号码</th>    
    <th width="5%">VIP</th>
    <th width="11%">联系电话</th>
    <th width="5%">状态</th> 
    <th width="12%">订票日期</th>   
    <th width="6%">团体</th>
    <th width="8%">备注</th>
    <th width="18%">操作</th>
  </tr>
  </table>
  </div>

<div align="left" style=" height:351px;overflow-y:auto;width:  96%;top: 0px;margin: 0px">
 <!--  hr color="#0033FF" />-->
 <table width="100%" border="0" align="left"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">
  
  <input type="hidden" name="flightinfoId" value="${flightinfoId}"/>
	<input type="hidden" name="orderdate" value="<%=request.getAttribute("orderdate").toString()%>"/>
	<input type="hidden" name="flightId" value="${flightId}"/>
	<input type="hidden" name="ordertime" value="${ordertime}"/>
  <%int i = 0; %>
  <c:forEach var="item" items="${oporderList}">
  <tr bgcolor="#FFFFFF" onmouseout="this.bgColor='#FFFFFF'" onmouseover="this.bgColor='ffcccc'">
     <!--td align="center" width="6%"><%=++i %></td>-->
      <td align="center" width="9%">${item.ticketpointname}</td>
    <td align="center" width="8%">${item.name}</td>
    <td align="center" width="6%">${item.certType}</td>
   
    <td align="center" width="12%">${item.certNo}</td>
    
    <td align="center" width="5%"><c:if test="${item.vipFlag==1}">是</c:if></td>
    <td align="center" width="11%">${item.linkphone}</td>
    <td align="center" width="5%"><c:if test="${item.status==0}">订 &nbsp; 票</c:if>
    <c:if test="${item.status==1}">确认订票</c:if>
    <c:if test="${item.status==2}">已售票</c:if>
    <c:if test="${item.status==3}">换登机牌</c:if>
    <c:if test="${item.status==4}">已安检</c:if>
    <c:if test="${item.status==7}">已登机</c:if>
   	<c:if test="${item.status==8}">已退订</c:if>
    <c:if test="${item.status==9}">已退票</c:if>
   
     
        </td>
    <td align="center" width="12%"><fmt:formatDate  value="${item.createdate}" pattern="MM.dd"/></td>
    <td align="center" width="6%" onMouseOver="Show(www_zzjs<%=i%>);" onMouseOut="Hide(www_zzjs<%=i%>);">
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
    <td width="8%" align="center" onMouseOver="Show(www_zzjs_net<%=i%>);" onMouseOut="Hide(www_zzjs_net<%=i%>);">
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
    <td align="left" width="18%"> 
      
    <c:if test="${item.status==0}">	
    	<c:if test="${item.teamflag==null||item.teamflag==0}">
		    <input type="button" style="width: 50px" value="售 票" onclick="sp(${item.id},${item.status});"/>
		    <input type="button" style="width: 50px" value="确认" onclick="qren(${item.id},${item.status});"/>    
		    <input type="button" style="width: 50px" value="修改" onclick="xiugai(${item.id},${item.status});"/> 	
			<input type="button" style="width: 50px" value="改签" onclick="dgq(${item.id},${item.status});"/>	
		</c:if>
		<c:if test="${item.teamflag==1}">
			 <input type="button" style="width: 50px" value="售 票" onclick="saltTeamTickets(${flightinfoId},'${item.teamName}',${item.status});"/>
		    <input type="button" style="width: 50px" value="确认" onclick="qren(${item.id},${item.status});"/>    
		    <input type="button" style="width: 50px" value="修改" onclick="xiugai(${item.id},${item.status});"/> 	
			<input type="button" style="width: 50px" value="改签" onclick="dgq(${item.id},${item.status});"/>	
		</c:if>
	</c:if>
	 <c:if test="${item.status==1}">
		 <c:if test="${item.teamflag==null||item.teamflag==0}">	
	   		 <input type="button" style="width: 50px" value="售 票" onclick="sp(${item.id},${item.status});"/>       
	    </c:if>
	    <c:if test="${item.teamflag==1}">
			 <input type="button" style="width: 50px" value="售 票" onclick="saltTeamTickets(${flightinfoId},'${item.teamName}',${item.status});"/>
		</c:if>
      <input type="button" style="width:50px" value="修改" onclick="xiugai(${item.id},${item.status});"/> 	
	
		<input type="button" style="width: 50px" value="改签" onclick="dgq(${item.id},${item.status});"/>	
	 
	</c:if>
	
	<c:if test="${item.status>=2}">	
		<input type="button" style="width: 50px" value="打印" onclick="prin(${item.id},${item.status});"/>
		<c:if test="${item.status == 7}">
			<c:if test="${authorization.sysqx==3 || authorization.sysqx==4}">
				<!--不能进行推票改签-->
	 		</c:if>
	 	</c:if>
		<c:if test="${item.status == 4 || item.status ==2 ||item.status ==3}">
			<input type="button" style="width: 50px" value="退票" onclick="tp(${item.id},${item.status});"/>		
				<input type="button" style="width: 50px" value="改签" onclick="dgpage(${item.id},${item.status});"/>
		</c:if>
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
<script language="JavaScript">
var NS4 = (document.layers);    // Which browser?
var IE4 = (document.all);
var win = window;    // window to search.
var n   = 0;
function findInPage() {
  var str = document.getElementById('string').value;
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


function selectAll(theField){
	var tempval=eval("document."+theField);
	tempval.focus();
	tempval.select();
}

</script>
