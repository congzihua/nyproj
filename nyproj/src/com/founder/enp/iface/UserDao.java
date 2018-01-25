package com.founder.enp.iface;

import java.util.List;

import com.founder.enp.entity.Accountie;
import com.founder.enp.entity.Advice;
import com.founder.enp.entity.DepartFlows;
import com.founder.enp.entity.UGRelation;
import com.founder.enp.entity.User;
import com.founder.enp.entity.UserKeyWord;
import com.founder.enp.entity.UserPage;
import com.founder.enp.entity.Watches;
import com.ibatis.dao.client.Dao;

public interface UserDao extends Dao
{
	public  abstract List list(UserKeyWord keyword);
	
	public abstract int checkAccount(String account);
	public abstract int insert(User user);
	public abstract void insertUgRelation(UGRelation relation);
	public abstract int queryUserCount(UserKeyWord keyword);
	public abstract User queryUserInfo(int userid);
	public abstract List queryUserGroup(int userid);
	public abstract void editUser(User user);
	public abstract void deleteUGRelation(int userid);
	public abstract void deleteUser(int userid);
	public abstract List getAllUser();
	public abstract List getBoundUser(UserKeyWord keyword);
	public abstract List getUnBoundUser(UserKeyWord keyword);
	public abstract void boundUser(Accountie accountie);
	public abstract void unBoundUser(Accountie accountie);
	public abstract User checkUser(User user);
	public abstract List getDepartFlowsUser(DepartFlows departFlows);
	public abstract List getUserMonitorList(UserKeyWord keyword);
	public abstract Integer getUserMonitorCount(UserKeyWord keyword);
	public abstract void addMonitorUser(Watches watches);
	public abstract Integer checkLoginSameUser(int userid);
	public abstract Watches getUserWatchesInfo(int id);
	public abstract void updateMonitorUnLock(int id);
	public abstract void updateDocNumUnLock(int userid);
	public abstract void updateDocNumLock(Watches watches);
	public abstract void delMonitorUser(int id);
	public abstract Integer getMonitorID(int userid);
	public abstract List getAdvice(int userid);
	public abstract void delAdvice(int adsid);
	public abstract void addAdvice(Advice advice);
	public abstract Integer getUserHaveGroupCount(int userid);
	public abstract void delboundUser(Accountie accountie);
	public abstract void transfer(User user);
	public abstract List getUserSelGroup(int userid);
	public abstract List getUserhaveBound(int userid);
	public abstract List getBoundUserPower(int userid);
	public abstract void addUserPage(UserPage userPage);
	public abstract void updateUserPage(UserPage userPage);
	public abstract UserPage getUserPage(int userid);
	public abstract void changeUserPwd(User user);
	public abstract User getAdministratorInfo(User user);
	public abstract void orderUser(User user);
}