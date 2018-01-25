package com.founder.enp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.DepartMent;
import com.founder.enp.service.DepartMentService;


public class GetDepartMentTree extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private static Log log = LogFactory.getLog(GetDepartMentTree.class);
    private DepartMentService service;
	/**
	 * Constructor of the object.
	 */
	public GetDepartMentTree() {
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
	        service = new DepartMentService();
	        Integer id;
	        id = request.getParameter("id") == null ? 0: Integer.parseInt(request.getParameter("id"));
	        Iterator list = service.queryDepartMent(id).iterator();
	        
	        while( list.hasNext())
	        {
	            DepartMent dm = (DepartMent)list.next();
	            buffer.append("<tree text=\"");
	            buffer.append(dm.getName()).append("\"");
	        	buffer.append(" click=\"itemClick(this)\"");
	            buffer.append(" dmId=\"").append(dm.getId()).append("\"");
	            buffer.append(" parentid=\"").append(dm.getParentid()).append("\"");
	            if (service.isLeaf(dm.getId()))
	            {
	            	  buffer.append(" src=\"../../gwlzadmin/GetDepartMentTree.do?id=").append(dm.getId()).append("\"");
	            }
		       	 buffer.append(" icon=\"../../images/foldericon.png\"").append(
	             " openIcon=\"../../images/foldericon.png\"").append(
	             " fileIcon=\"../../images/foldericon.png\"").append("/>");
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
