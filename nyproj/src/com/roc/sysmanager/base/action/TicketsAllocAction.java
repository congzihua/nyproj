package com.roc.sysmanager.base.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.util.Global;
import com.roc.sysmanager.base.service.BaTicketsallocService;
import com.roc.syspe.entity.BaTicketsalloc;
import com.roc.syspe.entity.BaTicketsallocKeyword;

public class TicketsAllocAction extends DispatchAction {

	
	public ActionForward seleTicketsallocList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int currentPage = Integer.parseInt(request.getParameter("currentPage") == null||request.getParameter("currentPage").trim().equals("")?"1":request.getParameter("currentPage"));
	    int count = 0;
	    String seleorderdate = request.getParameter("seleorderdate");
	    BaTicketsallocService service = new BaTicketsallocService();
	    BaTicketsallocKeyword keyWord = new BaTicketsallocKeyword();
	    if(seleorderdate!=null && !seleorderdate.trim().equals("")){
	    	keyWord.setOrderdate(seleorderdate);
	    }
	    count = service.getBaTicketsallocCount(keyWord);
		keyWord.setPageInfo(20, currentPage);
		List<BaTicketsalloc> list = service.getBaTicketsalloc(keyWord);
		request.setAttribute("count", Integer.valueOf(count));
        request.setAttribute("currentPage", Integer.valueOf(currentPage));
        request.setAttribute("pageCount", Integer.valueOf(Global.computePageCount(count)));
		request.setAttribute("list", list);
		request.setAttribute("seleorderdate",seleorderdate);
		return mapping.findForward("dppemana");
	}
	/**
	 * 删除信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	public ActionForward deleteTicketalloc(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String ids = request.getParameter("ids");
		boolean  b = false;
		int i = 0;
		String[]idA = ids.split(";");
		BaTicketsallocService service = new BaTicketsallocService();
		for(int j = 0; j<idA.length;j++){
			b = false;
			if(idA[j]!=null&&!idA[j].trim().equals("")){
				BaTicketsalloc keyword = new BaTicketsalloc();
				keyword.setDeleteFlag("1");
				keyword.setId(Integer.valueOf(idA[j]));
				b = service.editDeleBaTicketsalloc(keyword);
				if(b){
					i++;
				}
			}
		}
		request.setAttribute("deleNum", i);
		return seleTicketsallocList(mapping, form, request, response);
		
	}
	
	public ActionForward bentchAddInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String flightId = request.getParameter("flight");
		String orderdate = request.getParameter("orderdate");
		String orderdate1 = request.getParameter("orderdate1");
		String[] ticketpointIds = request.getParameterValues("ticketpointId");
		String[] amount = request.getParameterValues("amount");
		
		String hour=request.getParameter("hour");
		String minute=request.getParameter("minute");
		StringBuffer ordertimeSB=new StringBuffer();
		ordertimeSB.append(hour);
		ordertimeSB.append(":");
		ordertimeSB.append(minute);
		String ordertime=ordertimeSB.toString();
		
		String[] weeks=request.getParameterValues("week");
		
		BaTicketsallocService service = new BaTicketsallocService();
		
		BaTicketsalloc ba = new BaTicketsalloc();
		ba.setFlightId(Integer.valueOf(flightId));
		
		ba.setOrdertime(ordertime);
		
		for(int i=0;i<ticketpointIds.length;i++){
			if(amount[i]!=null && !amount[i].trim().equals("")){
				ba.setAmount(Integer.valueOf(amount[i]));
				ba.setTicketpointId(Integer.valueOf(ticketpointIds[i]));
				service.bentchAddBaTicketsalloc(orderdate, orderdate1,weeks, ba);
			}
		}
		request.setAttribute("oper", 1);
		return mapping.findForward("tip");
	}
	
	/**
	 * 解锁信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	public ActionForward keyTicketprices(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String ids = request.getParameter("ids");
		boolean  b = false;
		int i = 0;
		String[]idA = ids.split(";");
		BaTicketsallocService service = new BaTicketsallocService();
		for(int j = 0; j<idA.length;j++){
			b = false;
			if(idA[j]!=null&&!idA[j].trim().equals("")){
				BaTicketsalloc keyword = new BaTicketsalloc();
				
				keyword.setId(Integer.valueOf(idA[j]));
				keyword.setLockednum(0);
				b = service.updateBaTicketsalloc(keyword);
				if(b){
					i++;
				}
			}
		}
		request.setAttribute("keyLockedNum", i);
		return seleTicketsallocList(mapping, form, request, response);
		
	}
	
	public ActionForward ticketAllocUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String[] ids = request.getParameterValues("id");
		String[] amounts = request.getParameterValues("amount");
		BaTicketsallocService service = new BaTicketsallocService();
		
		BaTicketsalloc ba = new BaTicketsalloc();		
		service.editTicketsallocAmount(ids, amounts, ba);
		request.setAttribute("oper", 2);
		return mapping.findForward("tip");
	}
}
