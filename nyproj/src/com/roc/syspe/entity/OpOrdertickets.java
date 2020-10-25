package com.roc.syspe.entity;

import java.util.Date;
import java.util.LinkedList;

public class OpOrdertickets {
	private String startAddress;
	private  Integer flightId;//FLIGHT_ID	i
	private  java.util.Date flightDate;//FLIGHT_DATE
	private  String flyTime;//FLY_TIME	v
	private  String status;//STATUS	var
	private  String name;//NAME	varch
	private  Integer flightinfoId;//FLIGHTINFO_ID;
	private  String flightDateFormate;
	private  String certType;//CERT_TYPE	v
	private  String certNo; //CERT_NO	var
	private  String linkphone;//LINKPHONE	v
	private  String vipFlag;//VIP_FLAG	v
	private  Integer ticketpointId;//TICKETPOINT_ID	
	private  String flightNo;//FLIGHT_NO	varcha
	private  String payment; //PAYMENT	varchar	
	private  Double ticketprice;//TICKETPRICE	int	
	private  String remark;//REMARK	varchar	
	private  String gate;//GATE	varchar	50
	private  String halfpricecard;//HALFPRICECARD	va
	private  String zeropricecard;//ZEROPRICECARD	va
	private  Date createdate;//CREATEDATE	time
	private  String deleteFlag;//DELETE_FLAG	char
	private   Integer id; //ID	int	11	0	0	
	private Integer luggSum;//LUGG_SUM	int	11
	private Double weightSum;//WEIGHT_SUM	floa
	private String flight;
	private Integer orderuserId;//ORDERUSER_ID
	private String seatNum;
	private String gateTime;
	private Integer priceId;
	private String discountType;
	private Float realAmount;
	private String username;
	private Integer type;
	private Integer ids;
	private String ticketpointname;
	private String ordertime;
	private String bagNum;//BAG_NUM
	private String teamflag;
	private String teamName;
	private String month;
	private String day;
	private String bagNums;
	private Integer babyFlag;
	
	
	public Integer getBabyFlag() {
		return babyFlag;
	}
	public void setBabyFlag(Integer babyFlag) {
		this.babyFlag = babyFlag;
	}
	public String getFlightDateFormate() {
		return flightDateFormate;
	}
	public void setFlightDateFormate(String flightDateFormate) {
		this.flightDateFormate = flightDateFormate;
	}
	public String getStartAddress() {
		return startAddress;
	}
	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}
	public String getBagNums() {
		return bagNums;
	}
	public void setBagNums(String bagNums) {
		this.bagNums = bagNums;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
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
	public String getBagNum() {
		return bagNum;
	}
	public void setBagNum(String bagNum) {
		this.bagNum = bagNum;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getTicketpointname() {
		return ticketpointname;
	}
	public void setTicketpointname(String ticketpointname) {
		this.ticketpointname = ticketpointname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getIds() {
		return ids;
	}
	public void setIds(Integer ids) {
		this.ids = ids;
	}
	public String getDiscountType() {
		return discountType;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public Float getRealAmount() {
		return realAmount;
	}
	public void setRealAmount(Float realAmount) {
		this.realAmount = realAmount;
	}
	public Integer getPriceId() {
		return priceId;
	}
	public void setPriceId(Integer priceId) {
		this.priceId = priceId;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getGateTime() {
		return gateTime;
	}
	public void setGateTime(String gateTime) {
		this.gateTime = gateTime;
	}
	public Integer getOrderuserId() {
		return orderuserId;
	}
	public void setOrderuserId(Integer orderuserId) {
		this.orderuserId = orderuserId;
	}
	private Integer counts;
	
	
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public Integer getFlightId() {
		return flightId;
	}
	public void setFlightId(Integer flightId) {
		this.flightId = flightId;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getFlightinfoId() {
		return flightinfoId;
	}
	public void setFlightinfoId(Integer flightinfoId) {
		this.flightinfoId = flightinfoId;
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
	public Integer getTicketpointId() {
		return ticketpointId;
	}
	public void setTicketpointId(Integer ticketpointId) {
		this.ticketpointId = ticketpointId;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Double getTicketprice() {
		return ticketprice;
	}
	public void setTicketprice(Double ticketprice) {
		this.ticketprice = ticketprice;
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
	public String getHalfpricecard() {
		return halfpricecard;
	}
	public void setHalfpricecard(String halfpricecard) {
		this.halfpricecard = halfpricecard;
	}
	public String getZeropricecard() {
		return zeropricecard;
	}
	public void setZeropricecard(String zeropricecard) {
		this.zeropricecard = zeropricecard;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	public static void main(String[]args){
		LinkedList<String> list = new LinkedList<String>();
		list.add("a");
		list.add("b");
		list.add("Cc");
		System.out.println(list.contains("a")+" "+list.contains("c")+" "+list.contains("C"));
	}
	
}
