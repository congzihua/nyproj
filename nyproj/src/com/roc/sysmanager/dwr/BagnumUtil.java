package com.roc.sysmanager.dwr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.roc.sysmanager.base.service.BaTicketsallocService;
import com.roc.syspe.entity.Bagnum;

public class BagnumUtil {
	private static BagnumUtil bagnumUtil;
	private BagnumUtil(){
		
	}
	public static synchronized BagnumUtil getBagnumUtil(){
		if(bagnumUtil ==null){
			bagnumUtil = new BagnumUtil();
		}
		return bagnumUtil;
	}
	public static synchronized String getBagnum(){
		Bagnum bagnum = new Bagnum();
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		String yMd = format.format(new Date());
		BaTicketsallocService service = new BaTicketsallocService();
		List<Bagnum> banumList = service.getBagnumList(null);
		try{
			if(banumList == null || banumList.size() < 1){
				bagnum.setMonday(yMd);
				yMd+="001";		
				bagnum.setMaxnum(Long.valueOf(yMd));
				
				service.insertBagnum(bagnum);
			}else{
				bagnum = banumList.get(0);
				
				if(bagnum.getMonday()!=null && bagnum.getMonday().trim().equals(yMd)){
					bagnum.setMaxnum(bagnum.getMaxnum()+1);
				}else{
					bagnum.setMonday(yMd.trim());
					yMd+="001";	
					bagnum.setMaxnum(Long.valueOf(yMd));
				}
				service.editBagnum(bagnum);
			}
		}catch(Exception e){
			e.printStackTrace();
			return "-1";
		}
		
		return bagnum.getMaxnum().toString();
	}
}
