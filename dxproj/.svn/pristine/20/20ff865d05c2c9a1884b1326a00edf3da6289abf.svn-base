package com.founder.enp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.founder.enp.entity.User;
import com.founder.enp.service.UserService;

public class GetUserInfoTree extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetUserInfoTree() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	    response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0L);
        response.setContentType("text/xml;charset=UTF-8");
        PrintWriter out = response.getWriter();
        StringBuilder buffer = new StringBuilder();
        buffer.append("<?xml version=\"1.0\"?>");
        buffer.append("<tree>");
        UserService service = new UserService();
        Iterator list = service.getAllUser().iterator();
        
        while( list.hasNext())
        {
            User user = (User)list.next();
            buffer.append("<tree text=\"");
            buffer.append(user.getName()).append("\"");
        	buffer.append(" click=\"itemClick(this)\"");
            buffer.append(" userid=\"").append(user.getUserid()).append("\"");
	       	 buffer.append(" icon=\"../../xtree/images/openfoldericon.png\"").append(
             " openIcon=\"../../xtree/images/openfoldericon.png\"").append(
             " fileIcon=\"../../xtree/images/openfoldericon.png\"").append("/>");
	     }

        buffer.append("</tree>");
        out.println(buffer.toString());
        out.flush();
        out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
