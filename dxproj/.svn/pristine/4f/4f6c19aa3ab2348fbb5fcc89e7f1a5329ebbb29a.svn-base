package com.founder.enp.entity;

import com.founder.enp.persistence.PaginatedModel;

public class TemplateKeyWord  extends PaginatedModel{
	
	  private String templetname;
	  private Integer templetid;
	public Integer getTempletid() {
		return templetid;
	}
	public void setTempletid(Integer templetid) {
		this.templetid = templetid;
	}
	public String getTempletname() {
		return templetname;
	}
	public void setTempletname(String templetname) {
		this.templetname = templetname;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((templetid == null) ? 0 : templetid.hashCode());
		result = PRIME * result + ((templetname == null) ? 0 : templetname.hashCode());
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
		final TemplateKeyWord other = (TemplateKeyWord) obj;
		if (templetid == null) {
			if (other.templetid != null)
				return false;
		} else if (!templetid.equals(other.templetid))
			return false;
		if (templetname == null) {
			if (other.templetname != null)
				return false;
		} else if (!templetname.equals(other.templetname))
			return false;
		return true;
	}

}
