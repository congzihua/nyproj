<html>
	<head>
		<title> New Document </title>
<script language="javascript">
function CloseWin()
{
	var ua=navigator.userAgent
	var ie=navigator.appName=="Microsoft Internet Explorer"?true:false
	if(ie){
		var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE "))))
		if(IEversion< 5.5){
		   var str  = '<object id=noTipClose type="application/x-oleobject"  classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">'
		   str += '<param name="Command" value="Close"></object>';
		   document.body.insertAdjacentHTML("beforeEnd", str);
		   document.all.noTipClose.Click();
		}
		else{
		   window.opener = null;
		   window.close();
		}
	}
	else{
	   window.close();
	}
}


function login()
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
	var theWindowProperty="toolbar=0,status=1,"
	+ "width=" + (width-10) + ","
	+ "height=" + (height-56) + ","
        + "resizable=1,"
        + "scrollbars=1,"
	+ "screenx=" + xposition + "," //for Netscape
	+ "screeny=" + yposition + "," //for Netscape
	+ "left=" + xposition + "," //IE
	+ "top=" + yposition; //IE
	var newwin=window.open("login.jsp","_blank",theWindowProperty);
	CloseWin();
}
</script>
</head>

	<body onload="login()">
	</body>
</html>
