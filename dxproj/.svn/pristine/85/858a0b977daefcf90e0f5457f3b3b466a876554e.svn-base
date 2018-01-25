//var strIP = "172.1.1.9"
//var strIP = "172.1.1.66"
//var strIP = "10.2.2.232"


var printWindow;
var strUserName = "news";
var strPwd = "news";
var bPrint = true;
var showtime = 500000;
var property = 'width=300,height=200,menubar=yes,titlebar=no,resizable=yes,scrollbars=yes,toolbar=no,status=yes';
//closePrintFile
//getPrintStatus 0-finish 1 printing .
// get WebEdit ,ءӡ÷
try{
	if(strIP=="172.1.1.9" || strIP=="61.129.112.103" || strIP=="cbj.sh.gov.cn")
	{
		showtime = 5000;
	}
	else
	{
		showtime = 500000;
	}
}catch(e){}

function test_printWeb()
{
	alert("This is a test in printWeb.js .");
}
function closePrintWindow()
{
	if(printWindow && printWindow != null)
	{
		printWindow.close();
		printWindow = null;
	}
}

function getCNFormatDate(value)
{		
	try{
		if(value.length > 10)
			value = value.substring(0,10);
		var arRq = value.split("-");
		if(arRq[0] == "" || arRq[0] == "undefined" || null==arRq[0])
			arRq[0] = "&nbsp;&nbsp;";
		if(arRq[1] == "" || arRq[1] == "undefined" || null==arRq[1])
			arRq[1] = "&nbsp;&nbsp;";
		if(arRq[2] == "" || arRq[2] == "undefined" || null==arRq[2])
			arRq[2] = "&nbsp;&nbsp;";
		var arRq2 = arRq[0]+""+arRq[1]+""+arRq[2]+"";
		return arRq2;
	}catch(e)
	{
		alert("!");
		return value;
	}
}

function getArrayDate(value)
{		
	var arDate = new Array();
	arDate[0] = "";
	arDate[1] = "";
	arDate[2] = "";
	try{
		if(value.length > 10)
			value = value.substring(0,10);
		if(value != "")
	   		arDate = value .split("-");
	   
	   return arDate;
   }catch(e)
   {
	   	return arDate;
   }
}

