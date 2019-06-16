<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.founder.enp.entity.Authorization"%>
<%
Authorization 	auth = (Authorization)request.getSession(true).getAttribute("authorization");
 %>
<html>
	<head>
		<title>task</title>

		<script language="javascript">
function addUpBar()
{
    if (this.upScrollBar == null)
    {
        this.upScrollBar = new UpBar(this.id + "_upScrollBar", document.body.clientWidth - 20, this.top + this.titleHeight + 4, "../image/scrollup.gif", "../image/scrollup2.gif");
        this.upScrollBar.display("hidden");
    }
}
function addDownBar()
{
    if (this.downScrollBar == null)
    {
        this.downScrollBar = new DownBar(this.id + "_downScrollBar", document.body.clientWidth - 20, this.height - 20, "image/scrolldown.gif", "image/scrolldown2.gif");
        this.downScrollBar.display("hidden");
    }
}
</script>
		<script src="../js/outlook_UpBar.js"></script>
		<script src="../js/outlook_DownBar.js"></script>
		<script src="../js/outlook_Item.js"></script>
		<script src="../js/outlook_Bench.js"></script>
		<script src="../js/outlook_WorkArea.js"></script>
		<script language="JavaScript">
    var picScrollUp1 = "../images/scrollup.gif";
    var picScrollUp2 = "../images/scrollup2.gif";
    var picScrollDown1 = "../images/scrolldown.gif";
    var picScrollDown2 = "../images/scrolldown2.gif";
</script>
		<link rel="stylesheet" href="../css/sglobal.css">

	</head>
	<body onmousemove="return workArea.mousemove();"
		onresize="workArea.reload();" topmargin="0" leftmargin="0"
		style="font-size:12px; "
		oncontextmenu="if (!event.ctrlKey){return false;}" bgcolor="#808080">
		<script language="javascript">

workArea = new WorkArea("workArea", "#808080");

bench = new Bench("user", "用户管理", 25, 0, 0, 20, 100);

benchItem = new Item("部门管理", 20, "../images/DepartmentLibManager.gif", 30, 30,"department/list.jsp", "main");
bench.addItem(benchItem);

benchItem = new Item("组别设置", 20, "../images/organization.gif", 30, 30,"usergroup/main.jsp", "main");
bench.addItem(benchItem);

benchItem = new Item("用户管理", 20, "../images/Navi_userInfo.gif", 30, 30,"user/main.jsp", "main");
bench.addItem(benchItem);


//benchItem = new Item("用户监控", 20, "../images/menu_usermgr.gif", 30, 30,"monitor/watchesAction.do?oper=list", "main");
//bench.addItem(benchItem);

workArea.addBench(bench);


bench = new Bench("sysmanage", "基础数据管理", 25, 0, 0, 20, 100);
benchItem = new Item("航程管理", 20, "../images/hangcheng.jpg", 30, 30,"<%=request.getContextPath()%>/flightAction.do?method=list", "main");
bench.addItem(benchItem);
benchItem = new Item("票价管理", 20, "../images/Coding.png", 30, 30,"<%=request.getContextPath()%>/ticketpriceAction.do?method=ticketpriceList", "main");
bench.addItem(benchItem);
benchItem = new Item("订票点管理", 20, "../images/Simple-Icon-03.png", 30, 30,"<%=request.getContextPath()%>/flightAction.do?method=listTicketpoint", "main");
bench.addItem(benchItem);
benchItem = new Item("航班信息管理", 20, "../images/airplane_grey.png", 30, 30,"<%=request.getContextPath()%>/flightInfoAction.do?method=list", "main");
bench.addItem(benchItem);
benchItem = new Item("票额分配管理", 20, "../images/User_Files.png", 30, 30,"<%=request.getContextPath()%>/ticketsAllocAction.do?method=seleTicketsallocList", "main");
bench.addItem(benchItem);

workArea.addBench(bench);
<%if(auth.getSysqx().equals("4")){%>
bench = new Bench("sum", "统计分析", 25, 0, 0, 20, 100);

benchItem = new Item("统计分析", 20, "../images/unitsssys.png", 30, 30,"<%=request.getContextPath()%>/client/dsppages/units/allUserUnits.jsp", "main");
bench.addItem(benchItem);
benchItem = new Item("售票日统计", 20, "../images/wooden-calendar.png", 30, 30,"<%=request.getContextPath()%>/client/dsppages/units/userSaleTicketsInfo.jsp", "main");
bench.addItem(benchItem);
benchItem = new Item("订票点售票统计", 20, "../images/unitsssys.png", 30, 30,"<%=request.getContextPath()%>/client/dsppages/units/saltPointUnits.jsp", "main");
bench.addItem(benchItem);
benchItem = new Item("用户信息", 20, "../images/menu_usermgr.gif", 30, 30,"<%=request.getContextPath()%>/clientAction.do?method=seleCustomerLogList", "main");
bench.addItem(benchItem);
//benchItem = new Item("统计数据导出", 20, "../images/menu_epaper.gif", 30, 30,"<%=request.getContextPath()%>/nyaddfold/dataop/exportUnitsDataOp.jsp", "main");
benchItem = new Item("统计数据导出", 20, "../images/menu_epaper.gif", 30, 30,"<%=request.getContextPath()%>/nyaddfold/dataop/exportUnitsYearData.jsp", "main");
bench.addItem(benchItem);
benchItem = new Item("售票异常明细", 20, "../images/menu_node.gif", 30, 30,"<%=request.getContextPath()%>/nyaddfold/dataop/exceptionDatas.jsp", "main");
bench.addItem(benchItem);
workArea.addBench(bench);
<%}%>
bench = new Bench("blacklistzj", "黑名单及值机", 25, 0, 0, 20, 100);
benchItem = new Item("用户黑名单", 20, "../images/doodler.png", 30, 30,"<%=request.getContextPath()%>/blacklistUserAction.do?method=toBlacklistUserList", "main");
bench.addItem(benchItem);
benchItem = new Item("设置值班机时间", 20, "../images/wenjiageshi_18.png", 30, 30,"<%=request.getContextPath()%>/dutyTimeAction.do?method=toDutytimePage", "main");
bench.addItem(benchItem);
workArea.addBench(bench);
bench = new Bench("log", "系统操作日志", 25, 0, 0, 20, 100);

benchItem = new Item("系统日志", 20, "../images/doodler.png", 30, 30,"log/logAction.do?oper=list", "main");
bench.addItem(benchItem);
benchItem = new Item("操作日志", 20, "../images/wenjiageshi_18.png", 30, 30,"<%=request.getContextPath()%>/clientAction.do?method=seleUserLogList", "main");
bench.addItem(benchItem);
workArea.addBench(bench);

workArea.init();
</script>
	</body>
</html>
