package com.roc.sysmanager.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.util.Global;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.sysmanager.base.service.BlacklistUserService;

public class FlightNAction extends DispatchAction{
	/**
	 * 生成航班信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward queryFlightNoAndFlightInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("blacklistUserList");

	}
}
