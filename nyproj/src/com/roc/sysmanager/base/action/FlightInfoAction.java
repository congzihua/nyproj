package com.roc.sysmanager.base.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.forms.DepartMentsForm;
import com.founder.enp.service.LogService;
import com.founder.enp.util.Global;
import com.roc.enp.entity.FlightInfo;
import com.roc.enp.entity.FlightInfoKeyword;
import com.roc.sysmanager.base.form.BaFlightInfoForm;
import com.roc.sysmanager.base.service.FlightInfoService;
import com.roc.sysmanager.base.service.FlightService;

public class FlightInfoAction extends DispatchAction {

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		java.util.List<FlightInfo> list = null;
		int count = 0;
		
		FlightInfoKeyword keyword=null;
		int currentPage=1;
		try {
			keyword = new FlightInfoKeyword();
			currentPage = Integer.parseInt(request
					.getParameter("currentPage") == null ? "1" : request
							.getParameter("currentPage"));
			String flight_date_s = request.getParameter("flight_date");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			String fly_time = request.getParameter("fly_time");
			keyword.setPageInfo(20, currentPage);
			if (flight_date_s!=null&&!"".equals(flight_date_s)) {
				Date flight_date=sdf.parse("flight_date_s");
				keyword.setFlight_date(flight_date);
			}
			if (fly_time != null) {
				keyword.setFly_time(fly_time);
			}
			count = new FlightInfoService().getFlightInfoCount(keyword);
			list = new FlightInfoService().queryFlightInfo(keyword);
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("pageCount", Integer.valueOf(Global
				.computePageCount(count)));
		
		request.setAttribute("list", list);
		return mapping.findForward("flightInfoList");
		
	}
	
	
	
//	FlightInfo flightinfo= new FlightInfo();
//	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//	BaFlightInfoForm bfif = (BaFlightInfoForm) form;
//	flightinfo.setFlight_name(bfif.getFlight_name());
//	flightinfo.setFlight_id(bfif.getFlight_id());
//	Date flightDate=sdf.parse(bfif.getFlight_date());
//	flightinfo.setFlight_date(flightDate);
//	flightinfo.setFly_time(bfif.getFly_time());
//	flightinfo.setCreatedate(new Date());
//	flightinfo.setDelete_Flag("0");
	
	
}
