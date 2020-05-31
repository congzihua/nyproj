package com.tempflight.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.entity.Authorization;
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
public class TfClientAction extends DispatchAction {
	/**
	 * 查询临时航班并跳转至相应页面
	 */
	public ActionForward toBlankInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		TempClienService service = new TempClienService();
		TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
		keyword.setSeleDate(orderdate);
		keyword.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<TempFlightinfo> flightInfos = service.tempFlightInfoList(keyword);
		if(flightInfos ==null || flightInfos.size() == 0){
			request.setAttribute("message", 1);
			request.setAttribute("orderdate",orderdate);
			return mapping.findForward("tfHomePage");
		}	
		request.setAttribute("flightInfoList",flightInfos);	
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime",flyTime);
		return mapping.findForward("tempDspPage");
	}
	/**售票页面顶部**/
	public ActionForward toTopInfoPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightinfoId = request.getParameter("flightinfoId");
		TempClienService service = new TempClienService();
		TempFlightinfo tempFlightInfo = service.tempFlightInfoById(Integer.valueOf(flightinfoId));
		request.setAttribute("tempFlightinfo", tempFlightInfo);
		return mapping.findForward("tfDspTop");
		
	}
	/**
	 *  售票页面底部
	 */
	public ActionForward toBottomList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightInfoId = request.getParameter("flightinfoId");
		request.setAttribute("flightinfoId", Integer.valueOf(flightInfoId));
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String ordertime = request.getParameter("ordertime");
		request.setAttribute("ordertime", ordertime);
		TempClienService service = new TempClienService();
		TempFlightinfo tempFlightInfo = service.tempFlightInfoById(Integer.valueOf(flightInfoId));
		request.setAttribute("tempFlightinfo", tempFlightInfo);
		List<TempOrdertickets> ol = service.queryTempOrdertickets(Integer.valueOf(flightInfoId));
		request.setAttribute("oporderList", ol);
		return mapping.findForward("tfDspBottom");
	}
	/**增加临时航班的订票信息**/
	public ActionForward addOrderInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
//		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		
		TempOrdertickets orderT = new TempOrdertickets();
		orderT.setTempFlightinfoId(Integer.valueOf(request.getParameter("flightinfoId")));
		orderT.setFlightInfo(request.getParameter("flightInfo"));
		orderT.setGate(request.getParameter("gate"));
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setTeamflag(request.getParameter("teamflag").trim());
		if(request.getParameter("teamflag").trim().equals("1"))
			orderT.setTeamName(request.getParameter("teamName").trim());
		orderT.setRemark(request.getParameter("remark"));
		orderT.setStatus("2");
		TempClienService service = new TempClienService();
		int b = service.insertTempOrderticket(orderT);
		request.setAttribute("message", b>0?1:0);
		
		return toBottomList(mapping, form, request, response);
	}
	/**系统退出**/
	public ActionForward tc(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession(true).removeAttribute("authorization");
		PrintWriter out = response.getWriter();
		
		out.print("<script>top.location.href='"+request.getContextPath()+"/tflogin.jsp';</script>");
		return null;
	}
	/**
	 * 去修改页面
	 */
	public ActionForward toEdpage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		TempClienService service = new TempClienService();
		TempOrdertickets orderInfo = service.queryTempOrderticketsById(Integer.valueOf(id));			
		request.setAttribute("orderInfo",orderInfo);
		int fId = orderInfo.getTempFlightinfoId();
		TempFlightinfo flightInfo = service.tempFlightInfoById(fId);
		request.setAttribute("flightinfo", flightInfo);
		return mapping.findForward("tempDpEdit");
	}
	/**
	 * 订票或订票确认信息的修改
	 */
	public ActionForward orderInfoEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Integer id = Integer.valueOf(request.getParameter("id"));
		TempOrdertickets orderT = new TempOrdertickets();
		orderT.setId(id);
		orderT.setFlightInfo(request.getParameter("flightInfo"));
		orderT.setGate(request.getParameter("gate"));
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setRemark(request.getParameter("remark"));
		orderT.setTeamflag(request.getParameter("teamflag"));
		if(request.getParameter("teamflag")!=null&&request.getParameter("teamflag").equals("1")){
			orderT.setTeamName(request.getParameter("teamName").trim());
		}else{
			orderT.setTeamName("");
		}
		TempClienService service = new TempClienService();
		 service.editTempOrderticket(orderT);
		request.setAttribute("oper", 1);
		return mapping.findForward("tip");
	}
}