function hiddenButton()
{
	btnPrint.style.display = "none";
}
//printZpdjzs ӡƷǼ֤ - Ȩ
function printZpdjzs()
{
	try{
		printWindow = window.open("/yw/printpage/zpdjzs.htm");
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printZpdjzs ӡ֤ - 
function printNxkz()
{
	try{
		printWindow = window.open("/yw/printpage/yx_nzb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printZpdjzs ӡ֤ - 
function printNfb()
{
	try{
		printWindow = window.open("/yw/printpage/yx_nfb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printZpdjzs ӡ ֤ - 
function printMxkz()
{
	try{
		printWindow = window.open("/yw/printpage/yx_mzb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printZpdjzs ӡ ֤ - 
function printMfb()
{
	try{
		printWindow = window.open("/yw/printpage/yx_mfb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printZpdjzs ӡ֤ - 
function printExkz()
{
	try{
		printWindow = window.open("/yw/printpage/yx_ezb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printZpdjzs ӡ֤ - 
function printEfb()
{
	try{
		printWindow = window.open("/yw/printpage/yx_efb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printPaperZb()
{
	try{
		printWindow = window.open("/yw/printpage/paper_qkzb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printPaperFb1()
{
	try{
		printWindow = window.open("/yw/printpage/paper_qkfb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printPaperFb2()
{
	try{
		printWindow = window.open("/yw/printpage/paper_qkfb2.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printNewspaperZb()
{
	try{
		printWindow = window.open("/yw/printpage/paper2_qkzb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printNewspaperFb1()
{
	try{
		printWindow = window.open("/yw/printpage/paper2_qkfb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡڿ֤ - ӡڴ
function printNewspaperFb2()
{
	try{
		printWindow = window.open("/yw/printpage/paper2_qkfb2.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPressZb ӡӡˢ֤ - ӡˢ
function printPressZb()
{
	try{
		printWindow = window.open("/yw/printpage/press_zb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPressFb ӡӡˢ֤ - ӡˢ
function printPressFb()
{
	try{
		printWindow = window.open("/yw/printpage/press_fb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPressFb ֤ - 
function printMMakeZf()
{
	try{
		printWindow = window.open("/yw/printpage/yx_mmakezb.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPressZb ӡӡˢ֤ - ӡˢ
function printCopyZb(type)
{
	try{
		var strUrl = "/yw/printpage/copy_zb.htm";
		if(type==2)
			strUrl = "/yw/printpage/copy_zb2.htm";
			
		printWindow = window.open(strUrl,'',property);
		if(type==1)
			setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPressFb ӡӡˢ֤ - ӡˢ
function printCopyFb(type)
{
	try{
		var strUrl = "/yw/printpage/copy_fb.htm";
		if(type==2)
			strUrl = "/yw/printpage/copy_fb2.htm";
		printWindow = window.open(strUrl,'',property);
		if(type==1)
			setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printZpdjzs ӡ֤ - 
function printMediaMail(name,address,zip)
{
	try{
		var strUrl = "/media/printMail.jsp?zip="+zip+"&name="+name+"&address="+address;
		printWindow = window.open(strUrl,'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡӪ֤ - г
function printWebMarketZb()
{
	if(!checkForm())
			return false;
	try{
		printWindow = window.open("/yw/printpage/market_zb.htm",'',property);
		//setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}


//printPaperZb ӡӪ֤ - г
function printWebMarketZb_new()
{
	if(!checkForm())
			return false;
	try{
		printWindow = window.open("/yw/printpage/market_zb1.htm",'',property);
		//setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}


//printPaperZb ӡӪ֤ - г
function printWebMarketFb(strType)
{
	if(!checkForm())
			return false;
			
	if(strType == "1")
	{
		if(!checkDate(document.all.item("examineDate").value) )
		{
			debug("1");
			return;
		}
	}
	else if(strType == "2")
	{
		if(!checkDate(document.all.item("examineDate1").value) )
		{
			debug("2");
			return;
		}
	}
	else if(strType == "3")
	{
		if(!checkDate(document.all.item("examineDate2").value) )
		{
			debug("3");
			return;
		}
	}
	else if(strType == "4")
	{
		if(!checkDate(document.all.item("examineDate3").value) )
		{
			debug("4");
			return;
		}
	}
	var strUrl = "/yw/printpage/market_fb.jsp?type="+strType;
	
	try{
		printWindow = window.open(strUrl,'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}

//printPaperZb ӡŷ - г
function printWebMarketMail()
{
	try{
		printWindow = window.open("/yw/printpage/market_mail.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printPaperZb ӡ֪ͨ - г
function printWebTzd()
{
	try{
		printWindow = window.open("/yw/printpage/market_kaohetongzhidan.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printPaperZb ӡ֪ͨ - г
function printWebBmd()
{
	try{
		printWindow = window.open("/yw/printpage/market_kaohebaomingdan.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//printPaperNbzl ӡڲ׼ӡ֤ - 
function printPaperNbzl()
{
	try{
		printWindow = window.open("/yw/printpage/paper_qknbzl.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}
//convert number to float ;sample:300 to 300.0
function numToFloat(num)
{
	if(num == "")
		num = "0.0";
		
	if(isNaN(num))
	{
		debug(num+"Ϊ֣...");
		return "";	
	}
	var rule = "^(-?\\d+)(\\.\\d+)$";
	var result = num.match(rule);
	if(null == result){
		num += ".0"
	}
	return num;
}

function getCurrentCNDate()
{
	
	var currentDate = new Date();	
	currentDate = currentDate.getYear() + ""+(currentDate.getMonth()+1)+""+currentDate.getDate()+"";
	return currentDate;
}


//feng jie 2009-11-11 add
//printPaperZb ӡӪ֤ - г
function printWebMarketFb2(strType)
{
	if(!checkForm())
			return false;
			
	if(strType == "1")
	{
		if(!checkDate(document.all.item("examineDate").value) )
		{
			debug("1");
			return;
		}
	}
	else if(strType == "2")
	{
		if(!checkDate(document.all.item("examineDate1").value) )
		{
			debug("2");
			return;
		}
	}
	else if(strType == "3")
	{
		if(!checkDate(document.all.item("examineDate2").value) )
		{
			debug("3");
			return;
		}
	}
	else if(strType == "4")
	{
		if(!checkDate(document.all.item("examineDate3").value) )
		{
			debug("4");
			return;
		}
	}
	else if(strType == "5")
	{
		if(!checkDate(document.all.item("examineDate4").value) )
		{
			debug("5");
			return;
		}
	}
	else if(strType == "6")
	{
		if(!checkDate(document.all.item("examineDate5").value) )
		{
			debug("6");
			return;
		}
	}

	var strUrl = "/yw/printpage/music_fb2.jsp?type="+strType;
	
	try{
		printWindow = window.open(strUrl,'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}







//printPaperZb ӡӪ֤ - г
function printMusicChange(strType)
{
	
			
	
	var strUrl = "/yw/printpage/music_change.jsp?type="+strType;
	
	try{
		printWindow = window.open(strUrl,'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}



//printPaperZb ӡŷ - г
function printWebMarketMail_new()
{

	try{
		printWindow = window.open("/yw/printpage/market_mail_new.jsp",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}


//printPaperZb ӡӪ֤ - г
function printWebMarketZb_old()
{
	if(!checkForm())
			return false;
	try{
		printWindow = window.open("/yw/printpage/market_zb_old.htm",'',property);
		setTimeout('closePrintWindow()',showtime);
	}catch(e){
		alert(e.value); 
	}	
}