package com.roc.sysmanager.base.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.roc.enp.entity.Dutytime;
import com.roc.sysmanager.base.service.BlacklistUserService;
import com.roc.sysmanager.base.service.DutyTimeService;

public class DutyTimeAction extends DispatchAction {
	/**
	 * 值机时间查看
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toDutytimePage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DutyTimeService service = new DutyTimeService();
		List list = service.getDutyTime(null);
		if (list.size() > 0)
			request.setAttribute("dutyTime", list.get(0));
		return mapping.findForward("toDutytimePage");
	}
	
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String st = request.getParameter("st");
		String et = request.getParameter("et");
		DutyTimeService service = new DutyTimeService();
		Dutytime dt = new Dutytime();
		dt.setEt(Integer.parseInt(et));
		dt.setSt(Integer.parseInt(st));
		dt.setId(Integer.parseInt(id));
		service.editDutyTime(dt);
		response.getWriter().print(1);
        return null;
	}
}
