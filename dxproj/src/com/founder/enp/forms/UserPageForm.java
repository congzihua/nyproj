/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.founder.enp.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 08-14-2009
 * 
 * XDoclet definition:
 * @struts.form name="userPageForm"
 */
public class UserPageForm extends ActionForm {
	/*
	 * Generated Methods
	 */
	private String fileTempPath;
	private Integer fileNumber;
	private Integer selectLogin;
	private Integer userid;
	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	public Integer getFileNumber() {
		return fileNumber;
	}

	public void setFileNumber(Integer fileNumber) {
		this.fileNumber = fileNumber;
	}

	public String getFileTempPath() {
		return fileTempPath;
	}

	public void setFileTempPath(String fileTempPath) {
		this.fileTempPath = fileTempPath;
	}

	public Integer getSelectLogin() {
		return selectLogin;
	}

	public void setSelectLogin(Integer selectLogin) {
		this.selectLogin = selectLogin;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}
}