package com.roc.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class BlackUserKeyword extends PaginatedModel {
	private String name;
	private String idcard;
	private String certType;
	
	
	public String getCertType() {
		return certType;
	}
	public void setCertType(String certType) {
		this.certType = certType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
}
