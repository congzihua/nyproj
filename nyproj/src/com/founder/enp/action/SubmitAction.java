/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.founder.enp.entity.LogEntity;
import com.founder.enp.forms.SubmitForm;
import com.founder.enp.service.DocService;
import com.founder.enp.service.UserService;

/**
 * MyEclipse Struts Creation date: 07-31-2009
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class SubmitAction extends Action {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

 		DocService service = new DocService();
		String oper = request.getParameter("oper");
		if (oper.equals("submit")) {
			SubmitForm frm = (SubmitForm) form;
			String sel = request.getParameter("sel");
		
			LogEntity logEntity = new LogEntity();
			logEntity.setActiontype("提交公文");
			String tip = "";
			if (sel.equals("single"))
			{
			if (service.submitDoc(request, frm)) {
				logEntity.setAction("提交公文成功");
		
				tip = "submitsuccess";
			} else {
				logEntity.setAction("提交公文失败");
				tip = "submiterror";
			}
			}
			else
			{
				if (service.submitMoreDoc(request, frm)) {
					logEntity.setAction("公文送会签成功");
					tip = "submitMoresuccess";
				} else {
					logEntity.setAction("公文送会签失败");
					tip = "submitMoreerror";
				}
			}
			com.founder.enp.service.LogService.recordLog(logEntity, request);
			request.setAttribute("oper", tip);
			return mapping.findForward("tip");
		}
		if (oper.equals("check")) {
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0L);
			String flowsid = request.getParameter("flowids");
			String info = "";
			if (!service.checkSubmitDoc(flowsid)) {

				info = "nosubmit";
			} else {
			 if (!service.checkCounterSignISSubmit(flowsid))
				info = "counterSignNosubmit";
			}
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (Exception exception) {
			}
			out.print(info);
			out.close();
		}
		return null;
	}
}