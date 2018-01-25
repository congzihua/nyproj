package com.founder.enp.entity;

public class LogEntity {

	private Integer logid;


	private String account;

	private String actiontype;

	private String action;

	private String logtime;
	private String ip;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getActiontype() {
		return actiontype;
	}

	public void setActiontype(String actiontype) {
		this.actiontype = actiontype;
	}

	public Integer getLogid() {
		return logid;
	}

	public void setLogid(Integer logid) {
		this.logid = logid;
	}

	public String getLogtime() {
		return logtime;
	}

	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}



	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((action == null) ? 0 : action.hashCode());
		result = PRIME * result
				+ ((actiontype == null) ? 0 : actiontype.hashCode());
		result = PRIME * result + ((logid == null) ? 0 : logid.hashCode());
		result = PRIME * result + ((logtime == null) ? 0 : logtime.hashCode());
	
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
		final LogEntity other = (LogEntity) obj;
		if (action == null) {
			if (other.action != null)
				return false;
		} else if (!action.equals(other.action))
			return false;
		if (actiontype == null) {
			if (other.actiontype != null)
				return false;
		} else if (!actiontype.equals(other.actiontype))
			return false;
		if (logid == null) {
			if (other.logid != null)
				return false;
		} else if (!logid.equals(other.logid))
			return false;
		if (logtime == null) {
			if (other.logtime != null)
				return false;
		} else if (!logtime.equals(other.logtime))
			return false;
		return true;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
