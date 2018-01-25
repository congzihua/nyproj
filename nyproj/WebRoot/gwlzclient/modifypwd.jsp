<%@ page language="java"  pageEncoding="UTF-8"%>
<jsp:directive.page import="com.founder.enp.service.UserService"/>
<jsp:directive.page import="com.founder.enp.entity.Authorization" />
<jsp:directive.page import="com.founder.enp.entity.User"/>
<%

Authorization authorization = (Authorization) session
			.getAttribute("authorization");
  String pwd = request.getParameter("pwd");
  UserService service = new UserService();
  User user = new User();
  user.setUserid(authorization.getUserid());
  user.setPassword(pwd);
  System.out.println(pwd);
  if ( service.changeUserPwd(user))
  {
     out.print("修改密码成功");
  }
  else
  {
    out.print("修改密码失败");
  }
  out.close();
 
     
%>