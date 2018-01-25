package com.founder.enp.sqlmapdao;


import java.util.List;

import com.founder.enp.entity.Attache;
import com.founder.enp.entity.DocEntity;
import com.founder.enp.entity.DocFlowsKeyWord;
import com.founder.enp.entity.Flows;
import com.founder.enp.entity.User;
import com.founder.enp.entity.Watches;
import com.founder.enp.iface.DocDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;


public class SqlMapDocDao extends SqlMapDaoTemplate implements DocDao 
{
	public SqlMapDocDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	
	public  void updateDoc(DocEntity docEntity)
	{
		this.update("updateDoc", docEntity);
	}
	public  int addDoc(DocEntity doc)
	{
		return (Integer)this.insert("addDoc", doc);
	}
	public void addAttache(Attache attache)
	{
		this.insert("addAttache", attache);
	}
	public  void addFlows(Flows flows)
	{
		this.insert("addFlows", flows);
	}
	public List getFlowsList(DocFlowsKeyWord keyword)
	{
		return this.queryForList("flowslist", keyword);
	}
	public  Integer getFlowsListCount(DocFlowsKeyWord keyword)
	{
		return (Integer)this.queryForObject("flowscount", keyword);
	}
	public  DocEntity getDoc(Integer docid)
	{
		return (DocEntity)this.queryForObject("getDoc", docid);
	}
	public  List getDocAttache(Integer docid)
	{
		return this.queryForList("getDocAttache", docid);
	}
	public  void deleteDoc(Integer flowid)
	{
		this.update("deleteDoc", flowid);
	}
	public  Integer checkDeleteDoc(Integer flowid)
	{
		return (Integer)this.queryForObject("checkDeleteDoc", flowid);
	}
	public  void restoreDoc(Integer flowid)
	{

		this.update("restoreDoc", flowid);
	}
	public  Flows getFlows(int flowid)
	{
		return (Flows)this.queryForObject("getFlows", flowid);
	}
	public  void updateFlows(Flows flows)
	{
		this.update("updateFlows", flows);
	}
	public Integer checkSubmitDoc(int flowid)
	{
		System.out.println("===");
		int tmp = (Integer)this.queryForObject("checkSubmitDoc", flowid);
		return tmp;
	}
	public  Integer checkOpenStatus(Integer flowsid)
	{
		return (Integer)this.queryForObject("checkOpenStatus", flowsid);
	}
	public  void updateParentStatus(Flows flows)
	{
		this.update("updateParentStatus", flows);
	}
	public  Integer selectParentFlows(int flowid)
	{
		return (Integer)this.queryForObject("selectParentFlows", flowid);
	}
	public  Integer checkWithDrawDoc(int flowid)
	{
		return (Integer)this.queryForObject("checkWithDrawDoc", flowid);
	}
	public  void withDrawDoc(int flowid)
	{
		this.delete("withDrawDoc", flowid);
	}
	public  Integer checkWithDrawDocSelf(int flowid)
	{
		return (Integer)this.queryForObject("checkWithDrawDocSelf", flowid);
	}
	public  Integer selectLeafFlow(int flowid)
	{
		return (Integer)this.queryForObject("selectLeafFlow", flowid);
	}
	public  List getFlowsRecord(int docid)
	{
		return this.queryForList("getFlowsRecord", docid);
	}
	public  Integer checkModify(int docid)
	{
		return (Integer)this.queryForObject("checkModify", docid);
	}
	public  void updateCheckModify(Watches watches)
	{
		this.update("updateCheckModify", watches);
	}
	public  void updateUnCheckModify(Watches watches)
	{
		this.update("updateUnCheckModify", watches);
	}
	public  Integer getMaxAttacheID()
	{
		return (Integer)this.queryForObject("getMaxAttacheID", 1);
	}
	public void deleteAttache(int attacheid)
	{
		this.delete("deleteAttache", attacheid);
	}
	public  Integer checkRejectDoc(int flowid)
	{
		return (Integer)this.queryForObject("checkRejectDoc", flowid);
	}
	public  void updateDocNew(Flows flows)
	{
		this.update("updateFlowsNew", flows);
	}
	public  Integer checkCounterSign(int flowsid)
	{
		return (Integer)this.queryForObject("checkCounterSign", flowsid);
	}
	public List  getConterSignProcessorids(int flowsid)
	{
		return this.queryForList("getConterSignProcessorids", flowsid);
	}
	public  Integer checkCounterSignISSubmit(int flowsid)
	{
		return (Integer)this.queryForObject("checkCounterSignISSubmit", flowsid);
	}
	public  void updateConterSignStatus(Flows flows)
	{
		this.update("updateConterSignStatus", flows);
	}
	public  Integer chekcIsCounterSign(int flowsid)
	{
		return (Integer)this.queryForObject("chekcIsCounterSign", flowsid);
	}
	public  void withDrowCounterSignUser(Flows flows)
	{
		this.update("withDrowCounterSignUser", flows);
	}
	public  User getDocCreator(int docid)
	{
		return (User)this.queryForObject("getDocCreator", docid);
	}
	public  List getFlowsFinishList(DocFlowsKeyWord keyword)
	{
		return  this.queryForList("getFlowsFinishList", keyword);
	}
	public  Integer getFlowsFinishListCount(DocFlowsKeyWord keyword)
	{
		return (Integer)this.queryForObject("getFlowsFinishListCount", keyword);
	}
	public  List getUserFinishDoc(int userid)
	{
		return this.queryForList("getUserFinishDoc", userid);
	}
	public  void updateFlowsBackUpFlag(Flows flows)
	{
		this.update("updateFlowsBackUpFlag", flows);
	}
	public  List getFlowsFinishAllList(DocFlowsKeyWord keyword)
	{
		return this.queryForList("getFlowsFinishAllList", keyword);
	}
	public  Integer getFlowsFinishAllListCount(DocFlowsKeyWord keyword)
	{
		return (Integer)this.queryForObject("getFlowsFinishAllListCount", keyword);
	}

	public  void delGarbage(int docid)
	{
		this.delete("delGarbageDoc", docid);
		this.delete("delGarbageFlow", docid);
	}
	public  List getPowerGroupAdvice(DocFlowsKeyWord keyword)
	{
		return this.queryForList("getPowerGroupAdvice", keyword);
	}
	public  List getPowerGroupAdviceLeader(DocFlowsKeyWord keyword)
	{
		return this.queryForList("getPowerGroupAdviceLeader", keyword);
	}
	public  List getSounterSignAdvice(DocFlowsKeyWord keyword)
	{
		return this.queryForList("getSounterSignAdvice", keyword);
	}
	public  List getTaskList(DocFlowsKeyWord keyword)
	{
		return this.queryForList("getTaskList", keyword);
	}
	public Integer getTaskListCount (DocFlowsKeyWord keyword)
	{
		return (Integer)this.queryForObject("getTaskListCount", keyword);
	}
	public  List getAuditor(int docid)
	{
		return this.queryForList("getAuditor", docid);
	}
	public  Integer checkRejectModifyDoc(int flowsid)
	{
		return (Integer)this.queryForObject("checkRejectModifyDoc", flowsid);
	}
	public  String getFinisher(int docid)
	{
		return (String)this.queryForObject("getFinisher", docid);
	}
	public  void setReadFlag(Flows flows)
	{
		this.update("setReadFlag", flows);
	}
	public  String getDocTitle(int flowid)
	{
		return (String)this.queryForObject("getDocTitle", flowid);
	}
}
