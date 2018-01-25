package com.founder.enp.sqlmapdao;

import java.util.List;

import com.founder.enp.entity.Accountie;
import com.founder.enp.entity.Advice;
import com.founder.enp.entity.DepartFlows;
import com.founder.enp.entity.UGRelation;
import com.founder.enp.entity.User;
import com.founder.enp.entity.UserKeyWord;
import com.founder.enp.entity.UserPage;
import com.founder.enp.entity.Watches;
import com.founder.enp.iface.UserDao;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class SqlMapUserDao extends SqlMapDaoTemplate implements UserDao{
	
	public SqlMapUserDao(DaoManager daoManager) {
		super(daoManager);
	}
	public   List list(UserKeyWord keyword)
	{
		return this.queryForList("list", keyword);
	}
	public int checkAccount(String account)
	{
	   return ((Integer)queryForObject("getLoginCount", account)).intValue();
	}
	public  int insert(User user)
	{
		return ((Integer)this.insert("insertUser",user)).intValue();
	}
	public  void insertUgRelation(UGRelation relation)
	{
		this.insert("insertUGRelation",relation);
	}
	public int queryUserCount(UserKeyWord keyword)
	{
		return ((Integer)queryForObject("queryUserCount", keyword)).intValue();
	}
	public  User queryUserInfo(int userid)
	{
		return (User)this.queryForObject("queryUserInfo", userid);
	}
	public  List queryUserGroup(int userid)
	{
		return this.queryForList("queryUserGroup", userid);
	}
	public  void editUser(User user)
	{
		this.update("editUser", user);
	}
	public  void deleteUGRelation(int userid)
	{
		this.delete("deleteUgR", userid);
	}
	public  void deleteUser(int userid)
	{
		this.delete("deleteuser", userid);
//		this.delete("deleteUgR", userid);
//		this.delete("deleteaccountie", userid);
//		this.delete("deleteuseradvices", userid);
	}
	public  List getAllUser()
	{
		return this.queryForList("getAllUser", 1);
	}
	public  List getBoundUser(UserKeyWord keyword)
	{
		return this.queryForList("getBoundUser", keyword);
	}
	public  List getUnBoundUser(UserKeyWord keyword)
	{
		return this.queryForList("getUnBoundUser", keyword);
		
	}
	public  void boundUser(Accountie accountie)
	{
		this.delete("boundUser", accountie);
	}
	public  void unBoundUser(Accountie accountie)
	{
        this.delete("UnboundUser", accountie);
	}
	public  User checkUser(User user)
	{
		return (User)this.queryForObject("checkUser", user);
	}
	public  List getDepartFlowsUser(DepartFlows departFlows)
	{
		return this.queryForList("getDepartFlowsUser", departFlows);
	}
	public Integer getUserMonitorCount(UserKeyWord keyword)
	{
		return (Integer)this.queryForObject("getUserMonitorCount", keyword);
	}
	public  List getUserMonitorList(UserKeyWord keyword)
	{
		return this.queryForList("getUserMonitorList",  keyword);
	}
	public  void addMonitorUser(Watches watches)
	{
		this.insert("addMonitorUser",watches);
	}
	public  Integer checkLoginSameUser(int userid)
	{
		return (Integer)this.queryForObject("checkLoginSameUser", userid);
	}
	public  Watches getUserWatchesInfo(int id)
	{
		return (Watches)this.queryForObject("getUserWatchesInfo", id);
	}
	public  void updateMonitorUnLock(int docid)
	{
		this.update("updateMonitorUnLock", docid);
	}
	public  void updateDocNumUnLock(int userid)
	{
		this.update("updateDocNumUnLock", userid);
	}
	public  void delMonitorUser(int id)
	{
		this.delete("delMonitorUser", id);
	}
	public  void updateDocNumLock(Watches watches)
	{
		this.update("updateDocNumLock", watches);
	}
	public  Integer getMonitorID(int userid)
	{
		return (Integer)this.queryForObject("getMonitorID", userid);
	}
	public  List getAdvice(int userid)
	{
		return this.queryForList("getAdvice", userid);
	}
	public  void delAdvice(int adsid)
	{
		this.delete("delAdvice", adsid);
	}
	public  void addAdvice(Advice advice)
	{
		this.insert("addAdvice",advice);
	}
	public  Integer getUserHaveGroupCount(int userid)
	{
		return (Integer)this.queryForObject("getUserHaveGroupCount", userid);
	}
	public List getUserhaveBound(int userid)
	{
		return this.queryForList("getUserhaveBound", userid);
	}
	public  List getUserSelGroup(int userid)
	{
		return this.queryForList("getUserSelGroup", userid);
	}
	public  List getBoundUserPower(int userid)
	{
		return this.queryForList("getBoundUserPower", userid);
	}
	public  void addUserPage(UserPage userPage)
	{
		this.insert("addUserPage",userPage);
	}
	public void updateUserPage(UserPage userPage)
	{
		this.update("updateUserPage", userPage);
	}
	public  UserPage getUserPage(int userid)
	{
		return (UserPage)this.queryForObject("getUserPage", userid);
	}
	public  void changeUserPwd(User user)
	{
		this.update("changeUserPwd", user);
	}
	public  User getAdministratorInfo(User user)
	{
		return (User)this.queryForObject("getAdministratorInfo", user);
	}
	public  void delboundUser(Accountie accountie)
	{
		this.delete("delboundUser", accountie);
	}
	public  void transfer(User user)
	{
		this.update("transfer", user);
	}
	public  void orderUser(User user)
	{
		this.update("orderUser", user);
	}
}
