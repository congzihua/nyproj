package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.Attache;
import com.founder.enp.entity.DocEntity;
import com.founder.enp.entity.DocFlowsKeyWord;
import com.founder.enp.entity.Flows;
import com.founder.enp.entity.User;
import com.founder.enp.entity.Watches;
import com.ibatis.dao.client.Dao;


	
public interface DocDao extends Dao
{
 
	public abstract int addDoc(DocEntity doc);
	public abstract void addAttache(Attache attache);
	public abstract void addFlows(Flows flows);
	public abstract List getFlowsList(DocFlowsKeyWord keyword);
	public abstract Integer getFlowsListCount(DocFlowsKeyWord keyword);
	public abstract DocEntity getDoc(Integer docid);
	public abstract List  getDocAttache(Integer docid);
	public abstract void deleteDoc(Integer flowid);
	public abstract Integer checkDeleteDoc(Integer flowid);
	public abstract void restoreDoc(Integer flowid);
	public abstract Flows getFlows(int flowid);
	public abstract void updateFlows(Flows flows);
	public abstract Integer checkSubmitDoc(int flowid);
	public abstract void updateParentStatus(Flows flows);
	public abstract Integer selectParentFlows(int flowid);
	public abstract Integer checkWithDrawDoc(int flowid);
	public abstract void withDrawDoc(int flowid);
	public abstract  Integer checkWithDrawDocSelf(int flowid);
	public abstract Integer selectLeafFlow(int flowid);
	public abstract List getFlowsRecord(int docid);
	public abstract Integer checkModify(int docid);
	public abstract void updateCheckModify(Watches watches);
	public abstract void updateUnCheckModify(Watches watches);
	public abstract Integer getMaxAttacheID();
	public abstract void deleteAttache(int attacheid);
	public abstract void updateDoc(DocEntity docEntity);
	public abstract Integer checkRejectDoc(int flowid);
	public abstract void updateDocNew(Flows flows);
	public abstract Integer checkCounterSign(int flowsid);
	public abstract List getConterSignProcessorids(int flowsid);
	public abstract Integer checkCounterSignISSubmit(int flowsid);
	public abstract void updateConterSignStatus(Flows flows);
	public abstract Integer chekcIsCounterSign(int flowsid);
	public abstract Integer checkRejectModifyDoc(int flowsid);
	public abstract void withDrowCounterSignUser(Flows flows);
	public abstract User getDocCreator(int docid);
	public abstract List getFlowsFinishList(DocFlowsKeyWord keyword);
	public abstract Integer getFlowsFinishListCount(DocFlowsKeyWord keyword);
	public abstract List getUserFinishDoc(int userid);
	public abstract void updateFlowsBackUpFlag(Flows flows);
	public abstract List getFlowsFinishAllList(DocFlowsKeyWord keyword);
	public abstract Integer getFlowsFinishAllListCount(DocFlowsKeyWord keyword);
	public abstract void delGarbage(int docid);
	
	public abstract List getPowerGroupAdvice(DocFlowsKeyWord keyword);
	public abstract List getTaskList(DocFlowsKeyWord keyword);
	public abstract Integer getTaskListCount (DocFlowsKeyWord keyword);
	public abstract List getSounterSignAdvice(DocFlowsKeyWord keyword);
	public abstract List getPowerGroupAdviceLeader(DocFlowsKeyWord keyword);
	public abstract Integer checkOpenStatus(Integer flowsid);
	public abstract String getFinisher(int docid);
	public abstract List getAuditor(int docid);
	public abstract void setReadFlag(Flows flows);
	public abstract String getDocTitle(int flowid);
	
}

