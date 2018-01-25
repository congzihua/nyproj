function displayDownBar(visibility)
{
	document.write("<div style=\"position: absolute; left: " + this.left + "px; top: " + this.top + "px; ");
	document.write("visibility: " + visibility + ";\" id=\"" + this.id + "\" > ");
	document.write("<img ");
	document.write("onmouseup=\"javascript:this.src='" + this.imgWhenMouseUp + "'; stopMoveUp()\" ");
	document.write("onmousedown=\"javascript:this.src='" + this.imgWhenMouseDown + "'; moveUp()\" ");
	document.write("onmouseout=\"javascript:this.src='" + this.imgWhenMouseUp + "'; stopMoveUp()\" ");
	document.write("height=16 width=16 src=\"" + this.imgWhenMouseUp + "\" >");
	document.write("</div>");
}
function show()
{
	var bar = document.all(this.id);
	bar.style.visibility = "visible";
	this.visible = true;
}
function hidden()
{
	var bar = document.all(this.id);
	bar.style.visibility = "hidden";
	this.visible = false;
}
function downBarMoveTo(top)
{
	this.top = top;
	var downScrollBar = document.all(this.id);
	downScrollBar.style.top = this.top;
}
function reloadDownBar()
{
	this.moveTo(this.left, this.top);
}
function DownBar(id, left, top, imgWhenMouseUp, imgWhenMouseDown)
{
/*
attributes
*/
	this.id = id;
	this.left = left;
	this.top = top;
	this.imgWhenMouseUp = imgWhenMouseUp;
	this.imgWhenMouseDown = imgWhenMouseDown;
	this.visible = false;

/*
mehhods
*/
	this.display = displayDownBar;
	this.show = show;
	this.hidden = hidden;
	this.moveTo = downBarMoveTo;
	this.reload = reloadDownBar;
}
