package com.founder.enp.entity;

public class ViewBean implements java.io.Serializable{
	
	private String title;
	private Integer docid;
	private Integer flowid;
	private String createtime;
	private String typename;
	private String urgency;
	private Integer powergroup;
	private String status;
	private Integer flag;
	private String operationtor;
	private String opertime;
	private String sendtime;
	public Integer getDocid() {
		return docid;
	}
	public void setDocid(Integer docid) {
		this.docid = docid;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getFlowid() {
		return flowid;
	}
	public void setFlowid(Integer flowid) {
		this.flowid = flowid;
	}

	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getUrgency() {
		return urgency;
	}
	public void setUrgency(String urgency) {
		this.urgency = urgency;
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

	
	

}
