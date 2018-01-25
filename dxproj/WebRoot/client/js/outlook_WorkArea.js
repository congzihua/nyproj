function mousemove()
{
	if (event.button == 1)
		return false;
	return true;
}
function init()
{
	for (var i = 0; i < this.benchCount; i++)
	{
		this.benchs[i].bgColor = this.bgColor;
		for (var j = 0; j < this.benchs[i].itemCount; j++)
			this.benchs[i].items[j].bgColor = this.benchs[i].bgColor;
	}
	this.initBenchsPosition();
	this.benchs[0].displayItems("visible");
	if (this.benchs[0].height > this.firstBottomBenchPosition)
	{
		this.benchs[0].downScrollBar.moveTo(this.firstBottomBenchPosition - 20);
		this.benchs[0].downScrollBar.show();
	}
	for (var i = this.benchCount - 1; i > 0; i--)
		this.benchs[i].displayItems("hidden");
	this.benchs[0].displayTitle();
	for (var i = this.benchCount - 1; i > 0; i--)
		this.benchs[i].displayTitle();
}
function addBench(bench)
{
	this.benchs[this.benchCount] = bench;
	this.benchCount ++;
	if (this.benchCount > 1)
		this.firstBottomBenchIndex = this.benchCount - 1;
}
function getBenchById(id)
{
	for (var i = 0; i < this.benchCount; i++)
	{
		if (this.benchs[i].id == id)
			return this.benchs[i];
	}
	return null;
}
function initBenchsPosition()
{
	this.lastTopBenchPosition = 0;
	this.firstBottomBenchPosition = document.body.clientHeight;
	this.benchs[0].left = 0;
	this.benchs[0].top = 0;
	for (var i = 1; i < this.benchCount; i++)
	{
		this.benchs[i].left = 0;
		this.firstBottomBenchPosition = this.firstBottomBenchPosition - this.benchs[i].titleHeight - 1;
		this.benchs[i].top = this.firstBottomBenchPosition;
	}
}
function setBenchsPosition()
{
	this.firstBottomBenchPosition = document.body.clientHeight;

	for (var i = 1; i <= this.firstBottomBenchIndex; i++)
	{
		this.benchs[i].left = 0;
		this.firstBottomBenchPosition = this.firstBottomBenchPosition - this.benchs[i].titleHeight - 1;
		this.benchs[i].top = this.firstBottomBenchPosition;
	}
}
function getCurrentBench()
{
	for (var i = 0; i < this.benchCount; i++)
	{
		if (this.benchs[i].top == this.lastTopBenchPosition)
			return this.benchs[i];
	}
	return null;
}
function workAreaReload()
{
	this.setBenchsPosition();
	for (var i = 0; i < this.benchCount; i++)
	{
		this.benchs[i].downScrollBar.moveTo(this.firstBottomBenchPosition - 20);
		this.benchs[i].reload();
	}
	currentBench = this.getCurrentBench();
	if ((currentBench.height > this.firstBottomBenchPosition) && (this.firstBottomBenchPosition > (this.lastTopBenchPosition + currentBench.titleHeight + 1)))
		currentBench.downScrollBar.show();
	else
		currentBench.downScrollBar.hidden();
}
function WorkArea(name,bgColor)
{
/*
attributes
*/
	this.name = "name";
	this.benchCount = 0;
	this.benchs = new Array();
	this.lastTopBenchPosition = 0;
	this.firstBottomBenchPosition = document.body.clientHeight;
	this.firstBottomBenchIndex = -1;
	this.bgColor = bgColor;
/*
methods
*/
	this.init = init;
	this.addBench = addBench;
	this.getBenchById = getBenchById;
	this.initBenchsPosition = initBenchsPosition;
	this.setBenchsPosition = setBenchsPosition;
	this.getCurrentBench = getCurrentBench;
	this.reload = workAreaReload;
	this.mousemove = mousemove
}
