<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.DocService" />
<jsp:directive.page import="com.founder.enp.entity.DocEntity" />
<jsp:directive.page import="com.founder.enp.entity.Attache" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.entity.Flows" />
<jsp:directive.page import="com.founder.enp.entity.DocFlowsKeyWord" />

<%
	DocService service = new DocService();
	DocEntity docEntity = service.getDoc(Integer.parseInt(request
			.getParameter("docid")));
	String createTime = docEntity.getCreatetime();
	String[] splitTime = createTime.split("-");
	List list = service.getDocAttache(Integer.parseInt(request
			.getParameter("docid")));
	Iterator iter = list.iterator();
	int n = 1;
	DocFlowsKeyWord keyword = new DocFlowsKeyWord();
	keyword.setDocid(Integer.parseInt(request.getParameter("docid")));
	keyword.setPowergroup(2);
	List cbcList = service.getPowerGroupAdvice(keyword);
	Iterator iterCbc = cbcList.iterator();
	keyword.setPowergroup(3);
	List cbbsList = service.getPowerGroupAdvice(keyword);
	Iterator iterCbbs = cbbsList.iterator();
	keyword.setPowergroup(4);
	List sjList = service.getPowerGroupAdviceLeader(keyword);
	Iterator iterSj = sjList.iterator();
	keyword.setPowergroup(5);
	List jxList = service.getPowerGroupAdviceLeader(keyword);
	Iterator iterJx = jxList.iterator();
	List hqList = service.getSounterSignAdvice(keyword);
	Iterator iterHq = hqList.iterator();
	String auditor = service.getAuditor(Integer.parseInt(request
			.getParameter("docid")));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'printPage_fixed.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
	</head>

	<body
		style="backgroud-position:left top;left:0px;width:795px;position:absolute;top:0px;height:1050px;"
		ms_positioning="GridLayout" topmargin="0" bottommargin="0">
		<div style="left:31mm;position:absolute;top:25mm;OVERFLOW:hidden">
			<span style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getTitle()%>
			</span>
		</div>
		<div style="left:54mm;position:absolute;top:15mm;OVERFLOW:hidden">
			<span style='font-size:15.0pt;font-family:仿宋_GB2312'><%=splitTime[0]%>
			</span>
		</div>
		<div style="left:70mm;position:absolute;top:15mm;OVERFLOW:hidden">
			<span style='font-size:15.0pt;font-family:仿宋_GB2312'><%=splitTime[1]%>
			</span>
		</div>
		<div style="left:80mm;position:absolute;top:15mm;OVERFLOW:hidden">
			<span style='font-size:15.0pt;font-family:仿宋_GB2312'><%=splitTime[2]%>
			</span>
		</div>
		<div style="left:20mm;position:absolute;top:36mm;OVERFLOW:hidden">
			<span style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getSecret()%>
			</span>
		</div>
		<div style="left:121mm;position:absolute;top:15mm;OVERFLOW:hidden">
			<span style='font-size:15.0pt;font-family:仿宋_GB2312'><%=request.getParameter("docid")%>
			</span>
		</div>
		<div style="left:99mm;position:absolute;top:36mm;OVERFLOW:hidden">
			<span style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getUrgence()%>
			</span>
		</div>
		<div style="left:25mm;position:absolute;top:46mm;OVERFLOW:hidden">
			<span style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getCreator()%>
			</span>
		</div>
		<div style="left:105mm;position:absolute;top:46mm;OVERFLOW:hidden">
			<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=auditor == null ? "" : auditor%></span>
		</div>
		<div style="left:7mm;position:absolute;top:61mm;width:165mm;height:13mm;OVERFLOW:hidden;line-height:25px">
			<span
								style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%
					while (iterCbc.hasNext()) {
					Flows flows = (Flows) iterCbc.next();
					String[] splitTimeCbc = flows.getOpertime().split("-");
			%>
                       
			<%=flows.getAdvice()%>&nbsp;&nbsp;<%=flows.getFlowtor()%>&nbsp;<%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%><br>
			<%
			}
			%>
			</span>
		</div>
		<div
			style="left:6mm;position:absolute;top:84mm;width:77mm;height:34mm;OVERFLOW:hidden;line-height:25px">
			<span
								style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%
					while (iterCbbs.hasNext()) {
					Flows flows = (Flows) iterCbbs.next();
					String[] splitTimeCbc = flows.getOpertime().split("-");
			%>
			<%=flows.getAdvice()%>&nbsp;&nbsp;<%=flows.getFlowtor()%>&nbsp;<%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%><br>
			<%
			}
			%>
			</span>
		</div>
		<div
			style="left:89mm;position:absolute;top:84mm;width:82mm;height:34mm;OVERFLOW:hidden;line-height:25px">
			<span
								style='font-size:12.0pt;
  font-family:仿宋_GB2312;line-height:25px'><%
					while (iterHq.hasNext()) {
					Flows flows = (Flows) iterHq.next();
					String[] splitTimeCbc = flows.getOpertime().split("-");
			%>
			<%=flows.getAdvice()%>&nbsp;&nbsp;<%=flows.getFlowtor()%>&nbsp;<%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%><br>
			<%
			}
			%>
			</span>
		</div>
		<div
			style="left:6mm;position:absolute;top:127mm;width:165mm;height:92mm;OVERFLOW:hidden;line-height:25px">
			<span
								style='font-size:12.0pt;
  font-family:仿宋_GB2312;line-height:25px'><%
while (iterSj.hasNext()) {
					Flows flows = (Flows) iterSj.next();
					String[] splitTimeCbc = flows.getOpertime().split("-");
					
			%>
			<%=flows.getAdvice()%>&nbsp;&nbsp;<%=flows.getFlowtor()%>&nbsp;<%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%><br>
			<%
			}
			%>
			<%
while (iterJx.hasNext()) {
					Flows flows = (Flows) iterJx.next();
					String[] splitTimeCbc = flows.getOpertime().split("-");
					
			%>
			<%=flows.getAdvice()%>&nbsp;&nbsp;<%=flows.getFlowtor()%>&nbsp;<%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%><br>
			<%
			}
			%>
			</span>
		</div>
		<div
			style="left:6mm;position:absolute;top:229mm;width:165mm;height:14mm;OVERFLOW:hidden;line-height:25px">
			<u> <%
 		while (iter.hasNext()) {
 		Attache attache = (Attache) iter.next();
 %><span lang=EN-US style='font-size:12.0pt;font-family:仿宋_GB2312'><%=n%>
			</span> </u><u><span style='font-size:12.0pt;font-family:仿宋_GB2312'>、<%=attache.getTitle()%>&nbsp;&nbsp;<%
 	n++;
 	}
 %>
			
			</u>
		</div>
	</body>
</html>
