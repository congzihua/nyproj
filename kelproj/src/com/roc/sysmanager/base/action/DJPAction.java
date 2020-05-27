package com.roc.sysmanager.base.action;

import java.io.IOException;
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
	 */
	public ActionForward toBlankInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String orderdate = request.getParameter("orderdate");
		String flyTime = request.getParameter("hour") + ":"
				+ request.getParameter("minue");
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
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
		String flightInfoIds = "";
		for (OpOrdertickets ot :ol1) {
			flightInfoIds +=","+ot.getId();
		}
		flightInfoIds = flightInfoIds.substring(1);
		request.setAttribute("flightInfoIds", flightInfoIds);
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setSeleFlightInfos(flightInfoIds);
		List<OpOrdertickets> infoList = service.zhidengjiticketsList(keyword);
		request.setAttribute("infoList", infoList);
		return mapping.findForward("djpList");

	}

	/**
	 * 查看list
	 */
	public ActionForward toList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String flightinfoIds = request.getParameter("flightInfoIds");
		request.setAttribute("flightInfoIds", flightinfoIds);
		request.setAttribute("flyTime", request.getParameter("flyTime"));
		request.setAttribute("flight", request.getParameter("flight"));
		request.setAttribute("flightDate", request.getParameter("flightDate"));
		request.setAttribute("flightNo", request.getParameter("flightNo"));

		ClienService service = new ClienService();
		OpOrderticketsKeyword keyword = new OpOrderticketsKeyword();
		keyword.setSeleFlightInfos(flightinfoIds);
		List<OpOrdertickets> infoList = service.zhidengjiticketsList(keyword);
		request.setAttribute("infoList", infoList);
		return mapping.findForward("djpList");

	}

	/**
	 * 到换登机牌页面
	 */
	public ActionForward toDJPPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String flightInfoIds = request.getParameter("flightInfoIds");
		request.setAttribute("flightInfoIds", flightInfoIds);
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
		
		return mapping.findForward("shchDJP");
	}
	/**
	 * 到换登机牌页面-团体页面
	 */
	public ActionForward toDJPPage1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String flightInfoIds = request.getParameter("flightInfoIds");
		request.setAttribute("flightInfoIds", flightInfoIds);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);
		String teamName = ol1.getTeamName();
		kw.setSeleFlightInfos(flightInfoIds);
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
		
		return mapping.findForward("shchDJPTEAM");
	}
}
