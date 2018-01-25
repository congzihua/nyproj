package com.founder.enp.entity;

public class Attache {
	
	private Integer attacheid;
	private String title;
	private String filetype;
	private String filename;
	private Integer docid;
	private String fileOrgName;
	public Integer getAttacheid() {
		return attacheid;
	}
	public void setAttacheid(Integer attacheid) {
		this.attacheid = attacheid;
	}
	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((attacheid == null) ? 0 : attacheid.hashCode());
		result = PRIME * result + ((docid == null) ? 0 : docid.hashCode());
		result = PRIME * result + ((filename == null) ? 0 : filename.hashCode());
		result = PRIME * result + ((filetype == null) ? 0 : filetype.hashCode());
		result = PRIME * result + ((title == null) ? 0 : title.hashCode());
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
		final Attache other = (Attache) obj;
		if (attacheid == null) {
			if (other.attacheid != null)
				return false;
		} else if (!attacheid.equals(other.attacheid))
			return false;
		if (docid == null) {
			if (other.docid != null)
				return false;
		} else if (!docid.equals(other.docid))
			return false;
		if (filename == null) {
			if (other.filename != null)
				return false;
		} else if (!filename.equals(other.filename))
			return false;
		if (filetype == null) {
			if (other.filetype != null)
				return false;
		} else if (!filetype.equals(other.filetype))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	public String getFileOrgName() {
		return fileOrgName;
	}
	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}

}
