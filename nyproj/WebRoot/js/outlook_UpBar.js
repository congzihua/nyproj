function displayUpBar(visibility)
{
	document.write("<div style=\"position: absolute; left: " + this.left + "px; top: " + this.top + "px; ");
	document.write("visibility: " + visibility + ";\" id=\"" + this.id + "\" > ");
	document.write("<img ");
	document.write("onmouseup=\"javascript:this.src='" + this.imgWhenMouseUp + "'; stopMoveDown()\" ");
	document.write("onmousedown=\"javascript:this.src='" + this.imgWhenMouseDown + "'; moveDown()\" ");
	document.write("onmouseout=\"javascript:this.src='" + this.imgWhenMouseUp + "'; stopMoveDown()\" ");
	document.write("height=16 width=16 src=\"" + this.imgWhenMouseUp + "\" >");
	document.write("</div>");
}
function show()
{
	var upScrollBar = document.all(this.id);
	upScrollBar.style.visibility = "visible";
	this.visible = true;
}
function hidden()
{
	var upScrollBar = document.all(this.id);
	upScrollBar.style.visibility = "hidden";
	this.visible = false;
}
function upBarMoveTo(top)
{
	this.top = top;
	var upScrollBar = document.all(this.id);
	upScrollBar.style.top = this.top;
}
function reloadUpBar()
{
	this.moveTo(this.left, this.top);
}
function UpBar(id, left, top, imgWhenMouseUp, imgWhenMouseDown)
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
	this.display = displayUpBar;
	this.show = show;
	this.hidden = hidden;
	this.moveTo = upBarMoveTo;
	this.reload = reloadUpBar;
}
