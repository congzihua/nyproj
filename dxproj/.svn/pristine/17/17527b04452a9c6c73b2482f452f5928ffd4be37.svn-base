package com.founder.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class DocTypesKeyWord extends PaginatedModel{
	
	  private String typename;
	  private Integer doctypeid;
	  private Integer dmpid;
	public Integer getDoctypeid() {
		return doctypeid;
	}
	public void setDoctypeid(Integer doctypeid) {
		this.doctypeid = doctypeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
	public Integer getDmpid() {
		return dmpid;
	}
	public void setDmpid(Integer dmpid) {
		this.dmpid = dmpid;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((dmpid == null) ? 0 : dmpid.hashCode());
		result = PRIME * result + ((doctypeid == null) ? 0 : doctypeid.hashCode());
		result = PRIME * result + ((typename == null) ? 0 : typename.hashCode());
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
		final DocTypesKeyWord other = (DocTypesKeyWord) obj;
		if (dmpid == null) {
			if (other.dmpid != null)
				return false;
		} else if (!dmpid.equals(other.dmpid))
			return false;
		if (doctypeid == null) {
			if (other.doctypeid != null)
				return false;
		} else if (!doctypeid.equals(other.doctypeid))
			return false;
		if (typename == null) {
			if (other.typename != null)
				return false;
		} else if (!typename.equals(other.typename))
			return false;
		return true;
	}

}
