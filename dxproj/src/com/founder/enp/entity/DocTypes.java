package com.founder.enp.entity;

public class DocTypes {
	
	private Integer doctypeid;
	private String typename;
	private Integer dmpid;
	private Template template;
	private String templetname;
	private Integer templetid;
	public Integer getDmpid() {
		return dmpid;
	}
	public void setDmpid(Integer dmpid) {
		this.dmpid = dmpid;
	}
	public Integer getDoctypeid() {
		return doctypeid;
	}
	public void setDoctypeid(Integer doctypeid) {
		this.doctypeid = doctypeid;
	}
	public Template getTemplate() {
		return template;
	}
	public void setTemplate(Template template) {
		this.template = template;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((dmpid == null) ? 0 : dmpid.hashCode());
		result = PRIME * result + ((doctypeid == null) ? 0 : doctypeid.hashCode());
		result = PRIME * result + ((template == null) ? 0 : template.hashCode());
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
		final DocTypes other = (DocTypes) obj;
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
		if (template == null) {
			if (other.template != null)
				return false;
		} else if (!template.equals(other.template))
			return false;
		if (typename == null) {
			if (other.typename != null)
				return false;
		} else if (!typename.equals(other.typename))
			return false;
		return true;
	}
	public String getTempletname() {
		return templetname;
	}
	public void setTempletname(String templetname) {
		this.templetname = templetname;
	}
	public Integer getTempletid() {
		return templetid;
	}
	public void setTempletid(Integer templetid) {
		this.templetid = templetid;
	}

}
