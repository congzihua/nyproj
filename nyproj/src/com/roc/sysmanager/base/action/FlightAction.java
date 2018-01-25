package com.roc.sysmanager.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roc.enp.entity.BaFlight;
import com.roc.enp.entity.BaFlightKeyWord;
import com.roc.enp.entity.BaTicketpoint;
import com.roc.enp.entity.BaTicketpointKeyword;
import com.roc.sysmanager.base.service.FlightService;

public class FlightAction extends DispatchAction{

	/**
	 * 航程信息的list
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		java.util.List<BaFlight> list = null;
		BaFlightKeyWord keyword = new BaFlightKeyWord();
		list = new FlightService().queryBaFlight(keyword);
		request.setAttribute("list", list);
		return mapping.findForward("flightList");
		
	}
	/**
	 * 删除航程信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deleteFlights(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String ids = request.getParameter("ids");
		boolean  b = false;
		int i = 0;
		String[]idA = ids.split(";");
		for(int j = 0; j<idA.length;j++){
			b = false;
			if(idA[j]!=null&&!idA[j].trim().equals("")){
				BaFlight keyword = new BaFlight();
				keyword.setDeleteFlag("1");
				keyword.setId(Integer.valueOf(idA[j]));
				b = new FlightService().editDeleBaFlight(keyword);
				if(b){
					i++;
				}
			}
		}
		request.setAttribute("deleNum", i);
		return list(mapping, form, request, response);
		
	}
	/**
	 * 航程信息的list
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward listTicketpoint(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		java.util.List<BaTicketpoint> list = null;
		BaTicketpointKeyword keyword = new BaTicketpointKeyword();
		list = new FlightService().queryBaTicketpoint(keyword);
		request.setAttribute("list", list);
		return mapping.findForward("pdlist");
		
	}
	/**
	 * 删除订票点信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deleteTicketpoints(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		String ids = request.getParameter("ids");
		boolean  b = false;
		int i = 0;
		String[]idA = ids.split(";");
		for(int j = 0; j<idA.length;j++){
			b = false;
			if(idA[j]!=null&&!idA[j].trim().equals("")){
				BaTicketpoint keyword = new BaTicketpoint();
				keyword.setDeleteFlag("1");
				keyword.setId(Integer.valueOf(idA[j]));
				b = new FlightService().editDeleTickedpint(keyword);
				keyword = null;
				if(b){
					i++;
				}
			}
		}
		request.setAttribute("deleNum", i);
		return listTicketpoint(mapping, form, request, response);
		
	}
	
}
