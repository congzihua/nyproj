<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocTypesService" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.DocTypes" />

<%
	DocTypesService service = new DocTypesService();
	List list = service.getAllDocTypes();

	if (list == null || list.size() == 0) {
		out.println("<font size=5 color=red>没有可用公文文号，请先定制公文文号</font>");
		return;
	}
	Iterator iter = list.iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>选择规则</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/common.js"></script>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
       <script type="text/javascript">
       var doctypeidGlobal="";
       function getDocNum()
       {
           var doctypeid = document.all("doctypes").value;
           doctypeidGlobal = doctypeid;
           var sUrl = "../../gwlzadmin/docnum/docNumAction.do?oper=getDocNum&typeid="+doctypeid;
		   new net.ContentLoader(sUrl, doFinishGetDocNum); 
          
       }
       function doFinishGetDocNum()
       {
           var number = this.getReq().responseText;
           if (number == 'getNumError')
           {
              alert("获取公文文号错误, 用户正在使用此文号");
              return ;
           }
           var info = new Object();
           info.number=number;
           info.id=doctypeidGlobal;
           window.returnValue = info;
           window.close();
       }
       function closeWindow()
       {

            var info = new Object();
           info.number="";
           info.id="";
           window.returnValue = info;
           window.close();
       }
       
       
       </script>
	</head>

	<body style="margin:5px"
		oncontextmenu="if (!event.ctrlKey){return false;}" bgcolor="e1e7fb">
		<table>
			<tr>
				<td>
					<select style="width:200" name="doctypes" id="doctypes" size=12>
						<%
								if (iter.hasNext()) {
								DocTypes docTypes = (DocTypes) iter.next();
						%>
						<option selected value="<%=docTypes.getDoctypeid()%>">
							<%=docTypes.getTypename()%>
						</option>
						<%
							}
							while (iter.hasNext()) {
								DocTypes docTypes = (DocTypes) iter.next();
						%>
						<option value="<%=docTypes.getDoctypeid()%>">
							<%=docTypes.getTypename()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td valign="top">
					<table>
						<tr>
							<td>
								<input type="button" value="确 定" onclick="javascript:getDocNum();" class="button2">
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="取 消" onclick="javascript:closeWindow();" class="button2">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
