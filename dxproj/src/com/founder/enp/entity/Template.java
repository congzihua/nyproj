package com.founder.enp.entity;

public class Template {
	private Integer templetid;
    private String templetname;
    private String filename;
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
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
		result = PRIME * result + ((filename == null) ? 0 : filename.hashCode());
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
		final Template other = (Template) obj;
		if (filename == null) {
			if (other.filename != null)
				return false;
		} else if (!filename.equals(other.filename))
			return false;
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
