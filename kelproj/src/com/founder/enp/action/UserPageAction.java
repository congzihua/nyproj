/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.founder.enp.entity.UserPage;
import com.founder.enp.forms.UserPageForm;
import com.founder.enp.service.UserService;

/** 
 * MyEclipse Struts
 * Creation date: 08-14-2009
 * 
 * XDoclet definition:
 * @struts.action
 */
public class UserPageAction extends Action {
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

     UserPageForm frm = (UserPageForm)form;
     UserPage page = new UserPage();
     page.setFileNumber(frm.getFileNumber());
     page.setFileTempPath(frm.getFileTempPath());
     page.setSelectLogin(frm.getSelectLogin());
     page.setUserid(frm.getUserid());
     UserService serivce = new UserService();
     String info = "";
     if (serivce.updateUserPage(page))
     {
    	info="userpageUpdateSuccess";
     }
     else
     {
    	 info="userpageUpdateError";
     } 
     request.setAttribute("oper", info);
     return mapping.findForward("info");
     
	}
}