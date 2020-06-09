package com.roc.sysmanager.dwr;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.roc.sysmanager.base.service.ClienService;
import com.roc.syspe.entity.OpOrderticketsKeyword;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.service.TempClienService;

public class UpdateStatusDWR {

	public int  updateStatusAtDJP(String id,String flightInfoIds){
		ClienService cs=new ClienService();
		Pattern p = Pattern.compile("\\D");
		Matcher matc=p.matcher(id);
		if(matc.matches() || flightInfoIds == null ){
			return -1;
		}
		int wid=Integer.parseInt(id);
		int count=cs.queryStatusByCustomerId(wid,flightInfoIds);
		if(count==0){
			return -1;
		}
		return cs.updateStatusAtDJP(wid)>0?wid:-1;
	}
	/**
	 * 扫描并更改状态为已登机
	 * @param id
	 * @return
	 */
	public int  upFly(String id,String flightInfoIds){
		ClienService cs=new ClienService();
		Pattern p = Pattern.compile("\\D");
		Matcher matc=p.matcher(id);
		if(matc.matches() || flightInfoIds == null){
			return -1;
		}
		int wid=Integer.parseInt(id);
		int count=cs.selectStatusForOver(wid,flightInfoIds);
		if(count==0){
			return -1;
		}
		return cs.updateStatusOver(wid)>0?wid:-1;
	}
	
	public boolean updateStatusAtDJPForSeatNum(String id,Integer flightInfoId){
		ClienService cs=new ClienService();
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setSeleFlightInfo(flightInfoId);
			kw.setSeatNum(id.trim());
			int num = cs.getCountByFlightInfoIdSeatNum(kw);
			if(num > 0){
				return cs.updateStatusAtDJPForSeatNum(kw);
			}else
				return false;
		
	}
	public int updateTempStatusAtDJP(String id,int flightInfoId){
		TempClienService cs=new TempClienService();
		Pattern p = Pattern.compile("\\D");
		Matcher matc=p.matcher(id);
		if(matc.matches() ){
			return -1;
		}
		int wid=Integer.parseInt(id);
		TempOrdertickets order =cs.queryTempOrderticketsById(wid);
		if(order == null ){
			return -1;
		}
		int tId = order.getTempFlightinfoId();
		if (tId != flightInfoId || !order.getStatus().equals("3")) {
			return -1;
		}
		order.setStatus("4");
		boolean b = cs.tpTemptdOpOrderticket(order);
		return b?wid:-1;
	}
	public int  upTempFly(String id,int flightInfoId){
		TempClienService cs=new TempClienService();
		Pattern p = Pattern.compile("\\D");
		Matcher matc=p.matcher(id);
		if(matc.matches() ){
			return -1;
		}
		int wid=Integer.parseInt(id);
		TempOrdertickets order =cs.queryTempOrderticketsById(wid);
		if(order == null){
			return -1;
		}
		int tId = order.getTempFlightinfoId();
		if (tId != flightInfoId || !order.getStatus().equals("4")) {
			return -1;
		}
		order.setStatus("7");
		boolean b = cs.tpTemptdOpOrderticket(order);
		return b?wid:-1;
	}
}
