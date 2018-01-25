
/**
* discription: ȡ
* param: Ҫȡֵ ("name","type")
* return : һݵstring .
* author: limenghai
*/
function getTableValues()
{
	//alert("getTableValues");
	var params = getTableValues.arguments;
	//alert(params.length);
	if(params.length <= 0)
	{
		//alert(1);
		return null;
	}
	//alert(params);
	
	
	var flagOneField = "%__%";
	var flagOneRow = "*__*";
	
	var firstname = document.getElementsByName(params[0]);
	
	var total = "";
	for(var i=0;i<params.length;i++)
	{
		total += params[i];
		if(i<params.length-1)
			total += flagOneField;
	}
	total += flagOneRow;
	
	//һдűе
	var names = new Array(params.length);
	for(var i=0;i<params.length;i++)
	{
		names[i] = params[i];
	}
	total[0] = names;
	
	for(var i=0;i<params.length;i++)
	{
		var name = document.getElementsByName(params[i]);
		var one = "";
		for(var n=0;n<name.length;n++)
		{
			if(null == name[n].value || name[n].value == "")
			{
				one += "";
			}
			else
			{
				one += name[n].value;
			}	
			if(n != name.length-1)
			{
				one += flagOneField;
			}
					
		}
		total += one ;
		if(i != params.length-1)
			total += flagOneRow;
	}
	//alert("before return total:"+total);
	return total;
}

/**
* discription: tableʾ
* param:tableData - Ҫʾ
* param:tableID - table id
* param:minLine - table СnullûСơ
* author: limenghai
*/
function showTableData(tableData,tableID,minLine)
{
	//alert(tableData)
	if(null == tableID)
	{
		alert("ṩһid ");
		return;
	}
	if(!tableID.firstChild || tableID.firstChild.childNodes == 0)
	{
		alert("Ӧһȷ ");
		return;
	}
	//ǿգʼֱӲк󷵻ء
	if(null == tableData || tableData == "")
	{
		if(minLine != null && minLine > 1)
		{
			for(var i=0;i<minLine -1;i++)
			{
				addTableRow(tableID);
			}
		}
		return;	
	}
	
	var flagOneField = "%__%";
	var flagOneRow = "*__*";
	
	var rows = tableData.split(flagOneRow);
	//alert(rows.length);
	var firstRow = rows[1].split(flagOneField);	
	
	var names = rows[0].split(flagOneField);
	//alert("rows[0]:"+rows[0]);
	var oneRowInput = document.getElementsByName(names[0]);
	//ɾֻһ
	if(oneRowInput && tableID.firstChild.childNodes.length > 1)
	{
		var childs = tableID.firstChild.childNodes;
		for(var i=childs.length-1;i>(childs.length - oneRowInput.length);i--)		
		{
			tableID.firstChild.removeChild(childs[i]);
		}
	}
	//firstRow.length (һг)- Ѿڵ
	var addRowNum = firstRow.length -1;	
	//alert("addRowNum:"+addRowNum);	
	for(var i=0;i<addRowNum;i++)
	{
		addTableRow(tableID);
	}	
		
	//
	for(var i=0;i<names.length;i++)
	{
		var one = document.getElementsByName(names[i]);
		var fields = rows[i+1].split(flagOneField);
		for(var j=0;j<one.length;j++)
		{
			one[j].value=fields[j];
		}
	}
	//ССУ
	if(null != minLine && firstRow.length < minLine)
	{
		var firstRow = document.getElementsByName(names[0]);
		addRowNum = minLine - firstRow.length;
		for(var i=0;i<addRowNum;i++)//
		{
			addTableRow(tableID);
		}
	}
	//alert("showTableWithArray end .");
}


/**
*
* tableӶѾڵһƵС
* param:tableID -id
* param:tableID -ӵ
* author: limenghai
*/
function addTableRows(tableID,num)
{
	if(null == tableID || null ==num)
	{
		return;	
	}
	
	for(var i=0;i<num;i++)
	{
		addTableRow(tableID);
	}
}

/**
*
* tableһѾڵһƵС
* param:tableID -id
* author: limenghai
*/
function addTableRow(tableID)
{
	if(!tableID.childNodes || tableID.childNodes.length == 0)
	{
		alert("ñ?޷ӣ");
		return ;	
	}
	var oTbody = tableID.firstChild;
	while(oTbody.tagName.toUpperCase() != "TBODY")
	{
		oTbody = oTbody.nextSibling;
	}
	var oneTr = oTbody.lastChild;
	var oTR = document.createElement("TR");
	var childNodes = oneTr.childNodes;
	for(var n=0;n<childNodes.length;n++)
	{
		var oTD = childNodes[n].cloneNode();
		
		oTD.innerHTML = childNodes[n].innerHTML;
		
		//alert("ppp:"+oTD.innerHTML);	
		oTR.appendChild(oTD);
	}
	oTbody.appendChild(oTR);
	//ոƵ
	resetTrContent(oTR);
}

