<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat" />
<jsp:directive.page import="com.founder.enp.forms.DocsForm" />
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:directive.page import="com.founder.enp.entity.DocTypes" />
<jsp:directive.page import="com.founder.enp.service.DocTypesService" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="java.util.Iterator" />
<jsp:directive.page import="com.founder.enp.service.DocService"/>
<jsp:directive.page import="com.founder.enp.entity.Flows"/>
<jsp:directive.page import="com.founder.enp.entity.DocFlowsKeyWord"/>
<jsp:directive.page import="com.founder.enp.forms.SelectTemplateForm" />
<%
	Authorization authorization = (Authorization) request.getSession()
			.getAttribute("authorization");
	SelectTemplateForm form = (SelectTemplateForm) session
			.getAttribute("selectTemplate");
	//String docTypeid = form.getDoctypesid();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String now = format.format(new java.util.Date());
	DocsForm frm = null;
	String docid = "0";
	if (session.getAttribute("docsForm") == null) {
		frm = new DocsForm();
	} else {
		frm = (DocsForm) session.getAttribute("docsForm");
		System.out.print(frm.getCreator()+"===");
	} 
	String docOper = session.getAttribute("docOper") == null ? "": (String) session.getAttribute("docOper");
	if (!docOper.equals(""))
	{docid = String.valueOf(frm.getDocid());
	}
	 DocService service = new DocService();
	
	  DocFlowsKeyWord keyword = new DocFlowsKeyWord();
   keyword.setDocid(Integer.parseInt(docid)) ;
   keyword.setPowergroup(2);
   List cbcList = service.getPowerGroupAdvice(keyword);
   Iterator iterCbc = cbcList.iterator();
   StringBuffer cbcBuffer = new StringBuffer();
   while (iterCbc.hasNext())
   {
      Flows flows = (Flows)iterCbc.next();
      cbcBuffer.append(flows.getAdvice()).append("   ").append(flows.getFlowtor()).append("   ").append(flows.getOpertime()).append("\r\n");
   }
   keyword.setPowergroup(3);
   List cbbsList = service.getPowerGroupAdvice(keyword);
   Iterator iterCbbs = cbbsList.iterator();
    StringBuffer cbbsBuffer = new StringBuffer();
   while (iterCbbs.hasNext())
   {
      Flows flows = (Flows)iterCbbs.next();
      cbbsBuffer.append(flows.getAdvice()).append("   ").append(flows.getFlowtor()).append("   ").append(flows.getOpertime()).append("\r\n");
   }
   keyword.setPowergroup(4);
   List sjList = service.getPowerGroupAdviceLeader(keyword);
   Iterator iterSj = sjList.iterator();
    StringBuffer JxBuffer = new StringBuffer();
   while (iterSj.hasNext())
   {
      Flows flows = (Flows)iterSj.next();
      JxBuffer.append(flows.getAdvice()).append("   ").append(flows.getFlowtor()).append("   ").append(flows.getOpertime()).append("\r\n");
   }
   keyword.setPowergroup(5);
   List jxList = service.getPowerGroupAdviceLeader(keyword);
   Iterator iterJx = jxList.iterator();
   
   while (iterJx.hasNext())
   {
      Flows flows = (Flows)iterJx.next();
      JxBuffer.append(flows.getAdvice()).append("   ").append(flows.getFlowtor()).append("   ").append(flows.getOpertime()).append("\r\n");
   }
   List hqList = service.getSounterSignAdvice(keyword);
   Iterator iterHq = hqList.iterator();
     StringBuffer hqBuffer = new StringBuffer();
   while (iterHq.hasNext())
   {
      Flows flows = (Flows)iterHq.next();
      hqBuffer.append(flows.getAdvice()).append("   ").append(flows.getFlowtor()).append("   ").append(flows.getOpertime()).append("\r\n");
   }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'param.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link rel="stylesheet" href="../../css/admin.css">
		<script type="text/javascript" src="../../js/verify.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="../../js/calendar/themes/system.css"
			title="Calendar Theme - system.css">

		<script type="text/javascript" src="../../js/calendar/src/utils.js"></script>
		<script type="text/javascript" src="../../js/calendar/src/calendar.js"></script>
		<!-- import the language module -->
		<script type="text/javascript"
			src="../../js/calendar/lang/calendar-zh.js"></script>
		<script type="text/javascript"
			src="../../js/calendar/src/calendar-setup.js"></script>
		<script type="text/javascript">
		function check()
		{
		   var creator = jsTrim(document.all("creator").value);
		   if (creator=="")
		   {
		       alert("拟稿人不能为空");
		       document.all("creator").focus();
		       return false;
		   }
		   if (creator.length > 128)
		   {
		       alert("拟稿人超出范围");
		       document.all("creator").focus();
		       return false;
		   }
		   var secret = document.all("secretSelect").value;
		   document.all("secret").value = secret;
           var urgence = document.all("urgenceSelect").value;
           document.all("urgence").value=urgence;
           var title = jsTrim(document.all("title").value);
           if (title == "")
           {
              alert("文件标题不能为空");
              document.all("title").focus();
              return false;
           }
           if (title.length > 256)
           {
              alert("文件标题超出范围");
              document.all("title").focus();
              return false;
           }
           var toOrg = jsTrim(document.all("toOrg").value);
          
           if (toOrg.length > 128)
           {
              alert("主送单位超出范围");
              document.all("toOrg").focus();
              return false;
           }
           
           var copyto = jsTrim(document.all("copyto").value);
          
           if (copyto.length > 128)
           {
              alert("抄送单位超出范围");
              document.all("copyto").focus();
              return false;
           }
           var keywords =  jsTrim(document.all("keywords").value);
           
           if (keywords.length > 128)
           {
              alert("关键词超出范围");
              document.all("keywords").focus();
              return false;
           }
           document.all("publishtime").value = document.all("publishtimef").value;
           document.all("maketime").value = document.all("publishtimem").value;
            var publishOrg = jsTrim(document.all("publishOrg").value);
         
           if (publishOrg.length > 40)
           {
              alert("发文单位超出范围");
              document.all("publishOrg").focus();
              return false;
           }
           document.all("createmode").value=document.all("createmodeSelect").value;
           document.all("typename").value=document.all("typenameSelect").value;
           var createorg = jsTrim(document.all("createorg").value);
           if (createorg.length > 40)
           {
              alert("制作单位超出范围");
              document.all("createorg").focus();
              return false;
           }
           document.all("publishlevel").value=document.all("publishlevelSelect").value;
           document.all("secretime").value=document.all("secretimeSelect").value;
		}
		function Init()
		{
		   parent.oper.location.reload();
		}
		</script>
	</head>
	<body onload="javascript:Init();"  style="margin:0px"
		oncontextmenu="if (!event.ctrlKey){return false;}">
		<html:form action="/gwlzclient/doc/docSessionAction.do?oper=param"
			method="post">
			<html:hidden property="secret" name="docsForm" />
			<html:hidden property="docid" value="<%=docid%>" name="docsForm" />
			<html:hidden property="urgence" name="docsForm" />
			<html:hidden property="publishtime" name="docsForm" />
			<html:hidden property="maketime" name="docsForm" />
			<html:hidden property="createmode" name="docsForm" />
			<html:hidden property="typename" name="docsForm" />
			<html:hidden property="publishlevel" name="docsForm" />
			<html:hidden property="secretime" name="docsForm" />

			<table align="center">
				<tr>
					<td align="center" style="font-size:25;color:red">
						公文属性
					</td>
				</tr>
				<tr>
					<td>
						<table bgcolor="#000000" cellpadding="4" cellspacing="1"
							style="color: red;font-size:12">

							<tr bgcolor="#ffffff">
								<td>
									发文字号：
								</td>
								<td>
								
								<html:text property="docnum" readonly="true" value="<%=frm.getDocnum() %>"  styleClass="textbox2" name="docsForm">
									</html:text>
								
								</td>
								<td>
									拟稿人：
								</td>
								<td>
									<html:text property="creator"
										value='<%=(frm.getCreator()).equals("") ? authorization.getName() : frm.getCreator()%>'
										styleClass="textbox2" name="docsForm">
									</html:text>
								</td>

								<td>
									秘密等级：
								</td>
								<td>
									<select name="secretSelect" style="width:140px">

										<option <%if (frm.getSecret().equals("")){%> selected <%} %>
											value="">

										</option>
										<option <%if (frm.getSecret().equals("秘密")){%> selected <%} %>
											value="秘密">
											秘密
										</option>
										<option <%if (frm.getSecret().equals("机密")){%> selected <%} %>
											value="机密">
											机密
										</option>
										<option <%if (frm.getSecret().equals("绝密")){%> selected <%} %>
											value="绝密">
											绝密
										</option>
									</select>
								</td>
								<td>
									紧急程度：
								</td>
								<td colspan=3>
									<select name="urgenceSelect" style="width:100px">
										<option <%if (frm.getUrgence().equals("")){%> selected <%} %>
											value="">

										</option>
										<option <%if (frm.getUrgence().equals("平急")){%> selected <%} %>
											value="平急">
											平急
										</option>
										<option <%if (frm.getUrgence().equals("加急")){%> selected
											<%} %> value="加急">
											加急
										</option>
										<option <%if (frm.getUrgence().equals("特急")){%> selected
											<%} %> value="特急">
											特急
										</option>
										<option <%if (frm.getUrgence().equals("特提")){%> selected
											<%} %> value="特提">
											特提
										</option>
									</select>
								</td>
							</tr>

							<tr bgcolor="#ffffff">
								<td>
									文件标题：
								</td>
								<td colspan="5">
									<html:textarea property="title" value="<%=frm.getTitle()%>"
										style="BORDER: #000000 1px dotted;text-align:left;" cols="70"
										rows="2" name="docsForm">
									</html:textarea>

								</td>
								<td>
									印发份数：
								</td>

								<td>
								<%if (docOper.equals("finish"))
								{ %>
										<html:text property="printnum"  onkeypress="enterNumber()"  value='<%=String.valueOf(frm.getPrintnum()==null?"":frm.getPrintnum()) %>' 	style="text-align:center" size="10"  styleClass="textbox2" name="docsForm">
									</html:text>
                                <%}
                                else { %>
                                
                                <input type="text"  value="<%=String.valueOf(frm.getPrintnum()==null?"":frm.getPrintnum()) %>" onkeypress="enterNumber()" readonly
										style="text-align:center" class="textbox2" size="10" />
                                
                                <%} %>

								</td>
							</tr>

							<tr bgcolor="#ffffff">
								<td>
									发送范围：
								</td>
								<td colspan="10">
									<table style="color: red;font-size:12">
										<tr>
											<td>
												主送单位：
											</td>
											<td>
												<html:text property="toOrg" value="<%=frm.getToOrg()%>"
													name="docsForm" styleClass="textbox2" size="80">
												</html:text>

											</td>
										</tr>
										<tr>
											<td>
												抄送单位：
											</td>
											<td>
												<html:text property="copyto" value="<%=frm.getCopyto()%>"
													name="docsForm" styleClass="textbox2" size="80">
												</html:text>
											</td>
										</tr>

									</table>
								</td>
							</tr>

							<tr bgcolor="#ffffff">
								<td>
									主题词：
								</td>
								<td colspan=3>
									<html:text property="keywords" value="<%=frm.getKeywords()%>"
										name="docsForm" styleClass="textbox2" size="50">
									</html:text>
								</td>
								<td>
									印发日期：
								</td>
								<td>
								 
									<input name="publishtimef" type="button" <%if (!docOper.equals("finish")){ %> disabled <%} %>
										value="<%=frm.getPublishtime().equals("") ? now : frm
						.getPublishtime()%>"
										size=60>
								</td>
								<td>
									制作日期：
								</td>
								<td>
									<input name="publishtimem" type="button" <%if (!docOper.equals("finish")){ %> disabled <%} %>
										value="<%=frm.getMaketime()==null ? now : frm
						.getMaketime()%>"size=60>

								</td>
							</tr>

							<tr bgcolor="#ffffff">
								<td>
									发文单位：
								</td>
								<td colspan=3>
									<html:text property="publishOrg"
										value='<%=(frm.getPublishOrg()).equals("") ? "中国记协办公室"
							: frm.getPublishOrg()%>'
										name="docsForm" styleClass="textbox2" size="50">
									</html:text>
								</td>
								<td>
									生成方式：
								</td>
								<td>
									<select<%if (!docOper.equals("finish")){ %> disabled <%} %> name="createmodeSelect" style="width:140px">
										<option <%if (frm.getCreatemode().equals("打印标签份数")){%>
											selected <%} %> value="打印标签份数">
											打印标签份数
										</option>
										<option <%if (frm.getCreatemode().equals("套印条码")){%> selected
											<%} %> value="套印条码">
											套印条码
										</option>
										<option <%if (frm.getCreatemode().equals("生成条码图像文件")){%>
											selected <%} %> value="生成条码图像文件">
											生成条码图像文件
										</option>
										<option <%if (frm.getCreatemode().equals("生成条码图像到剪贴板")){%>
											selected <%} %> value="生成条码图像到剪贴板">
											生成条码图像到剪贴板
										</option>

									</select>
								</td>
								<td>
									文 种：
								</td>
								<td>
									<select  name="typenameSelect" style="width:100px">
										<option <%if (frm.getTypename().equals("请示")){%>
											selected <%} %> value="请示">
											请示
										</option>
										<option <%if (frm.getTypename().equals("报告")){%> selected
											<%} %> value="报告">
											报告
										</option>
										<option <%if (frm.getTypename().equals("函")){%>
											selected <%} %> value="函">
											函
										</option>
										<option <%if (frm.getTypename().equals("通知")){%>
											selected <%} %> value="通知">
											通知
										</option>
										<option <%if (frm.getTypename().equals("批复")){%>
											selected <%} %> value="批复">
											批复
										</option>
										<option <%if (frm.getTypename().equals("会议纪要")){%> selected
											<%} %> value="会议纪要">
											会议纪要
										</option>
										<option <%if (frm.getTypename().equals("意见")){%>
											selected <%} %> value="意见">
											意见
										</option>
										<option <%if (frm.getTypename().equals("决定")){%>
											selected <%} %> value="决定">
											决定
										</option>
										<option <%if (frm.getTypename().equals("通报")){%>
											selected <%} %> value="通报">
											通报
										</option>
										<option <%if (frm.getTypename().equals("公告")){%> selected
											<%} %> value="公告">
											公告
										</option>
										<option <%if (frm.getTypename().equals("公报")){%>
											selected <%} %> value="公报">
											公报
										</option>
										<option <%if (frm.getTypename().equals("决议")){%>
											selected <%} %> value="决议">
											决议
										</option>
										<option <%if (frm.getTypename().equals("通告")){%>
											selected <%} %> value="通告">
											通告
										</option>
										<option <%if (frm.getTypename().equals("命令（令）")){%> selected
											<%} %> value="命令（令）">
											命令（令）
										</option>
										<option <%if (frm.getTypename().equals("指示")){%>
											selected <%} %> value="指示">
											指示
										</option>
										<option <%if (frm.getTypename().equals("条例")){%>
											selected <%} %> value="条例">
											条例
										</option>
										<option <%if (frm.getTypename().equals("规定")){%>
											selected <%} %> value="规定">
											规定
										</option>
										<option <%if (frm.getTypename().equals("议案")){%> selected
											<%} %> value="议案">
											议案
										</option>
									</select>
								</td>
							</tr>

							<tr bgcolor="#ffffff">
								<td>
									制作单位：
								</td>
								<td colspan=3>
									<html:text property="createorg"
										value='<%=(frm.getCreateorg()).equals("") ? "中国记协办公室"
							: frm.getCreateorg()%>'
										name="docsForm" styleClass="textbox2" size="50">
									</html:text>
								</td>
								<td>
									发布层次：
								</td>
								<td>
									<select <%if (!docOper.equals("finish")){ %> disabled <%} %> name="publishlevelSelect" style="width:140px">
										<option <%if (frm.getPublishlevel().equals("公开发布")){%>
											selected <%} %> value="公开发布">
											公开发布
										</option>
										<option <%if (frm.getPublishlevel().equals("县团级")){%> selected
											<%} %> value="县团级">
											县团级
										</option>
										<option <%if (frm.getPublishlevel().equals("市地师级")){%>
											selected <%} %> value="市地师级">
											市地师级
										</option>
										<option <%if (frm.getPublishlevel().equals("省军级")){%> selected
											<%} %> value="省军级">
											省军级
										</option>

									</select>
								</td>
								<td>
									保密期限：
								</td>
								<td>
									<select name="secretimeSelect" style="width:100px">
										<option <%if (frm.getSecretime().equals("")){%> selected
											<%} %> value="">

										</option>
										<option <%if (frm.getSecretime().equals("一年")){%> selected
											<%} %> value="一年">
											一年
										</option>
										<option <%if (frm.getSecretime().equals("半年")){%> selected
											<%} %> value="半年">
											半年
										</option>
										<option <%if (frm.getSecretime().equals("7天")){%> selected
											<%} %> value="7天">
											7天
										</option>

									</select>
								</td>
							</tr>
							<tr bgcolor="#ffffff">
								<td>
									审核人意见：
								</td>

								<td colspan=10>
									<table style="color: red;font-size:12">
										<tr>
											<td>
												承办部室意见：
											</td>
											<td>
												<html:textarea
													style="BORDER: #000000 1px dotted;text-align:left;background:#ebebeb;color:red"
													cols="75"  readonly="true" property="advice" name="docsForm" value="<%=cbcBuffer.toString() %>" rows="3" >
											</html:textarea>

											</td>
										</tr>
										<tr>
											<td>
												主办部室领导意见：
											</td>
											<td>
												<html:textarea
													style="BORDER: #000000 1px dotted;text-align:left;background:#ebebeb;color:red"
													cols="75"  readonly="true" property="advice" name="docsForm" value="<%=cbbsBuffer.toString() %>" rows="3" >
											</html:textarea>

											</td>
										</tr>
										<tr>
											<td>
												会办部室领导意见：
											</td>
											<td>
												<html:textarea
													style="BORDER: #000000 1px dotted;text-align:left;background:#ebebeb;color:red"
													cols="75"  readonly="true" property="advice" name="docsForm" value="<%=hqBuffer.toString() %>" rows="3" >
											</html:textarea>

											</td>
										</tr>
										<tr>
											<td>
												记协领导意见：
											</td>
											<td>
												<html:textarea
													style="BORDER: #000000 1px dotted;text-align:left;background:#ebebeb;color:red"
													cols="75" readonly="true" property="advice" name="docsForm" value="<%=JxBuffer.toString() %>" rows="3" >
											</html:textarea>

											</td>
										</tr>
									</table>
								</td>
							</tr>

						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="submit" onclick="return check()" class="button2"
							value="确 定">
						<input type="reset" class="button2" value="重 置">
					</td>
				</tr>
			</table>
		</html:form>

	</body>
</html>
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "publishtimef",
    button            : "caldendar1",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });

  Zapatec.Calendar.setup({
    firstDay          : 1,
    step              : 1,
    electric          : false,
    inputField        : "publishtimem",
    button            : "caldendar2",
    ifFormat          : "%Y-%m-%d",
    daFormat          : "%Y-%m-%d",
    showsTime         :  false
  });
  //-->
</SCRIPT>
