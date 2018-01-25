function isTooLong(str)
{
    if((str==null)||(str.length<100)) 
        return(true);
    else 
        return(false);
}
function verifyKey(str)
{
    return SpecialString(str,'1234567890-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_');
}

function verifyCol(str)
{
    return SpecialString(str,'~!@#$%^&*()`\'"><}{[]|\\=?/+-.;:',false);
}
function SpecialString(string,compare,BelongOrNot)
{
    
   if ((string==null) || (compare==null) || ((BelongOrNot!=null) && (BelongOrNot!=true) && (BelongOrNot!=false)))
   {
      alert('function SpecialString(string,compare,BelongOrNot)param error');
      return false;
   }
   if (BelongOrNot==null || BelongOrNot==true)
   {
      for (var i=0;i<string.length;i++)
      {
         if (compare.indexOf(string.charAt(i))==-1)
            return false
      }
      return true;
   }
   else
   {
      for (var i=0;i<string.length;i++)
      {
         if (compare.indexOf(string.charAt(i))!=-1)
            return false
      }
      return true;
   }
}
//phone validator
function enterTelephone()
{
    if ((event.keyCode < 45 || event.keyCode > 57)||(event.keyCode == 47)||(event.keyCode == 46)) 
        event.returnValue = false;
}
//email validator
function isValidEMail(EmailStr){ 

 var myReg = /[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/;
 if(myReg.test(jsTrim(EmailStr))) 
     return true; 
 return false; 
}
//=============================================
//Purpose: Trim left spaces
//=============================================
function jsLTrim(str){
    var rtnStr;
    rtnStr=""
    for (var i=0;i<str.length;i++){
        if (str.charAt(i)!=" "){
            rtnStr=str.substr(i);
            break;
        }
    }
    return rtnStr;
}
function isIP(strIP) {
		
		if (strIP.length == 0) return false;
		var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/g //匹配IP地址的正则表达式
		if(re.test(strIP))
		{
		if( RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256) return true;
		}
		return false;
		}
function enterNumber()
{
    if ((event.keyCode < 45 || event.keyCode > 57)||(event.keyCode == 47) ) 
        event.returnValue = false;
}
function enterIP()
{
  if ((event.keyCode < 45 || (event.keyCode > 57  && event.keyCode != 59))||(event.keyCode == 47)) 
        event.returnValue = false;
}
//==========================================
//Purpose: Trim right spaces
//==========================================
function jsRTrim(str){
    var rtnStr;
    rtnStr=""
    for (var i=str.length-1;i>=0;i--){
        if (str.charAt(i)!=" "){
            rtnStr=str.substring(0,i+1);
            break;
        }
    }
    return rtnStr;
}

//==========================================
//Purpose: Trim both left and right spaces
//==========================================
function jsTrim(str){
    return(jsLTrim(jsRTrim(str)));
}
function IsDate(DateString , Dilimeter)
{
   if (DateString==null) return false;
   if (DateString.length<8 || DateString.length>10)
       return false;       
   if (Dilimeter=='' || Dilimeter==null)
   {
    var tmpYear=DateString.substring(0,4)
    var tmpMonth=DateString.substring(4,6)
    var tmpDay=DateString.substring(6,8)
    DateString=tmpYear+"-"+tmpMonth+"-"+tmpDay;
    Dilimeter = '-';
   }
   
   var tempy='';
   var tempm='';
   var tempd='';
   var tempArray;

   tempArray = DateString.split(Dilimeter);
   if (tempArray.length!=3)
      return false;
   if (tempArray[0].length==4)
   {
      tempy = tempArray[0];
      tempd = tempArray[2];
   }
   else
   {
      tempy = tempArray[2];
      tempd = tempArray[1];
   }
   tempm = tempArray[1];
   if (tempm.charAt(0)=="0")
    tempm=tempm.substring(1,2);
   if (tempd.charAt(0)=="0")
    tempd=tempd.substring(1,2);
   var tDateString = tempy + '/'+tempm + '/'+tempd+' 8:0:0';//加八小时是因为我们处于东八区
   var tempDate = new Date(tDateString);
   if (isNaN(tempDate))
      return false;
  if (((tempDate.getUTCFullYear()).toString()==tempy) && (tempDate.getMonth()==parseInt(tempm)-1) && (tempDate.getDate()==parseInt(tempd)))
   {
      return true;
   }
   else
   {
      return false;
   }
}
function CheckTime(Str,is){
    var i,j,s,h,m,ss;
    if (Str == '')
       return false;
    if(Str.indexOf(":")>0)//取分隔符
        s=":";
    else
        return false;//非法

    i=Str.indexOf(s);//第一分隔符位置
  
    j=Str.indexOf(s,i+1);//第二分隔符位置
  
    if(is == 1){
        if(i+1>=j||i>2||j>i+3)
        { 
            return false;//非法
        }
    }

    h=Str.substring(0,i);//时
  
    if(is == 1){
        m = Str.substring(i+1,j);//分
      
        ss = Str.substring(j+1,Str.length);//秒
    
    }
    else{
        m = Str.substring(i+1,Str.length);//分
 
    }
    if(isNaN(h)||isNaN(m)||h==""||m=="")
    {
        return false;//非法
    }
    if(is == 1){
        if(isNaN(ss)||ss == "")
            return false;//非法
    }

    h=parseInt(h);
    m=parseInt(m);
    ss=parseInt(ss);
    if (h<0||h>23||m<0||m>59)
        return false;//非法
    if(is == 1){
        if(ss<0||ss>59)
            return false;//非法
    }

    return true;
}
function CheckDate(Str){
    var i,j,s,m,d,y;
    if(Str.indexOf(".")>0)//取分隔符
        s=".";
    else if(Str.indexOf("/")>0)
        s="/";
    else if(Str.indexOf("-")>0)
        s="-";
    i=Str.indexOf(s);//第一分隔符位置
  
    j=Str.indexOf(s,i+1);//第二分隔符位置
  
    if(i+1>=j||i>4||j>i+3)
    {
        return false;//非法日期格式
    }

    y=Str.substring(0,i);//年
  
    m=Str.substring(i+1,j);//月
    
    d=Str.substring(j+1,Str.length);//日
   
 if (m=="08") m="8";
    if (m=="09") m="9";
    if (d=="08") d="8";
    if (d=="09") d="9";
    if (y.length!=4)
        return false;//非法日期格式
    if (isNaN(m)||isNaN(d)||isNaN(y)||y==""||m==""||d=="")
    {
        return false;//非法日期格式
    }

    y=parseInt(y);
    m=parseInt(m);
    d=parseInt(d);
    if (m<1||m>12||d<1||d>31||y<1000)
        return false;//非法日期格式
    if ((m==2||m==4||m==6||m==9||m==11)&&d>30)
        return false;//非法日期格式
    if ((m==2&&(d>29))||((m==2)&&(d==29)&&!((y==(parseInt(y/4)*4)&&y!=parseInt(y/100)*100)||y==parseInt(y/400)*400)))
        return false;//非法日期格式

    return true;
}