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
	String auditor = service.getAuditor(Integer.parseInt(request.getParameter("docid")));
%>
<html>

	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta name=Generator content="Microsoft Word 11 (filtered)">
		<title>中 国 记 协 公 文 办 理 单</title>
		<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:华文中宋;
	panose-1:2 1 6 0 4 1 1 1 1 1;}
@font-face
	{font-family:仿宋_GB2312;
	panose-1:2 1 6 9 3 1 1 1 1 1;}
@font-face
	{font-family:"\@华文中宋";
	panose-1:2 1 6 0 4 1 1 1 1 1;}
@font-face
	{font-family:"\@仿宋_GB2312";
	panose-1:2 1 6 9 3 1 1 1 1 1;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Times New Roman";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:9.0pt;
	font-family:"Times New Roman";}
 /* Page Definitions */
 @page Section1
	{size:595.3pt 841.9pt;
	margin:59.55pt 82.2pt 59.55pt 82.2pt;
	layout-grid:15.6pt;}
div.Section1
	{page:Section1;}
-->
</style>
		<style media=print>  
.Noprint{display:none;}<!--用本样式在打印时隐藏非打印项目-->  
.PageNext{page-break-after: always;}<!--控制分页-->  
</style>
		<object id="WebBrowser" width=0 height=0
			classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2">
		</object>
		<script type="text/javascript" src="../js/print.js">
		</script>
		<script type="text/javascript">
		docid=<%=request.getParameter("docid")%>;
		function printFixedAppTest()
		{
		   	   	var width=screen.width;
			var height=screen.height;
		
			var xPosition=0;
			var yPosition=0;
			if ((parseInt(navigator.appVersion) >= 4 ))
			{
				xposition = (screen.width - width) / 2;
				yposition = (screen.height - height) / 2;
			}
			var theWindowProperty="toolbar=0,"
			+ "width=" + (width-10) + ","
			+ "height=" + (height-56) + ","
		        + "resizable=1,"
		        + "scrollbars=1,"
			+ "screenx=" + xposition + "," //for Netscape
			+ "screeny=" + yposition + "," //for Netscape
			+ "left=" + xposition + "," //IE
			+ "top=" + yposition; //IE
			var newwin=window.open("printPage_fixed.jsp?docid="+docid,"_blank",theWindowProperty);
		}
		</script>
	</head>

	<body lang=ZH-CN style='text-justify-trim:punctuation'>
		<p align=right>
			<input type=button value="套打本页" class="Noprint"
				onclick="javascript:printFixedApp()">
			<input type=button value="打印本页" class="Noprint"
				onclick="javascript:window.print()" />
			<input type=button value="打印预览" class="Noprint"
				onclick="javascript:document.all.WebBrowser.ExecWB(7,1)">
			<input type=button value="打印设置" class="Noprint"
				onclick="javascript:document.all.WebBrowser.ExecWB(8,1)">
		</p>

		<div class=Section1 style='layout-grid:15.6pt'>

			<p class=MsoNormal align=center
				style='text-align:center;line-height:28.0pt'>
				<b><span style='font-size:22.0pt;font-family:华文中宋;color:red'>中
						国 记 协 公 文 办 理 单</span>
				</b>
			</p>

			<p class=MsoNormal style='text-align:center;line-height:28.0pt'>
				<span style='font-size:15.0pt;font-family:仿宋_GB2312;color:red'>（
				</span><span style='font-size:15.0pt;font-family:仿宋_GB2312'>&nbsp;<span
					lang=EN-US><%=splitTime[0]%> </span><span style='color:red'>年</span>
					<span lang=EN-US><%=splitTime[1]%>
				</span><span style='color:red'>月 </span><span lang=EN-US><%=splitTime[2]%>
				</span><span style='color:red'>日）<span lang=EN-US>&nbsp;&nbsp;&nbsp;
					</span>编号：</span><span lang=EN-US><%=request.getParameter("docid")%>
				</span>
				</span>
			</p>

			<table align=center class=MsoNormalTable border=1 cellspacing=0
				cellpadding=0 width=636
				style='width:477.0pt;border-collapse:collapse;border:none'>
				<tr style='height:19.35pt'>
					<td width=96 valign=top
						style='width:72.0pt;border:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:19.35pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>标题</span>
						</p>
					</td>
					<td width=540 colspan=3 valign=top
						style='width:405.0pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0cm 5.4pt 0cm 5.4pt;height:19.35pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getTitle()%>
							</span>
						</p>
					</td>
				</tr>
				<tr style='height:26.45pt'>
					<td width=300 colspan=2 valign=top
						style='width:225.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:26.45pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>密级：</span><span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getSecret()%>
							</span>
						</p>
					</td>
					<td width=336 colspan=2 valign=top
						style='width:252.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:26.45pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>缓急：</span><span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getUrgence()%>
							</span>
						</p>
					</td>
				</tr>
				<tr style='height:18.4pt'>
					<td width=300 colspan=2 valign=top
						style='width:225.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:18.4pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>拟稿人：</span><span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=docEntity.getCreator()%>
							</span>
						</p>
					</td>
					<td width=336 colspan=2 valign=top
						style='width:252.0pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:18.4pt'>
						<p class=MsoNormal style='line-height:28.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>核稿人：</span><span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312'><%=auditor == null ? "" : auditor%>
							</span>
						</p>
					</td>
				</tr>
				<tr style='height:49.2pt'>
					<td width=636 colspan=4 valign=top
						style='width:477.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:49.2pt'>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>承办处意见：</span>
						</p>
						<%
								while (iterCbc.hasNext()) {
								Flows flows = (Flows) iterCbc.next();
								String[] splitTimeCbc = flows.getOpertime().split("-");
						%>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span style='font-size:12.0pt;font-family:仿宋_GB2312'><%=flows.getAdvice()%>&nbsp;&nbsp;<span
								style='color:blue'><%=flows.getFlowtor()%>&nbsp;<span lang=EN-US><%=splitTimeCbc[0]%>.<%=splitTimeCbc[1]%>.<%=splitTimeCbc[2]%>
								</span>
							</span>
							</span>
						</p>
<%
						}
						%>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
						
					</td>
				</tr>
				<tr style='height:120.15pt'>
					<td width=312 colspan=3 valign=top
						style='width:234.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:120.15pt'>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>主办部室领导意见：</span>
						</p>
						<%
								while (iterCbbs.hasNext()) {
								Flows flows = (Flows) iterCbbs.next();
								String[] splitTimeCbbs = flows.getOpertime().split("-");
						%>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%=flows.getAdvice()%>&nbsp;&nbsp;<span
								style='color:blue'><%=flows.getFlowtor()%>&nbsp;<span
									lang=EN-US><%=splitTimeCbbs[0]%>.<%=splitTimeCbbs[1]%>.<%=splitTimeCbbs[2]%>
								</span>
							</span>
							</span>
						</p>
                                               <%
						}
						%>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:12.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
						
					</td>
					<td width=324 valign=top
						style='width:243.0pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt;height:120.15pt'>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>会办部室领导意见：</span>
						</p>
						<%
								while (iterHq.hasNext()) {
								Flows flows = (Flows) iterHq.next();
								String[] splitTimeHq = flows.getOpertime().split("-");
						%>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%=flows.getAdvice()%>&nbsp;&nbsp;<span
								style='color:blue'><%=flows.getFlowtor()%>&nbsp;<span
									lang=EN-US><%=splitTimeHq[0]%>.<%=splitTimeHq[1]%>.<%=splitTimeHq[2]%>
								</span>
							</span>
							</span>
						</p>
						<%
						}
						%>
					</td>
				</tr>
				<tr style='height:218.4pt'>
					<td width=636 colspan=4 valign=top
						style='width:477.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:218.4pt;'>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>记协领导意见：</span>
						</p>
						
						<%
								while (iterSj.hasNext()) {
								Flows flows = (Flows) iterSj.next();
								String[] splitTimeSj = flows.getOpertime().split("-");
						%>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%=flows.getAdvice()%>&nbsp;&nbsp;<span
								style='color:blue'><%=flows.getFlowtor()%>&nbsp;<span
									lang=EN-US><%=splitTimeSj[0]%>.<%=splitTimeSj[1]%>.<%=splitTimeSj[2]%>
								</span>
							</span>
							</span>
						</p>
						<%
						}
						%>
						<%
								while (iterJx.hasNext()) {
								Flows flows = (Flows) iterJx.next();
								String[] splitTimeJx = flows.getOpertime().split("-");
						%>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span style='font-size:12.0pt;
  font-family:仿宋_GB2312'><%=flows.getAdvice()%>&nbsp;&nbsp;<span
								style='color:blue'><%=flows.getFlowtor()%>&nbsp;<span
									lang=EN-US><%=splitTimeJx[0]%>.<%=splitTimeJx[1]%>.<%=splitTimeJx[2]%>
								</span>
							</span>
							</span>
						</p>
						<%
						}
						%>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:12.0pt;font-family:仿宋_GB2312;color:blue'>&nbsp;</span>
						</p>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:12.0pt;font-family:仿宋_GB2312;color:blue'>&nbsp;</span>
						</p>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr style='height:38.6pt'>
					<td width=636 colspan=4 valign=top
						style='width:477.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:38.6pt'>
						<p class=MsoNormal style='line-height:16.0pt'>
							<span
								style='font-size:14.0pt;
  font-family:仿宋_GB2312;color:red'>文件附件：</span>
  </p><p class=MsoNormal style='line-height:16.0pt'><u>
     <%
										while (iter.hasNext()) {
										Attache attache = (Attache) iter.next();
								%><span lang=EN-US
								style='font-size:12.0pt;font-family:仿宋_GB2312'><%=n%>
							</span>
							</u><u><span style='font-size:12.0pt;font-family:仿宋_GB2312'>、<%=attache.getTitle()%>&nbsp;&nbsp;<%
								n++;
								}
							%>
							
							</u>
						</p>
						<p class=MsoNormal style='line-height:22.0pt'>
							<span lang=EN-US
								style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>&nbsp;</span>
						</p>
					</td>
				</tr>
				<tr height=0>
					<td width=96 style='border:none'></td>
					<td width=204 style='border:none'></td>
					<td width=12 style='border:none'></td>
					<td width=324 style='border:none'></td>
				</tr>
			</table>

			<p class=MsoNormal align=center style='text-align:center'>
				<span lang=EN-US style='color:red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</span><span style='font-size:14.0pt;font-family:仿宋_GB2312;color:red'>中国记协办公室印制</span>
			</p>

		</div>

	</body>

</html>
