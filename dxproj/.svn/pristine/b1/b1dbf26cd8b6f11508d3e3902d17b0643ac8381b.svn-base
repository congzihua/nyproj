package com.flyticket.system.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;

import com.flyticket.system.beans.OrderTicketUnitBean;
import com.roc.enp.entity.BaFlight;
import com.roc.syspe.entity.OpOrdertickets;

public class ExcelOpUnit {
	private static byte[] lock = new byte[0];
	/**
	 * 
	 */
	public static boolean exportExcel(List<BaFlight> list,Map<String,List<OpOrdertickets>> map,String title,HttpServletRequest request, HttpServletResponse response){
		String startAddress = ArgsUnit.getStartAddress();
		try {					
		    String filePath = request.getSession(true).getServletContext().getRealPath("/excelmodel/unitsmodal.xls");
		    HSSFWorkbook workbook = null;		    
		    try {
				workbook = new HSSFWorkbook(new FileInputStream(filePath));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return false;
			} 
			HSSFCellStyle sty = workbook.createCellStyle();
			sty.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			sty.setFillForegroundColor(HSSFColor.WHITE.index);
			sty.setAlignment(CellStyle.ALIGN_CENTER);
			sty.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		    sty.setBottomBorderColor(HSSFColor.BLACK.index);
			sty.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
			sty.setLeftBorderColor(HSSFColor.BLACK.index);
			sty.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
			sty.setRightBorderColor(HSSFColor.BLACK.index);
			sty.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
			sty.setTopBorderColor(HSSFColor.BLACK.index);
			
			HSSFCellStyle styTitle = getTableTitleStyle(workbook);
			HSSFCellStyle styTitle1 = getTableTitleStyle(workbook);
			HSSFCellStyle styTitle2 = getTableTitleStyle(workbook);
			HSSFSheet sheet = workbook.getSheetAt(0);   //读取第一个工作簿    
			HSSFRow row = null;    
			int i = -1,count = 0,k=0,nums=0,totalNums=0;Double pjxj = 0.0D,total = 0.0D,toP = 0.0D;
			if(list != null){				
				for(BaFlight bf:list){
					 List<OpOrdertickets> opList  = map.get("unitsIfno"+k)==null?null: map.get("unitsIfno"+k); 
					 if(k >= 0){
						 row = sheet.createRow(++i);
						 row.createCell(0).setCellValue(title+startAddress+"至"+bf.getFlight()+"售票信息统计");
						//设置Excel中的背景
						 styTitle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
						 styTitle.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
						 row.getCell(0).setCellStyle(styTitle);	
				 		 sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 6));
				 		//设置Excel中的背景
						 styTitle1.setFillForegroundColor(HSSFColor.GREEN.index);
						 styTitle1.setFillBackgroundColor(HSSFColor.GREEN.index); 
				 		 int j = 0;
						 row = sheet.createRow(++i);
						 row.createCell(j).setCellValue("序号");
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("始发地");//出发地
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("目的地");//目的地
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("票价类型");//票价类型
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("单价");//单价
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("张数");//张数
				 		 row.getCell(j).setCellStyle(styTitle);					 		 
				 		 row.createCell(++j).setCellValue("票价小计");//票价小计
				 		 row.getCell(j).setCellStyle(styTitle1);						 
					 }
					 if(opList!=null){
						 for(OpOrdertickets ot:opList){
							 row = sheet.createRow(++i);
					 		 row.setHeight((short)300);
							 nums+= ot.getCounts();
							 pjxj = Double.valueOf(ot.getCounts()*ot.getRealAmount());
							 total+= pjxj;
							 int j = 0;
					 		 row.createCell(j).setCellValue(++count);
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(startAddress);//出发地
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(ot.getFlight());//目的地
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(ot.getDiscountType());//票价类型
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(ot.getRealAmount());//单价
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(ot.getCounts());//张数
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(pjxj);//票价小计
					 		 row.getCell(j).setCellStyle(sty);							
					    }
					}
					 row = sheet.createRow(++i);
			 		 row.setHeight((short)400);					 
					 int j = 0;
			 		 row.createCell(j).setCellValue("合计");
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue("--");//出发地
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue("--");//目的地
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue("--");//票价类型
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue("--");//单价
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue(nums);//张数
			 		 row.getCell(j).setCellStyle(sty);					 		 
			 		 row.createCell(++j).setCellValue(total);//票价小计
			 		 row.getCell(j).setCellStyle(sty);
				     k++;totalNums+=nums;toP+=total; nums=0;total=0.0D;
				}				
		 	}
			 row = sheet.createRow(++i);
	 		 row.setHeight((short)400);
	 		 int jj = 0;
	 		//设置Excel中的背景
			 styTitle2.setFillForegroundColor(HSSFColor.WHITE.index);
			 styTitle2.setFillBackgroundColor(HSSFColor.WHITE.index); 
	 		row.createCell(jj).setCellValue("总计张数:"+totalNums+"    总金额:"+toP+" 元");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		row.createCell(++jj).setCellValue("");	 		
	 		row.getCell(jj).setCellStyle(styTitle2);
	 		sheet.addMergedRegion(new CellRangeAddress(i, i, 0, 6));
	 		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
	 		long tLong = System.currentTimeMillis();
	 		String path ="d:/out_excels/"+format.format(new Date());
	 		String oldFilePath = path+"/"+tLong+".xls";
	 		String newFilePath = path+"/"+(++tLong)+".xls";
	 	    File fileDirs = new File(path);
	 		File file = new File(oldFilePath);
	 		if(!fileDirs.exists()){
	 			fileDirs.mkdirs();
	 		}
	 		FileOutputStream outStream = null;
	 		FileInputStream inputStream = null;
			try{
				 outStream = new FileOutputStream(file);
				 workbook.write(outStream);
				 outStream.flush();    
				 outStream.close();
				 workbook = null;
				 synchronized(lock){
					 try {
						 EncryptGen.encryptFile(oldFilePath, newFilePath);
						 String fileName = title+startAddress+"机场售票信息统计.encrypt";
							try {
								fileName = new String(fileName.getBytes("GBK"),"ISO-8859-1");
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
						  
						 response.addHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
						 response.setContentType("application/vnd.ms-excel");
						 OutputStream os = response.getOutputStream();	
						 inputStream = new FileInputStream(newFilePath);
						 byte[] b = new byte[1024];
						 int len = 0;
						 while ((len = inputStream.read(b)) > 0) {
								os.write(b, 0, len);
						 }
						 inputStream.close();
						 os.flush();    
						 os.close();
						
					} catch (Exception e) {
						e.printStackTrace();
						return false;
					}
				 }
				
			}catch(IOException e){
				e.printStackTrace();
				return false;
			}finally{
				if(outStream!=null){
					outStream.close();
				}
				if(inputStream!=null){
					inputStream.close();
				}
			}
	 	}catch (IOException e) {
			e.printStackTrace();
			return false;
		}  
		return true;
	}
	private static HSSFCellStyle getTableTitleStyle(HSSFWorkbook workbook){
		HSSFCellStyle style = workbook.createCellStyle();
		  style.setFillBackgroundColor(HSSFCellStyle.LEAST_DOTS);
		  style.setFillPattern(HSSFCellStyle.LEAST_DOTS);

		  //设置Excel中的边框(表头的边框)
		  style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		  style.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
		  style.setBottomBorderColor(HSSFColor.BLACK.index);
		  style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
		  style.setLeftBorderColor(HSSFColor.BLACK.index);
		  style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
		  style.setRightBorderColor(HSSFColor.BLACK.index);
		  style.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
		  style.setTopBorderColor(HSSFColor.BLACK.index);
		  //设置字体
		  HSSFFont font = workbook.createFont();
		  font.setFontHeightInPoints((short) 16); // 字体高度
		  font.setFontName(" 黑体 "); // 字体
		  style.setFont(font);		  
		  return style;

	}
	/**
	 * 
	 */
	public static boolean exportExcelYear(List<BaFlight> list,Map<String,List<OrderTicketUnitBean>> map,String year,HttpServletRequest request, HttpServletResponse response){
		String startAddress = ArgsUnit.getStartAddress(request.getSession(true).getServletContext().getRealPath("/"));
		try {					
		    String filePath = request.getSession(true).getServletContext().getRealPath("/excelmodel/unitsmodalyear.xls");
		    HSSFWorkbook workbook = null;		    
		    try {
				workbook = new HSSFWorkbook(new FileInputStream(filePath));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return false;
			} 
			HSSFCellStyle sty = workbook.createCellStyle();
			HSSFCellStyle sty1 = workbook.createCellStyle();
			HSSFCellStyle sty2 = workbook.createCellStyle();
			HSSFCellStyle rightSty = workbook.createCellStyle();
			sty.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			sty.setFillForegroundColor(HSSFColor.WHITE.index);
			sty.setAlignment(CellStyle.ALIGN_CENTER);
			sty.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    sty.setBottomBorderColor(HSSFColor.BLACK.index);
			sty.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			sty.setLeftBorderColor(HSSFColor.BLACK.index);
			sty.setBorderRight(HSSFCellStyle.BORDER_THIN);
			sty.setRightBorderColor(HSSFColor.BLACK.index);
			sty.setBorderTop(HSSFCellStyle.BORDER_THIN);
			sty.setTopBorderColor(HSSFColor.BLACK.index);
			
			
			rightSty.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			rightSty.setFillForegroundColor(HSSFColor.WHITE.index);
			rightSty.setAlignment(CellStyle.ALIGN_RIGHT);
			rightSty.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			rightSty.setBottomBorderColor(HSSFColor.BLACK.index);
			rightSty.setBorderLeft(HSSFCellStyle.BORDER_THIN);
			rightSty.setLeftBorderColor(HSSFColor.BLACK.index);
			rightSty.setBorderRight(HSSFCellStyle.BORDER_THIN);
			rightSty.setRightBorderColor(HSSFColor.BLACK.index);
			rightSty.setBorderTop(HSSFCellStyle.BORDER_THIN);
			rightSty.setTopBorderColor(HSSFColor.BLACK.index);
			   //读取第一个工作簿    
			HSSFRow row = null;    
			long allPriceTotal = 0;//全价
			long soldierPriceTotal = 0;//军人
			long eightPriceTotal = 0;//八折
			long fivePriceTotal = 0;//五折
			long childrenFivePriceTotal = 0;//儿童五折
			long babyPriceTotal = 0;//婴儿
			long overallPriceTotal = 0;//全免 = 0
			long personTotal = 0;
			double priceTotal = 0;
			int k = 0;
			if(list != null){				
				for(BaFlight bf:list){
					 HSSFSheet sheet = workbook.getSheetAt(k);
					 k++;
					 List<OrderTicketUnitBean> opList  = map.get(""+bf.getId())==null?null: map.get(""+bf.getId()); 
					
					 if(opList!=null){
						 row = sheet.createRow(1);
						 row.setHeightInPoints(24F);
						 String mc = null;
						 if(startAddress.contains("南苑") || startAddress.contains("北京")){
							 mc = "南苑保障办";
						 }else if(startAddress.contains("鼎新")){
							 mc = "鼎新保障办";
						 }else if(startAddress.contains("库")){
							 mc = "库尔勒保障办";
						 }
						 row.createCell(0).setCellValue("编报单位："+mc);
//						 HSSFCellStyle sty1 = sty;
						 sty1.setAlignment(CellStyle.ALIGN_LEFT);
						 row.getCell(0).setCellStyle(sty1);						
						 row.createCell(4).setCellValue("航程："+startAddress+"--"+bf.getFlight());
//						 sty2.setAlignment(sty1);
						 row.getCell(4).setCellStyle(sty1);	
						 row.createCell(9).setCellValue("编报时间："+new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
						 row.getCell(9).setCellStyle(sty1);
						 int rowNumStart = 3;
						 for(OrderTicketUnitBean ot:opList){
							 row = sheet.createRow(++rowNumStart);
//					 		 row.setHeight((short)300);
							 row.setHeightInPoints(18.75F);
					 		allPriceTotal += ot.getAllPriceCount();//全价
							soldierPriceTotal += ot.getSoldierPriceCount();//军人
							eightPriceTotal += ot.getEightPriceCount();//八折
							fivePriceTotal += ot.getFivePriceCount();//五折
							childrenFivePriceTotal += ot.getChildrenFivePriceCount();//儿童五折
							babyPriceTotal += ot.getBabyPriceCount();//婴儿
							overallPriceTotal += ot.getOverallPriceCount();//全免 = 0
							personTotal += ot.getPersonCount();
							priceTotal += ot.getPriceCount();
							 int j = 0;
					 		 row.createCell(j).setCellValue(ot.getMonth());
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(ot.getDay());//出发地
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 				 		 
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getAllPriceCount()));//票价类型
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getSoldierPriceCount()));//单价
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getEightPriceCount()));//张数
					 		 row.getCell(j).setCellStyle(sty);					 		 
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getFivePriceCount()));//票价小计
					 		 row.getCell(j).setCellStyle(sty);
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getChildrenFivePriceCount()));
					 		 row.getCell(j).setCellStyle(sty);
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getBabyPriceCount()));
					 		 row.getCell(j).setCellStyle(sty);
					 		 row.createCell(++j).setCellValue(formatNumLong(ot.getOverallPriceCount()));
					 		 row.getCell(j).setCellStyle(sty);
					 		row.createCell(++j).setCellValue(formatNumLong(ot.getPersonCount()));
					 		 row.getCell(j).setCellStyle(sty);
					 		row.createCell(++j).setCellValue(formatNumDouble(ot.getPriceCount()));
					 		 row.getCell(j).setCellStyle(rightSty);
					    }
						 row = sheet.createRow(++rowNumStart);
