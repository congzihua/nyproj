package com.roc.syspe.entity;

import com.founder.enp.persistence.PaginatedModel;

public class OpOrderticketsKeyword extends PaginatedModel {
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String seleStatus;
	
	private String seleDate;
	private Integer seleFlightId;
	private String flyTime;
	private Integer seleFlightInfo;
	private String seleFlightInfos;
	private Integer ticketPointId;
	private Integer userId;
	
	private String endDate;
	private Integer type;
	private String name;
	private String seatNum;
	private String im;
	//----------
	private Integer id;
	private String startDate;
	private String certNo;
	private String certType;
	private String status;
	//--------------
	private String teamName;
	private String teamflag;
	private String ids;
	private Integer year;
	private Integer flightId;
	
	
	public String getSeleFlightInfos() {
		return seleFlightInfos;
	}
	public void setSeleFlightInfos(String seleFlightInfos) {
		this.seleFlightInfos = seleFlightInfos;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getFlightId() {
		return flightId;
	}
	public void setFlightId(Integer flightId) {
		this.flightId = flightId;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getSeleStatus() {
		return seleStatus;
	}
	public void setSeleStatus(String seleStatus) {
		this.seleStatus = seleStatus;
	}
	public String getTeamflag() {
		return teamflag;
	}
	public void setTeamflag(String teamflag) {
		this.teamflag = teamflag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getCertType() {
		return certType;
	}
	public void setCertType(String certType) {
		this.certType = certType;
	}
	public String getIm() {
		return im;
	}
	public void setIm(String im) {
		this.im = im;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Integer getTicketPointId() {
		return ticketPointId;
	}
	public void setTicketPointId(Integer ticketPointId) {
		this.ticketPointId = ticketPointId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSeleFlightInfo() {
		return seleFlightInfo;
	}
	public void setSeleFlightInfo(Integer seleFlightInfo) {
		this.seleFlightInfo = seleFlightInfo;
	}
	public String getSeleDate() {
		return seleDate;
	}
	public void setSeleDate(String seleDate) {
		this.seleDate = seleDate;
	}
	public Integer getSeleFlightId() {
		return seleFlightId;
	}
	public void setSeleFlightId(Integer seleFlightId) {
		this.seleFlightId = seleFlightId;
	}
	public String getFlyTime() {
		return flyTime;
	}
	public void setFlyTime(String flyTime) {
		this.flyTime = flyTime;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	
}