/**
*
* tableһѾڵһƵС
* param:tableID -id
* author: zhangping
*/
function addTableRowWithValue(tableID)
{
	if(!tableID.childNodes || tableID.childNodes.length == 0)
	{
		alert("ñ?޷ӣ");
		return ;	
	}
	var oTbody = tableID.firstChild;
	while(oTbody.tagName.toUpperCase() != "TBODY")
	{
		oTbody = oTbody.nextSibling;
	}
	var oneTr = oTbody.lastChild;
	var oTR = document.createElement("TR");
	var childNodes = oneTr.childNodes;
	for(var n=0;n<childNodes.length;n++)
	{
		var oTD = childNodes[n].cloneNode();
		
		oTD.innerHTML = childNodes[n].innerHTML;
		
		//alert("ppp:"+oTD.innerHTML);	
		oTR.appendChild(oTD);
	}
	oTbody.appendChild(oTR);
	//ոƵ
	resetTrContent(oTR);
}

/**
*
* tableһѾڵһƵС
* param:tableID -id
* author: limenghai
*/
function addTableTimeRow(tableID)
{
	if(!tableID.childNodes || tableID.childNodes.length == 0)
	{
		alert("ñ?޷ӣ");
		return ;	
	}
	var oTbody = tableID.firstChild;
	while(oTbody.tagName.toUpperCase() != "TBODY")
	{
		oTbody = oTbody.nextSibling;
	}
	var oneTr = oTbody.lastChild;
	var oTR = document.createElement("TR");
	var childNodes = oneTr.childNodes;
	
	for(var n=0;n<childNodes.length;n++)
	{
		var oTD = childNodes[n].cloneNode();				
		var inputName = childNodes[n].getElementsByTagName("INPUT");
		if(inputName.length==0){
		  oTD.innerHTML = childNodes[n].innerHTML;
	        }else{
		var ename=inputName[0].name;
		var subename=ename.substring(0,3);
		
		if("ssj"==subename){
		  	
		  var olenum=ename.substring(3,ename.length);		  
		  var num=eval(olenum)+1;
		  var newssj="ssj"+num;
		  var newesj="esj"+num;
		  
		  var oldesj="esj"+olenum;
		 
		  var stringtext=childNodes[n].innerHTML;
		  
		  stringtext=stringtext.replace(ename,newssj);
		  stringtext=stringtext.replace(ename,newssj);
		  stringtext=stringtext.replace(oldesj,newesj);
		  stringtext=stringtext.replace(oldesj,newesj);
		  
		  oTD.innerHTML =stringtext;
		  
	        }else if("jsj"==subename){
		  	
		  var olenum=ename.substring(3,ename.length);		  
		  var num=eval(olenum)+1;
		  var newssj="jsj"+num;
		  var newesj="lsj"+num;
		  
		  var oldesj="lsj"+olenum;
		 
		  var stringtext=childNodes[n].innerHTML;
		  
		  stringtext=stringtext.replace(ename,newssj);
		  stringtext=stringtext.replace(ename,newssj);
		  stringtext=stringtext.replace(oldesj,newesj);
		  stringtext=stringtext.replace(oldesj,newesj);
		  
		  oTD.innerHTML =stringtext;
		  
	        }else{
	          
	          oTD.innerHTML = childNodes[n].innerHTML;
	         
	        }
	}
		oTR.appendChild(oTD);
}	
	oTbody.appendChild(oTR);
	//ոƵ
	resetTrContent(oTR);

}
/**
* tableеһֵΪһֵʹеĶӦֵͬɾʱcheckboxֵΪһidֵʱã
* param:srcRowName - Դ
* param:toRowName - ֵ
* author: limenghai
*/
function sameValueRowToRow(srcRowName,toRowName)
{
	if(!srcRowName || srcRowName == "" || !toRowName || toRowName == "")
		return;
		
	var srcRows = document.getElementsByName(srcRowName);
	var toRows = document.getElementsByName(toRowName);
	
	if(srcRows && toRows)
	{
		var rowLength = srcRows.length;
		if(toRows.length <rowLength)
			rowLength = toRows.length;//ȡСġһӦȡ
		
			
		for(var i=0;i<rowLength;i++)
		{
			//ֵ
			toRows[i].value=srcRows[i].value;
		}
	}
}



/**
* description:tableһTrIDǰһƵС
* ṩһصģҲԲصģСTrIDǰӡ
* tableҪ:Ѿ2С1.TrIDǰһҪƵС2.TrID
* param:TrID - TR  id
* author: limenghai
*/
function addTableRowByTrID(TrID)
{
	if(!TrID || "TR" !=(TrID.tagName).toUpperCase() )
	{
		alert("ṩһ TR  ID ");
		return null;
	}
	var tableID = TrID.parentNode.parentNode;
		
	var oTbody = tableID.firstChild;
	while(oTbody.tagName.toUpperCase() != "TBODY")
	{
		oTbody = oTbody.nextSibling;
	}
	if(!oTbody.childNodes || oTbody.childNodes.length <= 1)
	{
		alert("ñ?޷ӣȷñѾٴС");
		return null;	
	}
	
	var oneTr = TrID.previousSibling;
	var oTR = document.createElement("TR");
	var childNodes = oneTr.childNodes;
	for(var n=0;n<childNodes.length;n++)
	{
		var oTD = childNodes[n].cloneNode();
		//var oTD = document.createElement("TD");
		oTD.innerHTML = childNodes[n].innerHTML;
		oTR.appendChild(oTD);
	}
	oTbody.insertBefore(oTR,TrID);
	
	
	//ոƵ
	resetTrContent(oTR);
	
	return oTR;
}

