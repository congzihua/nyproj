package com.founder.enp.entity;

public class Parameter {
	
	 private String templateip;
	 private String attacheip;
	 private String contentip;
	 private String docsbackip;
	 private String httpupload;
	 private String httpdnload;
	public String getAttacheip() {
		return attacheip;
	}
	public void setAttacheip(String attacheip) {
		this.attacheip = attacheip;
	}
	public String getContentip() {
		return contentip;
	}
	public void setContentip(String contentip) {
		this.contentip = contentip;
	}
	public String getDocsbackip() {
		return docsbackip;
	}
	public void setDocsbackip(String docsbackip) {
		this.docsbackip = docsbackip;
	}
	public String getTemplateip() {
		return templateip;
	}
	public void setTemplateip(String templateip) {
		this.templateip = templateip;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((attacheip == null) ? 0 : attacheip.hashCode());
		result = PRIME * result + ((contentip == null) ? 0 : contentip.hashCode());
		result = PRIME * result + ((docsbackip == null) ? 0 : docsbackip.hashCode());
		result = PRIME * result + ((templateip == null) ? 0 : templateip.hashCode());
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
		final Parameter other = (Parameter) obj;
		if (attacheip == null) {
			if (other.attacheip != null)
				return false;
		} else if (!attacheip.equals(other.attacheip))
			return false;
		if (contentip == null) {
			if (other.contentip != null)
				return false;
		} else if (!contentip.equals(other.contentip))
			return false;
		if (docsbackip == null) {
			if (other.docsbackip != null)
				return false;
		} else if (!docsbackip.equals(other.docsbackip))
			return false;
		if (templateip == null) {
			if (other.templateip != null)
				return false;
		} else if (!templateip.equals(other.templateip))
			return false;
		return true;
	}
	public String getHttpdnload() {
		return httpdnload;
	}
	public void setHttpdnload(String httpdnload) {
		this.httpdnload = httpdnload;
	}
	public String getHttpupload() {
		return httpupload;
	}
	public void setHttpupload(String httpupload) {
		this.httpupload = httpupload;
	}

}
