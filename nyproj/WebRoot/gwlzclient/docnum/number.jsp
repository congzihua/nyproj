<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%
  String docid = request.getParameter("docid");
 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>生成文号操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" href="../../css/admin.css"> 
	<script type="text/javascript" src="../../js/common.js"></script>
	<script type="text/javascript">
	function getDocNum()
	{

	  var rtnMsg = window.showModalDialog('rule.jsp','选择规则','dialogWidth=400px;DialogHeight=300px;scrollbars=no;help=no;resizable=no;center:yes');
      document.all("number").value=rtnMsg.number;
      document.all("doctypeid").value=rtnMsg.id;
      document.all("docNum").value=rtnMsg.number;
	}
	function check()
	{
	   if (document.all("docNum").value == "")
	   {
	     alert("还没有获得文号");
	     return false;
	   }
	     
	   
	}
    function doUnLoad()
    {
        var sUrl = "../../gwlzadmin/monitor/watchesAction.do?oper=cleardoctypeid";
		new net.ContentLoader(sUrl, doFinishClearDoctypeid); 
    }
    function doFinishClearDoctypeid()
    { 
    }
	</script>
  </head>
  
  <body onunload="javascript:doUnLoad();"  style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}" bgcolor="#f0fafd">
			<html:form action="/gwlzclient/docNumOperAction.do"
			method="post" target="_top">
			<html:hidden property="docid" value="<%=docid %>" name="docNumOperForm"/>
			<html:hidden property="doctypeid" name="docNumOperForm"/>
			<html:hidden property="docNum" name="docNumOperForm"/>
    <table align="center" style="font-size:14px">
    <tr>
    <td>
    &nbsp;
    </td>
    </tr>
    <tr >

    <td>
       文号：
    </td>
    <td>
    <input type="text" size="30" name="number" id="number"  readonly  name="number"/>
    </td>
    <td>
    <input type="button"value="获取文号"  onclick="javascript:getDocNum()" class="button2">
    </td>
    </tr>
    <tr>
    <td colspan=5 align="center">
     <input type="submit" value="保 存" onclick="return check();" class="button2">
 
     <input type="button" value="取 消" onclick="javascript:window.close();" class="button2">
    </td>
    </tr>
    </table>
    </html:form>
  </body>
</html>
