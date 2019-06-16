package com.roc.sysmanager.base.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.founder.enp.persistence.DaoConfig;
import com.ibatis.dao.client.DaoManager;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.sysmanager.base.dao.BlacklistDao;
import com.roc.sysmanager.base.dao.OpOrderticeetsDao;


public class BlacklistUserService {
	private static Log log = LogFactory.getLog(BlacklistUserService.class);
	private DaoManager daoMgr;
	private BlacklistDao dao;
	public BlacklistUserService() {
		daoMgr = null;
		dao = null;
		try {
			daoMgr = DaoConfig.getDaoManager();
			dao = (BlacklistDao) daoMgr.getDao(BlacklistDao.class);
		} catch (Exception ex) {
			log.error((new StringBuilder(
					"\u521B\u5EFAdaomanager\u51FA\u73B0\u5F02\u5E38")).append(
					ex.getMessage()).toString());
		}
	}
	
	public List<BlacklistUser> getBlackLists(BlackUserKeyword keyword) {
		return dao.getBlackLists(keyword);
	}
	public int getBlacklistCount(BlackUserKeyword keyword) {
		return dao.getBlacklistCount(keyword);
	}

	
	public void insertBlacklistUserInfo(BlacklistUser blacklistUser) {
		dao.insertBlacklistUserInfo(blacklistUser);;
	}

	
	public void deleteBlacklistInfo(int id) {
		dao.deleteBlacklistInfo(id);;
	}
	public void editBlacklistInfo(BlacklistUser blacklistUser) {
		dao.editBlacklistInfo(blacklistUser);
	}
	public BlacklistUser getUserBlacklistInfoByIdCardAndCertType(BlackUserKeyword keyword) {
		return dao.getUserBlacklistInfoByIdCardAndCertType(keyword);
	}
	public BlacklistUser getInfoById(int id) {
		return dao.getInfoById(id);
	}
}
