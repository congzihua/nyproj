package com.roc.sysmanager.base.form;

import org.apache.struts.action.ActionForm;

public class BaFlightForm extends ActionForm {
	private Integer id;
	private String flight;
	private String englishname;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	public String getEnglishname() {
		return englishname;
	}
	public void setEnglishname(String englishname) {
		this.englishname = englishname;
	}
	
	
}
