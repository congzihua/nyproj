package com.founder.enp.util.databases;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
public class ConnectionManager //implements PlugIn
{

//	private static DataSource dataSource = null;
//
//	   private Connection conn = null;
//
//	   private PreparedStatement ps = null;
//
//	   private ResultSet rs = null;
//
//	 
//
//	   public void init(ActionServlet servlet, ModuleConfig config)
//
//	         throws ServletException {
//
//	      dataSource = (DataSource) servlet.getServletContext().getAttribute("datasource");
//
//	   }
//
//	  
//
//	   public Connection DBConn() throws SQLException {
//
//	      if (dataSource != null) {
//
//	            conn = dataSource.getConnection();
//
//	         }
//
//	      return conn;
//
//	   }
//
//	   public void close() {
//
//	      try {
//
//	          if (rs != null) {
//
//	             rs.close();
//
//	             rs = null;
//
//	          }
//
//	          if (ps != null) {
//
//	              ps.close();
//
//	              ps = null;
//
//	          }
//
//	          if (conn != null) {
//
//	              conn.close();
//
//	              conn = null;
//
//	          }
//
//	      } catch (Exception e) {
//
//	         e.printStackTrace();
//
//	      }
//
//	   }
//
//	public void destroy() {
//
//	      System.out.println("系统销毁");
//
//	   }

}
