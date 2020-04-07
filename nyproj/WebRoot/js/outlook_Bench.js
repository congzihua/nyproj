/*
define global variables and functions which used to manipulate benchs
*/
var timerID = null;
var scrolling = null;
function stopMoveUp()
{
	if (scrolling != null)
		scrolling = false;
}

function moveUp()
{
		if (scrolling == null)
		{
			scrolling = true;
			currentBench = workArea.getCurrentBench();
			var canScroll = currentBench.scrollUp(workArea.firstBottomBenchPosition);
			if(canScroll)
			{
				if (timerID != null)
					window.clearTimeout(timerID);
				timerID = window.setTimeout("moveUp()", currentBench.scrollInterval);
			}
			else
				scrolling = null;
		}
		else if (scrolling)
		{
			currentBench = workArea.getCurrentBench();
			var canScroll = currentBench.scrollUp(workArea.firstBottomBenchPosition);
			if(canScroll)
			{
				if (timerID != null)
					window.clearTimeout(timerID);
				timerID = window.setTimeout("moveUp()", currentBench.scrollInterval);
			}
			else
				scrolling = null;
		}
		else
			scrolling = null;
}
function moveDown()
{
	if (scrolling == null)
	{
		scrolling = true;
		currentBench = workArea.getCurrentBench();
		var canScroll = currentBench.scrollDown(workArea.lastTopBenchPosition + currentBench.titleHeight + 1);
		if (canScroll)
		{
			if (timerID != null)
				window.clearTimeout(timerID);
			timerID = window.setTimeout("moveDown()", currentBench.scrollInterval);
		}
		else
			scrolling = null;
	}
	else if (scrolling)
	{
		currentBench = workArea.getCurrentBench();
		var canScroll = currentBench.scrollDown(workArea.lastTopBenchPosition + currentBench.titleHeight + 1);
		if (canScroll)
		{
			if (timerID != null)
				window.clearTimeout(timerID);
			timerID = window.setTimeout("moveDown()", currentBench.scrollInterval);
		}
		else
			scrolling = null;
	}
	else
		scrolling = null;
}
function stopMoveDown()
{
	if (scrolling != null)
		scrolling = false;
}

