package com.founder.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class DocFlowsKeyWord extends PaginatedModel{
	
	
	private Integer userid;
	private Integer powergroup;
	private Integer docid;
	private String docids;
	private String title;
	private String startDate;
	private String endDate;
	public Integer getPowergroup() {
		return powergroup;
	}
	public void setPowergroup(Integer powergroup) {
		this.powergroup = powergroup;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getDocids() {
		return docids;
	}
	public void setDocids(String docids) {
		this.docids = docids;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	

}
