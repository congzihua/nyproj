package com.roc.sysmanager.base.impl;

import java.util.List;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;
import com.roc.sysmanager.base.dao.BlacklistDao;

public class BlacklistUserDaoImpl extends SqlMapDaoTemplate implements BlacklistDao {
	public BlacklistUserDaoImpl(DaoManager daoManager) {
		super(daoManager);
	}
	
	public List<BlacklistUser> getBlackLists(BlackUserKeyword keyword) {
		return queryForList("getBlackLists", keyword);
	}

	
	public int getBlacklistCount(BlackUserKeyword keyword) {
		return (Integer)queryForObject("getBlacklistCount", keyword);
	}

	
	public void insertBlacklistUserInfo(BlacklistUser blacklistUser) {
		insert("insertBlacklistUserInfo", blacklistUser);
	}

	
	public void deleteBlacklistInfo(int id) {
		delete("deleteBlacklistInfo", id);
	}

	
	public void editBlacklistInfo(BlacklistUser blacklistUser) {
		update("editBlacklistInfo", blacklistUser);
	}

	
	public BlacklistUser getUserBlacklistInfoByIdCardAndCertType(BlackUserKeyword keyword) {
		
		return (BlacklistUser)queryForObject("getUserBlacklistInfoByIdCardAndCertType", keyword);
	}
	public BlacklistUser getInfoById(int id) {
		return (BlacklistUser)queryForObject("getInfoById", id);
	}

}
