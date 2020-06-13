package com.tempflight.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.service.TemplateService;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
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
	//临时值班机系统查看用户信息里列表
	public ActionForward toLuggInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		TempClienService service = new TempClienService();
		TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
		keyword.setSeleDate(orderdate);
		keyword.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<TempFlightinfo> flightInfos = service.tempFlightInfoList(keyword);
		
		Integer flightinfoId = null;
		if(flightInfos !=null && flightInfos.size() > 0){
			flightinfoId = flightInfos.get(0).getId();
			OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
			List<TempOrdertickets> ol = service.queryTempOrdertickets(flightinfoId);
			request.setAttribute("list", ol);
		}	
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime",flyTime);
		request.setAttribute("flightinfoId",flightinfoId);
		return mapping.findForward("luggageInfo");
	}
	public ActionForward toXxinfoPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String idStr = request.getParameter("id");
		TempClienService service = new TempClienService();
		int id = Integer.valueOf(idStr);
		TempOrdertickets orderInfo = service.queryTempOrderticketsById(id);	
		if(orderInfo != null) {
			int luggSum = 0;
			String bagNum = orderInfo.getBagNum();
			if (bagNum != null && bagNum.trim().length() > 0) {
				String[] bagNums = bagNum.split(";");
				luggSum = bagNums.length;
				bagNum = "";
				for (int i = 0;i < bagNums.length;i++) {
					String bm = bagNums[i];
					if (i > 0){
						bagNum += "<br/>";
					}
					bagNum += bm;
				}
			}
			orderInfo.setLuggSum(luggSum);
			orderInfo.setBagNums(bagNum);
			int fId = orderInfo.getTempFlightinfoId();
			request.setAttribute("flightinfo",service.tempFlightInfoById(fId));
		}
		request.setAttribute("orderInfo",orderInfo);
		
		return mapping.findForward("xxinfo");
		
	}
	
	//通过起飞时间-到安检页面
	public ActionForward toMainPage(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response){
			String orderdate = request.getParameter("orderdate");
			String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
			TempClienService service = new TempClienService();
			TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
			keyword.setSeleDate(orderdate);
			keyword.setFlyTime(flyTime);
			//查看是否存在航班信息
			List<TempFlightinfo> flightInfos = service.tempFlightInfoList(keyword);
			
			if(flightInfos == null || flightInfos.size() == 0){
				request.setAttribute("message", "1");
				return mapping.findForward("homePageDJP");
			}
			request.setAttribute("orderdate", orderdate);
			request.setAttribute("flyTime", flyTime);
			request.setAttribute("flightInfo", flightInfos.get(0));
			return mapping.findForward("mainPage");
		}
	//登机坪操作核心页面未操作action
		public ActionForward toPageAtDJP1(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
			String flightinfoId = request.getParameter("flightinfoId");
			int fId = Integer.valueOf(flightinfoId);
			//查看是否存在航班信息
			TempClienService service = new TempClienService();
			List<TempOrdertickets> orderInfos =  service.queryTempOrdertickets(fId);
			TempFlightinfo flightinfo = service.tempFlightInfoById(fId);
			//查看是否存在航班信息
			List<TempOrdertickets> ol1 = new ArrayList<TempOrdertickets>();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			StringBuffer offLandTimeSb=new StringBuffer();
			offLandTimeSb.append(df.format(flightinfo.getFlightDate()));
			offLandTimeSb.append(" ");
			offLandTimeSb.append(flightinfo.getFlyTime());
			int shouPiao = 0,huanPai = 0,safeCheck = 0,dengJi = 0;
			for (TempOrdertickets info:orderInfos) {
				String status = info.getStatus();
				switch (status) {
				case "2"://售票
					shouPiao++;
					break;
				case "3"://换登机牌
					ol1.add(info);
					huanPai++;
					break;
				case "4"://安检
					safeCheck++;
					break;
				case "7"://登机
					dengJi++;
					break;
				}
			}
			request.setAttribute("which", "up");
			request.setAttribute("shouPiao",shouPiao);
			request.setAttribute("huanPai", huanPai);
			request.setAttribute("dengJi", dengJi);
			request.setAttribute("safeCheck", safeCheck);
			request.setAttribute("offLandTime", offLandTimeSb.toString());
			request.setAttribute("list", ol1);
			request.setAttribute("flightinfo", flightinfo);
			return mapping.findForward("containPage");
			
		}
		
