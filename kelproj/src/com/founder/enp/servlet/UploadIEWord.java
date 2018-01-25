package com.founder.enp.servlet;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class UploadIEWord extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3042140613047759897L;

	/**
	 * Constructor of the object.
	 */
	public UploadIEWord() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		char[] readerBuffer = new char[request.getContentLength()]; 
		BufferedReader bufferedReader = request.getReader(); 

		int portion = bufferedReader.read(readerBuffer); 
		int amount = portion; 
		while(amount < readerBuffer.length){ 
		portion = bufferedReader.read(readerBuffer,amount,readerBuffer.length-amount); 
		amount = amount + portion; 
		} 

		StringBuffer stringBuffer = new StringBuffer((int)(readerBuffer.length)); 
		for(int index = 0; index < readerBuffer.length;index++){ 
		char c = readerBuffer[index]; 
		stringBuffer.append(c); 
		} 

		String xml = stringBuffer.toString(); 


		Element root = null; 
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(xml);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		root = doc.getRootElement(); 
		String p = root.elementTextTrim("file1");
		System.out.println(p);

		byte[] b = new sun.misc.BASE64Decoder().decodeBuffer(p); 

		ByteArrayInputStream inStream=new ByteArrayInputStream(b); 


		File f = new File("c:\\ssdfd.doc"); 

		FileOutputStream fs=new FileOutputStream("c:\\ssdfd.doc"); 
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = inStream.read(buffer, 0, 8192)) != -1) {
			fs.write(buffer, 0, bytesRead);
		}
		fs.close();
		inStream.close();

		PrintWriter out = response.getWriter();
		out.print("successful");
		out.flush();
		out.close();

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
