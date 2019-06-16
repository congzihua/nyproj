package com.roc.sysmanager.base.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.founder.enp.entity.LogKeyWord;
import com.founder.enp.service.LogService;
import com.founder.enp.util.Global;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.sysmanager.base.service.BlacklistUserService;
import com.roc.sysmanager.base.service.ClienService;
import com.roc.syspe.entity.OpOrdertickets;
import com.roc.syspe.entity.OpOrderticketsKeyword;

public class BlacklistAction extends DispatchAction {
	/**
	 * 黑名单信息列表
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toBlacklistUserList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int currentPage = Integer.parseInt(request
				.getParameter("currentPage") == null ? "1" : request
						.getParameter("currentPage"));
		String name = request.getParameter("name");
		int count = 0;
		java.util.List<BlacklistUser> list = null;
		BlackUserKeyword kw = new BlackUserKeyword();
		kw.setPageInfo(20, currentPage);
		kw.setName(name);
		BlacklistUserService service = new BlacklistUserService();
		count = service.getBlacklistCount(kw);
		list = service.getBlackLists(kw);
		
		request.setAttribute("name", name);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("pageCount", Integer.valueOf(Global
				.computePageCount(count)));
		request.setAttribute("list", list);
		return mapping.findForward("blacklistUserList");

	}
	public ActionForward toAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("addBlackInfo");
	}
	/**
	 * 新增黑名单用户信息
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String idcard = request.getParameter("idcard");
		String certType = request.getParameter("certType");
		BlacklistUser bean = new BlacklistUser();
		bean.setCertType(certType);
		bean.setIdcard(idcard);
		bean.setName(name);
		BlacklistUserService servcie = new BlacklistUserService();
		servcie.insertBlacklistUserInfo(bean);
		int currentPage = Integer.parseInt(request
				.getParameter("currentPage") == null ? "1" : request
						.getParameter("currentPage"));
		int count = 0;
		java.util.List<BlacklistUser> list = null;
		BlackUserKeyword kw = new BlackUserKeyword();
		kw.setPageInfo(20, currentPage);
		BlacklistUserService service = new BlacklistUserService();
		count = service.getBlacklistCount(kw);
		list = service.getBlackLists(kw);
		
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("currentPage", Integer.valueOf(currentPage));
		request.setAttribute("pageCount", Integer.valueOf(Global
				.computePageCount(count)));
		request.setAttribute("list", list);
		return mapping.findForward("blacklistUserList");
	}
	
	public ActionForward updateInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String idcard = request.getParameter("idcard");
		String certType = request.getParameter("certType");
		String id = request.getParameter("id");
		BlacklistUser bean = new BlacklistUser();
		bean.setCertType(certType);
		bean.setIdcard(idcard);
		bean.setName(name);
		bean.setId(Integer.valueOf(id));
		BlacklistUserService servcie = new BlacklistUserService();
		servcie.editBlacklistInfo(bean);
		return toBlacklistUserList(mapping, form, request, response);
	}
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		
		BlacklistUserService servcie = new BlacklistUserService();
		servcie.deleteBlacklistInfo(Integer.valueOf(id));
		response.getWriter().print(1);
        return null;
	}
	
	public ActionForward getInfoById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		BlacklistUserService servcie = new BlacklistUserService();
		BlacklistUser bUser = servcie.getInfoById(Integer.valueOf(id));
		request.setAttribute("blacklistUser", bUser);
		return mapping.findForward("toEdit");
	}
}
