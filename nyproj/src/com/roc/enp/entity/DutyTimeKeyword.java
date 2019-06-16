package com.roc.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class DutyTimeKeyword extends PaginatedModel{
	private Integer id;
	private Integer stHour;
	private Integer etHour;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStHour() {
		return stHour;
	}
	public void setStHour(Integer stHour) {
		this.stHour = stHour;
	}
	public Integer getEtHour() {
		return etHour;
	}
	public void setEtHour(Integer etHour) {
		this.etHour = etHour;
	}
	
}
