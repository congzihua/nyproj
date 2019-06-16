package com.founder.enp.util;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.founder.enp.entity.Authorization;

public class LoginFilter extends HttpServlet implements Filter {
	public static final long serialVersionUID = 1L;

	private FilterConfig filterConfig;

	// Handle the passed-in FilterConfig
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	// Process the request/response pair
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) {
		try {
//			req.setCharacterEncoding("UTF-8");
//			res.setCharacterEncoding("UTF-8");
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) res;
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS,DELETE");
			response.setHeader("Access-Control-Max-Age", "3600");
			 response.setHeader("Access-Control-Allow-Headers", "x-requested-with,Content-Type");
			
			HttpSession session = ((HttpServletRequest) request).getSession();
			Authorization auth = (Authorization) session
					.getAttribute("authorization");
		    String uri = ((HttpServletRequest)request).getRequestURI();
		    String reg="(?i).+?\\.(jpg|gif|bmp|jpeg|jpeg2000|tif|ico|tiff|psd|png|swf|svg|pcx|dxf|img|dib|jfif|jpe|css|js)";//用正则表达式判断文件格式！这些都是图片格式
		    if(uri!=null&&uri.trim().toLowerCase().matches(reg)){
		    	
		    }else{
			    if (!uri.endsWith("login.jsp")&&!uri.endsWith("default.jsp") 
			    		&& !uri.endsWith("loginAction.do")&& !uri.endsWith("gettask.jsp")&& !uri.endsWith("dljm.jsp"))
			    {
			 		if (auth == null || auth.getUserid() == 0) {
						PrintWriter out = response.getWriter();
						HttpServletRequest r = (HttpServletRequest) request;
						out.print("<script>top.location.href='"+r.getContextPath()+"/login.jsp';</script>");
		
					} 
			    }
		    }
		    filterChain.doFilter(request, response);
		} catch (ServletException sx) {
			filterConfig.getServletContext().log(sx.getMessage());
		} catch (IOException iox) {
			filterConfig.getServletContext().log(iox.getMessage());
		}
	}

	// Clean up resources
	public void destroy() {
	}
}
