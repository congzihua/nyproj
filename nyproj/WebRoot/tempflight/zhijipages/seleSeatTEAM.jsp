<%@page import="com.tempflight.entity.TempOrdertickets"%>
<%@page import="com.tempflight.service.TempClienService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
		String path = request.getContextPath();
		String count = request.getParameter("count");
		String fligntInfoId = request.getParameter("fligntInfoId");
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		TempClienService service = new TempClienService();
		int id = Integer.valueOf(fligntInfoId);
		List<TempOrdertickets>  list = service.tempFlightInfoSeatNumList(id);
		LinkedList<String> strList = new LinkedList<String>();
		for(TempOrdertickets op:list){
			if(op!=null && !op.getSeatNum().trim().equals("")){
				strList.add(op.getSeatNum().trim());
			}
		}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
table,th,td
{
border:0px solid blue;
}
#Layer1{
    
	position:absolute;
	width:200px;
	z-index:1;
	left: 50px;
	top: 10px;
	border: 1px
	solid #000000
}
#Layer2{
     position:absolute;
	 width:105px;
	 z-index:1px;
	 left: 265px;
	 top:50px;
	 border:2px;
	 
	 
 }
/* #Layer3{
     position:absolute;
	 width:160px;
	 left: 150px;
	 top:20px;
	 border:2px;
	 
 }*/
 #Layer4{
     position:absolute;
	 width:105px;
	 z-index:1px;
	 left: 265px;
	 top:290px;
	 border:2px;
	  }
</style>





</head>

<body>

<script type="text/javascript">
var oImg = document.getElementsByName('seat');

function clickme(sId)
{
var chd = document.getElementsByName('tijiao');

for (var i = 0; i < chd.length; i++) {
		if(chd[i].value == sId && chd[i].checked != true){
			chd[i].checked = true;
        	oImg[i].style.border = '1px solid #C00000';
			oImg[i].src ="<%=request.getContextPath()%>/image/30.jpg";
			chd[i].checked = true;
		}else if(chd[i].value == sId && chd[i].checked==true){
			oImg[i].style.border = '1px solid #000000';
			oImg[i].src ="<%=request.getContextPath()%>/image/20.jpg";
			chd[i].checked = false;
		}
   }
	
}

function xuanzuo(){
	
  var temp = document.getElementsByName('tijiao');
  var subValue="";
  var coun = 0;
  for(var i=0; i<temp.length;i++){
    if(temp[i].checked){
		   subValue += temp[i].value+",";
		   coun++;
	}
  }
  if(coun>'<%=count%>'){
  	alert('您选择的座位大于团队人数，请重新选择，最多选择<%=count%>个座位');
  	return;
  }
  if(subValue==""){
  	alert("请选择座位！");
  }else{
  	window.returnValue=subValue.substring(0,subValue.length-1);
	window.close();
  }
 }
//function mousemove(sId){
//for (var i = 0; i < oImg.length; i++){
//if (oImg[i].id == sId){
//oImg[i].src ="<%=request.getContextPath()%>/image/20.jpg";
//}
//}
  
//}
//document.body.onmousemove=quickalt;
//function quickalt() {
//if (event.srcElement.hint)event.srcElement.alt=event.srcElement.hint;
//if(event.srcElement.alt && event.srcElement.alt!='') {
//event.srcElement.hint=event.srcElement.alt;
//altlayer.style.visibility='visible';
//altlayer.style.left=event.x-1;
//altlayer.style.top=event.y+16;
//altlayer.innerHTML=event.srcElement.hint
//event.srcElement.alt="";
//}
//else altlayer.style.visibility='hidden';}

</script>
<!--<div id = Layer3>
<tr><th ><img src="<%=request.getContextPath()%>/image/41.jpg" width="120" height="650" border="1px"/></th><th></th></tr>-->
</div>
<div id = Layer2>
	<tr><th ><img src="<%=request.getContextPath()%>/image/20.jpg" width="35" height="35" border="1px"/></th><th>可选座位</th></tr>

	<tr><th ><img src="<%=request.getContextPath()%>/image/38.jpg" width="35" height="35" border="1px"/></th><th>已选座位</th></tr>

	<tr><th ><img src="<%=request.getContextPath()%>/image/30.jpg" width="35" height="35" border="1px"/></th><th>选中座位</th></tr>
