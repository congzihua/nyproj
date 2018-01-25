package com.roc.sysmanager.base.action;

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

public class DJPAction extends DispatchAction {
	/**
	 * 查看是否有航班信息！
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toBlankInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String flightId = request.getParameter("flightId");
		request.setAttribute("flightId", flightId);
		String orderdate = request.getParameter("orderdate");
		String flyTime = request.getParameter("hour") + ":"
				+ request.getParameter("minue");
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setSeleFlightId(Integer.valueOf(flightId));
		kw.setFlyTime(flyTime);
		// 查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
		if (ol1 != null && ol1.size() > 0) {

		} else {
			request.setAttribute("message", 1);
			request.setAttribute("orderdate", orderdate);
			return mapping.findForward("homePage");
		}
		OpOrdertickets orderinfo = ol1.get(0);
		request.setAttribute("orderinfo", orderinfo);
		request.setAttribute("flightinfoId", orderinfo.getId());
		request.setAttribute("flight", orderinfo.getFlight());
		request.setAttribute("flightDate", orderdate);
		request.setAttribute("flyTime", orderinfo.getFlyTime());
		request.setAttribute("flightNo", orderinfo.getFlightNo());
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setSeleFlightInfo(orderinfo.getId());
		List<OpOrdertickets> infoList = service.zhidengjiticketsList(keyword);
		request.setAttribute("infoList", infoList);
		return mapping.findForward("djpList");

	}

	/**
	 * 查看list
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String flightinfoId = request.getParameter("flightinfoId");
		request.setAttribute("flightinfoId", flightinfoId);
		request.setAttribute("flyTime", request.getParameter("flyTime"));
		request.setAttribute("flight", request.getParameter("flight"));
		request.setAttribute("flightDate", request.getParameter("flightDate"));
		request.setAttribute("flightNo", request.getParameter("flightNo"));

		ClienService service = new ClienService();
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setSeleFlightInfo(Integer.valueOf(flightinfoId));
		List<OpOrdertickets> infoList = service.zhidengjiticketsList(keyword);
		request.setAttribute("infoList", infoList);
		return mapping.findForward("djpList");

	}

	/**
	 * 到换登机牌页面
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toDJPPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String teamName = (String) request.getAttribute("teamName");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);
		request.setAttribute("flightinfo", ol1);

		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList", tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		
		ClienService service3 = new ClienService();
		OpOrderticketsKeyword keyword1 = new OpOrderticketsKeyword();
		keyword1.setSeleFlightInfo(Integer.valueOf(id));
		
		
			return mapping.findForward("shchDJP");
		

	}
	/**
	 * 到换登机牌页面
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toDJPPage1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);
		String teamName = ol1.getTeamName();
		Integer flightInfoId = ol1.getFlightinfoId();
		kw.setSeleFlightInfo(flightInfoId);
		kw.setTeamName(teamName);
		kw.setStatus(ol1.getStatus());
		
		if(teamName==null||teamName.trim().toString().equals("")||ol1.getStatus()==null || (!ol1.getStatus().trim().equals("2")&&!ol1.getStatus().trim().equals("3")&&!ol1.getStatus().trim().equals("4"))){
			return null;
		}
		List<OpOrdertickets> ooList=service.teamDjpList(kw);
		request.setAttribute("ooList", ooList);
		
		request.setAttribute("flightinfo", ol1);

		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList", tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		
		ClienService service3 = new ClienService();
		OpOrderticketsKeyword keyword1 = new OpOrderticketsKeyword();
		keyword1.setSeleFlightInfo(Integer.valueOf(id));
		
		teamName = ol1.getTeamName();
		return mapping.findForward("shchDJPTEAM");
		

	}
}
