<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.roc.enp.entity.BaTicketpoint"%>
<%@page import="com.roc.enp.entity.BaTicketprice"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="com.roc.syspe.entity.OpOrdertickets"%>

 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	OpOrdertickets flightinfo = (OpOrdertickets)request.getAttribute("flightinfo");
	java.util.List<BaTicketpoint> tpList = (java.util.List<BaTicketpoint>)request.getAttribute("tpList");
 	List<BaTicketprice> tprice = (List<BaTicketprice>)request.getAttribute("tprice");
 	String[] hourandmin = flightinfo.getFlyTime().split(":");
 	String hour = hourandmin[0];
 	String minute = hourandmin[1];
 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 	String currentDate = format.format(new Date());
 	Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
 	Integer status = Integer.valueOf(flightinfo.getStatus());
 	if(status > 1){
 		status = 9;
 	}else{
 		status = 8;
 	}
 	
  	java.util.Date date = flightinfo.getFlightDate();
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="all"
			href="<%=request.getContextPath()%>/js/calendar/themes/system.css"
			title="Calendar Theme - system.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar/src/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/verify.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/table.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/worktable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/calendar/src/calendar-setup.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
	
	
	

		<STYLE type="text/css">
<!--
.tearea{overflow-y:auto;padding:0;width:120px;height:30px;border:1px solid gray;}
.article {
BORDER-BOTTOM: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FILTER: revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); POSITION: absolute; VISIBILITY: hidden
; background-color: #FFCC00; padding-top: 3px; padding-right: 3px; padding-bottom: 3px; padding-left: 3px}
.btn2 {padding: 2 4 0 4;font-size:12px;height:23;background-color:#ece9d8;border-width:1;}


-->
</STYLE>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/engine.js'></script> 
	<script type='text/javascript' src='<%=request.getContextPath() %>/dwr/interface/SysmanagerDWR.js'> </script>
<SCRIPT language=JavaScript1.2>
<!--
window.name="mytab";
function selectAll1(data){
	var isSele = document.getElementById("checkId");
	var cAll = document.getElementsByName(check_name);
	
	if(isSele.checked){
		for(var i = 0;i<data;i++){
			cAll[i].checked='checked';
		}
	}else{
		for(var i = 0;i<data;i++){
			cAll[i].checked='';
		}
	}
   sumPrices(data);
}

function check(data)
		{	   
			 var name = document.getElementsByName("name");
			var certType = document.getElementsByName("certType");
			var certNo = document.getElementsByName("certNo");
			var linkphone = document.getElementsByName("linkphone");
			var ticketpointId = document.getElementsByName("ticketpointId");
			
			var halfpricecard =  document.getElementsByName("halfpricecard");
			var zeropricecard =  document.getElementsByName("zeropricecard");
			var priceId =  document.getElementsByName("priceId");
			var remark = document.getElementsByName("remark");
			
			var isT = document.getElementsByName("teamflag");
			var teamName = document.getElementsByName("teamName");
			var re =  /(^\d{15}$)|(^\d{17}([0-9]|X|x|Y|y)$)/;	
			 var nodes = document.getElementsByName(check_name);
		     var len=0;
		     
		     for (var i = 0; i < data; i++)
		     {
		        if (nodes[i].checked)
		        {
		          len++;
					    if(name[i].value==null||jsTrim(name[i].value)==''){
							alert('姓名不能为空，请重新填写！');
							name[i].focus();
							return;				
						}
						if(name[i].value.length>25){
							alert('姓名长度超出范围,不能超过25个字符！');
							name[i].focus();
							return;
							
						}
						if(certNo[i].value == null || jsTrim(certNo[i].value)==''){
							alert('证件号码不能为空，请填写！');
							certNo[i].focus();
							return;				
						}
						if(certNo[i].value.length>25){
							alert('证件号码长度超出范围，不能超过25个字符！');
							certNo[i].focus();
							return;				
						}
								
						if((certType[i].value=="身份证" || certType[i].value=="户口簿")){
							if (!(re.test(certNo[i].value)))     
			          		{   
			               		alert('输入的身份证号或户口簿号长度不对，或者号码不符合规定！/n15位号码应全为数字，18位号码末位可以为数字或X。');   
			             	 	certNo[i].focus();
			             	 	return false;   
			        	 	}   
						}
						if(linkphone[i].value==null||jsTrim(linkphone[i].value)==''){
							alert('联系电话不能为空，请重新填写！');
							linkphone[i].focus();
							return;				
						}
						if(linkphone[i].value.length>25){
							alert('联系电话长度超出范围,不能超过25个字符！');
							linkphone[i].focus();
							return;
							
						}
						if(ticketpointId[i].value==null||ticketpointId[i].value==''){
							alert('订票点不能为空，请重新填写！');				
							return;				
						}
						
						if(halfpricecard[i].value.length > 25){
							alert("五折优惠卡长度超出范围，不能超过25个字符！");
							halfpricecard[i].focus();
							return;
							
						}
						if(zeropricecard[i].value.length > 25){
							alert("全免优惠卡长度超出范围，不能超过25个字符！");
							zeropricecard.focus();
							return;
							
						}
						if(priceId[i].value == null || priceId[i].value==""){
							alert("票价不能为空，请选择！");
							priceId[i].focus();							
							return;
						}
						
						if(isT[i].value==1){
							if(teamName[i].value==null || jsTrim(teamName[i].value)==''||teamName[i].value.length==0){
								alert('团体名称不能为空，请填写！');	
								teamName[i].focus();			
								return;		
							}
						}
						if(remark[i].value.length>200){
							alert('备注长度超出范围,不能超过200个字符！');	
							remark[i].focus();			
							return;				
						}
		        }
		     }
		     if (len == 0)
		     {
		       alert('请选择要售票的记录');
		       return ;
		     }
		   if (!confirm("您确定信息保存完成进行团体售票吗？"))
		   {
		        return ;
		   }
		   document.getElementById("bt1").disabled="disabled";
		   document.getElementById("bt2").disabled="disabled";
			document.forms[0].submit();
		}
		function sumPrices(data){
			 var nodes = document.getElementsByName(check_name);
			 var priceId = document.getElementsByName("priceId");
			var sum = 0;
			for(var i=0;i<data;i++){
				 if (nodes[i].checked){		        
					if(priceId[i].value == null || priceId[i].value==""){
						continue;
					}
					sum+=parseFloat(priceId[i].value.split(";")[1]);
				}
			}
			document.getElementById("zpjsum").value=sum;
			document.getElementById("zpjsum1").value=sum;
		}

//-->
</script>
	</head>
	<body oncontextmenu="if (!event.ctrlKey){return false;}">	
	<div align="left">
		<div style="width: 100%" align="center">
		<FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">
			目的地：</FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #b22222; HEIGHT: 9pt">&nbsp; ${flightinfo.flight} &nbsp; </FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt"> 航班号：<font color="#b22222">${flightinfo.flightNo} &nbsp; &nbsp; &nbsp;</font></FONT><FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #000000; HEIGHT: 9pt">乘机日期：</FONT>&nbsp; <FONT style="FONT-SIZE: 12pt;font-weight:5;font-family:'黑体'; COLOR: #B22222; HEIGHT: 9pt"><fmt:formatDate value="${flightinfo.flightDate}" pattern="yyyy-MM-dd"/> &nbsp;${flightinfo.flyTime} &nbsp; 星期 <%=weeks%>
		</FONT>
		</div>
		
	</div>
	
	<form action="<%=request.getContextPath()%>/clientAction.do?method=saltTeamsTicket" method="post" target="mytab">&nbsp; 
	<table id="listtable" width="95%" border="0" align="center"  cellpadding="0" cellspacing="1" bgcolor="#3366FF">	
 
 <%List<OpOrdertickets> list = (List<OpOrdertickets>)request.getAttribute("list");
		int size = list.size(); %>
		<font>&nbsp; <input type="button" id="bt1" name="bt1" onclick="check(<%=size%>);" class="btn2" value="售 票" />
  	总票价：<input id="zpjsum" type="text" value="0" readonly="readonly"/>
  	</font>
  <tr bgcolor="#F0F0F0">
     <th width="80px" nowrap="nowrap"><input id="checkId" type="checkbox" onclick="selectAll1(<%=size%>);" />全选</th>
	 <th width="6%">姓名<font color="#FF0000">*</font></th>
     <th width="5%">证件类型</th>
    <th width="13%">证件号码<font color="#FF0000">*</font></th>
    
    <th width="9%">联系电话<font color="#FF0000">*</font></th>
    <th width="4%">VIP</th>    
    <th width="8%">订票点</th>
    <th width="10%">五折卡</th>
    <th width="5%">全免卡</th> 
      
    <th width="6%">付款方式</th>
    <th width="6%">票价类型<font color="#FF0000">*</font></th>
    <th width="6%">是否团队</th>
	<th width="8%">团队名称</th>
	<th width="8%">备注</th> 
  </tr>
	<%
		int k = 0;
		for(OpOrdertickets opt :list){
	 %>
	
	
  <tr bgcolor="#DFFFDF" onmouseout="this.bgColor='#DFFFDF'" onmouseover="this.bgColor='ffcccc'">
   <td width="80px" align="center">
<input type="checkbox" onclick="sumPrices(<%=size%>)" id="check<%=opt.getId()%>" name="check_box" value="<%=k%>"/>
<input type="hidden"  name="id" value="<%=opt.getId()%>"/>
	</td>
    <td width="6%"><input type="text" style="width: 100px" name="name" value="<%=opt.getName()%>"/></td>
    
    <td width="5%"><select  name="certType" style="width: 90px">
		
		<option value="身份证" <%=opt.getCertType()!=null && opt.getCertType().equals("身份证")?"selected='selected'":"" %> >身份证</option>
		<option value="军人证" <%=opt.getCertType()!=null && opt.getCertType().equals("军人证")?"selected='selected'":"" %>>军人证</option>
		<option value="户口簿" <%=opt.getCertType()!=null && opt.getCertType().equals("户口簿")?"selected='selected'":"" %>>户口簿</option>
		<option value="警官证" <%=opt.getCertType()!=null && opt.getCertType().equals("警官证")?"selected='selected'":"" %>>警官证</option>
		<option value="其他" <%=opt.getCertType()!=null && opt.getCertType().equals("其他")?"selected='selected'":"" %>>其他</option>
		
	</select></td>
    
    <td width="13%"><input style="width: 100%" type="text" name="certNo" value="<%=opt.getCertNo()%>"/></td>
 
   
    <td width="9%"><input style="width: 100px" type="text" name="linkphone" value="<%=opt.getLinkphone()%>"/></td>
   
    <td width="4%"><select name="vipFlag" style="width:50px">
			<option value="0"  <%=opt.getVipFlag()!=null && opt.getVipFlag().equals("0")?"selected='selected'":"" %>>否</option>
			<option value="1"  <%=opt.getVipFlag()!=null && opt.getVipFlag().equals("1")?"selected='selected'":"" %>>是</option>
		</select>	</td>
    
    <td width="8%"><select id="ticketpointId" name="ticketpointId" style="width: 90px">
			<%for(BaTicketpoint tp: tpList){ %>
				<option value="<%=tp.getId() %>" <%=tp.getId().equals(opt.getTicketpointId())?"selected='selected'":""%>><%=tp.getName()%></option>
			<%}%>			
		</select></td>
  
   
    <td width="10%"><input type="text" name="halfpricecard" style="width: 100px" value="<%=opt.getHalfpricecard()==null?"":opt.getHalfpricecard()%>"/></td>
   
    <td width="5%"><input type="text" name="zeropricecard" style="width: 100px" value="<%=opt.getZeropricecard()==null?"":opt.getZeropricecard()%>"/></td>
   
    <td width="6%">
    <select  name="payment" style="width: 90px">
    	<option value="现金" >现金</option>
    	<option value="支票" >支票</option>
    	<option value="银行卡" >银行卡</option>
    </select>
   </td>
 
    
    <td  width="6%">
    <select  name="priceId" onchange="sumPrices(<%=size %>);" style="width: 90px">

    	<%for(BaTicketprice tpr:tprice){%>    	
    	<option value="<%=tpr.getId()+";"+tpr.getRealAmount()%>" <%=tpr.getRealAmount() ==1350||tpr.getRealAmount()==1000?"selected='selected'":"" %>><%=tpr.getDiscountType()+"("+tpr.getRealAmount()+")"%></option>
    	<%} %>
    </select>   
  </td>
  <td width="6%">
  	<select  name="teamflag" style="width: 50px">
    	<option value="0"  >否</option>
			<option value="1"  selected='selected'>是</option>
			
    </select>  
  </td>
	<td width="8%"><input type="text"  style="width: 100px" name="teamName" value="<%=opt.getTeamName()==null?"":opt.getTeamName()%>"/></td>
   
    <td width="8%"><textarea id="remark" name="remark" class="tearea"><%=opt.getRemark()==null?"":opt.getRemark()%></textarea></td>
  </tr>
		
		


<%k++;} %>
</table>
</form>
<font>&nbsp; <input type="button" id="bt2" name="bt" class="btn2" value="售 票" onclick="check(<%=size%>)"/>
 总票价：<input id="zpjsum1" type="text" value="0" readonly="readonly"/></font>
 
  </body>
</html>

