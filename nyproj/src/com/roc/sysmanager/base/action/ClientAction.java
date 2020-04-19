package com.roc.sysmanager.base.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.alibaba.fastjson.JSON;
import com.founder.enp.entity.Authorization;
import com.founder.enp.util.Global;
import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.sysmanager.base.service.BaTicketsallocService;
import com.roc.sysmanager.base.service.BlacklistUserService;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.sysmanager.base.service.FlightService;
import com.roc.sysmanager.dwr.SingleInstanceClientSer;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public class ClientAction extends DispatchAction {

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toBlankInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
		if(ol1!=null && ol1.size()>0){
			
		}else{
			request.setAttribute("message", 1);
			request.setAttribute("orderdate",orderdate);
			return mapping.findForward("homePage");
		}		
		request.setAttribute("flightInfoList",ol1);	
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime",flyTime);
		return mapping.findForward("dspPage");
		
	}
	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toTopInfoPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightinfoIds = request.getParameter("flightinfoIds");
		
		ClienService service = new ClienService();
		String[] finfoIds = flightinfoIds.split(",");
		List<OpOrdertickets> otList = new ArrayList<OpOrdertickets>();
		for (String flightInfoId:finfoIds) {
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setSeleFlightInfo(Integer.valueOf(flightInfoId));
			OpOrdertickets ot = service.getbaFlightInfoForIn(kw);
			otList.add(ot);
		}
		FlightService service1 = new FlightService();
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
				
		request.setAttribute("flightinfos", otList);
		String fInfoJson = JSON.toJSON(otList).toString();
		request.setAttribute("flightInfoJson",fInfoJson);
		request.setAttribute("flightinfo", otList.get(0));
		request.setAttribute("tpList", tpList);
		return mapping.findForward("dspTop");
		
	}
	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toBottomList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String flightInfoIds = request.getParameter("flightinfoIds");
		String[] fids = flightInfoIds.split(",");
		request.setAttribute("flightinfoId", Integer.valueOf(fids[0]));
		request.setAttribute("flightinfoIds", flightInfoIds);
		String[] flightIds = request.getParameter("flightIds").split(",");
	    String flightId = flightIds[0];
		request.setAttribute("flightId", Integer.valueOf(flightId));
		request.setAttribute("flightIds", request.getParameter("flightIds"));
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String ordertime = request.getParameter("ordertime");
		request.setAttribute("ordertime", ordertime);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleFlightInfos(flightInfoIds);
		
		List<OpOrdertickets> ol = service.getOrderticketsList(kw);
		
		List<List<BaTicketsalloc>> result = new ArrayList<>();
		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
		keyword.setFlightId(Integer.valueOf(flightId));
		keyword.setOrderdate(orderdate);
		keyword.setOrdertime(ordertime);
		BaTicketsallocService ser = new BaTicketsallocService();
		//查询航程和时间对应的票额分配情况列表
		List<BaTicketsalloc> bl = ser.getForSeleCountList(keyword);
		for (String flightInfoId:fids) {
			OpOrderticketsKeyword qkeyword = new OpOrderticketsKeyword();
			qkeyword.setSeleFlightInfo(Integer.valueOf(flightInfoId));
			//查询航班航程信息
			OpOrdertickets ot = service.getbaFlightInfoForIn(qkeyword);
			
			List<BaTicketsalloc> bl2 = new ArrayList<BaTicketsalloc>();
			for(BaTicketsalloc b:bl){
				
				BaTicketsalloc newBean = new BaTicketsalloc();
				newBean.setFlight(ot.getFlight());
				newBean.setId(Integer.valueOf(flightInfoId));
				newBean.setTicketpointId(b.getTicketpointId());
				int i = 0,k=0;
				kw = new OpOrderticketsKeyword();
				kw.setSeleFlightInfo(Integer.valueOf(flightInfoId));
				kw.setTicketPointId(b.getTicketpointId());
				//查询该航班下的订票点订售票票该航程的数量
				List<OpOrdertickets> ol2 =service.queryGroupOrderTicketInfos(kw);
				//已用票的订票数
				kw.setSeleStatus("1");
				List<OpOrdertickets> ol3 =service.queryGroupOrderTicketInfos(kw);
				if (ol2 != null && ol2.size() > 0) {
					Integer dsCount = ol2.get(0).getCounts();
					i = dsCount == null ? 0:dsCount;
				}
				
				if (ol3 != null && ol3.size() > 0) {
					Integer dCount = ol3.get(0).getCounts();
					k = dCount == null ? 0:dCount;
				}
				newBean.setUsedCount(i);
				newBean.setOrderCount(k);
				newBean.setBalance(b.getBalance()==null?0:b.getBalance());
//				b.setLookBalance(b.getAmount()-i);
				bl2.add(newBean);
			}
			result.add(bl2);
		}
		for (BaTicketsalloc b:bl) {
			int usedCount = 0;
			for (List<BaTicketsalloc> baList:result) {
				for (BaTicketsalloc ba:baList) {
					if (b.getTicketpointId().equals(ba.getTicketpointId())) {
						usedCount += ba.getUsedCount()== null?0:ba.getUsedCount();
					}
				}
			}
			b.setLookBalance(b.getAmount()-usedCount);
			b.setBalance(b.getLookBalance()-(b.getLockednum()==null?0:b.getLockednum()));
		}
		
		request.setAttribute("ticketsPointC", bl);
		request.setAttribute("ticketsPointAndStatCountList", result);
		request.setAttribute("oporderList", ol);
		
		return mapping.findForward("dspBottom");
		
	}
	public ActionForward addOrderInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		com.roc.enp.entity.OpUseroper userOper = new com.roc.enp.entity.OpUseroper();
		userOper.setType(0);
		userOper.setUserId(auth.getUserid());
		OpOrdertickets orderT = new OpOrdertickets();
		orderT.setFlightinfoId(Integer.valueOf(request.getParameter("flightinfoId")));
		orderT.setFlightNo(request.getParameter("flightNo"));     
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setTicketpointId(Integer.valueOf(request.getParameter("ticketpointId")));
		orderT.setTeamflag(request.getParameter("teamflag").trim());
		if(request.getParameter("teamflag").trim().equals("1"))
			orderT.setTeamName(request.getParameter("teamName").trim());
		orderT.setRemark(request.getParameter("remark"));
		orderT.setStatus("0");
		ClienService service = new ClienService();
		int b = service.insertOpOrderticket(orderT,userOper);
		request.setAttribute("message", b>0?1:0);
		
		return toBottomList(mapping, form, request, response);
	}
	public ActionForward toSpPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);			
		request.setAttribute("flightinfo",ol1);
		
		return mapping.findForward("spEdit");
		
	}
	public ActionForward editSp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);			
		request.setAttribute("flightinfo",ol1);
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		return mapping.findForward("spEdit");
		
	}
	
	public ActionForward editOrderInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		com.roc.enp.entity.OpUseroper userOper = new com.roc.enp.entity.OpUseroper();
		userOper.setType(2);
		userOper.setUserId(auth.getUserid());
		Integer id = Integer.valueOf(request.getParameter("id"));
		String origStatus = request.getParameter("status");
		userOper.setOrderId(id);
		OpOrdertickets orderT = new OpOrdertickets();
		orderT.setId(id);
		orderT.setStatus("2");//出票
		orderT.setFlightNo(request.getParameter("flightNo"));     
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setTicketpointId(Integer.valueOf(request.getParameter("ticketpointId")));
		orderT.setPayment(request.getParameter("payment"));
		orderT.setPriceId(Integer.valueOf(request.getParameter("priceId")));
		orderT.setHalfpricecard(request.getParameter("halfpricecard"));
		orderT.setZeropricecard(request.getParameter("zeropricecard"));
		orderT.setRemark(request.getParameter("remark"));
		if(!this.getOrderStatus(id,origStatus)){
			request.setAttribute("oper", 7);//状态已经改变！
			return mapping.findForward("tip");
		}
		int isU = isHasTickets(id,Integer.valueOf(request.getParameter("flightId")),Integer.valueOf(request.getParameter("flightinfoId")),request.getParameter("orderdate"),Integer.valueOf(request.getParameter("ticketpointId")),request.getParameter("flyTime"));
		
		if(!(isU>0)){
			request.setAttribute("oper", 6);//票点票额不足或没有票额
			return mapping.findForward("tip");
		}
		BlackUserKeyword keyword = new BlackUserKeyword();
		keyword.setCertType(orderT.getCertType());
		keyword.setIdcard(orderT.getCertNo());
		BlacklistUserService servcie = new BlacklistUserService();
		BlacklistUser bLUser = servcie.getUserBlacklistInfoByIdCardAndCertType(keyword);
		if (bLUser != null && bLUser.getIdcard()!= null) {
			request.setAttribute("oper", 10);//用户被列入黑名单中
			return mapping.findForward("tip");
		}
		ClienService service = new ClienService();
		boolean b = service.editOpOrderticket(orderT,userOper);
		request.setAttribute("oper", b?1:0);
		if(b){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setId(id);
			List <OpOrdertickets> o = service.getOrderticketsList(kw);
			OpOrdertickets order =  o==null||o.size()==0?null:service.getOrderticketsList(kw).get(0);
			
			if(order != null){
				FlightService s = new FlightService();
				BaTicketpriceKeyword k = new BaTicketpriceKeyword();
				k.setId(order.getPriceId());
				if(order.getPriceId()!=null){
					List<BaTicketprice> l1 = s.queryBaTicketpriceList(k);
					order.setTicketprice(l1!=null&&l1.size()>0?l1.get(0).getRealAmount():0);	
					
				}else{
					order.setTicketprice(0D);
				}	
				try{
					ExcelUtil.proceed(order, auth.getName());
				}catch(Exception e){
					e.printStackTrace();
					request.setAttribute("oper", b?2:0);
				}
			}else{
				
				request.setAttribute("oper", b?2:0);
			}
		}		
		return mapping.findForward("tip");
	}
	
	public ActionForward tgSp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);			
		request.setAttribute("flightinfo",ol1);
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		return mapping.findForward("dgEdit");
		
	}
	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toBeanchInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
		if(ol1!=null && ol1.size()>0){
			
		}else{
			request.setAttribute("message", 0);
			request.setAttribute("orderdate",orderdate);
			return mapping.findForward("bentchUpdate");
		}	
		request.setAttribute("message", 1);
		String flightinfoIds = "";
		String flightNo = "";
		for (OpOrdertickets ot:ol1) {
			flightinfoIds += ","+ot.getId();
			if (ot.getFlightNo() != null)
				flightNo = ot.getFlightNo();
		}
		request.setAttribute("flightinfoIds", flightinfoIds.substring(1));	
		request.setAttribute("flightNo", flightNo);
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime", flyTime);
		return mapping.findForward("bentchUpdate");
		
	}
	/**
	 * 去修改配额信息列表
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward seleUserOperLogUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(orderdate +" 00:00:00");
		kw.setEndDate(orderdate + " 23:59:59");
		kw.setUserId(auth.getUserid());
		kw.setType(2);
		List<OpOrdertickets> countList = service.userInfoCounts(kw);
		List<OpOrdertickets> userUnitInList = service.userUnitInList(kw);
		//统计退票的信息type=9
		OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
		kw1.setStartDate(orderdate +" 00:00:00");
		kw1.setEndDate(orderdate + " 23:59:59");
		kw1.setUserId(auth.getUserid());
		kw1.setType(9);
		List<OpOrdertickets> countList1 = service.userInfoCounts(kw1);
		List<OpOrdertickets> userUnitInList1 = service.userUnitInList(kw1);
		request.setAttribute("countList", countList);
		request.setAttribute("userUnitInList", userUnitInList);
		request.setAttribute("countList1", countList1);
		request.setAttribute("userUnitInList1", userUnitInList1);
		return mapping.findForward("myUnits");
		
	}
	
	public ActionForward seleUserLogList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null||request.getParameter("currentPage").trim().equals("")?"1":request.getParameter("currentPage"));
	    int count = 0;
	    String seleorderdate = request.getParameter("seleorderdate");
	    request.setAttribute("seleorderdate",seleorderdate);
	    String name = request.getParameter("name");
	    request.setAttribute("name",name);
	    String ckname = request.getParameter("ckname");
	    request.setAttribute("ckname",ckname==null?"":ckname);
	   ClienService service = new ClienService();
	    OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();
	    if(seleorderdate!=null && !seleorderdate.trim().equals("")){
	    	keyWord.setStartDate(seleorderdate);
	    }
	    if(name!=null && !name.trim().equals("")){
	    	keyWord.setName("%"+name.trim()+"%");
	    }
	    if(ckname!=null && !ckname.trim().equals("")){
	    	keyWord.setUsername("%"+ckname.trim()+"%");
	    }
	    count = service.userOperLogCount(keyWord);
		keyWord.setPageInfo(20, currentPage);
		List<OpOrdertickets> list = service.userOperLogList(keyWord);
		request.setAttribute("count", Integer.valueOf(count));
        request.setAttribute("currentPage", Integer.valueOf(currentPage));
        request.setAttribute("pageCount", Integer.valueOf(Global.computePageCount(count)));
		request.setAttribute("list", list);
		
		return mapping.findForward("userOperLog");
	}
	
	public ActionForward seleCustomerLogList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null||request.getParameter("currentPage").trim().equals("")?"1":request.getParameter("currentPage"));
	    int count = 0;
	    String certNo = request.getParameter("certNo");
	    request.setAttribute("certNo",certNo);
	    String name = request.getParameter("name");
	    request.setAttribute("name",name);
	   ClienService service = new ClienService();
	    OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();
	    if(certNo==null&&name==null){
	    	request.setAttribute("count", Integer.valueOf(count));
	    	request.setAttribute("currentPage", Integer.valueOf(currentPage));
	        request.setAttribute("pageCount", Integer.valueOf(Global.computePageCount(count)));
	    	return mapping.findForward("customerOperLog");
	    }
	    if(certNo!=null && !certNo.trim().equals("")){
	    	keyWord.setCertNo(certNo);
	    }
	    if(name!=null && !name.trim().equals("")){
	    	keyWord.setName(name.trim());
	    }
	    count = service.CustomerLogCount(keyWord);
		keyWord.setPageInfo(20, currentPage);
		List<OpOrdertickets> list = service.customerLogList(keyWord);
		request.setAttribute("count", Integer.valueOf(count));
        request.setAttribute("currentPage", Integer.valueOf(currentPage));
        request.setAttribute("pageCount", Integer.valueOf(Global.computePageCount(count)));
		request.setAttribute("list", list);
		
		return mapping.findForward("customerOperLog");
	}
	
	/**
	 * 所有用户在一段时间内售票信息统计
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward seleAllUserOperLogUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String orderdate1 = request.getParameter("orderdate1");
		request.setAttribute("orderdate1", orderdate1);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(orderdate +" 00:00:00");
		kw.setEndDate(orderdate1 + " 23:59:59");		
		kw.setType(2);
		List<OpOrdertickets> countList = service.userInfoCounts(kw);
		
		request.setAttribute("countList", countList);
		
		return mapping.findForward("allUserUnits");
		
	}
	public ActionForward tc(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession(true).removeAttribute("authorization");
		PrintWriter out = response.getWriter();
		
		out.print("<script>top.location.href='"+request.getContextPath()+"/default.jsp';</script>");
		return null;
	}
	/**
	 * 所有用户在一段时间内已经销售的信息统计
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward ticketInfoUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String orderdate1 = request.getParameter("orderdate1");
		request.setAttribute("orderdate1", orderdate1);
		java.util.List<BaFlight> list = null;
		BaFlightKeyWord keyword = new BaFlightKeyWord();
		list = new FlightService().queryBaFlight(keyword);
		request.setAttribute("list", list);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(orderdate +" 00:00:00");
		kw.setEndDate(orderdate1 + " 23:59:59");		
		int i = 0;
		for(BaFlight bf:list){
			kw.setSeleFlightId(bf.getId());
			request.setAttribute("unitsIfno"+i, service.getAllCountInfoForUnits(kw));
			i++;
		}				
		return mapping.findForward("allUserUnits");
		
	}
//通过起飞时间-到安检页面
public ActionForward toMainPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		ClienService service = new ClienService();
		boolean b=service.mainPageForDJP(kw);
		if(!b){
			request.setAttribute("message", "1");
			return mapping.findForward("homePageDJP");
		}
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime", flyTime);
		return mapping.findForward("mainPage");
		
	}
	
	//登机坪操作核心页面未操作action
	public ActionForward toPageAtDJP1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("flyTime");
		//查看是否存在航班信息
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.listForChargeDJP(kw);
		List<OpOrdertickets> ol2 = service.listForReserveDJP(kw);
		List<OpOrdertickets> ol3 = service.listForChargedDJP(kw);
		OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
		kw1.setSeleDate(orderdate);
		kw1.setFlyTime(flyTime);
		List<OpOrdertickets> ol4 = service.getBaFlightInfoList(kw1);
		List<OpOrdertickets> statusOverList = service.listForInFly(kw1);
		StringBuffer offLandTimeSb=new StringBuffer();
		offLandTimeSb.append(orderdate);
		offLandTimeSb.append(" ");
		offLandTimeSb.append(flyTime);
		request.setAttribute("which", "up");
		request.setAttribute("shouPiao", ol2.size());
		request.setAttribute("huanPai", ol1.size());
		
		request.setAttribute("dengJi", statusOverList.size());
		request.setAttribute("safeCheck", ol3.size());
		request.setAttribute("offLandTime", offLandTimeSb.toString());
		request.setAttribute("list", ol1);
		request.setAttribute("orderdate",orderdate);
		request.setAttribute("flightNo", (ol4!=null)?ol4.get(0).getFlightNo():"");
		return mapping.findForward("containPage");
		
	}
	
//	登机坪操作核心页面已操作action
	public ActionForward toPageAtDJP2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = (request.getParameter("id")!=null && !"".equals(request.getParameter("id").trim()))?request.getParameter("id"):"";
		
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("flyTime");
		ClienService service = new ClienService();
		if(!id.equals("")){
			OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
			kw1.setId(Integer.valueOf(id));
			List<OpOrdertickets> kwOpOrder = service.getOrderticketsList(kw1);
			request.setAttribute("smInfo", kwOpOrder!=null?kwOpOrder.get(0):null);
		}
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.listForChargedDJP(kw);
		
		request.setAttribute("list", ol1);
		return mapping.findForward("containPage");
		
	}
	/**
	 * 去修改页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toEdpage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);			
		request.setAttribute("flightinfo",ol1);
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		
		return mapping.findForward("dpEdit");
		
	}
	/**
	 * 订票或订票确认信息的修改
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward orderInfoEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Integer flightId = Integer.valueOf(request.getParameter("flightId"));
		Integer flightinfoId = Integer.valueOf(request.getParameter("flightinfoId"));
		String orderdate = request.getParameter("orderdate");
		Integer ticketpointId = Integer.valueOf(request.getParameter("ticketpointId"));
		Integer id = Integer.valueOf(request.getParameter("id"));
		String flyTime = request.getParameter("flyTime");
		//Integer id,Integer flightId,Integer flightinfoId,String orderdate,Integer ticketpointId
		int isU = isHasTickets(id,flightId,flightinfoId,orderdate,ticketpointId,flyTime);
		if(!(isU>0)){
			request.setAttribute("oper", 6);//票点票额不足或没有票额
			return mapping.findForward("tip");
		}
		String status = request.getParameter("status");
		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		com.roc.enp.entity.OpUseroper userOper = new com.roc.enp.entity.OpUseroper();
		userOper.setType(6);
		userOper.setUserId(auth.getUserid());		
		userOper.setOrderId(id);
		OpOrdertickets orderT = new OpOrdertickets();
		orderT.setId(id);
		orderT.setStatus(status);//订票或订票确认状态信息的修改 状态不变
		orderT.setFlightNo(request.getParameter("flightNo"));     
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setTicketpointId(Integer.valueOf(request.getParameter("ticketpointId")));		
		orderT.setRemark(request.getParameter("remark"));
		orderT.setTeamflag(request.getParameter("teamflag"));
		if(request.getParameter("teamflag")!=null&&request.getParameter("teamflag").equals("1")){
			orderT.setTeamName(request.getParameter("teamName").trim());
		}else{
			orderT.setTeamName("");
		}
		ClienService service = new ClienService();
		boolean b = service.editOpOrderticket(orderT,userOper);
		request.setAttribute("oper", b?1:0);
		return mapping.findForward("tip");
	}
	
	private static int isHasTickets(Integer id,Integer flightId,Integer flightinfoId,String orderdate,Integer ticketpointId,String flyTime){
		ClienService cService = new ClienService();
		com.roc.syspe.entity.OpOrderticketsKeyword okw = new com.roc.syspe.entity.OpOrderticketsKeyword();
		okw.setTicketPointId(ticketpointId);
		okw.setSeleFlightInfo(flightinfoId);//航班信息的id
		okw.setId(id);
		List<OpOrdertickets>  orderList= cService.groupTiecketCount(okw);
		OpOrdertickets countOrder = null;
		if(orderList!=null && orderList.size()>0){
			countOrder = orderList.get(0);
		}
		BaTicketsallocKeyword keyword = new BaTicketsallocKeyword();
		keyword.setFlightId(flightId);
		keyword.setOrderdate(orderdate);
		keyword.setTicketpointId(ticketpointId);
		keyword.setOrdertime(flyTime);
		BaTicketsallocService ser = new BaTicketsallocService();
		List<BaTicketsalloc> bl = ser.getForSeleCountList(keyword);
		BaTicketsalloc bt = null;		
		if(bl!=null && bl.size()>0){
			bt = bl.get(0);
		}else{
			return 0;//选择日期该票点没有票额分配
		}
		int bCount = bt.getAmount()-(bt.getLockednum()==null?0:bt.getLockednum())-(countOrder!=null &&countOrder.getCounts()!=null?countOrder.getCounts():0)-1;//看是不是负数，负数则不能改签
		if(bCount<0){
			return 0;//该票点票额不足
		}
		return 1;
		
	}
	/**
	 * 去改签页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toDGQ(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);			
		request.setAttribute("flightinfo",ol1);
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(ol1.getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		
		return mapping.findForward("dgqEdit");
		
	}
	/**
	 * 对员工售票信息进行统计 通过职工编号
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward seleUserUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		String im = request.getParameter("im");
		request.setAttribute("im", im);
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(orderdate +" 00:00:00");
		kw.setEndDate(orderdate + " 23:59:59");		
		kw.setType(2);
		kw.setIm(im);
		List<OpOrdertickets> countList = service.userInfoCounts(kw);
		
		//统计退票的信息type=9
		OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
		kw1.setStartDate(orderdate +" 00:00:00");
		kw1.setEndDate(orderdate + " 23:59:59");
		kw1.setIm(im);
		kw1.setType(9);
		List<OpOrdertickets> countList1 = service.userInfoCounts(kw1);
		
		request.setAttribute("countList", countList);
		
		request.setAttribute("countList1", countList1);
		
		
		return mapping.findForward("userSaleTicketsInfo");
		
	}
	/**
	 * 对售票点售票信息进行统计 通过职工编号
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward saltTaUnits(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		request.setAttribute("orderdate", orderdate);
		
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setStartDate(orderdate);
		
		kw.setStatus("4");//统计已登机的人
		
		List<OpOrdertickets> countList = service.saltPointInfoCounts(kw);
		
		request.setAttribute("countList", countList);
		
		return mapping.findForward("saltPointUnits");
		
	}
	public ActionForward toSp(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		request.setAttribute("flightId", request.getParameter("flightId"));
		request.setAttribute("orderdate", request.getParameter("orderdate"));
		request.setAttribute("flyTime", request.getParameter("flyTime"));
		request.setAttribute("flightinfoId", request.getParameter("flightinfoId"));
		request.setAttribute("ordertime", request.getParameter("ordertime"));
		
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setSeleFlightInfo(Integer.valueOf(request.getParameter("flightinfoId")));
		
		OpOrdertickets ol1 = new ClienService().getbaFlightInfoForIn(kw);			
		request.setAttribute("flightinfo", ol1);
		 
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(Integer.valueOf(request.getParameter("flightId")));
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		ClienService service = new ClienService();
		String orderdate = request.getParameter("orderdate");
		String flyTime = request.getParameter("flyTime");
		
		request.setAttribute("tprice", tprice);
		OpOrderticketsKeyword kw2 = new OpOrderticketsKeyword();
		kw2.setSeleDate(orderdate);
		kw2.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol2 = service.getBaFlightInfoList(kw2);
		request.setAttribute("flightinfos", ol2);
		String fInfoJson = JSON.toJSON(ol2).toString();
		request.setAttribute("flightInfoJson",fInfoJson);
		Map<Integer,List<BaTicketprice>> prices = new HashMap<>();
		for (OpOrdertickets t:ol2) {
			keyword.setFlightId(t.getFlightId());
			prices.put(t.getFlightId(),service2.queryBaTicketpriceList(keyword));
		}
		request.setAttribute("pricesJson",JSON.toJSON(prices).toString());
		return mapping.findForward("saltTickets");
	}
	public ActionForward addSaltTicketsInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		com.roc.enp.entity.OpUseroper userOper = new com.roc.enp.entity.OpUseroper();
		userOper.setType(2);
		userOper.setUserId(auth.getUserid());
		OpOrdertickets orderT = new OpOrdertickets();
		orderT.setFlightinfoId(Integer.valueOf(request.getParameter("flightinfoId")));
		orderT.setStatus("2");   
		orderT.setName(request.getParameter("name"));
		orderT.setCertType(request.getParameter("certType"));
		orderT.setCertNo(request.getParameter("certNo"));
		orderT.setLinkphone(request.getParameter("linkphone"));		
		orderT.setVipFlag(request.getParameter("vipFlag"));
		orderT.setTicketpointId(Integer.valueOf(request.getParameter("ticketpointId")));
		orderT.setTeamflag(request.getParameter("teamflag").trim());
		if(request.getParameter("teamflag").trim().equals("1"))
			orderT.setTeamName(request.getParameter("teamName").trim());
		orderT.setRemark(request.getParameter("remark"));
		orderT.setHalfpricecard(request.getParameter("halfpricecard"));
		orderT.setZeropricecard(request.getParameter("zeropricecard"));
		orderT.setPayment(request.getParameter("payment"));
		orderT.setPriceId(Integer.valueOf(request.getParameter("priceId")));
		ClienService service = new ClienService();
		int b = service.insertOpOrderticket(orderT,userOper);
		request.setAttribute("message", b>0?1:0);
		if(b>0){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setId(b);
			List <OpOrdertickets> o = service.getOrderticketsList(kw);
			OpOrdertickets order =  o==null||o.size()==0?null:service.getOrderticketsList(kw).get(0);
			
			if(order != null){
				FlightService s = new FlightService();
				BaTicketpriceKeyword k = new BaTicketpriceKeyword();
				k.setId(order.getPriceId());
				if(order.getPriceId()!=null){
					List<BaTicketprice> l1 = s.queryBaTicketpriceList(k);
					order.setTicketprice(l1!=null&&l1.size()>0?l1.get(0).getRealAmount():0);	
					
				}else{
					order.setTicketprice(0.00);
				}	
				try{
					ExcelUtil.proceed(order, auth.getName());
				}catch(Exception e){
					e.printStackTrace();
					request.setAttribute("message", 2);
				}
			}
		}
		request.setAttribute("teamflag",request.getParameter("teamflag"));
		request.setAttribute("teamName",request.getParameter("teamName"));
		request.setAttribute("linkphone", request.getParameter("linkphone"));
		return toSp(mapping, form, request, response);
	}
	/**
	 * 获得订票信息的状态防止误操作
	 * @param id
	 * @return
	 */
	public boolean getOrderStatus(Integer id,String status){
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		StringBuffer nowStatus = new  StringBuffer("");
		nowStatus.append(service.getOrderStatus(id));
		boolean b = false;
		if(nowStatus!=null&&nowStatus.toString().equals(status)){
			b = true;	
		}
        return b;
    }
	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward seleCustomerList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
	    String certNo = request.getParameter("certNo");
	    request.setAttribute("certNo",certNo);
	    String name = request.getParameter("name");
	    request.setAttribute("name",name);
	   ClienService service = new ClienService();
	    OpOrderticketsKeyword keyWord = new OpOrderticketsKeyword();
	    
	    if(certNo!=null && !certNo.trim().equals("")){
	    	keyWord.setCertNo(certNo);
	    }
	    if(name!=null && !name.trim().equals("")){
	    	keyWord.setName(name.trim());
	    }
	    int count = 0;
	    count = service.CustomerLogCount(keyWord);
		keyWord.setPageInfo(count, 1);
		List<OpOrdertickets> list = service.customerLogList(keyWord);
		
		request.setAttribute("list", list);
		
		return mapping.findForward("userFlyInfoList");
	}
	/**
	 * 到售团体票页面
	 * @throws UnsupportedEncodingException 
	 */
	public ActionForward toSaltTeamTickets(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		Integer flightinfoId = Integer.valueOf(request.getParameter("flightinfoId"));
		String teamName = URLDecoder.decode(request.getParameter("name"),"UTF-8");
		String status = request.getParameter("status");
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleFlightInfo(flightinfoId);
		kw.setTeamName(teamName);
		kw.setStatus("1");
		kw.setTeamflag("1");
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		List<OpOrdertickets> list = service.teamSaltOrUpList(kw);
		request.setAttribute("list",list);
		request.setAttribute("flightinfo", list.get(0));
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(list.get(0).getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		return mapping.findForward("teamSaltTickets");
	}
	
	public ActionForward saltTeamsTicket(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
//		price_id= #priceId#,STATUS=#status#, NAME=#name#, CERT_TYPE=#certType#, CERT_NO=#certNo#, LINKPHONE=#linkphone#, VIP_FLAG=#vipFlag#, 
//		TEAMFLAG=#teamflag#,TEAM_NAME=#teamName#,TICKETPOINT_ID=#ticketpointId#,   TICKETPRICE=#ticketprice#, REMARK=#remark#,HALFPRICECARD=#halfpricecard#,ZEROPRICECARD=#zeropricecard#,PAYMENT=#payment#
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		String[] check_boxs = request.getParameterValues("check_box");
		
		String[] names = request.getParameterValues("name");
		String[] certTypes = request.getParameterValues("certType");
		
		String[] certNos = request.getParameterValues("certNo");
		String[] linkphones = request.getParameterValues("linkphone");
		String[] vipFlags = request.getParameterValues("vipFlag");
		String[] teamflags = request.getParameterValues("teamflag");
		String[] teamNames = request.getParameterValues("teamName");
		String[] ticketpointIds = request.getParameterValues("ticketpointId");
		
		String[] remarks = request.getParameterValues("remark");
		String[] ids = request.getParameterValues("id");
		String[] priceIds = request.getParameterValues("priceId");
		String[]halfpricecards = request.getParameterValues("halfpricecard");
		String[]zeropricecards= request.getParameterValues("zeropricecard");
		String[]payments = request.getParameterValues("payment");
	    Authorization auth = (Authorization)request.getSession(true).getAttribute("authorization");
		com.roc.enp.entity.OpUseroper userOper = new com.roc.enp.entity.OpUseroper();
		userOper.setType(2);
		userOper.setUserId(auth.getUserid());
		List<OpOrdertickets> opList = new ArrayList<OpOrdertickets>();
		int arrVal = 0;
		for(int i =0; i < check_boxs.length;i++){
			arrVal = Integer.valueOf(check_boxs[i]);
			OpOrdertickets orderT = new OpOrdertickets();
			orderT.setStatus("2");  
			orderT.setName(names[arrVal]);
			orderT.setCertType(certTypes[arrVal]);
			orderT.setCertNo(certNos[arrVal]);
			orderT.setLinkphone(linkphones[arrVal]);		
			orderT.setVipFlag(vipFlags[arrVal]);
			orderT.setTicketpointId(Integer.valueOf(ticketpointIds[arrVal]));
			orderT.setTeamflag(teamflags[arrVal]);
			if(teamflags[arrVal].trim().equals("1"))
				orderT.setTeamName(teamNames[arrVal].trim());
			else
				orderT.setTeamName("");
			orderT.setRemark(remarks[arrVal]);
			orderT.setHalfpricecard(halfpricecards[arrVal]);
			orderT.setPriceId(Integer.valueOf(priceIds[arrVal].split(";")[0]));
			orderT.setZeropricecard(zeropricecards[arrVal]);
			orderT.setPayment(payments[arrVal]);
			orderT.setId(Integer.valueOf(ids[arrVal]));
			opList.add(orderT);
		}
		boolean b = service.saltTeamTickets(opList, userOper);
		if(b){
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			request.setAttribute("message", 1);
			List <OpOrdertickets> o = null;
			for(OpOrdertickets oop:opList){
				kw.setId(oop.getId());
				o = service.getOrderticketsList(kw);
				OpOrdertickets order =  o==null||o.size()==0?null:service.getOrderticketsList(kw).get(0);
				
				if(order != null){
					FlightService s = new FlightService();
					BaTicketpriceKeyword k = new BaTicketpriceKeyword();
					k.setId(order.getPriceId());
					if(order.getPriceId()!=null){
						List<BaTicketprice> l1 = s.queryBaTicketpriceList(k);
						order.setTicketprice(l1!=null&&l1.size()>0?l1.get(0).getRealAmount():0);	
					}else{
						order.setTicketprice(0.00);
					}	
					try{
						ExcelUtil.proceed(order, auth.getName());
					}catch(Exception e){
						e.printStackTrace();
						request.setAttribute("message", 2);
					}
				}
			}
		}else{
			request.setAttribute("message", 0);
		}		
		return mapping.findForward("tipteam");
	}
	
	/**
	 * 到售团体票页面
	 * @throws UnsupportedEncodingException 
	 */
	public ActionForward toUPdateTeampage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		Integer id = Integer.valueOf(request.getParameter("id"));
		
		
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setId(id);
		ClienService service =  SingleInstanceClientSer.getClientService().getService();
		OpOrdertickets ol1 = service.getOrderticketsList(kw).get(0);	
		kw.setSeleFlightInfo(ol1.getFlightinfoId());
		kw.setStatus(ol1.getStatus());
		kw.setTeamName(ol1.getTeamName());
		List<OpOrdertickets> list = service.teamDjpList(kw);
		request.setAttribute("list",list);
		request.setAttribute("flightinfo", list.get(0));
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		keyword.setFlightId(list.get(0).getFlightId());
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		return mapping.findForward("teamUpDate");
	}
	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toLuggInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		//查看是否存在航班信息
		List<OpOrdertickets> ol1 = service.getBaFlightInfoList(kw);
		String flightInfoIds = "";
		if(ol1!=null && ol1.size()>0){
			for (OpOrdertickets ot:ol1) {
				flightInfoIds += "," +ot.getId();
			}
			flightInfoIds = flightInfoIds.substring(1);
			OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
			kw1.setSeleFlightInfos(flightInfoIds);
			List<OpOrdertickets> ol = service.allInfoList(kw1);
			request.setAttribute("list", ol);
		}	
		
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime",flyTime);
		request.setAttribute("flightInfoIds",flightInfoIds);
		return mapping.findForward("luggageInfo");
		
	}
	public ActionForward toXxinfoPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		
		ClienService service = new ClienService();
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		
		kw.setId(Integer.valueOf(id));
		OpOrdertickets ol1 = service.allInfoList(kw).get(0);	
		if(ol1 != null) {
			int luggSum = 0;
			String bagNum = ol1.getBagNum();
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
			ol1.setLuggSum(luggSum);
			ol1.setBagNums(bagNum);
		}
		request.setAttribute("flightinfo",ol1);
		BaTicketpointKeyword kw1 = new BaTicketpointKeyword();
		FlightService service1 = new FlightService();
		java.util.List<BaTicketpoint> tpList = service1.queryBaTicketpoint(kw1);
		request.setAttribute("tpList",tpList);
		FlightService service2 = new FlightService();
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		
		keyword.setFlightId(Integer.valueOf(request.getParameter("fid")));
		List<BaTicketprice> tprice = service2.queryBaTicketpriceList(keyword);
		request.setAttribute("tprice", tprice);
		return mapping.findForward("xxinfo");
		
	}
	/**------------------------------------------------------------------------------------------
	 * 13.1.27
	 * 增加登机扫描节点
	 */
	public ActionForward toFlyMainPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String orderdate = request.getParameter("orderdate");
		String flyTime= request.getParameter("hour")+":"+request.getParameter("minue");
		OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
		kw.setSeleDate(orderdate);
		kw.setFlyTime(flyTime);
		ClienService service = new ClienService();
		boolean b=service.mainPageForDJP(kw);
		if(!b){
			request.setAttribute("message", "1");
			return mapping.findForward("fly_homePage");
		}
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("flyTime", flyTime);
		return mapping.findForward("fly_mainFramePage");
		
	}
	/**
	 * 已经安检的乘客列表查询页面，并返回统计结果页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
		public ActionForward toFlyAlrSafeCheck(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
			String orderdate = request.getParameter("orderdate");
			String flyTime= request.getParameter("flyTime");
			OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
			kw1.setSeleDate(orderdate);
			kw1.setFlyTime(flyTime);
			//查看是否存在航班信息			
			ClienService service = new ClienService();
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setSeleDate(orderdate);
			kw.setFlyTime(flyTime);
			//查看是否存在航班信息
			List<OpOrdertickets> ol1 = service.listForChargeDJP(kw);
			List<OpOrdertickets> ol2 = service.listForReserveDJP(kw);
			List<OpOrdertickets> ol3 = service.listForChargedDJP(kw);			
			List<OpOrdertickets> ol4 = service.getBaFlightInfoList(kw1);
			List<OpOrdertickets> statusOverList = service.listForInFly(kw1);
			StringBuffer offLandTimeSb=new StringBuffer();
			offLandTimeSb.append(orderdate);
			offLandTimeSb.append(" ");
			offLandTimeSb.append(flyTime);
			request.setAttribute("which", "up");
			request.setAttribute("shouPiao", ol2.size());
			request.setAttribute("huanPai", ol1.size());
			request.setAttribute("safeCheck", ol3.size());
			request.setAttribute("dengJi",statusOverList.size());
			request.setAttribute("offLandTime", offLandTimeSb.toString());
			request.setAttribute("list", ol3);
			request.setAttribute("orderdate",orderdate);
			request.setAttribute("flightNo", (ol4!=null)?ol4.get(0).getFlightNo():"");
			return mapping.findForward("fly_containPage");
			
		}
		
/**
 * 已经登机扫描结束的乘客信息列表
 * @param mapping
 * @param form
 * @param request
 * @param response
 * @return
 */
		
		public ActionForward areadyToFly(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response){
			String id = (request.getParameter("id")!=null && !"".equals(request.getParameter("id").trim()))?request.getParameter("id"):"";
			String orderdate = request.getParameter("orderdate");
			String flyTime= request.getParameter("flyTime");
			ClienService service = new ClienService();
			if(!id.equals("")){
				OpOrderticketsKeyword kw1 = new OpOrderticketsKeyword();
				kw1.setId(Integer.valueOf(id));
				List<OpOrdertickets> kwOpOrder = service.getOrderticketsList(kw1);
				request.setAttribute("smInfo", kwOpOrder!=null?kwOpOrder.get(0):null);
			}
			OpOrderticketsKeyword kw = new OpOrderticketsKeyword();
			kw.setSeleDate(orderdate);
			kw.setFlyTime(flyTime);
			//查看是否存在航班信息
			List<OpOrdertickets> ol1 = service.listForInFly(kw);		
			request.setAttribute("list", ol1);
			return mapping.findForward("fly_containPage");
			
		}
}
