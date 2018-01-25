<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.entity.Watches" />
<jsp:directive.page import="com.founder.enp.service.UserService" />
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.entity.UserGroup" />
<jsp:directive.page import="com.founder.enp.service.UserGroupService" />
<%
	String groupid = request.getParameter("groupid");
	UserGroupService groupService = new UserGroupService();
	UserGroup group = groupService.queryPowersInfo(Integer.parseInt(groupid));
	Authorization authorization = (Authorization) session.getAttribute("authorization");
	authorization.setGroupid(Integer.parseInt(groupid));
	authorization.setPowers(group.getPowers());
	authorization.setLeaderid(Integer.parseInt(request.getParameter("leaderid")));
	session.setAttribute("authorization", authorization);
	UserService userService = new UserService();
	Watches watches = new Watches();
	watches.setUserid(authorization.getUserid());
    watches.setIpaddress(request.getRemoteAddr());
    userService.addLoginUser(watches);
    request.getRequestDispatcher("index.jsp").forward(request,response);
%>