//				 		 row.setHeight((short)400);		
						 row.setHeightInPoints(18.75F);
						 int j = 0;
				 		 row.createCell(j).setCellValue("合计");
				 		 row.getCell(j).setCellStyle(sty);					 		 
				 		 row.createCell(++j).setCellValue("");//出发地
				 		 row.getCell(j).setCellStyle(sty);					 		 
				 		 row.createCell(++j).setCellValue(formatNumLong(allPriceTotal));//票价类型
				 		 row.getCell(j).setCellStyle(sty);					 		 
				 		 row.createCell(++j).setCellValue(formatNumLong(soldierPriceTotal));//单价
				 		 row.getCell(j).setCellStyle(sty);					 		 
				 		 row.createCell(++j).setCellValue(formatNumLong(eightPriceTotal));//张数
				 		 row.getCell(j).setCellStyle(sty);					 		 
				 		 row.createCell(++j).setCellValue(formatNumLong(fivePriceTotal));//票价小计
				 		 row.getCell(j).setCellStyle(sty);
				 		 row.createCell(++j).setCellValue(formatNumLong(childrenFivePriceTotal));
				 		 row.getCell(j).setCellStyle(sty);
				 		 row.createCell(++j).setCellValue(formatNumLong(babyPriceTotal));
				 		 row.getCell(j).setCellStyle(sty);
				 		 row.createCell(++j).setCellValue(formatNumLong(overallPriceTotal));
				 		 row.getCell(j).setCellStyle(sty);
				 		row.createCell(++j).setCellValue(formatNumLong(personTotal));
				 		 row.getCell(j).setCellStyle(sty);
				 		row.createCell(++j).setCellValue(formatNumDouble(priceTotal));
				 		 row.getCell(j).setCellStyle(rightSty);
				 		sheet.addMergedRegion(new CellRangeAddress(rowNumStart, rowNumStart, 0,1));
					}
					 
					 allPriceTotal = 0;soldierPriceTotal = 0;eightPriceTotal = 0;fivePriceTotal = 0;//五折
						childrenFivePriceTotal = 0;//儿童五折
						babyPriceTotal = 0;//婴儿
						overallPriceTotal = 0;//全免 = 0
						personTotal = 0;
						priceTotal = 0;
				}				
		 	}
			SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
	 		long tLong = System.currentTimeMillis();
	 		String path ="d:/out_excels/"+format.format(new Date());
	 		String oldFilePath = path+"/"+tLong+".xls";
	 		String newFilePath = path+"/"+(tLong)+".encrypt";
	 	    File fileDirs = new File(path);
	 		File file = new File(oldFilePath);
	 		if(!fileDirs.exists()){
	 			fileDirs.mkdirs();
	 		}
	 		FileOutputStream outStream = null;
	 		FileInputStream inputStream = null;
			try{
				 outStream = new FileOutputStream(file);
				 workbook.write(outStream);
				 outStream.flush();    
				 outStream.close();
				 workbook = null;
				 synchronized(lock){
					 try {
						 EncryptGen.encryptFile(oldFilePath, newFilePath);
						 List<File> listfile = new ArrayList<File>();
						 File fileOld =  new File(oldFilePath);
						 fileOld.setReadOnly();
						 listfile.add(fileOld);
						 listfile.add(new File(newFilePath));
						 FileToZip.downLoadFiles(listfile, year+"年"+startAddress+"机场售票信息统计.zip",request,response);
						 
//						 String fileName = year+"年"+startAddress+"机场售票信息统计.encrypt";
//							try {
//								fileName = new String(fileName.getBytes("GBK"),"ISO-8859-1");
//							} catch (UnsupportedEncodingException e) {
//								e.printStackTrace();
//							}
//						  
//						 response.addHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
//						 response.setContentType("application/vnd.ms-excel");
//						 OutputStream os = response.getOutputStream();	
//						 inputStream = new FileInputStream(newFilePath);
//						 byte[] b = new byte[1024];
//						 int len = 0;
//						 while ((len = inputStream.read(b)) > 0) {
//								os.write(b, 0, len);
//						 }
//						 inputStream.close();
//						 os.flush();    
//						 os.close();
						
					} catch (Exception e) {
						e.printStackTrace();
						return false;
					}
				 }
				
			}catch(IOException e){
				e.printStackTrace();
				return false;
			}finally{
				if(outStream!=null){
					outStream.close();
				}
				if(inputStream!=null){
					inputStream.close();
				}
			}
	 	}catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	private static String formatNumDouble(Double fn){
		DecimalFormat f = new DecimalFormat("##,##0.00");
		return f.format(fn);
	}
	private static  String formatNumLong(Long fn){
		DecimalFormat f = new DecimalFormat("##,###");
		return f.format(fn);
	}
	
}