//		登机坪操作核心页面已操作action
		public ActionForward toPageAtDJP2(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response){
			String id = (request.getParameter("id")!=null && !"".equals(request.getParameter("id").trim()))?request.getParameter("id"):"";
			
			String flightinfoId = request.getParameter("flightinfoId");
			int fId = Integer.valueOf(flightinfoId);
			TempClienService service = new TempClienService();
			if( id != null && !id.equals("") ){
				TempOrdertickets kwOpOrder = service.queryTempOrderticketsById(Integer.valueOf(id));
				request.setAttribute("smInfo", kwOpOrder);
			}
			
			List<TempOrdertickets> ol1 = service.listTempForChargedDJP(fId);
			TempFlightinfo flightinfo = service.tempFlightInfoById(fId);
			request.setAttribute("flightinfo", flightinfo);
			request.setAttribute("list", ol1);
			return mapping.findForward("containPage");
			
		}
		/**------------------------------------------------------------------------------------------
		 * 13.1.27
		 * 增加登机扫描节点
		 */
		public ActionForward toFlyMainPage(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response){
			String orderdate = request.getParameter("orderdate");
			String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
			TempClienService service = new TempClienService();
			TempOrderticketsKeyword keyword = new TempOrderticketsKeyword();
			keyword.setSeleDate(orderdate);
			keyword.setFlyTime(flyTime);
			//查看是否存在航班信息
			List<TempFlightinfo> flightInfos = service.tempFlightInfoList(keyword);
			if(flightInfos == null || flightInfos.size() == 0){
				request.setAttribute("message", "1");
				return mapping.findForward("fly_homePage");
			}
			request.setAttribute("flightinfoId", flightInfos.get(0).getId());
			return mapping.findForward("fly_mainFramePage");
		}
		public ActionForward toFlyAlrSafeCheck(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
			String flightinfoId = request.getParameter("flightinfoId");
			int fId = Integer.valueOf(flightinfoId);
			//查看是否存在航班信息
			TempClienService service = new TempClienService();
			List<TempOrdertickets> orderInfos =  service.queryTempOrdertickets(fId);
			TempFlightinfo flightinfo = service.tempFlightInfoById(fId);
			//查看是否存在航班信息
			List<TempOrdertickets> ol = new ArrayList<TempOrdertickets>();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			StringBuffer offLandTimeSb=new StringBuffer();
			offLandTimeSb.append(df.format(flightinfo.getFlightDate()));
			offLandTimeSb.append(" ");
			offLandTimeSb.append(flightinfo.getFlyTime());
			int shouPiao = 0,huanPai = 0,safeCheck = 0,dengJi = 0;
			for (TempOrdertickets info:orderInfos) {
				String status = info.getStatus();
				switch (status) {
				case "2"://售票
					shouPiao++;
					break;
				case "3"://换登机牌
					huanPai++;
					break;
				case "4"://安检
					ol.add(info);
					safeCheck++;
					break;
				case "7"://登机
					dengJi++;
					break;
				}
			}
			request.setAttribute("which", "up");
			request.setAttribute("shouPiao", shouPiao);
			request.setAttribute("huanPai", huanPai);
			request.setAttribute("safeCheck", safeCheck);
			request.setAttribute("dengJi",dengJi);
			request.setAttribute("offLandTime", offLandTimeSb.toString());
			request.setAttribute("list", ol);
			request.setAttribute("flightinfo",flightinfo);
			request.setAttribute("flightNo", flightinfo.getFlightNo());
			return mapping.findForward("fly_containPage");
			
		}
		public ActionForward areadyToFly(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response){
			
			String id = request.getParameter("id");
			
			String flightinfoId = request.getParameter("flightinfoId");
			int fId = Integer.valueOf(flightinfoId);
			TempClienService service = new TempClienService();
			if( id != null && !id.equals("") ){
				TempOrdertickets kwOpOrder = service.queryTempOrderticketsById(Integer.valueOf(id));
				request.setAttribute("smInfo", kwOpOrder);
			}
			
			List<TempOrdertickets> ol1 = service.listTempForChargedSafeCheck(fId);
			TempFlightinfo flightinfo = service.tempFlightInfoById(fId);
			request.setAttribute("flightinfo", flightinfo);
			request.setAttribute("list", ol1);
			return mapping.findForward("fly_containPage");
		}
	public ActionForward deleteTempFlightInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		TempClienService service = new TempClienService();
		int num = service.deleteTempFlightinfoById(Integer.valueOf(id));
		request.setAttribute("num", num == 0?-1:num);
		return mapping.findForward("tempFlightinfoList");
	}
	public ActionForward toTempFlightInfoList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		return mapping.findForward("tempFlightinfoList");
	}
	//临时航班的统计
	public ActionForward ticketInfoUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String orderdate1 = request.getParameter("orderdate1");
		request.setAttribute("orderdate1", orderdate1);
		
		TempClienService service = new TempClienService();
		TempOrderticketsKeyword kw = new TempOrderticketsKeyword();
		kw.setStartDate(orderdate +" 00:00:00");
		kw.setEndDate(orderdate1 + " 23:59:59");
		List<TempFlightinfo> flghtInfos = service.queryTempFlghtInfosByDates(kw);
		for(TempFlightinfo bf:flghtInfos){
			Integer orderNum = service.queryTempOrderCount(bf.getId());
			bf.setOrderNum(orderNum);
		}		
		request.setAttribute("list", flghtInfos);
		return mapping.findForward("allUserUnits");
		
	}
}
