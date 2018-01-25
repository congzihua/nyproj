package com.founder.enp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.entity.Accountie;
import com.founder.enp.entity.Advice;
import com.founder.enp.entity.Authorization;
import com.founder.enp.entity.DepartFlows;
import com.founder.enp.entity.UGRelation;
import com.founder.enp.entity.User;
import com.founder.enp.entity.UserKeyWord;
import com.founder.enp.entity.UserPage;
import com.founder.enp.entity.Watches;
import com.founder.enp.iface.UserDao;
import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;

public class UserService {
	private static Log log = LogFactory.getLog(DepartMentService.class);

	private DaoManager daoMgr;

	private UserDao dao;

	public UserService() {
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (UserDao) daoMgr.getDao(UserDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}

	public boolean transfer(String dmpid,String strUserIDs)
	{
		try {
			daoMgr.startTransaction();
			
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					strUserIDs, ";");
			User user = new User();
			while (token.hasMoreTokens()) {
				Integer userid = Integer.parseInt(token.nextToken());
				dao.deleteUGRelation(userid);
				user.setUserid(userid);
				user.setDmpid(Integer.parseInt(dmpid));
				dao.transfer(user);
			}
			
			daoMgr.commitTransaction();
		}
		catch(Exception ex)
		{
			log.error(ex.getStackTrace());
			return false;
		}
		finally
		{
			daoMgr.endTransaction();
		}
		
		return true;
	}
	public List listUser(UserKeyWord keyword) {
		List list;
		try {
			list = dao.list(keyword);
		} catch (Exception ex) {
			log.error((new StringBuilder("查询部门用户错误")).append(ex.getMessage())
					.toString());
			return null;
		}
		return list;

	}
	public boolean orderUser(User user)
	{
		try
		{
			dao.orderUser(user);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
		return true;
	}

	public int checkAccount(String account) {
		try {
			return dao.checkAccount(account);
		} catch (Exception ex) {
			log.error((new StringBuilder("验证用户错误")).append(ex.getMessage())
					.toString());
			return -1;
		}
	}

	public boolean delUser(String strUserID) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					strUserID, ";");
			daoMgr.startTransaction();
			while (token.hasMoreTokens()) {
				dao.deleteUser(Integer.parseInt(token.nextToken()));
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error((new StringBuilder("删除用户错误")).append(ex.getMessage())
					.toString());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean editUser(User user) {

		try {
			daoMgr.startTransaction();
			String strUg = user.getStrUg();
			UGRelation relation = new UGRelation();
			dao.editUser(user);
			dao.deleteUGRelation(user.getUserid());
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					strUg, ",");
			if (strUg.equals("")){
				
				Accountie accountie = new Accountie();
				accountie.setUserid(user.getUserid());
				dao.delboundUser(accountie);
			}
			while (token.hasMoreTokens()) {
				relation.setGroupid(Integer.parseInt(token.nextToken()));
				relation.setUserid(user.getUserid());
				dao.insertUgRelation(relation);
			}
			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error((new StringBuilder("更新用户信息错误")).append(ex.getMessage())
					.toString());

			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean insertUser(User user) {
		try {
			daoMgr.startTransaction();
			String strUg = user.getStrUg();
			UGRelation relation = new UGRelation();
			int userid = dao.insert(user);
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					strUg, ",");
			while (token.hasMoreTokens()) {
				relation.setGroupid(Integer.parseInt(token.nextToken()));
				relation.setUserid(userid);
				dao.insertUgRelation(relation);
			}
			UserPage userPage = new UserPage();
			userPage.setUserid(userid);
			userPage.setFileNumber(20);
			userPage.setFileTempPath("c:\\\\founder");
			userPage.setSelectLogin(0);
			dao.addUserPage(userPage);
		
			daoMgr.commitTransaction();
			return true;

		} catch (Exception ex) {
			log.error((new StringBuilder("插入用户信息错误")).append(ex.getMessage())
					.toString());

			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}
	public UserPage getUserPage(int userid)
	{
		try
 		{
 		   return dao.getUserPage(userid);
 		}
 		catch(Exception ex)
 		{
 			log.error(ex.getMessage());
 			return null;
 		}
	}
 	public boolean updateUserPage(UserPage userPage)
 	{
 		try
 		{
 			dao.updateUserPage(userPage);
 			return true;
 		}
 		catch(Exception ex)
 		{
 			log.error(ex.getMessage());
 			return false;
 		}
 	}

	public int queryUserCount(UserKeyWord keyword) {
		try {
			return dao.queryUserCount(keyword);
		} catch (Exception ex) {
			log.error("查询用户信息数量错误" + ex.getMessage());
			return -1;
		}
	}

	public User queryUserInfo(int userid) {
		try {
			return dao.queryUserInfo(userid);
		} catch (Exception ex) {
			log.error("查询用户信息错误" + ex.getMessage());
			return null;
		}
	}

	public List queryUserGroup(int userid) {
		try {
			return dao.queryUserGroup(userid);
		} catch (Exception ex) {
			log.error("查询用户信息错误" + ex.getMessage());
			return null;
		}
	}

	public List getAllUser() {
		try {
			return dao.getAllUser();
		} catch (Exception ex) {
			log.error("查询用户信息错误" + ex.getMessage());
			return null;
		}
	}

	public List getBoundUser(UserKeyWord keyword) {
		try {
			return dao.getBoundUser(keyword);
		} catch (Exception ex) {
			log.error("查询绑定用户信息错误" + ex.getMessage());
			return null;
		}
	}

	public List getUnBoundUser(UserKeyWord keyword) {
		try {
			return dao.getUnBoundUser(keyword);
		} catch (Exception ex) {
			log.error("查询未绑定用户信息错误" + ex.getMessage());
			return null;
		}
	}

	public boolean boundUser(int userid, String idString) {
		try {

			java.util.StringTokenizer token = new java.util.StringTokenizer(
					idString, ";");
			daoMgr.startTransaction();
			while (token.hasMoreTokens()) {
				Accountie accountie = new Accountie();
				accountie.setUserid(userid);
				accountie.setLeaderid(Integer.parseInt(token.nextToken()));
				dao.boundUser(accountie);
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("绑定用户错误" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public boolean unBoundUser(int userid, String idString) {
		try {
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					idString, ";");
			daoMgr.startTransaction();
			while (token.hasMoreTokens()) {
				Accountie accountie = new Accountie();
				accountie.setUserid(userid);
				accountie.setLeaderid(Integer.parseInt(token.nextToken()));
				dao.unBoundUser(accountie);
			}
			daoMgr.commitTransaction();
			return true;
		} catch (Exception ex) {
			log.error("解除绑定用户错误" + ex.getMessage());
			return false;
		} finally {
			daoMgr.endTransaction();
		}
	}

	public User checkUser(User user) {
		try {
			return dao.checkUser(user);

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}
	public List getDepartFlowsUser(DepartFlows departFlows)
	{
		try {
			return dao.getDepartFlowsUser(departFlows);

		} catch (Exception ex) {
			log.error(ex.getMessage());
			return null;
		}
	}
	public List getUserMonitorList(UserKeyWord userKeyWord)
	{
		try
		{
			return dao.getUserMonitorList(userKeyWord);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public Integer getUserMonitorCount(UserKeyWord userKeyWord)
	{
		try
		{
			return dao.getUserMonitorCount(userKeyWord);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public boolean addLoginUser(Watches watches)
	{
		try
		{
			dao.addMonitorUser(watches);
			return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public boolean checkLoginSameUser(int userid)
	{
		try
		{
			if (dao.checkLoginSameUser(userid) > 0)
			return true;
			else
			return false;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public void updateDocNumLock(Watches watches)
	{
		dao.updateDocNumLock(watches);
	}
	public boolean updateDocNumUnLock(HttpServletRequest request)
	{
		Authorization authorization = (Authorization) request.getSession()
		.getAttribute("authorization");
		try
		{
			dao.updateDocNumUnLock(authorization.getUserid());
			return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public boolean unload(HttpServletRequest request)
	{
		try
		{
			Authorization authorization = (Authorization) request.getSession()
			.getAttribute("authorization");
			Integer id = dao.getMonitorID(authorization.getUserid());
			if (id == null)
				return false;
			return logout(String.valueOf(id));
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public boolean logout(String idstring)
	{
		try
		{
			daoMgr.startTransaction();
			java.util.StringTokenizer token = new java.util.StringTokenizer(
					idstring, ";");
			
			while (token.hasMoreTokens())
			{
				Integer id = Integer.parseInt(token.nextToken());
				dao.updateMonitorUnLock(id);
				dao.delMonitorUser(id);
				//清除SESSION
			}
			daoMgr.commitTransaction();
			return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
		finally
		{
			daoMgr.endTransaction();
		}
	}
	public List getAdvice(int userid)
	{
		try
		{
			return dao.getAdvice(userid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public boolean delAdvice(int adsid)
	{
		try
		{
			dao.delAdvice(adsid);
			return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public void addAdvice(Advice advice) throws Exception
	{
			dao.addAdvice(advice);
	}
	public Integer getUserHaveGroupCount(int userid)
	{
		try
		{
			return dao.getUserHaveGroupCount(userid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return 0;
		}
	}
	public List getUserhaveBound(int userid)
	{
		try
		{
			return dao.getUserhaveBound(userid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public List getUserSelGoup(int userid)
	{
		try
		{
			return dao.getUserSelGroup(userid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public List getBoundUserPower(int userid)
	{
		try
		{
			return dao.getBoundUserPower(userid);
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
	public boolean changeUserPwd(User user)
	{
		try
		{
		   dao.changeUserPwd(user);
		   return true;
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return false;
		}
	}
	public User getAdministratorInfo(User user)
	{
		try
		{
		  return  dao.getAdministratorInfo(user);
		
		}
		catch(Exception ex)
		{
			log.error(ex.getMessage());
			return null;
		}
	}
}
