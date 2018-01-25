package com.founder.enp.entity;

public class Flows {
	
	private Integer id;
	private Integer powergroup;
	private Integer docid;

	private String status;
	private String sendtime;
	private Integer fatherid;
	private Integer flag;
	private Integer processorid;
	private String advice;
    private Integer readflag;
	private String operationtor;
	private String flowtor;
	private String opertime;
	private Integer version;
	private String flowName;

	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	public Integer getFatherid() {
		return fatherid;
	}
	public void setFatherid(Integer fatherid) {
		this.fatherid = fatherid;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPowergroup() {
		return powergroup;
	}
	public void setPowergroup(Integer powergroup) {
		this.powergroup = powergroup;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int PRIME = 31;
		int result = 1;
		result = PRIME * result + ((docid == null) ? 0 : docid.hashCode());
		result = PRIME * result + ((fatherid == null) ? 0 : fatherid.hashCode());
		result = PRIME * result + ((flag == null) ? 0 : flag.hashCode());
		result = PRIME * result + ((id == null) ? 0 : id.hashCode());
		result = PRIME * result + ((powergroup == null) ? 0 : powergroup.hashCode());
		result = PRIME * result + ((sendtime == null) ? 0 : sendtime.hashCode());
		result = PRIME * result + ((status == null) ? 0 : status.hashCode());
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
		final Flows other = (Flows) obj;
		
		if (docid == null) {
			if (other.docid != null)
				return false;
		} else if (!docid.equals(other.docid))
			return false;
		if (fatherid == null) {
			if (other.fatherid != null)
				return false;
		} else if (!fatherid.equals(other.fatherid))
			return false;
		if (flag == null) {
			if (other.flag != null)
				return false;
		} else if (!flag.equals(other.flag))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (powergroup == null) {
			if (other.powergroup != null)
				return false;
		} else if (!powergroup.equals(other.powergroup))
			return false;
		if (sendtime == null) {
			if (other.sendtime != null)
				return false;
		} else if (!sendtime.equals(other.sendtime))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public Integer getProcessorid() {
		return processorid;
	}
	public void setProcessorid(Integer processorid) {
		this.processorid = processorid;
	}
	public String getOperationtor() {
		return operationtor;
	}
	public void setOperationtor(String operationtor) {
		this.operationtor = operationtor;
	}
	public String getOpertime() {
		return opertime;
	}
	public void setOpertime(String opertime) {
		this.opertime = opertime;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getFlowName() {
		return flowName;
	}
	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}
	public String getFlowtor() {
		return flowtor;
	}
	public void setFlowtor(String flowtor) {
		this.flowtor = flowtor;
	}
	public Integer getReadflag() {
		return readflag;
	}
	public void setReadflag(Integer readflag) {
		this.readflag = readflag;
	}
	

}
