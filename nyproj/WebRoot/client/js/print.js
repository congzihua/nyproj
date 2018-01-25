
window.print = printFrame;
function printFrame(frame, onfinish) {
	if (!frame) {
		frame = window;
	}

	function execOnFinish() {
		switch (typeof(onfinish)) {
		  case "string":
			alert("print...");
			break;
		  case "function":
			onfinish();
		}
		if (focused && !focused.disabled) {
			focused.focus();
		}
	}
	if ((frame.document.readyState !="complete"))
	{
		execOnFinish();
		return;
	}
	var eventScope = printGetEventScope(frame);
	var focused = document.activeElement;
	window.printHelper = function () {
		execScript("on error resume next:printWB.ExecWB 6,1", "VBScript");
		printFireEvent(frame, eventScope, "onafterprint");
		printWB.outerHTML = "";
		execOnFinish();
		window.printHelper = null;
	};
	document.body.insertAdjacentHTML("beforeEnd", "<object id=\"printWB\" width=0   height=0 classid=\"clsid:8856F961-340A-11D0-A96B-00C04FD705A2\">");
	printFireEvent(frame,eventScope, "onbeforeprint ");
	frame.focus();
	window.printHelper = printHelper;
	setTimeout("window.printHelper()",0);
}
function printFixedApp() {
	
		printHidden("printPage_fixed.jsp?docid="+docid);//里面是套打的页面 
}
function printHidden(url) {
	document.body.insertAdjacentHTML("beforeEnd", "<iframe name=printHiddenFrame width=0 height=0></iframe>");
	var doc = printHiddenFrame.document;
	doc.open();
	doc.write("<body onload=\"parent.onprintHiddenFrame();\">");
	doc.write("<iframe name=printMe width=0 height=0 src=\"" + url + "\"></iframe>");
	doc.write("</body>");
	doc.close();
}
function onprintHiddenFrame() {
	function onfinish() {
		printHiddenFrame.outerHTML = " ";
		if (window.onprintcomplete) {
			window.onprintcomplete();
			alert("print completed! ");
		}
	}
	printFrame(printHiddenFrame.printMe, onfinish);
} 

function printFireEvent(frame, obj, name) {
	var handler = obj[name];
	switch (typeof (handler)) {
	  case "string":
		frame.execScript(handler);
		break;
	  case "function ":
		handler();
	}
}
function printGetEventScope(frame) {
	var frameset = frame.document.all.tags("FRAMESET");
	if (frameset.length) {
		return frameset[0];
	}
	return frame.document.body;
}

