package com.founder.enp.entity;

import java.io.Serializable;

public class Authorization implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String account;
	private String name;
	private Integer dmpid;
	private Integer groupid;
	private String email;
	private String other;
	private String phone;
	private String password;
	private Integer type;
	private String powers;
	private String rtime;
	private String ip;
	private Integer leaderid;
	private String workerNo;
	private String sysqx;
	
	
	public String getSysqx() {
		return sysqx;
	}
	public void setSysqx(String sysqx) {
		this.sysqx = sysqx;
	}
	public String getWorkerNo() {
		return workerNo;
	}
	public void setWorkerNo(String workerNo) {
		this.workerNo = workerNo;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Integer getDmpid() {
		return dmpid;
	}
	public void setDmpid(Integer dmpid) {
		this.dmpid = dmpid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPowers() {
		return powers;
	}
	public void setPowers(String powers) {
		this.powers = powers;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((account == null) ? 0 : account.hashCode());
		result = PRIME * result + ((dmpid == null) ? 0 : dmpid.hashCode());
		result = PRIME * result + ((email == null) ? 0 : email.hashCode());
		result = PRIME * result + ((ip == null) ? 0 : ip.hashCode());
		result = PRIME * result + ((name == null) ? 0 : name.hashCode());
		result = PRIME * result + ((other == null) ? 0 : other.hashCode());
		result = PRIME * result + ((password == null) ? 0 : password.hashCode());
		result = PRIME * result + ((phone == null) ? 0 : phone.hashCode());
		result = PRIME * result + ((powers == null) ? 0 : powers.hashCode());
		result = PRIME * result + ((rtime == null) ? 0 : rtime.hashCode());
		result = PRIME * result + ((type == null) ? 0 : type.hashCode());
		result = PRIME * result + ((userid == null) ? 0 : userid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Authorization other = (Authorization) obj;
		if (account == null) {
			if (other.account != null)
				return false;
		} else if (!account.equals(other.account))
			return false;
		if (dmpid == null) {
			if (other.dmpid != null)
				return false;
		} else if (!dmpid.equals(other.dmpid))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (this.other == null) {
			if (other.other != null)
				return false;
		} else if (!this.other.equals(other.other))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (powers == null) {
			if (other.powers != null)
				return false;
		} else if (!powers.equals(other.powers))
			return false;
		if (rtime == null) {
			if (other.rtime != null)
				return false;
		} else if (!rtime.equals(other.rtime))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}
	public Integer getLeaderid() {
		return leaderid;
	}
	public void setLeaderid(Integer leaderid) {
		this.leaderid = leaderid;
	}
	public Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	

}
