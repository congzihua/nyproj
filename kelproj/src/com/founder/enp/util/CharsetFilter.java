/**
 * Copyright (c) 2002,北大方正数字科技项目开发部
 * All rights reserved.
 *
 *摘要： 
 *    编码过滤器类 解决从HTML或JSP向Servlet传递中文信息的乱码问题。
 *
 * 当前版本：1.0
 * 作者：ligy
 * 完成日期：2008-3-30
 */

package com.founder.enp.util;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 */


public class CharsetFilter implements Filter {
	/** 保存用户指定编码 */
	protected String encoding = null;
	
	/**
	 * 初始化过滤器方法，由系统创建Filter时自动调用 把web.xml中用户指定的编码保存在本类的属性中
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
	}

	/**
	 * 执行过滤功能 将参数信息按指定的编码进行转换
	 */
	@SuppressWarnings("deprecation")
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}

	/**
	 * 销毁方法，在系统销毁Filter之前由系统自动调用
	 */
	public void destroy() {
		this.encoding = null;
	}
}
