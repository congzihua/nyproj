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
import com.founder.enp.service.DocService;

/** 
 * MyEclipse Struts
 * Creation date: 08-11-2009
 * 
 * XDoclet definition:
 * @struts.action
 */
public class BakupDocAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String flowsid = request.getParameter("flowsid");
		DocService serivce = new DocService();
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0L);
		String info = "";
		LogEntity logEntity = new LogEntity();
		logEntity.setActiontype("公文归档");
		if (serivce.backUpDoc(flowsid, request))
		{
			info = "success";
			logEntity.setAction("公文归档成功");
		}
		else
		{
			info = "error";
			logEntity.setAction("公文归档失败");
		}
		com.founder.enp.service.LogService.recordLog(logEntity, request);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (Exception exception) {
		}
		out.print(info);
		out.close();
		return null;
	}
}