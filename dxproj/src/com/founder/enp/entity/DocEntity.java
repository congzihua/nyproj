package com.founder.enp.entity;

public class DocEntity {
	
	private Integer docid;
	private String title="";
	private String createtime="";
	private String maketime=null;
	private String content="";
	private String typename="";
	private String urgence="";
	private String publishtime=null;
	private String createorg="";
	private String docnum="";
	private String secret="";
	private String toOrg="";
	private Integer printnum=null;
	private String secretime="";
	private String createmode="";
	private String publishlevel="";
	private Integer deleteflag=0;
	private String publishOrg="";
	private String copyto="";
	private String keywords="";
	private String result="";
	private String event="";
	private String attacheid="";
	private String creator="";
	private String dlock;

	public String getAttacheid() {
		return attacheid;
	}
	public void setAttacheid(String attacheid) {
		this.attacheid = attacheid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCopyto() {
		return copyto;
	}
	public void setCopyto(String copyto) {
		this.copyto = copyto;
	}
	public String getCreatemode() {
		return createmode;
	}
	public void setCreatemode(String createmode) {
		this.createmode = createmode;
	}
	public String getCreateorg() {
		return createorg;
	}
	public void setCreateorg(String createorg) {
		this.createorg = createorg;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public Integer getDeleteflag() {
		return deleteflag;
	}
	public void setDeleteflag(Integer deleteflag) {
		this.deleteflag = deleteflag;
	}
	public String getDlock() {
		return dlock;
	}
	public void setDlock(String dlock) {
		this.dlock = dlock;
	}
	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	public String getDocnum() {
		return docnum;
	}
	public void setDocnum(String docnum) {
		this.docnum = docnum;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public Integer getPrintnum() {
		return printnum;
	}
	public void setPrintnum(Integer printnum) {
		this.printnum = printnum;
	}
	public String getPublishlevel() {
		return publishlevel;
	}
	public void setPublishlevel(String publishlevel) {
		this.publishlevel = publishlevel;
	}
	public String getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(String publishtime) {
		this.publishtime = publishtime;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getSecretime() {
		return secretime;
	}
	public void setSecretime(String secretime) {
		this.secretime = secretime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getToOrg() {
		return toOrg;
	}
	public void setToOrg(String toOrg) {
		this.toOrg = toOrg;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getUrgence() {
		return urgence;
	}
	public void setUrgence(String urgence) {
		this.urgence = urgence;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((toOrg == null) ? 0 : toOrg.hashCode());
		result = PRIME * result + ((attacheid == null) ? 0 : attacheid.hashCode());
		result = PRIME * result + ((content == null) ? 0 : content.hashCode());
		result = PRIME * result + ((copyto == null) ? 0 : copyto.hashCode());
		result = PRIME * result + ((createmode == null) ? 0 : createmode.hashCode());
		result = PRIME * result + ((createorg == null) ? 0 : createorg.hashCode());
		result = PRIME * result + ((createtime == null) ? 0 : createtime.hashCode());
		result = PRIME * result + ((deleteflag == null) ? 0 : deleteflag.hashCode());
		result = PRIME * result + ((dlock == null) ? 0 : dlock.hashCode());
		result = PRIME * result + ((docid == null) ? 0 : docid.hashCode());
		result = PRIME * result + ((docnum == null) ? 0 : docnum.hashCode());
		result = PRIME * result + ((event == null) ? 0 : event.hashCode());
		result = PRIME * result + ((keywords == null) ? 0 : keywords.hashCode());
		result = PRIME * result + ((printnum == null) ? 0 : printnum.hashCode());
		result = PRIME * result + ((publishlevel == null) ? 0 : publishlevel.hashCode());
		result = PRIME * result + ((publishtime == null) ? 0 : publishtime.hashCode());
		result = PRIME * result + ((this.result == null) ? 0 : this.result.hashCode());
		result = PRIME * result + ((secret == null) ? 0 : secret.hashCode());
		result = PRIME * result + ((secretime == null) ? 0 : secretime.hashCode());
		result = PRIME * result + ((title == null) ? 0 : title.hashCode());
		result = PRIME * result + ((typename == null) ? 0 : typename.hashCode());
		result = PRIME * result + ((urgence == null) ? 0 : urgence.hashCode());
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
		final DocEntity other = (DocEntity) obj;
		if (toOrg == null) {
			if (other.toOrg != null)
				return false;
		} else if (!toOrg.equals(other.toOrg))
			return false;
		if (attacheid == null) {
			if (other.attacheid != null)
				return false;
		} else if (!attacheid.equals(other.attacheid))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (copyto == null) {
			if (other.copyto != null)
				return false;
		} else if (!copyto.equals(other.copyto))
			return false;
		if (createmode == null) {
			if (other.createmode != null)
				return false;
		} else if (!createmode.equals(other.createmode))
			return false;
		if (createorg == null) {
			if (other.createorg != null)
				return false;
		} else if (!createorg.equals(other.createorg))
			return false;
		if (createtime == null) {
			if (other.createtime != null)
				return false;
		} else if (!createtime.equals(other.createtime))
			return false;
		if (deleteflag == null) {
			if (other.deleteflag != null)
				return false;
		} else if (!deleteflag.equals(other.deleteflag))
			return false;
		if (dlock == null) {
			if (other.dlock != null)
				return false;
		} else if (!dlock.equals(other.dlock))
			return false;
		if (docid == null) {
			if (other.docid != null)
				return false;
		} else if (!docid.equals(other.docid))
			return false;
		if (docnum == null) {
			if (other.docnum != null)
				return false;
		} else if (!docnum.equals(other.docnum))
			return false;
		if (event == null) {
			if (other.event != null)
				return false;
		} else if (!event.equals(other.event))
			return false;
		if (keywords == null) {
			if (other.keywords != null)
				return false;
		} else if (!keywords.equals(other.keywords))
			return false;
		if (printnum == null) {
			if (other.printnum != null)
				return false;
		} else if (!printnum.equals(other.printnum))
			return false;
		if (publishlevel == null) {
			if (other.publishlevel != null)
				return false;
		} else if (!publishlevel.equals(other.publishlevel))
			return false;
		if (publishtime == null) {
			if (other.publishtime != null)
				return false;
		} else if (!publishtime.equals(other.publishtime))
			return false;
		if (result == null) {
			if (other.result != null)
				return false;
		} else if (!result.equals(other.result))
			return false;
		if (secret == null) {
			if (other.secret != null)
				return false;
		} else if (!secret.equals(other.secret))
			return false;
		if (secretime == null) {
			if (other.secretime != null)
				return false;
		} else if (!secretime.equals(other.secretime))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (typename == null) {
			if (other.typename != null)
				return false;
		} else if (!typename.equals(other.typename))
			return false;
		if (urgence == null) {
			if (other.urgence != null)
				return false;
		} else if (!urgence.equals(other.urgence))
			return false;
		return true;
	}
	public String getPublishOrg() {
		return publishOrg;
	}
	public void setPublishOrg(String publishOrg) {
		this.publishOrg = publishOrg;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getMaketime() {
		return maketime;
	}
	public void setMaketime(String maketime) {
		this.maketime = maketime;
	}
	

}
