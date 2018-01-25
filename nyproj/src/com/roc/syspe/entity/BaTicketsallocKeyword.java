package com.roc.syspe.entity;

import com.founder.enp.persistence.PaginatedModel;

public class BaTicketsallocKeyword extends PaginatedModel {
	private String orderdate;//ORDERDATE
	private String ordertime;
	private Integer flightId;
	private Integer ticketpointId;
	
	public Integer getFlightId() {
		return flightId;
	}

	public void setFlightId(Integer flightId) {
		this.flightId = flightId;
	}

	public Integer getTicketpointId() {
		return ticketpointId;
	}

	public void setTicketpointId(Integer ticketpointId) {
		this.ticketpointId = ticketpointId;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	
}
