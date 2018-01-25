package com.roc.enp.entity;

public class BaTicketpoint {
	private Integer id;
	private String name;//NAME
	private String telephone;//TELEPHONE
	private java.util.Date createdate;//CREATEDATE
	private String deleteFlag;//DELETE_FLAG
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public java.util.Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(java.util.Date createdate) {
		this.createdate = createdate;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
}