/**
* description:Trеݡ
* param:TrID - TR  id
* author: limenghai
*/
function resetTrContent(TrID)
{
	if(!TrID || "TR" !=(TrID.tagName).toUpperCase() )
	{
		return ;
	}	
	
	var inputs = TrID.getElementsByTagName("INPUT");
	for(var n=0;n<inputs.length;n++)
	{
		if(inputs[n].type == 'text' || inputs[n].type == 'checkbox'
		|| inputs[n].type == 'hidden')
		{
			inputs[n].value="";
			if(inputs[n].type == 'checkbox')
				inputs[n].checked = false;
		}
	}
	inputs = TrID.getElementsByTagName("TEXTAREA");
	for(var n=0;n<inputs.length;n++)
	{
		inputs[n].value="";
	}
	//alert("addTableRow end");
	/*var selects = oTR.getElementsByTagName("SELECT");
	for(var n=0;n<selects.length;n++)
	{
		selects[n].index=0;
	}*/
}

/**
* description:Trеݡ
* param:TrID - TR  id
* author: limenghai
*/
function setTrContent(TrID,arValue)
{
	if(!TrID || "TR" !=(TrID.tagName).toUpperCase() )
	{
		return ;
	}	
	
	var inputs = TrID.getElementsByTagName("INPUT");
	for(var n=0;n<inputs.length;n++)
	{
		if(inputs[n].type == 'text')
		{
			inputs[n].value=arValue[n];
		}
	}
	
}

/**
* ɾtableָinputΪյС
* param:tableID -id
* param:itemName -inputnameinputֵΪɾ֮
* author: limenghai
*/
function removeEmptyTableRow(tableID,itemName)
{
	if(!tableID || !itemName || itemName =="")
		return false;
	var inputs = tableID.getElementsByTagName("INPUT");
	if(inputs && inputs.length > 0)
	{
		for(var i=0;i<inputs.length;i++)
		{
			if(inputs[i].name == itemName && inputs[i].value =="")
			{
				var oTr = inputs[i].parentNode.parentNode;
				var oTbody = oTr.parentNode;
				oTbody.removeChild(oTr);
			}
		}
	}
	return true;
}

/**
* ֪һTDеĶɾС
* param:inputObject 
* 
*/
function removeOneTableRow(inputObject)
{
	if(!inputObject)
		return false;
		
	var oTR = inputObject.parentNode;
	while(oTR.tagName.toUpperCase() !="TR")
	{
		oTR = oTR.parentNode;
	}
	
	var oTRParentNode = oTR.parentNode;
	oTRParentNode.removeChild(oTR);
	
	return true;
}

/**
* 删除行
* param:inputObject
* 
*/
function removeThisRow()
{
	if(!confirm("确定要删除该行么？"))
		return false;
		
	inputObject = event.srcElement;
	if(!inputObject)
		return false;
	
	var oTR = inputObject.parentNode;
	while(oTR.tagName.toUpperCase() !="TR")
	{
		oTR = oTR.parentNode;
	}
	
	var bLastRow = false;
	var oInputs = oTR.getElementsByTagName("INPUT");
	
	if(oInputs && oInputs.length > 0)//input
	{
		var oneInputs = document.getElementsByName(oInputs[0].name);
		if(oneInputs == null || oneInputs.length == 1)
			bLastRow = true;
	}
	else 
	{
		var oSelects = oTR.getElementsByTagName("SELECT");
		if(oSelects && oSelects.length > 0)
		{
			var oneSelects = document.getElementsByName(oSelects[0].name);
			if(oneSelects == null || oneSelects.length == 1)
				bLastRow = true;
		}
	}
	if(bLastRow == true)
	{
		alert("最后一行不允许删除！");	
		return false;
	}
	
	var oTRParentNode = oTR.parentNode;
	oTRParentNode.removeChild(oTR);
	
	return true;
}


/**
*
* tablestyle.displaynoneС
* param:tableID -id
*/
function clearSearchTable(tableID)
{
	if(!tableID || !tableID.childNodes || tableID.childNodes.length == 0)
	{
		alert("ñ?ڻ޷գ");
		return ;	
	}
	var oTbody = tableID.firstChild;
	while(oTbody.tagName.toUpperCase() != "TBODY")
	{
		oTbody = oTbody.nextSibling;
	}
	var oTRs = oTbody.childNodes;
	for(var n=oTRs.length-1;n>=0;n--)
	{
		var display =oTRs[n].style.display;
		//alert(display); 
		if(display !="none")
		{
			//alert("delete");
			oTbody.removeChild(oTRs[n]);
		}
		//else
			//alert("not delete");
	}
}