/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.action;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.founder.enp.entity.DocNum;
import com.founder.enp.entity.LogEntity;
import com.founder.enp.service.DocTypesService;

/**
 * MyEclipse Struts Creation date: 07-17-2009
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class DocNumAction extends Action {
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
		String oper = request.getParameter("oper");
		DocTypesService serivce = new DocTypesService();
		if (oper.equals("list"))
		{
			String typeid = request.getParameter("typeid");
			DocNum docNum = serivce.getDocNum(Integer.parseInt(typeid));
			if (docNum == null)
			{
				request.setAttribute("oper", "listerror");
				return mapping.findForward("info");
			}
			request.setAttribute("docNum", docNum);
			return mapping.findForward("list");
			
			
		}
		if (oper.equals("save"))
		{
			String year = request.getParameter("year");
			String number = request.getParameter("number");
			String docnumid = request.getParameter("docnumid");
			DocNum docNum = new DocNum();
			docNum.setYear(Integer.parseInt(year));
			docNum.setNextnum(Integer.parseInt(number));
			docNum.setDocnumid(Integer.parseInt(docnumid));
			LogEntity logEntity = new LogEntity();
			logEntity.setActiontype("公文文号管理");
			if (serivce.saveDocNum(docNum))
			{
				logEntity.setAction("修改公文文号成功");
				request.setAttribute("oper","updatesuccess");
			}
			else
			{
				logEntity.setAction("修改公文文号失败");
				request.setAttribute("oper", "updateerror");
			}
			com.founder.enp.service.LogService.recordLog(logEntity, request);
			return mapping.findForward("info");
		}
		if (oper.equals("getDocNum"))
		{
			String typeid = request.getParameter("typeid");
			DocNum docNum = serivce.getDocSynchornizedNum(Integer.parseInt(typeid),request);
			
			String info="";
			LogEntity logEntity = new LogEntity();
			logEntity.setActiontype("获取公文文号");
			if (docNum == null)
			{
		        info="getNumError";
		    	logEntity.setAction("获取公文文号失败");
			}
			else
			{
				 String nextNum = String.valueOf(docNum.getNextnum());
				 if (nextNum.length()==1)
				     nextNum = "00"+nextNum;
				 else if (nextNum.length() ==2)
				     nextNum = "0"+nextNum;
				info = docNum.getTypename()+"["+docNum.getYear()+"]"+nextNum +"号";
				logEntity.setAction("获取公文文号成功");
				
			}
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0L);
			response.setCharacterEncoding("utf-8");
			com.founder.enp.service.LogService.recordLog(logEntity, request);
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