<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
switch
</title>
</head>
<script>
function switchSysBar(){
    if (parent.document.getElementById("enpTaskMenu").style.display == "none"){
        document.getElementById("frameshow").src = '../images/p_1.gif';
        document.getElementById("frameshow").alt = "关闭左栏";
        parent.document.getElementById("enpMainFrame").cols= "120,10,*";
        parent.document.getElementById("enpTaskMenu").style.display = "block";

    }
    else{
        document.getElementById("frameshow").src = '../images/p_2.gif';
        document.getElementById("frameshow").alt = "打开左栏";
        parent.document.getElementById("enpMainFrame").cols= "0,10,*";
        parent.document.getElementById("enpTaskMenu").style.display = "none";
    }
}
</script>
<BODY bgcolor="#cccc9" >
<TABLE border="0" cellPadding="0" cellSpacing="0" width="10">
     <TBODY>
      <TR>
          <TD style="HEIGHT: 100%">
              <IMG alt="关闭左栏" border="0" height="50" id="frameshow" onclick="switchSysBar()"; src="../images/p_1.gif" width="9">
          </TD>
     </TR>
     </TBODY>
</TABLE>
</html>
