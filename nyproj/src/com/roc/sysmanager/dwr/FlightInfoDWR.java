package com.roc.sysmanager.dwr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.FlightInfo;
import com.roc.sysmanager.base.form.BaFlightInfoForm;
import com.roc.sysmanager.base.service.FlightInfoService;
import com.roc.sysmanager.base.service.FlightService;

public class FlightInfoDWR {

	public boolean addFlightInfo(int flightId,String flightName,String flyDate,String flyTime){
		FlightInfo flightinfo= new FlightInfo();
		FlightInfoService service = new FlightInfoService();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List<FlightInfo> oldList=service.queryAllForSingle();
		if(oldList!=null&&oldList.size()!=0){
			int count=0;
			for(FlightInfo fi:oldList){
				String flydate_s=sdf.format(fi.getFlight_date());
				if(flightId==fi.getFlight_id()&&flyDate.equals(flydate_s)&&flyTime.equals(fi.getFly_time())){
					count++;
				}
			}
			if(count==0){
				try {
					flightinfo.setFlight_name(flightName);
					flightinfo.setFlight_id(flightId);
					Date flightDate=sdf.parse(flyDate);
					flightinfo.setFlight_date(flightDate);
					flightinfo.setFly_time(flyTime);
					flightinfo.setCreatedate(new Date());
					flightinfo.setDelete_Flag("0");
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return service.addFlightInfo(flightinfo)>0;
			}else {
				return false;
			}
		}else {
			try {
				flightinfo.setFlight_name(flightName);
				flightinfo.setFlight_id(flightId);
				Date flightDate=sdf.parse(flyDate);
				flightinfo.setFlight_date(flightDate);
				flightinfo.setFly_time(flyTime);
				flightinfo.setCreatedate(new Date());
				flightinfo.setDelete_Flag("0");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return service.addFlightInfo(flightinfo)>0;
		}
	}
	
	public boolean updateFlightInfo(int id,int flightId,String flightName,String flyDate,String flyTime){
		FlightInfo flightinfo= new FlightInfo();
		FlightInfoService service = new FlightInfoService();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List<FlightInfo> oldList=service.queryAllForSingle();
		if(oldList!=null&&oldList.size()!=0){
			int count=0;
			for(FlightInfo fi:oldList){
				String flydate_s=sdf.format(fi.getFlight_date());
				if(flightId==fi.getFlight_id()&&flyDate.equals(flydate_s)&&flyTime.equals(fi.getFly_time())){
					count++;
				}
			}
			if(count==0){
				try {
					flightinfo.setId(id);
					flightinfo.setFlight_name(flightName);
					flightinfo.setFlight_id(flightId);
					Date flightDate=sdf.parse(flyDate);
					flightinfo.setFlight_date(flightDate);
					flightinfo.setFly_time(flyTime);
					flightinfo.setCreatedate(new Date());
					flightinfo.setDelete_Flag("0");
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return service.changeFlightInfo(flightinfo)>0;
			}else {
				return false;
			}
		}else {
			try {
				flightinfo.setId(id);
				flightinfo.setFlight_name(flightName);
				flightinfo.setFlight_id(flightId);
				Date flightDate=sdf.parse(flyDate);
				flightinfo.setFlight_date(flightDate);
				flightinfo.setFly_time(flyTime);
				flightinfo.setCreatedate(new Date());
				flightinfo.setDelete_Flag("0");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return service.changeFlightInfo(flightinfo)>0;
		}
	}
	
	public Integer deleteFlightInfo(String ids){
		int count=0;
		FlightInfoService service = new FlightInfoService();
		String[] idarr=ids.split(";");
		for(String idstring:idarr){
			int id=Integer.parseInt(idstring);
			int flag=service.deleteFlightInfo(id);
			if(flag>0){
				count++;
			}
		}
		return count;
	}
	
	public boolean batchAddFlightInfo(int flightId,String flightName,String flyDate1,String weeks,String flyDate2,String flyTime){
		FlightInfoService service = new FlightInfoService();
		List<FlightInfo> fiList=new ArrayList<FlightInfo>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		List<FlightInfo> oldList=service.queryAllForSingle();
		try {
			Date dateBegin=sdf.parse(flyDate1);
			Calendar cale1=Calendar.getInstance();
			cale1.setTime(dateBegin);
			Date dateEnd=sdf.parse(flyDate2);
			Calendar cale2=Calendar.getInstance();
			cale2.setTime(dateEnd);
			String[] weekArr=weeks.split(";");
			while(cale1.getTimeInMillis()< cale2.getTimeInMillis()){
				int we=cale1.get(Calendar.DAY_OF_WEEK);
				for(String w:weekArr){
						if(we==Integer.parseInt(w)){
							int count=0;
							String cale1_s=sdf.format(cale1.getTime());
							for(FlightInfo fi:oldList){
								String flydate_s=sdf.format(fi.getFlight_date());
								if(flightId==fi.getFlight_id()&&flyTime.equals(fi.getFly_time())&&cale1_s.equals(flydate_s)){
									count++;
									break;
								}
							}
							if(count==0){
								FlightInfo flightinfo= new FlightInfo();
								flightinfo.setDelete_Flag("0");
								flightinfo.setFlight_id(flightId);
								flightinfo.setFly_time(flyTime);
								flightinfo.setFlight_name(flightName);
								flightinfo.setFlight_date(cale1.getTime());
								flightinfo.setCreatedate(new Date());
								fiList.add(flightinfo);
							}
					}
					
				}
				cale1.add(Calendar.DAY_OF_YEAR, 1);
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return service.batchAddFlightInfo(fiList)>0;
	}
	
}
