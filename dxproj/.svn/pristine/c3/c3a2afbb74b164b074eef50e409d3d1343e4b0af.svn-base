<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>填写意见</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<script type="text/javascript">
		function check()
		{
		   var advice = jsTrim(document.all("advice").value);
		   if (advice=="")
           {
              if (!confirm("您还没有填写意见,是否提交?"))
              {
                 document.all("advice").focus();
                 return false;
              }
           }
           if (advice.length > 1024)
           {
              alert("意见超出系统允许的范围");
              document.all("advice").focus();
              return false;
           }
		   return true;
		}
		
		 function getAdvice()
        { 
           var rtnMsg = window.showModalDialog('../../adviceAction.do?oper=list','获取审批常用语','dialogWidth=600px;DialogHeight=300px;scrollbars=no;help=no;resizable=no;center:yes');
           if (rtnMsg == undefined)
           return ;
           document.all("advice").value=rtnMsg;
        }
        function saveAdvice()
        {
         if (jsTrim(document.all("advice").value) == "")
         {
               alert("审批语不能为空");
               document.all("advice").focus();
               return ;
         }
          
         alert("当提交后,审批语才会保存");
         document.all("adviceFlag").value=1;
        }
		</script>
	</head>

	<body  oncontextmenu="if (!event.ctrlKey){return false;}" style="font-szie:12px;" bgcolor="#f0fafd">
	<html:form action="/gwlzclient/rejectAction.do?oper=submit"
			method="post" target="_top">
			<input type="hidden" name="adviceFlag" value="0"/>
	<html:hidden property="flowids" name="submitForm" value='<%=request.getParameter("flowids") %>'/>
		<table>
			<tr>
				<td>
					意见:&nbsp;&nbsp;<a href="#" onclick="javascript:getAdvice();" style="color:red">提取审批语</a>&nbsp;&nbsp;<a href="#" style="color:red" onclick="javascript:saveAdvice()">保存审批语</a>
				</td>
			</tr>
			<tr>
				<td>
				<html:textarea property="advice" rows="10" cols="50" name="submitForm"></html:textarea>
				</td>
			</tr>
			<tr align="center">
				<td>
					<input type="submit"  onclick="return check();" value="确 定">
					<input type="button" onclick="javascript:window.close();" value="取 消">
				<td>
			</tr>
		</table>
		</html:form>
	</body>
</html>
