/*
define functions which are used to manipulate class Item
*/

//chenkai alter begin 2001-9-27
/*
function itemClicked(link, target)
{
	window.open(link, target);
}
*/
function itemClicked(link, target)
{
	if(link == "picture")
	{
		window.open("toPictureLib.jsp", "_blank", "scrollbars=yes,height="+(screen.height-60)+",width="+(screen.width-100)+",left=90,top=0");
	}
	else if (link == "bulletin")
	{
		window.open('bulletin/blt.htm','','directories=no,height=400,width=600,status=no,toolbar=yes,menubar=no,location=no,resizable=yes,scrollbars=yes');
	}
	else if (link == "changeSite4SysMgr")
	{
		window.open('SwitchSite/SwitchSite4SysMgr.jsp', '_blank','height=400,width=250,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes');
	}
	else
		window.open(link, target);
}
//chenkai alter end

function mouseOver()
{
	var obj = event.srcElement;
	if (obj != null)
	{
		while (obj.tagName.toLowerCase() != "table")
		{
			obj = obj.parentElement;
			if (obj == null)
				return;
		}
		if (obj.id != "enpWorkAreaBenchItem")
			return;
		obj.border = 1;
		obj.borderColorLight = "white";
		obj.borderColorDark = "black";

		obj = obj.parentElement;
		obj.style.padding = 0;
	}
}
function mouseOut()
{
	var obj = event.srcElement;
	if (obj != null)
	{
		while (obj.tagName.toLowerCase() != "table")
		{
			obj = obj.parentElement;
			if (obj == null)
				return;
		}
		if (obj.id != "enpWorkAreaBenchItem")
			return;
		obj.border = 0;
		obj = obj.parentElement;
		obj.style.padding = 2;
	}
}
function mouseDown()
{
	var obj = event.srcElement;
	if (obj != null)
	{
		while (obj.tagName.toLowerCase() != "table")
		{
			obj = obj.parentElement;
			if (obj == null)
				return;
		}
		if (obj.id != "enpWorkAreaBenchItem")
			return;
		obj.border = 1;
		obj.borderColorLight = "black";
		obj.borderColorDark = "white";

		obj = obj.parentElement;
		obj.style.padding = 0;
	}
}
/*
define the methods of class Item
*/
function displayItem()
{
	document.write("<table border=0 width= 100%><tr>");
	document.write("<td align=\"center\" style=\"padding: 2px;\" >");
	document.write("<table border=0 cellpadding=0 cellspacing=0 id=\"enpWorkAreaBenchItem\"> ");
	document.write("<tr>");
	document.write("<td align=\"center\" borderColorLight='" + this.bgColor + "' borderColorDark='" + this.bgColor + "'>");
	document.write("<img border=0 style=\"cursor: hand\" src=" + this.imgSrc + " width=" + this.imgWidth + " height=" + this.imgHeight + " ");
	document.write("onmouseout=\"mouseOut()\" ");
	document.write("onmouseup=\"mouseOut()\" ");
	document.write("onmousedown=\"mouseDown()\" ");
	document.write("onmouseover=\"mouseOver();\" ");
	document.write("onclick=\"itemClicked('" + this.url + "', '" + this.target + "')\" >");
	document.write("</td>");
	document.write("</tr>");
	document.write("</table>");
	document.write("</td></tr></table>");
	document.write("<table width=100% border=0>");
	document.write("<tr>");
	document.write("<td  height=" + this.titleHeight + "px align=\"center\" > <font  style='font-size:12px;color:white'>");
	document.write(this.title);
	document.write("</td>");
	document.write("</tr>");
	document.write("</table>");
}
/*
define class Item
*/
function Item(title, titleHeight, imgSrc, imgWidth, imgHeight, link, target)
{
/*
attributes
*/
	this.title = title;
	this.titleHeight = titleHeight;
	this.imgSrc = imgSrc;
	this.imgWidth = imgWidth;
	this.imgHeight = imgHeight;
	this.height = this.titleHeight + this.imgHeight + 12;
	this.url = link;
	this.target = target;
	this.bgColor="";

/*
methods
*/
	this.display = displayItem;
	this.itemClicked = itemClicked;
}
