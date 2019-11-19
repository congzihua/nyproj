package com.roc.sysmanager.base.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WriteException;

import com.flyticket.system.util.ArgsUnit;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.roc.syspe.entity.OpOrdertickets;
//import com.sun.corba.se.spi.orbutil.fsm.Input;

public class ExcelUtil {

	public static void printByExcel(OpOrdertickets orderT,String operName,String tUrl){
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		String currDate = format.format(new Date());
		Workbook wb = null;
		jxl.write.WritableWorkbook wwb=null;
		try {
//			this.getClass().getClassLoader().getResource("/").getPath() + "/" + ".xls"
//			System.out.println(ExcelUtil.class.getClass().getClassLoader().getResource("./").getPath());
			String url1=ExcelUtil.class.getClassLoader().getResource("/").getPath();
			String[] strArr=url1.split("/WEB-INF");
			String str=strArr[0];
			String mUrl=str+"/client/excel/Modeul.xls";
			
			wb = Workbook.getWorkbook(new File(mUrl));
			wwb=Workbook.createWorkbook(new File(tUrl),wb);
			WritableSheet wws = wwb.getSheet(0);
			Label name = (Label)wws.getWritableCell(1,0);
			name.setString(orderT.getName());//谢尔盖伊俄罘    名字
			Label certNo = (Label)wws.getWritableCell(3,0);
			certNo.setString(orderT.getCertNo());//证件号码
			Label from = (Label)wws.getWritableCell(0,2);
			String startAddress = ArgsUnit.getStartAddress();
			from.setString((startAddress.contains("北京")?"北京南郊":startAddress));
			Label to = (Label)wws.getWritableCell(0,3);
			to.setString(orderT.getFlight());//"鼎新"
			Label fn = (Label)wws.getWritableCell(1,2);
			fn.setString(orderT.getFlightNo());//航班号
			Label date = (Label)wws.getWritableCell(2,2);
			date.setString(format.format(orderT.getFlightDate()));//"2012.1.12
			Label time = (Label)wws.getWritableCell(3,2);
			time.setString(orderT.getFlyTime());//"09:09"
			Label price = (Label)wws.getWritableCell(4,2);
			price.setString(orderT.getTicketprice()==null||orderT.getTicketprice()<1?"":String.valueOf(orderT.getTicketprice().longValue()));//
			Label pricesmall = (Label)wws.getWritableCell(1,3);
			pricesmall.setString(orderT.getTicketprice()==null||orderT.getTicketprice()<1?"":String.valueOf(orderT.getTicketprice().longValue()));//"1688.00"
			Label pricesbig = (Label)wws.getWritableCell(1,4);
			pricesbig.setString(orderT.getTicketprice()==null||orderT.getTicketprice()<1?"全免":format(String.valueOf(orderT.getTicketprice().longValue())));//"壹仟陆佰捌拾捌圆"
			Label charge = (Label)wws.getWritableCell(4,4);
			charge.setString(orderT.getHalfpricecard()!=null&&orderT.getHalfpricecard().trim().length()>0?orderT.getHalfpricecard():(orderT.getZeropricecard()!=null && orderT.getZeropricecard().trim().length()>0?orderT.getZeropricecard().trim():""));//优惠凭证
			Label operator = (Label)wws.getWritableCell(0,5);
			operator.setString(operName);//"吴菊萍"
			Label operateTime = (Label)wws.getWritableCell(4,5);
			operateTime.setString(currDate);//"2012-01-01"
			wwb.write();

		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
			 if(wwb!=null){
				wwb.close();
				
			 }
			 if(wb !=null){
				 wb.close();
				 
			 }
			} catch (WriteException e) {
				e.printStackTrace();
				
			} catch (IOException e) {
				e.printStackTrace();
				
			}
		}
		
	}
	
	public static void proceed(OpOrdertickets orderT,String operName) throws Exception{
		//保证进程被杀死 
		//killProcess("EXCEL.EXE");
		String targName = String.valueOf(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		String path = ArgsUnit.getDataOutDir()+format.format(new Date())+"/"+operName;
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		String tUrl=path+"/"+targName+".xls";
		printByExcel(orderT,operName,tUrl);
		ActiveXComponent xl = null;
		try{
			ComThread.InitSTA();
			xl = new ActiveXComponent("Excel.Application"); 
			//		new Variant(false)  打印时是否显示文档       false不显示   
			Dispatch.put(xl, "Visible", new Variant(false)); 
		    Dispatch workbooks = xl.getProperty("Workbooks").toDispatch(); 
		    String url1=ExcelUtil.class.getClassLoader().getResource("/").getPath();
		    String[] strArr=url1.split("/WEB-INF");
		    String str=strArr[0];
           //		打开文档 		
		    str=str.substring(1);
		    Dispatch excel=Dispatch.call(workbooks,"Open",tUrl).toDispatch(); 
		    Dispatch.get(excel,"PrintOut"); 
		 // 开始打印
            if (excel != null) {
                // Dispatch.call(excel, "PrintOut");
                // 增加以下三行代码解决文件无法删除bug
                Dispatch.call(excel, "save");
                Dispatch.call(excel, "Close", new Variant(true));
                excel = null;
            }
            xl.invoke("Quit", new Variant[] {});
            xl = null;            
		               
		}catch (Exception e){
			e.printStackTrace();
		}finally{ 		
			ComThread.Release();
			xl = null;
			
		}

	}
	
//	public static void main(String[] args) {
////		System.out.println(ExcelUtil.class.getClassLoader().getResource(".").getPath());
////		ExcelUtil.proceed();
////		ExcelUtil.printByExcel();
//	}
	
	private  static final  String [] pattern ={"零","壹","贰","叁","肆","伍","陆","柒","捌","玖"};
	 private static final String [] cPattern ={"","拾","佰","仟","万","拾","佰","仟","亿"};
	 private static final String [] cfPattern = {"","角","分"};
	 private static final String ZEOR = "零";
	 
	 
	 public  static String format(String moneyString){
	  int dotPoint = moneyString.indexOf("."); //判断是否为小数
	  String moneyStr;      
	  if(dotPoint != -1){
	   moneyStr = moneyString.substring(0,moneyString.indexOf("."));
	  }
	  else{
	   moneyStr = moneyString;
	  }
	  StringBuffer fraction = null;   //小数部分的处理,以及最后的yuan.
	  StringBuffer ms = new StringBuffer(); 
	  for(int i = 0;i < moneyStr.length();i++){
	   ms.append(pattern[moneyStr.charAt(i) - 48]); //按数组的编号加入对应大写汉字
	  }
	  
	  int cpCursor = 1;
	  for(int j = moneyStr.length() - 1;j > 0;j--){
	   ms.insert(j,cPattern[cpCursor]);   //在j之后加字符,不影响j对原字符串的相对位置
	              //只是moneyStr.length()不断增加
	              //insert(j,"string")就在j位置处插入,j=0时为第一位
	   cpCursor = cpCursor == 8?1:cpCursor + 1;    //亿位之后重新循环
	  }
	  
	  
	  while(ms.indexOf("零拾") != -1){  //当十位为零时用一个"零"代替"零拾"
	            //replace的起始于终止位置
	   ms.replace(ms.indexOf("零拾"),ms.indexOf("零拾") + 2,ZEOR);
	  }
	  while(ms.indexOf("零佰") != -1){  //当百位为零时,同理
	   ms.replace(ms.indexOf("零佰"),ms.indexOf("零佰") + 2,ZEOR);
	  }
	  while(ms.indexOf("零仟") != -1){  //同理
	   ms.replace(ms.indexOf("零仟"),ms.indexOf("零仟") + 2,ZEOR);
	  }
	  while(ms.indexOf("零万") != -1){  //万需保留，中文习惯
	   ms.replace(ms.indexOf("零万"),ms.indexOf("零万") + 2,"万");
	  }
	  while(ms.indexOf("零亿") != -1){  //同上
	   ms.replace(ms.indexOf("零亿"),ms.indexOf("零亿") + 2,"亿");
	  }
	  while(ms.indexOf("零零") != -1){//有连续数位出现零，即有以下情况，此时根据习惯保留一个零即可
	   ms.replace(ms.indexOf("零零"),ms.indexOf("零零") + 2,ZEOR);
	  }
	  while(ms.indexOf("亿万") != -1){  //特殊情况，如:100000000,根据习惯保留高位
	   ms.replace(ms.indexOf("亿万"),ms.indexOf("亿万") + 2,"亿");
	  }
	  while(ms.lastIndexOf("零") == ms.length()-1){  //当结尾为零j，不必显示,经过处理也只可能出现一个零
	   ms.delete(ms.lastIndexOf("零"),ms.lastIndexOf("零") + 1);
	  }
	  
	  
	  int end;
	  if((dotPoint = moneyString.indexOf(".")) != -1 ){ //是小数的进入 
	   String fs = moneyString.substring(dotPoint + 1,moneyString.length());
	   if(fs.indexOf("00") == -1 || fs.indexOf("00") >= 2){//若前两位小数全为零，则跳过操作
	    end = fs.length() > 2?2:fs.length();  //仅保留两位小数
	    fraction = new StringBuffer(fs.substring(0,end));
	    for(int j = 0;j < fraction.length();j++){
	     fraction.replace(j,j+1,pattern[fraction.charAt(j) - 48]); //替换大写汉字
	    }
	    for(int i = fraction.length();i > 0;i--){  //插入中文标识
	     fraction.insert(i,cfPattern[i]);
	    }
	    fraction.insert(0,"元");      //为整数部分添加标识
	   }
	   else{
	    fraction = new StringBuffer("元整"); 
	   }
	   
	  }
	  else{
	   fraction = new StringBuffer("元整");
	  }
	   
	  ms.append(fraction);         //加入小数部分
	  return ms.toString();
	 }
	 
	 
	 
	 
	 //"excel.exe"杀死进程方法
	 private static void killProcess(String processName) throws IOException{
		 Process process = Runtime.getRuntime().exec("tasklist"); 	
		  Scanner in=new Scanner(process.getInputStream()); 	
		  while(in.hasNextLine()){	
			  String p=in.nextLine();		
			  //打印所有进程  
				if(p.contains(processName)){	
					  StringBuffer buf=new StringBuffer();  		
					  for(int i=0;i<p.length();i++){ 		
						 char ch=p.charAt(i); 		
						 if(ch != ' '){  		
							 buf.append(ch); 		
						 } 	
					  }  
				 
				 //打印 javaw.exe的pid 				 
					  
						  System.out.println(buf.toString().split("Console")[0].substring(processName.length()));  
						  Runtime.getRuntime().exec("tskill /im "+buf.toString().split("Console")[0].substring(processName.length()));
					 
			 
				}  
		 }
	 }
	 
	 public static void main(String [] ar){
			ActiveXComponent xl = null;
			try
			{
			ComThread.InitSTA();
			xl = new ActiveXComponent("Excel.Application"); 
//			new Variant(false)  打印时是否显示文档       false不显示   
			Dispatch.put(xl, "Visible", new Variant(false));
			        Dispatch workbooks = xl.getProperty("Workbooks").toDispatch(); 
			        			
			                 Dispatch excel=Dispatch.call(workbooks,"Open","d:/da.xls").toDispatch(); 
			 
//			                 Dispatch.get(excel,"PrintOut"); 
			                 
			               
			}catch (Exception e)
			{
				e.printStackTrace();
			}finally
			{ 		
				ComThread.Release();
				xl = null;
				
			}
	 }
}
