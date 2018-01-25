package com.founder.enp.entity;

public class DocNum {
	
	
	private Integer docnumid;
    private String typename;
    private Integer year;
    private Integer nextnum;
    private Integer doctypeid;
    private String dlock;
	public Integer getDocnumid() {
		return docnumid;
	}
	public void setDocnumid(Integer docnumid) {
		this.docnumid = docnumid;
	}
	public Integer getNextnum() {
		return nextnum;
	}
	public void setNextnum(Integer nextnum) {
		this.nextnum = nextnum;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	
	public Integer getDoctypeid() {
		return doctypeid;
	}
	public void setDoctypeid(Integer doctypeid) {
		this.doctypeid = doctypeid;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((docnumid == null) ? 0 : docnumid.hashCode());
		result = PRIME * result + ((doctypeid == null) ? 0 : doctypeid.hashCode());
		result = PRIME * result + ((nextnum == null) ? 0 : nextnum.hashCode());
		result = PRIME * result + ((typename == null) ? 0 : typename.hashCode());
		result = PRIME * result + ((year == null) ? 0 : year.hashCode());
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
		final DocNum other = (DocNum) obj;
		if (docnumid == null) {
			if (other.docnumid != null)
				return false;
		} else if (!docnumid.equals(other.docnumid))
			return false;
		if (doctypeid == null) {
			if (other.doctypeid != null)
				return false;
		} else if (!doctypeid.equals(other.doctypeid))
			return false;
		if (nextnum == null) {
			if (other.nextnum != null)
				return false;
		} else if (!nextnum.equals(other.nextnum))
			return false;
		if (typename == null) {
			if (other.typename != null)
				return false;
		} else if (!typename.equals(other.typename))
			return false;
		if (year == null) {
			if (other.year != null)
				return false;
		} else if (!year.equals(other.year))
			return false;
		return true;
	}
	public String getDlock() {
		return dlock;
	}
	public void setDlock(String dlock) {
		this.dlock = dlock;
	}

}
