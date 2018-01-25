/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.founder.enp.entity.Attache;
import com.founder.enp.entity.Parameter;
import com.founder.enp.forms.AttacheForm;
import com.founder.enp.service.DocService;
import com.founder.enp.service.ParameterService;
import com.founder.enp.util.ContentNameUtil;

/**
 * MyEclipse Struts Creation date: 07-25-2009
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class AttacheSessionAction extends Action {
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

		
		if (oper.equals("add")) {
			AttacheForm frm = (AttacheForm) form;
			Attache attache = new Attache();
			attache.setTitle(frm.getTitle());
			String fileName = frm.getFilename();
			attache.setFiletype(fileName.substring(
					fileName.lastIndexOf(".") + 1, fileName.length()));
			Integer attacheid = (Integer) request.getSession().getAttribute(
					"attacheid");
			attache.setFileOrgName(fileName);
			if (attacheid == null) {
				DocService service = new DocService();
				attacheid = service.getMaxAttacheID();
				request.getSession().setAttribute("attacheid", attacheid);
			} else {
				attacheid++;
				request.getSession().setAttribute("attacheid", attacheid);
			}
			attache.setAttacheid(attacheid);
			attache.setFilename(ContentNameUtil.GetContentName()+fileName.substring(fileName.lastIndexOf("."),fileName.length()));
			List list = (List) request.getSession().getAttribute("attache");
			if (list == null) {
				list = new ArrayList();
				list.add(attache);
				request.getSession().setAttribute("attache", list);
			} else {
				list.add(attache);
			}
		}
		if (oper.equals("del")) {

			List list = (List) request.getSession().getAttribute("attache");

			String idString = request.getParameter("idString");
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					idString, ";");
			Iterator itera = list.iterator();
			while (token.hasMoreTokens()) {
                int attacheid = Integer.parseInt(token.nextToken());
				while (itera.hasNext()) {
					Attache attache = (Attache) itera.next();
					if (attache.getAttacheid() == attacheid) {

						if (attache.getFileOrgName() == null)
						{
							ParameterService service = new ParameterService();
							Parameter parameter = service.listParameter();
							//删除网络文件
							String netFile = parameter.getAttacheip()+attache.getFilename();
							File file = new File(netFile);
							if (file.exists())
								file.delete();
							DocService docService = new DocService();
							docService.delDocAttachments(attache.getAttacheid());
						}
						list.remove(attache);
						itera = list.iterator();
						
					}
				}
				itera = list.iterator();

			}

			request.getSession().setAttribute("attache", list);

		}

		return mapping.findForward("attache");
	}
}
