package com.roc.sysmanager.base.dao;

import java.util.List;

import com.ibatis.dao.client.Dao;
import com.roc.enp.entity.BlackUserKeyword;
import com.roc.enp.entity.BlacklistUser;

public interface BlacklistDao extends Dao{
	public List<BlacklistUser> getBlackLists(BlackUserKeyword keyword);
	public int getBlacklistCount(BlackUserKeyword keyword);
	public void insertBlacklistUserInfo(BlacklistUser blacklistUser);
	public void deleteBlacklistInfo(int id);
	public void editBlacklistInfo(BlacklistUser blacklistUser);
	public BlacklistUser getUserBlacklistInfoByIdCardAndCertType(BlackUserKeyword keyword);
	public BlacklistUser getInfoById(int id);
}
