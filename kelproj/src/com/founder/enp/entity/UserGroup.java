package com.founder.enp.entity;

public class UserGroup {
	
	private Integer id;
	private String name;
	private String mem;
	private Integer dpmid;
	private String powers;
	public Integer getDpmid() {
		return dpmid;
	}
	public void setDpmid(Integer dpmid) {
		this.dpmid = dpmid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMem() {
		return mem;
	}
	public void setMem(String mem) {
		this.mem = mem;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPowers() {
		return powers;
	}
	public void setPowers(String powers) {
		this.powers = powers;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((dpmid == null) ? 0 : dpmid.hashCode());
		result = PRIME * result + ((id == null) ? 0 : id.hashCode());
		result = PRIME * result + ((mem == null) ? 0 : mem.hashCode());
		result = PRIME * result + ((name == null) ? 0 : name.hashCode());
		result = PRIME * result + ((powers == null) ? 0 : powers.hashCode());
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
		final UserGroup other = (UserGroup) obj;
		if (dpmid == null) {
			if (other.dpmid != null)
				return false;
		} else if (!dpmid.equals(other.dpmid))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (mem == null) {
			if (other.mem != null)
				return false;
		} else if (!mem.equals(other.mem))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (powers == null) {
			if (other.powers != null)
				return false;
		} else if (!powers.equals(other.powers))
			return false;
		return true;
	}

}
