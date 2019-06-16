package com.roc.sysmanager.base.form;

import org.apache.struts.action.ActionForm;

public class DutyTimeForm extends ActionForm{
	private Integer id;
	private Integer st;
	private Integer et;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSt() {
		return st;
	}
	public void setSt(Integer st) {
		this.st = st;
	}
	public Integer getEt() {
		return et;
	}
	public void setEt(Integer et) {
		this.et = et;
	}
	
	
}
