package com.tempflight.entity;

import java.util.Date;

public class TempOrdertickets {
	private   Integer id; //ID	int	11	0	0	
	private  Integer tempFlightinfoId;//TEMP_FLIGHTINFO_ID	
	private  String flightInfo;//flight_info
	private  String name;//NAME	varch
	private  String certType;//CERT_TYPE	v
	private  String certNo; //CERT_NO	var
	private  String linkphone;//LINKPHONE	v
	private  String vipFlag;//VIP_FLAG	v
	private  java.util.Date flightDate;//FLIGHT_DATE
	private  String flyTime;//FLY_TIME	v
	private  String status;//STATUS	var
	private  String remark;//REMARK	varchar	
	private  String gate;//GATE	varchar	50
	private  Date createdate;//CREATEDATE	time
	private  String deleteFlag;//DELETE_FLAG	char
	private Integer luggSum;//LUGG_SUM	int	11
	private Double weightSum;//WEIGHT_SUM	floa
	private String seatNum;
	private String bagNum;//BAG_NUM
	private String teamflag;
	private String teamName;
	private String bagNums;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTempFlightinfoId() {
		return tempFlightinfoId;
	}
	public void setTempFlightinfoId(Integer tempFlightinfoId) {
		this.tempFlightinfoId = tempFlightinfoId;
	}
	public String getFlightInfo() {
		return flightInfo;
	}
	public void setFlightInfo(String flightInfo) {
		this.flightInfo = flightInfo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCertType() {
		return certType;
	}
	public void setCertType(String certType) {
		this.certType = certType;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	public String getLinkphone() {
		return linkphone;
	}
	public void setLinkphone(String linkphone) {
		this.linkphone = linkphone;
	}
	public String getVipFlag() {
		return vipFlag;
	}
	public void setVipFlag(String vipFlag) {
		this.vipFlag = vipFlag;
	}
	public java.util.Date getFlightDate() {
		return flightDate;
	}
	public void setFlightDate(java.util.Date flightDate) {
		this.flightDate = flightDate;
	}
	public String getFlyTime() {
		return flyTime;
	}
	public void setFlyTime(String flyTime) {
		this.flyTime = flyTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getGate() {
		return gate;
	}
	public void setGate(String gate) {
		this.gate = gate;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public Integer getLuggSum() {
		return luggSum;
	}
	public void setLuggSum(Integer luggSum) {
		this.luggSum = luggSum;
	}
	public Double getWeightSum() {
		return weightSum;
	}
	public void setWeightSum(Double weightSum) {
		this.weightSum = weightSum;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getBagNum() {
		return bagNum;
	}
	public void setBagNum(String bagNum) {
		this.bagNum = bagNum;
	}
	public String getTeamflag() {
		return teamflag;
	}
	public void setTeamflag(String teamflag) {
		this.teamflag = teamflag;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getBagNums() {
		return bagNums;
	}
	public void setBagNums(String bagNums) {
		this.bagNums = bagNums;
	}
	
}
