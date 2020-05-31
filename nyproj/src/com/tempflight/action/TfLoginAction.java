package com.tempflight.action;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.founder.enp.entity.Authorization;
import com.founder.enp.entity.User;
import com.founder.enp.entity.UserPage;
import com.founder.enp.service.UserGroupService;
import com.founder.enp.service.UserService;
public class TfLoginAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		User user = new User();
		String admin = request.getParameter("admin");
		user.setAccount(request.getParameter("account"));
		user.setPassword(request.getParameter("password"));
		UserService service = null;
		try{
			 service = new UserService();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		user = service.checkUser(user);
		Authorization authorization = new Authorization();
		if (user == null) {			
			String msg = "用户名或密码错误,请重新输入!";
			request.setAttribute("msg", msg);
			return mapping.findForward("tip");
		}
		UserGroupService ugService = new UserGroupService();
		//获得用户的权限
		List<com.founder.enp.entity.GpReleation> list = ugService.seleQXSystem(user.getUserid());
		LinkedList<String> strList = new LinkedList<String>();
		
		if(list==null || list.size()==0){
			String msg =  "您目前没有任何权限，不能登录系统!";			
			request.setAttribute("msg", msg);
			return mapping.findForward("tip");
		}else{
			for(com.founder.enp.entity.GpReleation gr:list){
				if(gr!=null && gr.getPowerid()!=null)
					strList.add(String.valueOf(gr.getPowerid()));
			}
		}
		if(strList.size()==0){
			String msg =  "您目前没有任何权限，不能登录系统!";			
			request.setAttribute("msg", msg);
			return mapping.findForward("tip");
		}
		boolean b = false;
		String m = null;
		if(admin.equals("2") || strList.contains("3") || strList.contains("4")){
			if(strList.contains("0")){
				b = true;
			}else{
				m = "您没有访问订售票系统的权限!";
			}
		}else if(admin.equals("3")){
			if(strList.contains("1") || strList.contains("3") || strList.contains("4")){
				b = true;
			}else{
				m = "您没有访问值登机系统的权限!";
			}
		}else if(admin.equals("4")){
			if(strList.contains("2") || strList.contains("3") || strList.contains("4")){
				b = true;
			}else{
				m = "您没有访问指挥中心系统的权限";
			}
		}else if(admin.equals("5")){
			if(strList.contains("5") || strList.contains("3") || strList.contains("4")){
				b = true;
			}else{
				m = "您没有访问安检系统的权限";
			}
		}else if(admin.equals("6")){
			if(strList.contains("5") || strList.contains("3") || strList.contains("4")){
				b = true;
			}else{
				m = "您没有访问登机扫描系统的权限";
			}
		}
		if(!b){			
			request.setAttribute("msg", m);
			return mapping.findForward("tip");
		}
		
		authorization.setAccount(user.getAccount());
		authorization.setDmpid(user.getDmpid());
		authorization.setEmail(user.getEmail());
		authorization.setIp(request.getRemoteAddr());
		authorization.setName(user.getName());
		authorization.setOther(user.getOther());
		authorization.setPhone(user.getPhone());
		authorization.setUserid(user.getUserid());
		authorization.setType(user.getType());
		authorization.setPassword(request.getParameter("password"));
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		authorization.setRtime(sdf.format(date));
		authorization.setWorkerNo(user.getIm());//员工号
		authorization.setSysqx(strList.contains("4")?"4":"3");
		UserPage userPage = service.getUserPage(user.getUserid());
		request.getSession(true).setAttribute("userPage", userPage);
		request.getSession(true).setAttribute("authorization", authorization);
		if(admin.equals("2")){
			return mapping.findForward("success");
		}else if(admin.equals("3")){
				return mapping.findForward("djpMain");
		}else if(admin.equals("4")){
			return mapping.findForward("zhzxMain");
		}else if(admin.equals("5")){
			return  mapping.findForward("toSafeMain");
		}else if(admin.equals("6")){
			return  mapping.findForward("toFlyMain");
		}
		return null;
	}
}