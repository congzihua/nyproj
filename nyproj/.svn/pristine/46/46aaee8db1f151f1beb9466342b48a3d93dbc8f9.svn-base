package com.roc.sysmanager.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaTicketprice;
import com.roc.enp.entity.BaTicketpriceKeyword;
import com.roc.sysmanager.base.service.FlightService;

public class TicketpriceAction extends DispatchAction {
	/**
	 * 票价信息的list
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward ticketpriceList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		java.util.List<BaTicketprice> list = null;
		BaTicketpriceKeyword keyword = new BaTicketpriceKeyword();
		list = new FlightService().queryBaTicketpriceList(keyword);
		request.setAttribute("list", list);
		return mapping.findForward("tacketpricelist");
		
	}
	/**
	 * 删除票价信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deleteTicketprices(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String ids = request.getParameter("ids");
		boolean  b = false;
		int i = 0;
		String[]idA = ids.split(";");
		for(int j = 0; j<idA.length;j++){
			b = false;
			if(idA[j]!=null&&!idA[j].trim().equals("")){
				BaTicketprice keyword = new BaTicketprice();
				keyword.setDeleteFlag("1");
				keyword.setId(Integer.valueOf(idA[j]));
				b = new FlightService().editDeleTicketprice(keyword);
				if(b){
					i++;
				}
			}
		}
		request.setAttribute("deleNum", i);
		return ticketpriceList(mapping, form, request, response);
		
	}
}
