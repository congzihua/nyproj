package com.tempflight.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.base.service.FlightService;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;
import com.tempflight.entity.TempFlightinfo;
import com.tempflight.entity.TempOrdertickets;
import com.tempflight.entity.TempOrderticketsKeyword;
import com.tempflight.service.TempClienService;

public class TfDJPAction extends DispatchAction {
	/**
	 * 查看是否有航班信息！
	 */
	public ActionForward toBlankInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String orderdate = request.getParameter("orderdate");
		String flyTime = request.getParameter("hour") + ":"
				+ request.getParameter("minue");
		TempClienService service = new TempClienService();
		TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
		keyword.setSeleDate(orderdate);
		keyword.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<TempFlightinfo> flightInfos = service.tempFlightInfoList(keyword);
		if(flightInfos ==null || flightInfos.size() == 0){
			request.setAttribute("message", 1);
			request.setAttribute("orderdate", orderdate);
			return mapping.findForward("homePage");
		}
		TempFlightinfo flighInfo = flightInfos.get(0);
		request.setAttribute("flighInfo", flighInfo);
		request.setAttribute("flightDate", orderdate);
		request.setAttribute("flyTime", flighInfo.getFlyTime());
		request.setAttribute("flightNo", flighInfo.getFlightNo());
		List<TempOrdertickets> orderTickets = service.queryTempOrderticketsForDjp(flighInfo.getId());
		request.setAttribute("infoList", orderTickets);
		return mapping.findForward("djpList");

	}
	/**
	 * 查看list
	 */
	public ActionForward toList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String flightinfoId = request.getParameter("flightinfoId");
		request.setAttribute("flightInfoIds", flightinfoId);
		request.setAttribute("flyTime", request.getParameter("flyTime"));
		request.setAttribute("flightDate", request.getParameter("flightDate"));
		request.setAttribute("flightNo", request.getParameter("flightNo"));
		TempClienService service = new TempClienService();
		//查看是否存在航班信息
		TempFlightinfo flighInfo = service.tempFlightInfoById(Integer.valueOf(flightinfoId));
		List<TempOrdertickets> orderTickets = service.queryTempOrderticketsForDjp(flighInfo.getId());
		request.setAttribute("flighInfo", flighInfo);
		request.setAttribute("infoList", orderTickets);
		return mapping.findForward("djpList");

	}

	/**
	 * 到换登机牌页面
	 */
	public ActionForward toDJPPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String flightInfoId = request.getParameter("flightInfoId");
		request.setAttribute("flightInfoId", flightInfoId);
		TempClienService service = new TempClienService();
		//查看是否存在航班信息
		TempFlightinfo flighInfo = service.tempFlightInfoById(Integer.valueOf(flightInfoId));
		TempOrdertickets info = service.queryTempOrderticketsById(Integer.valueOf(id));
		request.setAttribute("flightinfo", flighInfo);
		request.setAttribute("orderInfo", info);
		
		return mapping.findForward("shchDJP");
	}
	/**
	 * 到换登机牌页面-团体页面
	 */
	public ActionForward toDJPPage1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String flightinfoId = request.getParameter("flightinfoId");
		request.setAttribute("flightinfoId", flightinfoId);
		TempClienService service = new TempClienService();
		TempOrdertickets orderInfo = service.queryTempOrderticketsById(Integer.valueOf(id));
		String teamName = orderInfo.getTeamName();
		if(teamName==null||teamName.trim().toString().equals("")||orderInfo.getStatus()==null ){
			return null;
		}
		TempFlightinfo flightInfo = service.tempFlightInfoById(orderInfo.getTempFlightinfoId());
		TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
		kw.setTeamName(teamName);
		kw.setSeleFlightInfo(orderInfo.getTempFlightinfoId());
		kw.setTeamflag("1");
		List<TempOrdertickets> ooList=service.tempTeamDjpList(kw);
		request.setAttribute("ooList", ooList);
		request.setAttribute("flightinfo", flightInfo);
		request.setAttribute("orderInfo", orderInfo);
		return mapping.findForward("shchDJPTEAM");
	}
}