</div>
<form name = "form" action = "" method = "post">
<div id="Layer1" align="center">
<table>
<% int k = 0;for(int i = 1;i <= 2;i++){ %>
<tr>
<th width="42" height="42">
<%if(strList!=null && strList.size()>0&&strList.contains("V"+i+"-A")){%>
	<img    title="<%="V"+i+"-A"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="35" height="35" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%="V"+i+"-A"%>" name="tijiao" style="display:none">
	<img id=<%="V"+i+"-A"%>  name="seat" title="<%="V"+i+"-A"%>" src="<%=request.getContextPath()%>/image/20.jpg" width="35" height="35" border="1px" onClick="javascript:clickme(this.id);"  />
<%}%>
</th>
<th width="42">
<%if(strList!=null && strList.size()>0&&strList.contains("V"+i+"-B")){%>
	<img    title="<%="V"+i+"-B"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="35" height="35" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%="V"+i+"-B"%>" name="tijiao" style="display:none">
	<img id='<%="V"+i+"-B"%>'  name="seat" title="<%="V"+i+"-B"%>" src="<%=request.getContextPath()%>/image/20.jpg" width="35" height="35" border="1px" onClick="javascript:clickme(this.id);"  />
<%}%>
</th>
<th width="42">&nbsp;V&nbsp;</th>
<th width="53" height="42">
<%if(strList!=null && strList.size()>0&&strList.contains("V"+i+"-C")){%>
	<img    title="<%="V"+i+"-C"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="35" height="35" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%="V"+i+"-C" %>" name="tijiao" style="display:none">
	<img id='<%="V"+i+"-C"%>'  name="seat" title="<%="V"+i+"-C"%>" src="<%=request.getContextPath()%>/image/20.jpg" width="35" height="35" border="1px" onClick="javascript:clickme(this.id);"  />
<%}%>
</th>
<th>
	<%k++;if(strList!=null && strList.size()>0&&strList.contains("V"+i+"-D")){%>
	<img    title="<%="V"+i+"-D"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="35" height="35" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%="V"+i+"-D" %>" name="tijiao" style="display:none">
	<img id='<%="V"+i+"-D"%>'  name="seat" title="<%="V"+i+"-D"%>" src="<%=request.getContextPath()%>/image/20.jpg" width="35" height="35" border="1px" onClick="javascript:clickme(this.id);"  />
<%}%>
</th>
</tr>
<%} %>

</table>

<table>
<tr>
<th width="20" height="20">A</th>
<th width="20" height="20">B</th>
<th width="20" height="20">C</th>
<th width="42">&nbsp;&nbsp;&nbsp;</th>
<th width="20" height="20">D</th>
<th width="20" height="20">E</th>
<th width="20" height="20">F</th>
</tr>
<%k = 0;for(int i = 0;i < 18;i++){k++; %>
<tr>
<th width="20" height="20">
<%if(strList!=null && strList.size()>0&&strList.contains((k)+"A")){%>

	<img title="<%=(k)+"A"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"A"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"A"%>' name="seat" title="<%=(k)+"A"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>
</th>
<th width="20" height="20">
<%if(strList!=null && strList.size()>0&&strList.contains((k)+"B")){%>

	<img title="<%=(k)+"B"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"B"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"B"%>'  name="seat" title="<%=(k)+"B"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>
</th>

<th width="20" height="20">
<%if((k+"C").equals("1C")||(k+"C").equals("18C")||(strList!=null && strList.size()>0&&strList.contains((k)+"C"))){%>

	<img title="<%=(k)+"C"%>"   src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"C"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"C"%>'  name="seat" title="<%=(k)+"C"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>

</th>
<th width="42">&nbsp;<%=i+1%>&nbsp;</th>

<th width="20" height="20">
<%if((k+"D").equals("9D")||(strList!=null && strList.size()>0&&strList.contains((k)+"D"))){%>

	<img title="<%=(k)+"D"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"D"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"D"%>'  name="seat" title="<%=(k)+"D"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>

</th>

<th width="20" height="20">
<%if(strList!=null && strList.size()>0&&strList.contains((k)+"E")){%>

	<img title="<%=(k)+"E"%>" src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"E"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"E"%>'  name="seat" title="<%=(k)+"E"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>
</th>

<th width="20" height="20">
<%if(strList!=null && strList.size()>0&&strList.contains((k)+"F")){%>

	<img title="<%=(k)+"F"%>"   src="<%=request.getContextPath()%>/image/38.jpg" width="20" height="20" border="1px"/>
<%}else{%>
	<input type="checkbox" value= "<%=(k)+"F"%>"  name="tijiao" style="display:none">
	<img id='<%=(k)+"F"%>'  name="seat" title="<%=(k)+"F"%>"src="<%=request.getContextPath()%>/image/20.jpg" width="20" height="20" border="1px" onClick="javascript:clickme(this.id);" />
<%}%>
</th>
<%} %>
</table>

</div>
<div id = Layer4 align="center"><input type="button"  value="选  择" name = "submit1" onClick="javascript:xuanzuo();"></div>
</form>
</body>
</html>
