var all_selected = false;
var check_name ="check_box";
var hidden_name ="check_hidden";

function GetRow(oElem)
{
    while (oElem)
    {
        if (oElem.tagName.toLowerCase() == "tr"
            && oElem.parentElement.tagName.toLowerCase() == "tbody")
            return oElem;
        if (oElem.tagName.toLowerCase() == "table" || oElem.tagName.toLowerCase() == "th") return false;
        oElem = oElem.parentElement;
    }
}

function selectAll()
{
    all_obj = document.all(check_name);
    if(all_obj != null)
    {
        len = all_obj.length;
 
        selectedColor = "";
        if (all_selected == false)
        {
            all_selected = true;
            selectedColor = "#FFCCCC";
        }
        else
            all_selected = false;
        if (len == null)
        {
            all_obj.checked = all_selected;
            listtable.rows.item(1).style.backgroundColor = selectedColor;
        }
        else
        {
            var j = 0;
            for (i = 0; i < len; i++)
            {
                all_obj[i].checked = all_selected;
                listtable.rows.item(j+1).style.backgroundColor = selectedColor;
                j+=2
            }
        }
    }
}

function checkSelected()
{
    var trstyle = GetRow( window.event.srcElement );
    if (! trstyle )
        return false;
    if (trstyle.style.backgroundColor.toLowerCase() == "#ffcccc")
        trstyle.style.backgroundColor = "";
    else
        trstyle.style.backgroundColor = "#FFCCCC";
}

function selected(id)
{
    var checkid = "check" + id;
    var checkobj = document.all(checkid);
    if (checkobj.checked)
        checkobj.checked = false;
    else
        checkobj.checked = true;
    var trstyle = GetRow( window.event.srcElement );
    if (! trstyle )
        return false;
    if (trstyle.style.backgroundColor.toLowerCase() == "#ffcccc")
        trstyle.style.backgroundColor = "";
    else
        trstyle.style.backgroundColor = "#FFCCCC";
}