function bottomBenchClicked(clickedBench, currentBench)
{
	var clickedBenchTop = clickedBench.top;
	var currentBenchTop = currentBench.top;
	for (var i = workArea.benchCount - 1; i >= 0; i --)
	{
		if ((workArea.benchs[i].top < clickedBenchTop) && (workArea.benchs[i].top > currentBenchTop))
		{
			workArea.lastTopBenchPosition += currentBench.titleHeight + 1;
			workArea.benchs[i].moveTo(0, workArea.lastTopBenchPosition);
			workArea.benchs[i].shrink();
			currentBench = workArea.benchs[i];
		}
		if (workArea.benchs[i] == clickedBench)
			workArea.firstBottomBenchIndex = i - 1;
	}
	workArea.lastTopBenchPosition += currentBench.titleHeight + 1;
	workArea.firstBottomBenchPosition = clickedBench.top + clickedBench.titleHeight + 1;
	clickedBench.moveTo(0, workArea.lastTopBenchPosition);
}
function topBenchClicked(clickedBench, currentBench)
{
	var clickedBenchTop = clickedBench.top;
	var currentBenchTop = currentBench.top;
	var bottomValue = workArea.firstBottomBenchPosition;
	for (var i = 1; i < workArea.benchCount; i++)
	{
		if ((workArea.benchs[i].top > clickedBenchTop) && (workArea.benchs[i].top < bottomValue))
		{
			workArea.benchs[i].shrink();
			workArea.firstBottomBenchPosition = workArea.firstBottomBenchPosition - workArea.benchs[i].titleHeight - 1;
			workArea.benchs[i].moveTo(0, workArea.firstBottomBenchPosition);
		}
		if (workArea.benchs[i] == clickedBench)
			workArea.firstBottomBenchIndex = i - 1;
	}
	if (workArea.benchs[0] == clickedBench)
		workArea.firstBottomBenchIndex = workArea.benchCount - 1;

	workArea.lastTopBenchPosition = clickedBench.top;
}
function benchOnclick(id)
{
	var clickedBench = workArea.getBenchById(id);
	var currentBench = workArea.getCurrentBench();
	if (currentBench != clickedBench)
	{
		currentBench.shrink();
		if (clickedBench.top > currentBench.top)
			bottomBenchClicked(clickedBench, currentBench);
		else
			topBenchClicked(clickedBench, currentBench);
		workArea.benchs[0].moveTo(0, 0);
		clickedBench.expand();
		if (clickedBench.height > workArea.firstBottomBenchPosition)
		{
			clickedBench.downScrollBar.show();
			clickedBench.downScrollBar.moveTo(workArea.firstBottomBenchPosition - 20);
		}
	}
}
/*
define the method of class bench
*/
function displayBenchTitle()
{
	document.write("<div style=\"position: absolute;width:100%; left: " + this.left + "px; top: " + this.top + "px;\" ");
	document.write("id=\"" + this.id + "_TitleBar\" > ");
	document.write("<table border=0 width=100% nowrap borderColorLight='" + this.bgColor + "' borderColorDark='" + this.bgColor +"' ");
	document.write("cellpadding=0 cellspacing=0> ");
	document.write("<tr>");
	document.write("<td align=\"center\" height=" + this.titleHeight + "px bgcolor='#d4d0cd' borderColorLight=black borderColorDark=white ");
	document.write("onmouseup=\"javascript:this.borderColorDark='white';this.borderColorLight='black'\" ");
	document.write("onmouseout=\"javascript:this.borderColorDark='white';this.borderColorLight='black'\" ");
	document.write("onmousedown=\"javascript:this.borderColorDark='black';this.borderColorLight='White'\" ");
	document.write("style=\"CURSOR: hand\" onclick=\"benchOnclick('" + this.id + "');\"  >");
	document.write("<font color=black>");
	document.write(this.title);
	document.write("</font></td>");
	document.write("</tr>");
	document.write("</table>");
	document.write("</div>");
}
function displayBenchItems(visibility)
{
	var topValue = this.top + this.titleHeight + 8;
	document.write("<div style=\"position: absolute;width:100%; left: " + this.left + "px; top: " + topValue + "px; ");
	document.write("visibility: " + visibility + ";\" id=\"" + this.id + "_ItemList\" >");
	for (var i = 0; i < this.itemCount; i++)
	{
		this.items[i].display();
		this.itemsHeight += this.items[i].height;
	}
	document.write("</div>");
	this.addDownBar();
	this.addUpBar();
	this.height = this.top + this.titleHeight + this.itemsHeight;
}
function addItem(item)
{
	this.items[this.itemCount] = item;
	this.itemCount ++;
}
function shrink()
{
	var itemList = document.all(this.id + "_ItemList");
	itemList.style.visibility = "hidden";
	this.downScrollBar.hidden();
	this.upScrollBar.hidden();
}
function expand()
{
	this.reload();
	var itemList = document.all(this.id + "_ItemList");
	itemList.style.visibility = "visible";
	if (this.downScrollBar.visible)
		this.downScrollBar.show();
	this.upScrollBar.moveTo(this.top + this.titleHeight + 4);
}
function moveTo(left, top)
{
	this.left = left;
	this.top = top;

	var benchTitleBar = document.all(this.id + "_TitleBar");
	benchTitleBar.style.top = top;

	var benchItemList = document.all(this.id + "_ItemList");
	var itemListTop = this.top + this.titleHeight + 8;
	benchItemList.style.top = itemListTop;

	this.height = this.top + this.titleHeight + this.itemsHeight;
}
function benchReload()
{
	this.upScrollBar.hidden();
	this.moveTo(this.left, this.top);
}
function addUpBar()
{
	if (this.upScrollBar == null)
	{
		this.upScrollBar = new UpBar(this.id + "_upScrollBar", document.body.clientWidth - 20, this.top + this.titleHeight + 4, picScrollUp1, picScrollUp2);
		this.upScrollBar.display("hidden");
	}
}
function addDownBar()
{
	if (this.downScrollBar == null)
	{
		this.downScrollBar = new DownBar(this.id + "_downScrollBar", document.body.clientWidth - 20, this.height - 20, picScrollDown1, picScrollDown2);
		this.downScrollBar.display("hidden");
	}
}
function scrollUp(workAreaBottom)
{
	this.upScrollBar.show();
	var canScroll = true;
	var itemList = document.all(this.id + "_ItemList");
	if (this.height > workAreaBottom)
	{
		var top = itemList.style.top;
		var pos = top.indexOf("px");
		if (pos > -1)
			top = top.substring(0, pos);
		top -= this.scrollSpeed;
		itemList.style.top = top + "px";
		this.height -= this.scrollSpeed;
	}
	if (this.height < workAreaBottom)
	{
		this.downScrollBar.hidden();
		canScroll = false;
	}
	return canScroll;
}
function scrollDown(workAreaTop)
{
	this.downScrollBar.show();
	var canScroll = true;
	var itemList = document.all(this.id + "_ItemList");
	var top = itemList.style.top;
	var pos = top.indexOf("px");
	if (pos > -1)
		top = top.substring(0, pos);
	if (top < workAreaTop)
	{
		top = top - 0 + this.scrollSpeed;
		itemList.style.top = top + "px";
		this.height += this.scrollSpeed;
	}
	if (top > workAreaTop)
	{
		this.upScrollBar.hidden();
		canScroll = false;
	}
	return canScroll;
}

/*
define class bench
*/
function Bench(id, title, titleHeight, left, top, scrollSpeed, scrollInterval)
{
/*
attributes
*/
	this.id = id;
	this.title = title;
	this.titleHeight = titleHeight;
	this.itemCount = 0;
	this.items = new Array();
	this.height = 0;
	this.left = left;
	this.top = top;
	this.upScrollBar = null;
	this.downScrollBar = null;
	this.itemsHeight = 0;
	this.scrollSpeed = scrollSpeed;
	this.scrollInterval = scrollInterval;
	this.bgColor = "";

/*
methods
*/
	this.displayTitle = displayBenchTitle;
	this.displayItems = displayBenchItems;
	this.addItem = addItem;
	this.shrink = shrink;
	this.moveTo = moveTo;
	this.expand = expand;
	this.reload = benchReload;
	this.addUpBar = addUpBar;
	this.addDownBar = addDownBar;
	this.scrollUp = scrollUp;
	this.scrollDown = scrollDown;
}
