package com.founder.enp.entity;

public class UGRelation {
	
	private Integer id;
	private Integer userid;
	private Integer groupid;
	public Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
		result = PRIME * result + ((groupid == null) ? 0 : groupid.hashCode());
		result = PRIME * result + ((id == null) ? 0 : id.hashCode());
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
		final UGRelation other = (UGRelation) obj;
		if (groupid == null) {
			if (other.groupid != null)
				return false;
		} else if (!groupid.equals(other.groupid))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}

}
