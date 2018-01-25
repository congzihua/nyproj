package com.roc.enp.entity;

import java.util.Date;

import com.founder.enp.persistence.PaginatedModel;

public class FlightInfoKeyword extends PaginatedModel {

	private String flight_name;
	private Date flight_date;
	private String fly_time;
//	private Integer begin;
//	private Integer end;
//	public Integer getBegin() {
//		return begin;
//	}
//	public void setBegin(Integer begin) {
//		this.begin = begin;
//	}
//	public Integer getEnd() {
//		return end;
//	}
//	public void setEnd(Integer end) {
//		this.end = end;
//	}
	public Date getFlight_date() {
		return flight_date;
	}
	public void setFlight_date(Date flight_date) {
		this.flight_date = flight_date;
	}
	public String getFlight_name() {
		return flight_name;
	}
	public void setFlight_name(String flight_name) {
		this.flight_name = flight_name;
	}
	public String getFly_time() {
		return fly_time;
	}
	public void setFly_time(String fly_time) {
		this.fly_time = fly_time;
	}
}
